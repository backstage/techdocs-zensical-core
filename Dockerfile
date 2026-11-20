# Copyright 2026 The Backstage Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Base on the official Zensical image which already includes:
# - Python, Zensical, markdown, pymdown-extensions, pygments
FROM zensical/zensical:0.0.69

# System dependencies for PlantUML and Graphviz diagram rendering
RUN apk update && \
    apk --no-cache add bash graphviz plantuml && \
    rm -rf /var/cache/apk/*

# Additional Python Markdown extensions not bundled by Zensical.
# These hook into Python Markdown's processing pipeline.
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR /input

# Config preprocessing is handled by TechdocsZensicalGenerator in TypeScript.
# This container just runs the zensical binary.
ENTRYPOINT ["zensical"]

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 05 Jul 2023 13:41:17 -0000
Message-ID: <168856447707.24204.17276453539701928122@emeril.freedesktop.org>
References: <20230705131853.545449-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230705131853.545449-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_H?=
 =?utf-8?q?andle_GT_and_tile_seperation_in_IGT_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Handle GT and tile seperation in IGT (rev5)
URL   : https://patchwork.freedesktop.org/series/119801/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/927340 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44957835):
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:46a290212d18d6f820439b9a479e0894356e5f5b3409e37adeb7cd0d480fc368"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:46a290212d18d6f820439b9a479e0894356e5f5b3409e37adeb7cd0d480fc368
  Copying config sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078
  Writing manifest to image destination
  time="2023-07-05T13:37:46Z" level=fatal msg="Error writing manifest: Error uploading manifest commit-16f34045c6fa4c608b462a81a7c6f8d504004de4 to registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian: received unexpected HTTP status: 500 Internal Server Error" 
  section_end:1688564266:step_script
  section_start:1688564266:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688564267:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/927340

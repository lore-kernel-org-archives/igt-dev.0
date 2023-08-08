Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 08 Aug 2023 14:08:02 -0000
Message-ID: <169150368236.13859.7516060804271211890@emeril.freedesktop.org>
References: <20230808115913.1064831-1-anshuman.gupta@intel.com>
In-Reply-To: <20230808115913.1064831-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_vram=5Fd3cold=5Fthreshold_test?=
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

Series: Add vram_d3cold_threshold test
URL   : https://patchwork.freedesktop.org/series/122154/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/955604 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46916629):
          "intel-IGT_5164"
      ],
      "Created": "2021-03-25T19:28:06.985111241Z",
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
  time="2023-08-08T14:03:26Z" level=fatal msg="Error trying to reuse blob sha256:46a290212d18d6f820439b9a479e0894356e5f5b3409e37adeb7cd0d480fc368 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian: 500 (Internal Server Error)" 
  section_end:1691503407:step_script
  section_start:1691503407:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691503408:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/955604

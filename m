Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 27 Jun 2023 03:56:09 -0000
Message-ID: <168783816936.2456.2463482780698268461@emeril.freedesktop.org>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_N?=
 =?utf-8?q?ew_dir_structure_for_intel_specific_tests_=28rev4=29?=
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

Series: New dir structure for intel specific tests (rev4)
URL   : https://patchwork.freedesktop.org/series/117227/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/919560 for the overview.

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44467237):
      ],
      "Created": "2019-11-20T12:54:52.073706506Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9
  time="2023-06-27T03:53:28Z" level=fatal msg="Error reading config blob sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-armhf/blobs/sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8: dial tcp: lookup registry.freedesktop.org on 147.75.207.208:53: read udp 10.88.57.158:59606->147.75.207.208:53: i/o timeout" 
  section_end:1687838009:step_script
  section_start:1687838009:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687838009:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/919560

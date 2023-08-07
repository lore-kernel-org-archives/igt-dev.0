Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 07 Aug 2023 05:06:36 -0000
Message-ID: <169138479638.13178.6787239086079835192@emeril.freedesktop.org>
References: <20230807033439.44097-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230807033439.44097-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/intel=5Fctx=7Cfb=3A_Rename_engine_to_exec=5Fqueue_in_xe_lib_?=
 =?utf-8?q?for_completion?=
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

Series: lib/intel_ctx|fb: Rename engine to exec_queue in xe lib for completion
URL   : https://patchwork.freedesktop.org/series/122080/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/954096 for the overview.

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46796390):
      "DockerVersion": "",
      "Labels": {
          "maintainer": "Clement Verna \u003ccverna@fedoraproject.org\u003e"
      },
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc
  time="2023-08-07T05:04:39Z" level=fatal msg="Error reading config blob sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-fedora/blobs/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: dial tcp: lookup registry.freedesktop.org on 147.75.207.208:53: read udp 10.88.24.64:60747->147.75.207.208:53: i/o timeout" 
  section_end:1691384679:step_script
  section_start:1691384679:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691384680:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/954096

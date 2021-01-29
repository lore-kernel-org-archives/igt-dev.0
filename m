Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 29 Jan 2021 15:19:30 -0000
Message-ID: <161193357000.15522.18235076835120862021@emeril.freedesktop.org>
References: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_IGT_allocator_=28rev19=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce IGT allocator (rev19)
URL   : https://patchwork.freedesktop.org/series/82954/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/263656 for the overview.

test:test-list-diff has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/6980640):
  Skipping Git submodules setup
  section_end:1611933306:get_sources
  section_start:1611933306:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-debian-autotools (6980633)...
  Downloading artifacts from coordinator... ok        id=6980633 responseStatus=200 OK token=uwkSujHy
  Downloading artifacts for build:tests-debian-meson (6980628)...
  Downloading artifacts from coordinator... ok        id=6980628 responseStatus=200 OK token=AMDEGSSu
  section_end:1611933309:download_artifacts
  section_start:1611933309:step_script
  Executing "step_script" stage of the job script
  $ diff <(sed "s/ /\n/g" meson-test-list.txt| grep -v 'vc4\|v3d\|panfrost\|nouveau' | sort) <(sed "s/ /\n/g" autotools-test-list.txt | sort)
  10d9
  < api_intel_allocator
  section_end:1611933312:step_script
  section_start:1611933312:cleanup_file_variables
  Cleaning up file based variables
  section_end:1611933315:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/263656
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

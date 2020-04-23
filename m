Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Apr 2020 17:24:04 -0000
Message-ID: <158766264467.26751.16302452746456492422@emeril.freedesktop.org>
References: <20200423165520.26115-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200423165520.26115-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical?=
 =?utf-8?q?=5Fengine_to_utilize_all_available_=28rev9=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev9)
URL   : https://patchwork.freedesktop.org/series/75536/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/136733 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2414024):
                           Iengines.engines[child % num_engines].name ? " c" : "C",
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~ ~
  ../lib/igt_core.h:1193:62: note: expanded from macro 'igt_info'
  #define igt_info(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO, f)
                                                               ^
  ../tests/i915/gem_sync.c:1168:44: error: address of array 'Iengines.engines[child % num_children].name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
                           Iengines.engines[child % num_children].name ?  " c" : "C",
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~ ~
  ../lib/igt_core.h:1193:62: note: expanded from macro 'igt_info'
  #define igt_info(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO, f)
                                                               ^
  9 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1587662204:build_script
  section_start:1587662204:after_script
  section_end:1587662206:after_script
  section_start:1587662206:upload_artifacts_on_failure
  section_end:1587662208:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/136733
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

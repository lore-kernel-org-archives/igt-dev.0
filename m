Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 25 May 2022 18:46:39 -0000
Message-ID: <165350439945.16573.4303825800934897171@emeril.freedesktop.org>
References: <20220525183702.490989-1-matthew.auld@intel.com>
In-Reply-To: <20220525183702.490989-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?mall_BAR_uapi_bits?=
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

Series: small BAR uapi bits
URL   : https://patchwork.freedesktop.org/series/104368/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/595891 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23136846):
              ^
  In file included from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../tests/i915/i915_query.c:24:
  ../tests/i915/i915_query.c:846:12: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_debug("fill completed with idx=%d, total=%luKiB, num_handles=%u\n",
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       idx, total >> 10, num_handles);
            ~~~~~~~~~~~
  ../lib/igt_core.h:1209:64: note: in definition of macro ‘igt_debug’
   #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                  ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1653504240:step_script
  section_start:1653504240:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1653504241:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23136848):
              ^
  In file included from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../tests/i915/i915_query.c:24:
  ../tests/i915/i915_query.c:846:12: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
    igt_debug("fill completed with idx=%d, total=%luKiB, num_handles=%u\n",
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       idx, total >> 10, num_handles);
            ~~~~~~~~~~~
  ../lib/igt_core.h:1209:64: note: in definition of macro ‘igt_debug’
   #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                  ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1653504228:step_script
  section_start:1653504228:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1653504229:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/595891

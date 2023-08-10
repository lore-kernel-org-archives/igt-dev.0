Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 10 Aug 2023 11:21:30 -0000
Message-ID: <169166649049.4960.7445551730879334753@emeril.freedesktop.org>
References: <20230810081743.1065566-1-swati2.sharma@intel.com>
In-Reply-To: <20230810081743.1065566-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_d?=
 =?utf-8?q?p-mst_helpers_=28rev3=29?=
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

Series: dp-mst helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/122070/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/957482 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47078542):
  [786/1558] Generating gem_ctx_engines.testlist with a meson_exe.py custom command.
  [787/1558] Compiling C object 'tests/59830eb@@gem_ctx_param@exe/i915_gem_ctx_param.c.o'.
  [788/1558] Linking target tests/gem_ctx_isolation.
  [789/1558] Compiling C object 'tests/59830eb@@gem_ctx_persistence@exe/i915_gem_ctx_persistence.c.o'.
  [790/1558] Linking target tests/gem_ctx_param.
  [791/1558] Generating gem_concurrent_blit.testlist with a meson_exe.py custom command.
  [792/1558] Compiling C object 'tests/59830eb@@gem_ctx_sseu@exe/i915_gem_ctx_sseu.c.o'.
  [793/1558] Compiling C object 'tests/59830eb@@gem_ctx_switch@exe/i915_gem_ctx_switch.c.o'.
  [794/1558] Generating gem_ctx_isolation.testlist with a meson_exe.py custom command.
  [795/1558] Linking target tests/gem_ctx_persistence.
  [796/1558] Linking target tests/gem_ctx_sseu.
  [797/1558] Linking target tests/gem_ctx_switch.
  [798/1558] Generating gem_ctx_param.testlist with a meson_exe.py custom command.
  [799/1558] Compiling C object 'tests/59830eb@@gem_evict_alignment@exe/i915_gem_evict_alignment.c.o'.
  [800/1558] Compiling C object 'tests/59830eb@@gem_ctx_shared@exe/i915_gem_ctx_shared.c.o'.
  [801/1558] Generating gem_ctx_persistence.testlist with a meson_exe.py custom command.
  [802/1558] Generating gem_ctx_sseu.testlist with a meson_exe.py custom command.
  [803/1558] Generating gem_ctx_switch.testlist with a meson_exe.py custom command.
  [804/1558] Linking target tests/gem_evict_alignment.
  [805/1558] Linking target tests/gem_ctx_shared.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/957482

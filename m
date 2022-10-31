Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Mon, 31 Oct 2022 17:04:05 -0000
Message-ID: <166723584571.2015.6815406250253863633@emeril.freedesktop.org>
References: <20221031135652.2342078-1-anshuman.gupta@intel.com>
In-Reply-To: <20221031135652.2342078-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/i915=5Fpm=5Frpm=3A_Verify_bridge_binds_with_pcieport_driver?=
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

Series: test/i915_pm_rpm: Verify bridge binds with pcieport driver
URL   : https://patchwork.freedesktop.org/series/110325/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
372c56225e12578a7a4a6bcc5b79eb40b643fcde runner: Disable socket communications for now

      |             ^~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1500:13: warning: ‘gem_evict_pwrite_subtest’ defined but not used [-Wunused-function]
 1500 | static void gem_evict_pwrite_subtest(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1491:13: warning: ‘gem_idle_subtest’ defined but not used [-Wunused-function]
 1491 | static void gem_idle_subtest(void)
      |             ^~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1433:1: warning: ‘gem_execbuf_stress_subtest’ defined but not used [-Wunused-function]
 1433 | gem_execbuf_stress_subtest(int rounds, int wait_flags,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1338:13: warning: ‘gem_execbuf_subtest’ defined but not used [-Wunused-function]
 1338 | static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions)
      |             ^~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1183:13: warning: ‘gem_pread_subtest’ defined but not used [-Wunused-function]
 1183 | static void gem_pread_subtest(void)
      |             ^~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1114:13: warning: ‘gem_mmap_args’ defined but not used [-Wunused-function]
 1114 | static void gem_mmap_args(const struct mmap_offset *t,
      |             ^~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1089:13: warning: ‘debugfs_forcewake_user_subtest’ defined but not used [-Wunused-function]
 1089 | static void debugfs_forcewake_user_subtest(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1079:13: warning: ‘sysfs_read_subtest’ defined but not used [-Wunused-function]
 1079 | static void sysfs_read_subtest(void)
      |             ^~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:1069:13: warning: ‘debugfs_read_subtest’ defined but not used [-Wunused-function]
 1069 | static void debugfs_read_subtest(void)
      |             ^~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:991:13: warning: ‘i2c_subtest’ defined but not used [-Wunused-function]
  991 | static void i2c_subtest(void)
      |             ^~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:947:13: warning: ‘drm_resources_equal_subtest’ defined but not used [-Wunused-function]
  947 | static void drm_resources_equal_subtest(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:908:13: warning: ‘modeset_subtest’ defined but not used [-Wunused-function]
  908 | static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
      |             ^~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:892:13: warning: ‘pc8_residency_subtest’ defined but not used [-Wunused-function]
  892 | static void pc8_residency_subtest(void)
      |             ^~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:882:13: warning: ‘basic_subtest’ defined but not used [-Wunused-function]
  882 | static void basic_subtest(void)
      |             ^~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:863:13: warning: ‘teardown_environment’ defined but not used [-Wunused-function]
  863 | static void teardown_environment(bool display_enabled)
      |             ^~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_rpm.c:828:13: warning: ‘setup_environment’ defined but not used [-Wunused-function]
  828 | static bool setup_environment(bool display_enabled)
      |             ^~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.


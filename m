Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 21:39:01 -0000
Message-ID: <158499954185.9808.16515268144486878071@emeril.freedesktop.org>
References: <20200323204621.173722-1-jose.souza@intel.com>
In-Reply-To: <20200323204621.173722-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzZXJp?=
 =?utf-8?q?es_starting_with_=5Bi-g-t=2Cv5=2C1/7=5D_tests/kms=5Ffrontbuffer?=
 =?utf-8?q?=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v5,1/7] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74987/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
79e7382202c104b247a672c61a6186d1f51e4958 i915/pm_rc6_residency: Pull the accuracy pair into a subgroup

FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

 61/286 testcase check: kms_frontbuffer_tracking  FAIL     0.33 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_frontbuffer_tracking
--- stdout ---
tests/kms_frontbuffer_tracking:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does not exit with 0 or 79 with --list-subtests!
FAIL: tests/kms_frontbuffer_tracking
--- stderr ---
(kms_frontbuffer_tracking:30974) intel_chipset-CRITICAL: Test assertion failure function intel_get_drm_devid, file ../lib/intel_chipset.c:132:
(kms_frontbuffer_tracking:30974) intel_chipset-CRITICAL: Failed assertion: is_i915_device(fd)
(kms_frontbuffer_tracking:30974) intel_chipset-CRITICAL: Last errno: 25, Inappropriate ioctl for device
Test kms_frontbuffer_tracking failed.
**** DEBUG ****
(kms_frontbuffer_tracking:30974) intel_chipset-CRITICAL: Test assertion failure function intel_get_drm_devid, file ../lib/intel_chipset.c:132:
(kms_frontbuffer_tracking:30974) intel_chipset-CRITICAL: Failed assertion: is_i915_device(fd)
(kms_frontbuffer_tracking:30974) intel_chipset-CRITICAL: Last errno: 25, Inappropriate ioctl for device
****  END  ****
kms_frontbuffer_tracking: ../lib/igt_core.c:1543: igt_fail: Assertion `igt_can_fail()' failed.
Received signal SIGABRT.
Stack trace: 
 #0 [fatal_sig_handler+0xd6]
 #1 [killpg+0x40]
 #2 [gsignal+0xc7]
 #3 [abort+0x141]
 #4 [uselocale+0x33a]
 #5 [__assert_fail+0x42]
 #6 [igt_fail+0x11e]
 #7 [__igt_fail_assert+0x11e]
 #8 [intel_get_drm_devid+0xc1]
 #9 [__real_main3351+0x240b]
 #10 [main+0x39]
 #11 [__libc_start_main+0xe7]
 #12 [_start+0x2a]
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

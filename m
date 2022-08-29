Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6473207499068177373=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 29 Aug 2022 16:32:53 -0000
Message-ID: <166179077307.11952.2949879084647159875@emeril.freedesktop.org>
References: <20220810105212.1774656-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810105212.1774656-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3A_Convert_tests_to_dynamic_=28rev2?=
 =?utf-8?q?=29?=
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

--===============6473207499068177373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition: Convert tests to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/107117/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12024_full -> IGTPW_7689_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7689_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7689_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/index.html

Participating hosts (11 -> 9)
------------------------------

  Additional (1): shard-rkl 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7689_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_allocator@two-level-inception:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb7/igt@api_intel_allocator@two-level-inception.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb7/igt@api_intel_allocator@two-level-inception.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-glk9/igt@i915_suspend@basic-s2idle-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk2/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb5/igt@i915_suspend@basic-s2idle-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@i915_suspend@basic-s2idle-without-i915.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-apl:          [DMESG-WARN][7] ([i915#180] / [i915#5904] / [i915#62]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl6/igt@i915_suspend@basic-s2idle-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl7/igt@i915_suspend@basic-s2idle-without-i915.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12024_full and IGTPW_7689_full:

### New IGT tests (86) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.99, 5.21] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 3.97] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 5.01] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 3.47] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.63, 38.31] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [41.58] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [41.72] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.82] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.66, 38.37] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [38.10] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [37.74] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.78] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.61, 37.54] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.68, 41.35] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [41.40] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.84] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.61, 37.43] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.93, 38.41] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [37.78] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.80] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.91, 3.88] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 3.82] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.92, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.11, 4.12] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.39, 4.62] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.98, 4.88] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.86] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.21] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.40] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.40] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.30] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 3.52] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [16.44, 16.76] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.17, 4.87] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.72] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.18, 3.49] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [16.17, 16.19] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.16, 4.61] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  

Known issues
------------

  Here are the changes found in IGTPW_7689_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@api_intel_bb@crc32.html

  * igt@feature_discovery@display-2x:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#1839])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@feature_discovery@display-2x.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#6335])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#4525]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#6344])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2842]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#2842]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_suspend@basic-s3-devices@smem:
    - shard-snb:          [PASS][25] -> [INCOMPLETE][26] ([i915#6598])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-snb2/igt@gem_exec_suspend@basic-s3-devices@smem.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb4/igt@gem_exec_suspend@basic-s3-devices@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-apl:          [PASS][27] -> [INCOMPLETE][28] ([i915#6598]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl3/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl3/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl3/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4270]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@input-checking:
    - shard-glk:          NOTRUN -> [DMESG-WARN][35] ([i915#4991])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk5/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#3297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2527] / [i915#2856])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#2856]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@resize-bar:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#6412])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#1937])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#1937])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         NOTRUN -> [WARN][42] ([i915#2684]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +44 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109293] / [fdo#109506])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][45] -> [INCOMPLETE][46] ([i915#6598]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-glk3/igt@i915_pm_rpm@system-suspend-modeset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk3/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([i915#6598]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [PASS][49] -> [INCOMPLETE][50] ([i915#4939] / [i915#6598])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl2/igt@i915_pm_rpm@system-suspend-modeset.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109302])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#5723])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@perf@migrate:
    - shard-tglb:         [PASS][53] -> [DMESG-WARN][54] ([i915#2867]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb1/igt@i915_selftest@perf@migrate.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb2/igt@i915_selftest@perf@migrate.html

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          [PASS][55] -> [INCOMPLETE][56] ([i915#4939] / [i915#6598])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-snb6/igt@i915_suspend@debugfs-reader.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#180]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#4765])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#1769] / [i915#3555]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#1769] / [i915#3555])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#5286]) +9 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +218 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110723]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2705])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278]) +33 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl3/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#3886]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +14 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk8/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [i915#3886]) +9 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3742])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk1/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@ctm-blue-to-red:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@kms_color_chamelium@ctm-blue-to-red.html
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl7/igt@kms_color_chamelium@ctm-blue-to-red.html

  * igt@kms_color_chamelium@gamma:
    - shard-snb:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb5/igt@kms_color_chamelium@gamma.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][78] ([i915#1319]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl3/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109300] / [fdo#111066]) +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#1063])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb3/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][81] ([i915#1319] / [i915#6637])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
    - shard-tglb:         [PASS][82] -> [DMESG-WARN][83] ([i915#2411] / [i915#2867])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb7/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb2/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#5287]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_dsc@dsc-with-bpp:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#3828])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@kms_dsc@dsc-with-bpp.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109274]) +7 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#3555]) +4 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2672]) +6 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2672])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2672] / [i915#3555])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109285])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [FAIL][92] ([i915#2546])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [PASS][93] -> [DMESG-FAIL][94] ([i915#118])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#6497])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109280]) +42 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#5438])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109280] / [fdo#111825])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][99] -> [SKIP][100] ([i915#433])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#6403]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][102] ([i915#6598])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][103] ([i915#6598]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][104] ([i915#6520] / [i915#6598])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][107] ([i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][108] ([fdo#109271]) +293 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#5176]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#5235]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][111] ([fdo#109271]) +229 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#658]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#658])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#658])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#111068] / [i915#658]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#658]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109642] / [fdo#111068] / [i915#658])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][118] -> [SKIP][119] ([fdo#109441]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109441]) +3 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][121] -> [SKIP][122] ([i915#5519])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-iclb:         [PASS][123] -> [DMESG-FAIL][124] ([i915#1888] / [i915#6316])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([i915#5030]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([fdo#109309])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][127] ([i915#6598]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#2437])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#2437]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#2437])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-iclb:         NOTRUN -> [SKIP][131] ([i915#2437])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#2530]) +3 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109289]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@perf@gen12-mi-rpc.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([fdo#109291]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@prime_nv_pcopy@test3_2.html

  * igt@runner@aborted:
    - shard-glk:          NOTRUN -> [FAIL][135] ([i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk5/igt@runner@aborted.html

  * igt@sysfs_clients@recycle:
    - shard-glk:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#2994]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk2/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-25:
    - shard-apl:          NOTRUN -> [SKIP][137] ([fdo#109271] / [i915#2994]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl8/igt@sysfs_clients@sema-25.html
    - shard-iclb:         NOTRUN -> [SKIP][138] ([i915#2994]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-iclb:         [TIMEOUT][139] ([i915#6016]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb6/igt@gem_busy@close-race.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@gem_busy@close-race.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][141] ([i915#5784]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb1/igt@gem_eio@kms.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb7/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][143] ([i915#2842]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][145] ([i915#2842]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][147] ([i915#2190]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-kbl:          [FAIL][149] -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl6/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-snb:          [INCOMPLETE][151] ([i915#4817] / [i915#4939] / [i915#6598]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-apl:          [INCOMPLETE][153] ([i915#4939] / [i915#6598]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-iclb:         [INCOMPLETE][155] ([i915#6598]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@bad-pitch-256:
    - shard-apl:          [DMESG-WARN][157] ([i915#62]) -> [PASS][158] +11 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl6/igt@kms_addfb_basic@bad-pitch-256.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl2/igt@kms_addfb_basic@bad-pitch-256.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][159] ([i915#5904] / [i915#62]) -> [PASS][160] +5 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21:
    - shard-apl:          [DMESG-WARN][161] ([i915#180] / [i915#5904] / [i915#62]) -> [PASS][162] +33 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl6/igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl1/igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][163] ([i915#180]) -> [PASS][164] +2 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-glk:          [FAIL][165] ([i915#1888] / [i915#5852]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [FAIL][167] ([i915#1188]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [SKIP][169] ([i915#5235]) -> [PASS][170] +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][171] ([fdo#109441]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [DMESG-FAIL][173] ([i915#62]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl6/igt@kms_sysfs_edid_timing.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl7/igt@kms_sysfs_edid_timing.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][175] ([i915#3063]) -> [FAIL][176] ([i915#5784])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          [SKIP][177] ([fdo#109271]) -> [FAIL][178] ([i915#2105])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl6/igt@kms_content_protection@uevent.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][179] ([i915#6598]) -> [INCOMPLETE][180] ([i915#180] / [i915#6598])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [INCOMPLETE][181] ([i915#1982] / [i915#6598]) -> [INCOMPLETE][182] ([i915#6598])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][183] ([i915#658]) -> [SKIP][184] ([i915#2920])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][185] ([i915#2920]) -> [SKIP][186] ([fdo#111068] / [i915#658])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][187], [FAIL][188]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> [FAIL][189] ([i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl2/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl7/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5852]: https://gitlab.freedesktop.org/drm/intel/issues/5852
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#6016]: https://gitlab.freedesktop.org/drm/intel/issues/6016
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6316]: https://gitlab.freedesktop.org/drm/intel/issues/6316
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6520]: https://gitlab.freedesktop.org/drm/intel/issues/6520
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6636 -> IGTPW_7689
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12024: 656b7e74f416705f11953d30cda518a98f18ba2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7689: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/index.html
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/index.html

--===============6473207499068177373==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition: Convert tests t=
o dynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107117/">https://patchwork.freedesktop.org/series/107117/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7689/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12024_full -&gt; IGTPW_7689_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7689_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7689_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/index.=
html</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Additional (1): shard-rkl <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7689=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_allocator@two-level-inception:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb7/igt@api_intel_allocator@two-level-inception.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
689/shard-tglb7/igt@api_intel_allocator@two-level-inception.html">INCOMPLET=
E</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-glk9/igt@i915_suspend@basic-s2idle-without-i915.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689=
/shard-glk2/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a>=
</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-iclb5/igt@i915_suspend@basic-s2idle-without-i915.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_768=
9/shard-iclb7/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</=
a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s2idle-without-i915:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl6/igt@i915_suspend@basic-s2idle-without-i915.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5904">i915#5904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7689/shard-apl7/igt@i915_suspend@basic-s2idle-without-i915.h=
tml">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12024_full and IGTPW_7689_=
full:</p>
<h3>New IGT tests (86)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.99, 5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 3.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.80, 5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp=
-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.63, 38.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [41.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [41.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-vg=
a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-dp=
-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.66, 38.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [38.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [37.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-vg=
a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.61, 37.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.68, 41.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [41.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.61, 37.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.93, 38.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [37.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.91, 3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.92, 4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.11, 4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.39, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.98, 4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-edp-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-vga-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-edp-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-vga-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-d=
p-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-e=
dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-h=
dmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-h=
dmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-v=
ga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-d=
p-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-e=
dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-h=
dmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-h=
dmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-v=
ga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-1:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [16.44, 16.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.17, 4.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-vga-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-1:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.18, 3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [16.17, 16.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.16, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-vga-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-dp-1=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-dp-1=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-edp-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7689_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230=
</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@feature_discovery@display-2x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_768=
9/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-snb6/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@gem_exec_balancer@parallel-context=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689=
/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@gem_exec_capture@capture-recoverab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-=
tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-=
kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-snb2/igt@gem_exec_suspend@basic-s3-devices@smem.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_768=
9/shard-snb4/igt@gem_exec_suspend@basic-s3-devices@smem.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#65=
98</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl3/igt@gem_exec_suspend@basic-s4-devices@smem.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_768=
9/shard-apl3/igt@gem_exec_suspend@basic-s4-devices@smem.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#65=
98</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-apl3/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4613">i915#4613</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb6/igt@gem_lmem_swapping@verify-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">=
i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@gem_lmem_swapping@verify-random-ccs=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@gem_pxp@dmabuf-shared-protected-ds=
t-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk5/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@gen9_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@gen9_exec_parse@bb-start-param.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@i915_module_load@resize-bar.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">=
i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@rcs=
0.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2684">i915#2684</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-kbl6/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-=
stress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-glk3/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/sha=
rd-glk3/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>) +=
1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/sh=
ard-iclb3/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)=
 +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-apl2/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/sha=
rd-apl2/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598<=
/a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@i915_query@query-topology-unsuppor=
ted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@migrate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb1/igt@i915_selftest@perf@migrate.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tgl=
b2/igt@i915_selftest@perf@migrate.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-snb6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-snb=
6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/sh=
ard-kbl1/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-tglb3/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 simil=
ar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-apl7/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +218 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_big_joiner@2x-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i9=
15#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-apl3/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-glk8/igt@kms_ccs@pipe-c-crc-sprite-planes-bas=
ic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +14 similar issues<=
/p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk1/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_chamelium@hdmi-hpd-with-enable=
d-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-apl6/igt@kms_color_chamelium@ctm-blue-to-red.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-kbl7/igt@kms_color_chamelium@ctm-blue-to-red.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@gamma:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-snb5/igt@kms_color_chamelium@gamma.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-apl3/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-tglb3/igt@kms_content_protection@lic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i9=
15#1063</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-kbl1/igt@kms_content_protection@lic.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6637">i915#6637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb7/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7689/shard-tglb2/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
1">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2867">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb6/igt@kms_dsc@dsc-with-bpp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#38=
28</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-tglb3/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-pr=
imscrn-pri-shrfb-draw-mmap-gtt.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-mult=
idraw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7689/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-mul=
tidraw.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/6497">i915#6497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5438">i915#5438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-t=
glb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc=
@pipe-b-dp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-b-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6598">i915#6598</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc=
@pipe-b-vga-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6520">i915#6520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-snb4/igt@kms_plane_scaling@plane-scaler-with=
-clipping-clamping-rotation@pipe-a-vga-1.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +293 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-=
edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk6/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +229 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-apl8/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-glk1/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
642">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-i=
clb8/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb2/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7689/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-18=
0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7689/shard-iclb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6316">i915#6316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb5/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
09">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6598">i915#6598</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-apl6/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-glk3/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@perf@gen12-mi-rpc.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10928=
9</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-iclb8/igt@prime_nv_pcopy@test3_2.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#431=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i9=
15#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
99">i915#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7689/shard-glk2/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-apl8/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7689/shard-iclb8/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb6/igt@gem_busy@close-race.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/6016">i915#6016</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-i=
clb7/igt@gem_busy@close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb1/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tglb7/igt@ge=
m_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
689/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/s=
hard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-tg=
lb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl6/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/s=
hard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4817">i915#4817</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7689/shard-snb4/igt@i915_suspend@fence-restore-tiled2=
untiled.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7689/shard-apl6/igt@i915_suspend@fence-restore-tiled2untile=
d.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12024/shard-iclb3/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7689/shard-iclb1/igt@i915_suspend@fence-restore-tiled2untiled.ht=
ml">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-256:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl6/igt@kms_addfb_basic@bad-pitch-256.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#6=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689=
/shard-apl2/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a> +11 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5904">=
i915#5904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7689/shard-apl7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">PASS</a> =
+5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl6/igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5904">i915#5904</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7689/shard-apl1/igt@kms_cursor_crc@cursor-random@pip=
e-b-dp-1-64x21.html">PASS</a> +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7689/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-d=
p1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp=
-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5852">i915#5852</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-glk7/igt@kms=
_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-m=
ode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/=
shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-iclb1/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html">=
PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
89/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl6/igt@kms_sysfs_edid_timing.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-a=
pl7/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-tglb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shar=
d-tglb5/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl6/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689=
/shard-apl6/igt@kms_content_protection@uevent.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7689/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7689/shard-apl2/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-dp1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7689/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7689/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-apl7/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/6599">i915#6599</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-apl6/igt@runner@aborte=
d.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12024/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_12024/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12024/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_12024/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7689/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/shard-kbl1/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/sh=
ard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7689/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i9=
15#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
12">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6636 -&gt; IGTPW_7689</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12024: 656b7e74f416705f11953d30cda518a98f18ba2e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7689: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7689/index.htm=
l<br />
  IGT_6636: 1298b5f0e1b3e010657ffba41d2e775fab028e08 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6473207499068177373==--

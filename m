Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3382261423416291240=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 10 Aug 2022 21:18:12 -0000
Message-ID: <166016629235.12354.2745035779333252767@emeril.freedesktop.org>
References: <20220810105212.1774656-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810105212.1774656-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3A_Convert_tests_to_dynamic?=
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

--===============3382261423416291240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/107117/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11981_full -> IGTPW_7630_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/index.html

Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

New tests
---------

  New tests have been introduced between CI_DRM_11981_full and IGTPW_7630_full:

### New IGT tests (114) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 5.10] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.67] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.69, 5.14] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.72, 37.34] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [40.66] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [40.83] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.87] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.63, 37.36] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [37.29] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [37.49] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.83] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.73, 5.13] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 5.0] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.43] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.67, 38.48] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [42.61] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [41.97] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.86] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.59, 37.96] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [38.46] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [38.78] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.83] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 3.94] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 4.14] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.78] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.11, 4.20] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.68, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.70] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.91, 3.94] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.87, 4.12] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.86] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.12, 4.29] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.66, 4.94] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.35] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 3.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 4.15] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.34] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.11, 4.18] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.67, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.52] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 3.93] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 4.12] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.12, 4.18] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.68, 4.91] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.61] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.54] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.28] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.46] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.31] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 3.53] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [16.44, 16.60] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.95] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.80] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 3.51] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [16.12, 16.19] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.74] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.23] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.40] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.42] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.20] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.19] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.38] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.45] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.21] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [6.00] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [6.95, 8.94] s

  

Known issues
------------

  Here are the changes found in IGTPW_7630_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#5361])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-tglb2/igt@api_intel_allocator@two-level-inception-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@drm_buddy@all:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#6433])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb1/igt@drm_buddy@all.html
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#6433])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@drm_buddy@all.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#658])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb2/igt@feature_discovery@psr2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#6268])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-snb4/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][12] ([i915#3354])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-snb2/igt@gem_eio@unwedge-stress.html
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#5784])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#112283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@gem_exec_params@secure-non-root.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#112283])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@gem_huc_copy@huc-copy.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#2190])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +147 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271]) +22 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#768])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@evict-single-offset:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#4171])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb8/igt@gem_softpin@evict-single-offset.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3323])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][34] ([i915#4991])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_userptr_blits@input-checking.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][35] ([i915#4991])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109289])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@gen7_exec_parse@chained-batch.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109289])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb8/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          NOTRUN -> [DMESG-WARN][40] ([i915#5566] / [i915#716])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#2527] / [i915#2856])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2856])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb4/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#454])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#1769] / [i915#3555]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#1769] / [i915#3555]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#5286])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#5286])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-glk:          NOTRUN -> [DMESG-WARN][49] ([i915#118])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#3886]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689] / [i915#3886])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +209 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3886]) +12 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb4/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#4103])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#4103])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_dsc@dsc-with-bpp:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3828])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb2/igt@kms_dsc@dsc-with-bpp.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#3828])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_dsc@dsc-with-bpp.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@kms_flip@2x-blocking-wf_vblank.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#2672]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#2672])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#3555])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#6497]) +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271]) +34 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109280] / [fdo#111825]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#1839])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#1839])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2:
    - shard-glk:          [PASS][77] -> [DMESG-WARN][78] ([i915#118] / [i915#1888])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk2/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk5/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111615]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][80] -> [SKIP][81] ([i915#5235]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][84] ([i915#132] / [i915#3467])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109441]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb4/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([i915#5519])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2437])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@kms_writeback@writeback-fb-id.html
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2437])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl7/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109291]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109291]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb1/igt@prime_nv_pcopy@test3_3.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl3/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@sema-10:
    - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2994]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@sysfs_clients@sema-10.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][96] ([i915#180]) -> [PASS][97] +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-apl:          [TIMEOUT][98] ([i915#3063]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl1/igt@gem_eio@in-flight-contexts-1us.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl6/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][100] ([i915#2842]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [FAIL][102] ([i915#2842]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][104] ([i915#2842]) -> [PASS][105] +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - shard-glk:          [FAIL][106] ([i915#2521]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
    - shard-iclb:         [FAIL][108] ([i915#5072]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb6/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][110] ([i915#2346]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][112] ([i915#2122]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [FAIL][114] ([i915#79]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-dp-1:
    - shard-apl:          [DMESG-WARN][116] ([i915#1982] / [i915#62]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl3/igt@kms_plane_lowres@tiling-y@pipe-a-dp-1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl4/igt@kms_plane_lowres@tiling-y@pipe-a-dp-1.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][118] ([fdo#109441]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-apl:          [DMESG-WARN][120] ([i915#62]) -> [PASS][121] +6 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl3/igt@kms_vblank@pipe-a-accuracy-idle.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl1/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-apl:          [FAIL][122] -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][124] ([i915#180]) -> [PASS][125] +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][126] ([i915#5639]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-glk9/igt@perf@polling-parameterized.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [INCOMPLETE][128] -> [DMESG-WARN][129] ([i915#180])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-WARN][130] ([i915#180]) -> [FAIL][131] ([i915#1188])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][132] ([fdo#108145] / [i915#62]) -> [FAIL][133] ([fdo#108145] / [i915#265])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][134] ([fdo#111068] / [i915#658]) -> [SKIP][135] ([i915#2920])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb4/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][136] ([i915#658]) -> [SKIP][137] ([i915#2920])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][138] ([i915#2920]) -> [SKIP][139] ([fdo#111068] / [i915#658])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl3/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl2/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl4/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl1/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl6/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl8/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl4/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl8/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5361]: https://gitlab.freedesktop.org/drm/intel/issues/5361
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6619 -> IGTPW_7630
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7630: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/index.html
  IGT_6619: ec2ab8e3a151ce05bd2726319c528c2ab99e8a96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/index.html

--===============3382261423416291240==
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
o dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107117/">https://patchwork.freedesktop.org/series/107117/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7630/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11981_full -&gt; IGTPW_7630_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/index.=
html</p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11981_full and IGTPW_7630_=
full:</p>
<h3>New IGT tests (114)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 5.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.69, 5.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp=
-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.72, 37.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [40.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [40.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-vg=
a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-dp=
-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.63, 37.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [37.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [37.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-vg=
a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.73, 5.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 5.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.67, 38.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [42.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [41.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.59, 37.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [38.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [38.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.11, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.68, 4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.91, 3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.87, 4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.12, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.66, 4.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.92, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-edp-1:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a=
-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-vga-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.11, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-edp-1:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.67, 4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a=
-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-vga-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.94, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.12, 4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.68, 4.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-d=
p-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-e=
dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-h=
dmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-h=
dmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-v=
ga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-d=
p-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-e=
dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-h=
dmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-h=
dmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-v=
ga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-1:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [16.44, 16.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-vga-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-dp-1:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.25, 3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [16.12, 16.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-vga-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-dp-1=
:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-=
1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi=
-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-hdmi=
-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-vga-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-dp-1=
:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-edp-=
1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi=
-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-hdmi=
-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-vga-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.95, 8.94] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7630_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-tglb2/igt@api_intel_allocator@two-level-inception-inter=
ruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7630/shard-tglb5/igt@api_intel_allocator@two-level-inception-i=
nterruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5361">i915#5361</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@all:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb1/igt@drm_buddy@all.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)<=
/p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb7/igt@drm_buddy@all.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb3/i=
gt@feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard=
-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
30/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-snb4/igt@gem_ctx_persistence@legacy-engines-=
persistence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3354">i915#33=
54</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5=
784</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/=
shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-=
tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-k=
bl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb2/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb3/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-kbl4/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11981/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-tglb7/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl6/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl7/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +147 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-til=
ed-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +22 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/768">i915#768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb8/igt@gem_softpin@evict-single-offset.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shar=
d-iclb7/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-kbl7/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-apl1/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4991">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
0/shard-apl8/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb5/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb8/igt@gen7_exec_parse@chained-batch.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl8/igt@gen9_exec_parse@allowed-single.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5566">i915#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">=
i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb4/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb7/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-tglb2/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-iclb6/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-glk5/igt@kms_big_fb@yf-tiled-addfb-size-over=
flow.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-glk3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_ccs@pipe-b-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb3/igt@kms_ccs@pipe-b-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +209 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-iclb4/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl7/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb2/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb2/igt@kms_dsc@dsc-with-bpp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#382=
8</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_dsc@dsc-with-bpp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#382=
8</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb7/igt@kms_flip@2x-blocking-wf_vblank.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
4">fdo#109274</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb5/igt@kms_flip@2x-blocking-wf_vblank.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
4">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3637">i915#3637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-mo=
desetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6497">i915#6497</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +34 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +3 similar iss=
ues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb6/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk2/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7630/shard-glk5/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
18">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb7/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_plane_scaling@plan=
es-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">=
i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
467">i915#3467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-ic=
lb4/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb2/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7630/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-kbl4/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-apl7/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-tglb7/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-iclb1/igt@prime_nv_pcopy@test3_3.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-apl3/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7630/shard-kbl1/igt@sysfs_clients@sema-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7630/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl1/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3=
063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
30/shard-apl6/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
630/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
30/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/s=
hard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7630/shard-glk3/igt@kms_async_flips@alternate-sync-as=
ync-flip@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5072">i915#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7630/shard-iclb6/igt@kms_cursor_legacy@cursor-vs-flip@varying-si=
ze.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk2/igt@kms_cursor_legacy@flip-vs-=
cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-glk5/igt@kms_flip@2x-plain-flip-=
fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7630/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl3/igt@kms_plane_lowres@tiling-y@pipe-a-dp-1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7630/shard-apl4/igt@kms_plane_lowres@tiling-y@pipe-a-dp-1.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shar=
d-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-accuracy-idle:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl3/igt@kms_vblank@pipe-a-accuracy-idle.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915=
#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
30/shard-apl1/igt@kms_vblank@pipe-a-accuracy-idle.html">PASS</a> +6 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.=
html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7630/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7630/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.htm=
l">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-glk9/igt@perf@polling-parameterized.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shar=
d-glk2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
30/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7630/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i91=
5#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.h=
tml">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7630/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb4/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7630/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7630/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11981/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7630/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11981/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl2/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11981/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11981/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11981/shard-apl8/igt@runner@aborted.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7630/shard-apl1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-ap=
l6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7630/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/shard-apl4/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7630/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#=
3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312"=
>i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6619 -&gt; IGTPW_7630</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7630: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7630/index.htm=
l<br />
  IGT_6619: ec2ab8e3a151ce05bd2726319c528c2ab99e8a96 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3382261423416291240==--

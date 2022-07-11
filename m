Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4072574853086450360=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 11 Jul 2022 19:17:12 -0000
Message-ID: <165756703285.5763.7018724077476304547@emeril.freedesktop.org>
References: <20220711070036.10453-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220711070036.10453-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fgt=3A_Remove_static_vcs2_engine?=
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

--===============4072574853086450360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_gt: Remove static vcs2 engine
URL   : https://patchwork.freedesktop.org/series/106172/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11862_full -> IGTPW_7495_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7495_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x170} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +47 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x170.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@device_reset@unbind-reset-rebind:
    - {shard-dg1}:        NOTRUN -> ([INCOMPLETE][2], [PASS][3])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-rkl}:        NOTRUN -> ([WARN][4], [PASS][5])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11862_full and IGTPW_7495_full:

### New IGT tests (288) ###

  * igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.17] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [11.54] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [8.15] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.87] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.87] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.44] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.75] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.81] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.81] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.75] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.82] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.74] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.74] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.74] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.74] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.58] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.54] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.53] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.59] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.52] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.52] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [5.58] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [5.59] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [5.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [5.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.57] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.22] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.84] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.79] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.79] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.79] s

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.22] s

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.08] s

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.99] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.93] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.92] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.13] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.07] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.09] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.15] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.08] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.12] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.76] s

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.65] s

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.69] s

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.65] s

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [30.36] s

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [30.00] s

  * igt@kms_flip@flip-vs-panning@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.74] s

  * igt@kms_flip@flip-vs-panning@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.72] s

  * igt@kms_flip@flip-vs-panning@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.70] s

  * igt@kms_flip@flip-vs-panning@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.72] s

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.69] s

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.67] s

  * igt@kms_flip@flip-vs-rmfb@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.67] s

  * igt@kms_flip@flip-vs-rmfb@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.69] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [3.04] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.98] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.92] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [2.91] s

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.99] s

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.95] s

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.93] s

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.93] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.13] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.07] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.07] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_legacy_colorkey@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_rmfb@close-fd@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_rmfb@close-fd@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_sequence@get-forked@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_sequence@get-forked@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_sequence@get-forked@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_sequence@get-forked@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_setmode@basic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_setmode@basic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_7495_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@busy-idle-check-all:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271]) +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@drm_fdinfo@busy-idle-check-all.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> ([DMESG-WARN][7], [DMESG-WARN][8]) ([i915#4991])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl7/igt@gem_create@create-massive.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> ([DMESG-WARN][9], [DMESG-WARN][10]) ([i915#4991])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@gem_create@create-massive.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_create@create-massive.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][11] -> ([FAIL][12], [PASS][13]) ([i915#6268])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> ([SKIP][16], [SKIP][17]) ([fdo#109271] / [i915#1099]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@gem_ctx_persistence@engines-hostile.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb7/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglb:         NOTRUN -> ([FAIL][18], [FAIL][19]) ([i915#2410])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@gem_ctx_persistence@hostile.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][20] -> ([SKIP][21], [PASS][22]) ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> ([FAIL][23], [FAIL][24]) ([i915#6117])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_exec_balancer@parallel-ordering.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][25] -> ([PASS][26], [FAIL][27]) ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          NOTRUN -> ([PASS][28], [FAIL][29]) ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          NOTRUN -> ([FAIL][30], [FAIL][31]) ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-snb:          NOTRUN -> ([SKIP][32], [SKIP][33]) ([fdo#109271]) +48 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb7/igt@gem_exec_fair@basic-none-solo.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb5/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          NOTRUN -> ([FAIL][34], [PASS][35]) ([i915#2842])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-tglb:         NOTRUN -> ([FAIL][36], [FAIL][37]) ([i915#2842])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][38] ([i915#2842])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> ([FAIL][39], [FAIL][40]) ([i915#2842])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][41] -> ([FAIL][42], [PASS][43]) ([i915#2842])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][44] ([i915#2842])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][45] -> ([FAIL][46], [PASS][47]) ([i915#2842])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-apl:          [PASS][48] -> ([PASS][49], [FAIL][50]) ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          NOTRUN -> ([FAIL][51], [FAIL][52]) ([i915#2842]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][53] -> [FAIL][54] ([i915#2842])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb1/igt@gem_exec_fair@basic-pace@bcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-kbl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl6/igt@gem_exec_suspend@basic-s3@smem.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_lmem_swapping@verify:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-kbl:          NOTRUN -> ([SKIP][58], [SKIP][59]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_lmem_swapping@verify-random.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglb:         NOTRUN -> ([SKIP][60], [SKIP][61]) ([i915#4270]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@gem_pxp@create-regular-buffer.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_pxp@create-regular-buffer.html
    - shard-iclb:         NOTRUN -> ([SKIP][62], [SKIP][63]) ([i915#4270])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_pxp@create-regular-buffer.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_softpin@evict-single-offset:
    - shard-kbl:          NOTRUN -> ([FAIL][64], [FAIL][65]) ([i915#4171])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_softpin@evict-single-offset.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_softpin@evict-single-offset.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> ([SKIP][66], [SKIP][67]) ([fdo#109312])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglb:         NOTRUN -> ([SKIP][68], [SKIP][69]) ([fdo#109289]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@gen7_exec_parse@basic-allocation.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][70] -> ([DMESG-WARN][71], [DMESG-WARN][72]) ([i915#5566] / [i915#716])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@gen9_exec_parse@allowed-single.html
    - shard-glk:          [PASS][73] -> ([DMESG-WARN][74], [DMESG-WARN][75]) ([i915#5566] / [i915#716])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk6/igt@gen9_exec_parse@allowed-single.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk1/igt@gen9_exec_parse@allowed-single.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][76] -> ([DMESG-WARN][77], [PASS][78]) ([i915#6201])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][79] -> ([PASS][80], [FAIL][81]) ([i915#454])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglb:         NOTRUN -> ([WARN][82], [WARN][83]) ([i915#2681]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-glk:          [PASS][84] -> ([WARN][85], [PASS][86]) ([i915#6405])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          NOTRUN -> ([DMESG-WARN][87], [PASS][88]) ([i915#180]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271]) +73 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([fdo#111615])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> ([SKIP][92], [SKIP][93]) ([fdo#109278] / [i915#3886])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][94], [SKIP][95]) ([i915#3689] / [i915#3886])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][96], [SKIP][97]) ([i915#3689]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-iclb:         [PASS][98] -> ([FAIL][99], [FAIL][100]) ([i915#1888])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][101], [SKIP][102]) ([i915#6095]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][103], [SKIP][104]) ([fdo#111615] / [i915#3689]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([fdo#109271] / [i915#3886]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#3886]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
    - shard-kbl:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([fdo#109271]) +153 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> ([SKIP][110], [SKIP][111]) ([fdo#109278]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb3/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][112] ([fdo#109271] / [fdo#111827])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb5/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-glk:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([fdo#109271] / [fdo#111827]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_chamelium@dp-hpd-fast.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk5/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-kbl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([fdo#109271] / [fdo#111827]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [fdo#111827])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-tglb:         NOTRUN -> ([SKIP][119], [SKIP][120]) ([fdo#109284] / [fdo#111827])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-glk:          NOTRUN -> [SKIP][121] ([fdo#109271] / [fdo#111827])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-iclb:         NOTRUN -> ([SKIP][122], [SKIP][123]) ([fdo#109284] / [fdo#111827])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109271] / [fdo#111827]) +12 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> ([SKIP][126], [SKIP][127]) ([i915#1063])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_content_protection@lic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> ([TIMEOUT][128], [TIMEOUT][129]) ([i915#1319]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_content_protection@srm.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> ([SKIP][130], [SKIP][131]) ([fdo#109274] / [fdo#111825])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> ([FAIL][132], [FAIL][133]) ([i915#4767])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> ([INCOMPLETE][134], [INCOMPLETE][135]) ([i915#180] / [i915#4939])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglb:         NOTRUN -> ([SKIP][136], [SKIP][137]) ([fdo#109274] / [fdo#111825] / [i915#3637])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][138] -> ([PASS][139], [DMESG-WARN][140]) ([i915#180]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][141] ([i915#2672]) +6 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][142], [SKIP][143]) ([i915#2672]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> ([SKIP][144], [SKIP][145]) ([i915#2672])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][146] -> [SKIP][147] ([i915#3555])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglb:         NOTRUN -> ([SKIP][148], [SKIP][149]) ([i915#5439])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][150] ([fdo#109271]) +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
    - shard-iclb:         NOTRUN -> ([SKIP][151], [SKIP][152]) ([fdo#109280])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> ([SKIP][153], [SKIP][154]) ([fdo#109280] / [fdo#111825]) +4 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-apl:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([fdo#109271]) +11 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][157] ([fdo#109271]) +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][158] -> ([SKIP][159], [SKIP][160]) ([i915#433])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> ([SKIP][161], [SKIP][162]) ([i915#6403]) +3 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][163] -> ([DMESG-WARN][164], [DMESG-WARN][165]) ([i915#180])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-4:
    - shard-glk:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([fdo#109271]) +21 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_plane_multiple@atomic-pipe-b-tiling-4.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk9/igt@kms_plane_multiple@atomic-pipe-b-tiling-4.html

  * {igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][168] ([i915#5176]) +15 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][169] -> ([PASS][170], [SKIP][171]) ([i915#5235]) +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-kbl:          NOTRUN -> [SKIP][172] ([fdo#109271] / [i915#658])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglb:         NOTRUN -> ([SKIP][173], [SKIP][174]) ([i915#2920])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([fdo#109271] / [i915#658]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> ([SKIP][177], [SKIP][178]) ([i915#658])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][179] -> ([PASS][180], [SKIP][181]) ([fdo#109642] / [fdo#111068] / [i915#658])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][182] -> ([SKIP][183], [PASS][184]) ([fdo#109441])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          [PASS][185] -> ([FAIL][186], [FAIL][187]) ([i915#1888] / [i915#65])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_vblank@pipe-a-query-forked-busy:
    - shard-snb:          [PASS][188] -> ([SKIP][189], [PASS][190]) ([fdo#109271]) +4 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-snb5/igt@kms_vblank@pipe-a-query-forked-busy.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb7/igt@kms_vblank@pipe-a-query-forked-busy.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb5/igt@kms_vblank@pipe-a-query-forked-busy.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][191] -> [INCOMPLETE][192] ([i915#3614] / [i915#4939])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][193] -> ([PASS][194], [FAIL][195]) ([i915#5639])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl8/igt@perf@polling-parameterized.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl7/igt@perf@polling-parameterized.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@perf@polling-parameterized.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> ([SKIP][196], [SKIP][197]) ([fdo#109289])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@perf@unprivileged-single-ctx-counters.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> ([SKIP][198], [SKIP][199]) ([fdo#109291]) +1 similar issue
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> ([SKIP][200], [SKIP][201]) ([fdo#109291])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@prime_nv_api@i915_nv_import_vs_close.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb1/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@sysfs_clients@split-10:
    - shard-kbl:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([fdo#109271] / [i915#2994]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@sysfs_clients@split-10.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-snb:          [TIMEOUT][204] ([i915#5748]) -> ([PASS][205], [PASS][206])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-snb6/igt@gem_busy@close-race.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb7/igt@gem_busy@close-race.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][207] ([i915#180]) -> ([PASS][208], [PASS][209]) +1 similar issue
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][210] ([i915#118]) -> ([PASS][211], [PASS][212])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [TIMEOUT][213] ([i915#3953]) -> ([PASS][214], [PASS][215])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][216] ([i915#3921]) -> ([PASS][217], [PASS][218])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb7/igt@i915_selftest@live@hangcheck.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@i915_selftest@live@hangcheck.html
    - shard-tglb:         [DMESG-WARN][219] ([i915#5591]) -> ([PASS][220], [PASS][221])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb3/igt@i915_selftest@live@hangcheck.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@i915_selftest@live@hangcheck.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][222] ([i915#180]) -> ([PASS][223], [PASS][224])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl4/igt@i915_suspend@fence-restore-untiled.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl2/igt@i915_suspend@fence-restore-untiled.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-WARN][225] ([i915#180]) -> [PASS][226] +2 similar issues
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1:
    - shard-kbl:          [FAIL][227] ([i915#2122]) -> ([PASS][228], [PASS][229])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html

  * igt@kms_plane@plane-position-covered@pipe-b-planes:
    - shard-tglb:         [INCOMPLETE][230] -> ([PASS][231], [PASS][232])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb8/igt@kms_plane@plane-position-covered@pipe-b-planes.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_plane@plane-position-covered@pipe-b-planes.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_plane@plane-position-covered@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-glk:          [DMESG-FAIL][233] ([i915#118] / [i915#1888]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2:
    - shard-glk:          [FAIL][235] ([i915#1888]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][237] ([i915#5519]) -> ([PASS][238], [PASS][239])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][240] ([i915#5784]) -> ([FAIL][241], [PASS][242]) ([i915#5784])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb2/igt@gem_eio@kms.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@gem_eio@kms.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][243] ([i915#4525]) -> ([PASS][244], [SKIP][245]) ([i915#4525]) +3 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][246] ([i915#2842]) -> ([FAIL][247], [FAIL][248]) ([i915#2842] / [i915#2852])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][249] ([i915#2842]) -> ([PASS][250], [FAIL][251]) ([i915#2842])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][252] ([i915#2849]) -> ([PASS][253], [FAIL][254]) ([i915#2849])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][255] ([i915#3614] / [i915#4939] / [i915#794]) -> [DMESG-WARN][256] ([i915#180])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][257] ([i915#658]) -> ([SKIP][258], [SKIP][259]) ([i915#588] / [i915#658])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         [WARN][260] ([i915#2684]) -> ([FAIL][261], [WARN][262]) ([i915#2684])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-iclb:         [FAIL][263] ([i915#2684]) -> ([WARN][264], [WARN][265]) ([i915#2684])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
    - shard-kbl:          [WARN][266] ([i915#6405]) -> ([WARN][267], [PASS][268]) ([i915#6405])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-FAIL][269] ([i915#180]) -> ([PASS][270], [FAIL][271]) ([i915#1188])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][272] ([i915#180]) -> ([PASS][273], [DMESG-WARN][274]) ([i915#180]) +1 similar issue
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][275] ([i915#2920]) -> ([SKIP][276], [SKIP][277]) ([i915#658])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][278] ([i915#2920]) -> ([SKIP][279], [SKIP][280]) ([fdo#111068] / [i915#658])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][281] ([fdo#111068] / [i915#658]) -> ([SKIP][282], [SKIP][283]) ([fdo#111068] / [i915#2920] / [i915#658]) +1 similar issue
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][284] ([fdo#109441]) -> ([SKIP][285], [PASS][286]) ([fdo#109441]) +3 similar issues
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][287], [FAIL][288]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][289], [FAIL][290], [FAIL][291], [FAIL][292], [FAIL][293], [FAIL][294], [FAIL][295], [FAIL][296], [FAIL][297], [FAIL][298]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl8/igt@runner@aborted.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl4/igt@runner@aborted.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@runner@aborted.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@runner@aborted.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl1/igt@runner@aborted.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@runner@aborted.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@runner@aborted.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl8/igt@runner@aborted.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl7/igt@runner@aborted.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/igt@runner@aborted.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@runner@aborted.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][299], [FAIL][300], [FAIL][301], [FAIL][302], [FAIL][303], [FAIL][304], [FAIL][305], [FAIL][306], [FAIL][307]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][308], [FAIL][309], [FAIL][310], [FAIL][311], [FAIL][312], [FAIL][313], [FAIL][314], [FAIL][315], [FAIL][316], [FAIL][317], [FAIL][318], [FAIL][319], [FAIL][320], [FAIL][321]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@aborted.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborted.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@aborted.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborted.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborted.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@runner@aborted.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3953]: https://gitlab.freedesktop.org/drm/intel/issues/3953
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/index.html

--===============4072574853086450360==
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
<tr><td><b>Series:</b></td><td>lib/igt_gt: Remove static vcs2 engine</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106172/">https://patchwork.freedesktop.org/series/106172/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7495/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7495/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11862_full -&gt; IGTPW_7495_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7495=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x170} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding@pip=
e-b-hdmi-a-4-512x170.html">SKIP</a> +47 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-dg1-17/igt@device_reset@unbind-reset-rebind=
.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7495/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vc=
s0.html">WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7495/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a>)<=
/li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11862_full and IGTPW_7495_=
full:</p>
<h3>New IGT tests (288)</h3>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@hdmi-a-4-pipe-a:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-4-=
pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-4-=
pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-4-pipe-a:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-4-pipe-b:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdm=
i-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdm=
i-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [30.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [30.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-a-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-b-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-c-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75@pipe-d-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-c-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-d-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-c-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-d-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-b-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-c-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-d-hd=
mi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7495_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-snb2/igt@drm_fdinfo@busy-idle-check-all.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-apl7/igt@gem_create@create-massive.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495=
/shard-apl3/igt@gem_create@create-massive.html">DMESG-WARN</a>) ([i915#4991=
])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@gem_create@create-massive.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495=
/shard-kbl6/igt@gem_create@create-massive.html">DMESG-WARN</a>) ([i915#4991=
])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shar=
d-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_ctx_exec=
@basic-nohangcheck.html">PASS</a>) ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
95/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-snb2/igt@gem_ctx_persistence@engines-hostil=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-snb7/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a>) (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099">i91=
5#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@gem_ctx_persistence@hostile.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/s=
hard-tglb7/igt@gem_ctx_persistence@hostile.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495=
/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@ge=
m_exec_balancer@parallel-contexts.html">PASS</a>) ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_exec_balancer@parallel-orderin=
g.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a>) ([=
i915#6117])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard=
-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@gem_exec_fair@=
basic-flow@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs=
0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-snb7/igt@gem_exec_fair@basic-none-solo.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/=
shard-snb5/igt@gem_exec_fair@basic-none-solo.html">SKIP</a>) (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +48 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
495/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a=
>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7495/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_exec_fair@basic-none-solo@rcs0=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-iclb2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
kbl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_exec_fair@bas=
ic-none@vcs0.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/s=
hard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk8/igt@gem_=
exec_fair@basic-pace-share@rcs0.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/s=
hard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/igt@gem_=
exec_fair@basic-pace-share@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-kbl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb1/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
iclb7/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl6/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
kbl6/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@gem_lmem_swapping@verify.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@gem_lmem_swapping@verify-random.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_749=
5/shard-kbl7/igt@gem_lmem_swapping@verify-random.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@gem_pxp@create-regular-buffer.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/=
shard-tglb3/igt@gem_pxp@create-regular-buffer.html">SKIP</a>) ([i915#4270])=
 +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@gem_pxp@create-regular-buffer.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/=
shard-iclb4/igt@gem_pxp@create-regular-buffer.html">SKIP</a>) ([i915#4270])=
</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_softpin@evict-single-offset.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_749=
5/shard-kbl6/igt@gem_softpin@evict-single-offset.html">FAIL</a>) ([i915#417=
1])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7495/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</=
a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo#=
109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@gen7_exec_parse@basic-allocation.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
495/shard-tglb7/igt@gen7_exec_parse@basic-allocation.html">SKIP</a>) (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-apl6/igt@gen9_exec_parse@allowed-single.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@gen9_exec_=
parse@allowed-single.html">DMESG-WARN</a>) ([i915#5566] / [i915#716])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-glk6/igt@gen9_exec_parse@allowed-single.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
glk1/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk2/igt@gen9_exec_=
parse@allowed-single.html">DMESG-WARN</a>) ([i915#5566] / [i915#716])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-snb7/igt@i915_module_load@reload-with-fault-injection.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7495/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
495/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS<=
/a>) ([i915#6201])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@=
i915_pm_dc@dc6-psr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7495/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">FAIL</a>) (=
[i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rc=
s0.html">WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7495/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/=
shard-glk1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-glk7/igt@i915=
_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a>) ([i915#6405])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@i915_suspend@fence-restore-untiled=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7495/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp=
-rotate-0.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@kms_ccs@pipe-a-bad-pixel-format-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_ccs@pipe-a-bad-pixel-format-=
y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-=
y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-y=
_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7495/shard-tglb8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_ti=
led_ccs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7495/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y=
f_tiled_ccs.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7495/shard-iclb5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_=
tiled_ccs.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_ccs@pipe-c-bad-pixel-format-4=
_tiled_dg2_rc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-4_til=
ed_dg2_rc_ccs.html">SKIP</a>) ([i915#6095]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_ccs@pipe-c-bad-pixel-format-y=
f_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7495/shard-tglb3/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_cc=
s.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-=
y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_ccs@pipe-c-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7495/shard-kbl1/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_ccs@pipe-d-bad-pixel-format-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb3/igt@kms_ccs@pipe-d-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-snb5/igt@kms_chamelium@dp-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_chamelium@dp-hpd-fast.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shar=
d-glk5/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a>) (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_chamelium@hdmi-cmp-planar-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>) (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo=
#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7495/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_color_chamelium@pipe-a-ctm-0-2=
5.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>) (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#10928=
4</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">f=
do#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7495/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@kms_color_chamelium@pipe-a-ctm-0-2=
5.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>) (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#10928=
4</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">f=
do#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-blu=
e-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7495/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_content_protection@lic.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/sh=
ard-tglb3/igt@kms_content_protection@lic.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1063">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_content_protection@srm.html">T=
IMEOUT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/=
shard-kbl1/igt@kms_content_protection@srm.html">TIMEOUT</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7495/shard-tglb8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard=
-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a>) ([i915#4767])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INC=
OMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495=
/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i915#=
4939])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-tglb3/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>) (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#109274=
</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fd=
o#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard=
-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@kms_flip@flip-v=
s-suspend@a-dp1.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/igt@kms=
_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-vali=
d-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@kms=
_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-vali=
d-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_flip_sc=
aled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
55">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7495/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</=
a>) ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7495/shard-apl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-p=
rimscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a>) (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +4 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
tglb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb3/igt@kms_hdmi_inject@=
inject-audio.html">SKIP</a>) ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_invalid_mode@clock-too-high@e=
dp-1-pipe-a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7495/shard-tglb3/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-=
a.html">SKIP</a>) ([i915#6403]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7495/shard-apl4/igt@kms_plane@plane-panning-bottom-right-=
suspend@pipe-a-planes.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7495/shard-apl1/igt@kms_plane@plane-panning-bott=
om-right-suspend@pipe-a-planes.html">DMESG-WARN</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-glk6/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7495/shard-glk9/igt@kms_plane_multiple@atomic-pipe-b-tiling-4.html">=
SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a=
-hdmi-a-4} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-dg1-12/igt@kms_plane_scaling@plane-downscale=
-with-modifiers-factor-0-25@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#5176]) +1=
5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms=
_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html"=
>SKIP</a>) ([i915#5235]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-co=
ntinuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-tglb8/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-big-fb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-d=
mg-area-big-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-glk2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7495/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg=
-area-big-fb.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-big-fb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7495/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-d=
mg-area-big-fb.html">SKIP</a>) ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shar=
d-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb1/igt@kms_psr2_su@=
page_flip-xrgb8888.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb6/ig=
t@kms_psr@psr2_no_drrs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS<=
/a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo=
#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-=
top.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7495/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-=
top.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7495/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
888">i915#1888</a> / [i915#65])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-snb5/igt@kms_vblank@pipe-a-query-forked-busy.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/=
shard-snb7/igt@kms_vblank@pipe-a-query-forked-busy.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb5/igt@kms_=
vblank@pipe-a-query-forked-busy.html">PASS</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +4 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i=
915#3614</a> / [i915#4939])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl8/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl=
7/igt@perf@polling-parameterized.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@perf@polling-parameteri=
zed.html">FAIL</a>) ([i915#5639])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-iclb7/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7495/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html">SKIP</=
a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#=
109289</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a>) (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@prime_nv_api@i915_nv_import_vs_cl=
ose.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7495/shard-iclb1/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a>=
) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#10=
9291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@sysfs_clients@split-10.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-k=
bl6/igt@sysfs_clients@split-10.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar iss=
ue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-snb6/igt@gem_busy@close-race.html">TIMEOUT</a> ([i915#5=
748]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495=
/shard-snb7/igt@gem_busy@close-race.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@gem_busy@close-race.=
html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7495/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shar=
d-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a>) +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/118">i915#118</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7495/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked-all.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
495/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a=
>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3953">i915#3953</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7495/shard-tglb3/igt@i915_module_load@reload-with-fault-injec=
tion.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7495/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3=
921</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
495/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-snb2/igt@i915_sel=
ftest@live@hangcheck.html">PASS</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-tglb3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN<=
/a> ([i915#5591]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7495/shard-tglb7/igt@i915_selftest@live@hangcheck.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tglb8/i=
gt@i915_selftest@live@hangcheck.html">PASS</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl4/igt@i915_suspend@fence-restore-untiled.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7495/shard-apl2/igt@i915_suspend@fence-restore-untiled.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl6/i=
gt@i915_suspend@fence-restore-untiled.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl1/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7495/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.htm=
l">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-d=
p1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2122">i915#2122</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7495/shard-kbl1/igt@kms_flip@plain-flip-ts-check-interruptibl=
e@c-dp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7495/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1=
.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb8/igt@kms_plane@plane-position-covered@pipe-b-plane=
s.html">INCOMPLETE</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7495/shard-tglb5/igt@kms_plane@plane-position-covered@pipe-b-p=
lanes.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7495/shard-tglb3/igt@kms_plane@plane-position-covered@pipe-b-planes.ht=
ml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7495/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a=
-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888=
">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7495/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> ([i915#5519]) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7495/shard-tglb7/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7495/shard-tglb2/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-tgl=
b2/igt@gem_eio@kms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7495/shard-tglb7/igt@gem_eio@kms.html">PASS</a>) ([i915#5=
784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> ([i915#4525]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7495/shard-iclb1/igt@gem_exec_balancer@parallel-keep-sub=
mit-fence.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7495/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a>) ([i915#4525]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb3/ig=
t@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7495/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb7/=
igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@=
gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i915#3614</=
a> / [i915#4939] / [i915#794]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@gem_softpin@noreloc-s3.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> ([i915#658]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7495/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb1/i=
gt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) ([i915#588] / [i915#658]=
)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7495/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/=
igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915=
#2684</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb4/i=
gt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-kbl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN<=
/a> ([i915#6405]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7495/shard-kbl6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-k=
bl1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a>) ([i915#6405])</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">D=
MESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7495/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shar=
d-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@kms_plane@plane-panning-bot=
tom-right-suspend@pipe-a-planes.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a-planes.html">DMESG-WARN</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
920">i915#2920</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7495/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
495/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP<=
/a>) ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7495/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg=
-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7495/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1068">fdo#111068</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / [i915#658]) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr2_sf@primary-plane-up=
date-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7495/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dm=
g-area.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a> / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/sha=
rd-iclb7/igt@kms_psr@psr2_sprite_blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-iclb2/igt@kms_psr@psr2_sprit=
e_blt.html">PASS</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3002">i915#3002</a> / [i915#4312] / [i915#5257]) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7495/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl1/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7495/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495=
/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-=
apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7495/shard-apl3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-apl7/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3002">i915#3002</a> / [i915#4312] / [i915#525=
7])</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11862/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11862/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1862/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1186=
2/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / [i915#4312] / [i=
915#5257]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7495/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kb=
l1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7495/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl1/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7495/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl4/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7495/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/shard-kbl6/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/sh=
ard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3002">i915#3002</a> / [i915#4312] / [i915#=
5257] / [i915#92])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[i</p>

</body>
</html>

--===============4072574853086450360==--

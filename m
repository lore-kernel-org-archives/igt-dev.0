Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1075484004502542470=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 27 Jun 2022 09:57:44 -0000
Message-ID: <165632386489.11792.4122207793254150800@emeril.freedesktop.org>
References: <20220622154837.20582-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220622154837.20582-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Finvalid=5Fmode=3A_Test_Cleanup?=
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

--===============1075484004502542470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/105501/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6541_full -> IGTPW_7362_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7362_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7362_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7362_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * {igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a.html

  * {igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb5/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color@pipe-d-invalid-gamma-lut-sizes:
    - {shard-dg1}:        NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-15/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html

  * igt@kms_concurrent@pipe-b@hdmi-a-1:
    - {shard-dg1}:        [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-dg1-13/igt@kms_concurrent@pipe-b@hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-15/igt@kms_concurrent@pipe-b@hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:
    - {shard-tglu}:       NOTRUN -> [SKIP][12] +13 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32.html

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:
    - {shard-dg1}:        NOTRUN -> [SKIP][13] +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - {shard-rkl}:        NOTRUN -> [SKIP][14] +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-2/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_invalid_mode@bad-htotal:
    - {shard-rkl}:        [SKIP][15] ([i915#4278]) -> [SKIP][16] +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@kms_invalid_mode@bad-htotal.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-2/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_invalid_mode@zero-clock:
    - {shard-rkl}:        [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-2/igt@kms_invalid_mode@zero-clock.html

  
New tests
---------

  New tests have been introduced between IGT_6541_full and IGTPW_7362_full:

### New IGT tests (182) ###

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.56] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 5.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.43] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 5.42] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 5.51] s

  * igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.34] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.31] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.34] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-htotal@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.34] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 0.78] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.36] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@clock-too-high@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@clock-too-high@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.31] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.36] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@int-max-clock@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.31] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.35] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@zero-clock@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.30] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.30] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.34] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_7362_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@feature_discovery@psr2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb7/igt@feature_discovery@psr2.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#5325])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][22] ([i915#4991])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1099]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         NOTRUN -> [TIMEOUT][24] ([i915#3063])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][25] -> [TIMEOUT][26] ([i915#3063])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb6/igt@gem_eio@in-flight-contexts-10ms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][27] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#2842])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][34] ([i915#2842])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#2842]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_suspend@basic-s3-devices@smem:
    - shard-snb:          [PASS][39] -> [INCOMPLETE][40] ([i915#5871])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-snb6/igt@gem_exec_suspend@basic-s3-devices@smem.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-snb7/igt@gem_exec_suspend@basic-s3-devices@smem.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl2/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][45] ([i915#2658])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#4270])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#4270])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271]) +54 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#768]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#3297])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@input-checking:
    - shard-glk:          NOTRUN -> [DMESG-WARN][51] ([i915#4991])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3297]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2527] / [i915#2856])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@gen9_exec_parse@unaligned-jump.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#2856])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#454])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][57] -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-apl4/igt@i915_pm_dc@dc9-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109289]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109289])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][61] ([i915#2681])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][62] ([i915#2373])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][63] ([i915#1759])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3826])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#3826])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#5286])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#5286])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111614])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111615]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#6095]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689] / [i915#6095]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +5 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#3689] / [i915#3886]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#3886]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [i915#3886]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3689]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk8/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl3/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@pipe-a-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278] / [i915#3555])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb2/igt@kms_color@pipe-a-deep-color.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#1149])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb7/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_color_chamelium@pipe-a-degamma.html
    - shard-snb:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-snb5/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_color_chamelium@pipe-d-degamma.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][87] ([i915#3359]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - shard-apl:          [PASS][88] -> [DMESG-WARN][89] ([i915#180]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#5287]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109274]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +113 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109280] / [fdo#111825]) +14 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][95] ([fdo#109271]) +156 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109280]) +9 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][97] -> [SKIP][98] ([i915#433])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#3555])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_hdr@bpc-switch-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#3555])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][101] ([i915#265])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-glk:          NOTRUN -> [FAIL][102] ([i915#265])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][103] ([i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][104] ([fdo#108145] / [i915#265]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#5176]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#5176]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271]) +74 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#5235]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#5235]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#658])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2920]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#658])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#658])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#658]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][115] -> [SKIP][116] ([fdo#109441])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][117] ([i915#132] / [i915#3467])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_psr@psr2_sprite_plane_onoff.html
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109441])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][119] -> [DMESG-WARN][120] ([i915#180]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109278]) +15 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#2437])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl1/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#2437])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_writeback@writeback-check-output.html

  * igt@prime_nv_pcopy@test1_micro:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109291]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@prime_nv_pcopy@test1_micro.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109291]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@sysfs_clients@fair-0:
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#2994]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl3/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@split-25:
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2994]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl3/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@hostile:
    - {shard-tglu}:       [FAIL][128] ([i915#2410]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglu-3/igt@gem_ctx_persistence@hostile.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglu-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglb:         [FAIL][130] ([i915#5099]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb2/igt@gem_ctx_persistence@smoketest.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][132] ([i915#5784]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb2/igt@gem_eio@kms.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][134] ([i915#5784]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-dg1-16/igt@gem_eio@reset-stress.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-15/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - {shard-rkl}:        [TIMEOUT][136] ([i915#3063]) -> [PASS][137] +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-4/igt@gem_eio@unwedge-stress.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@fairslice:
    - {shard-rkl}:        [SKIP][138] ([i915#6259]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-5/igt@gem_exec_balancer@fairslice.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][140] ([i915#4525]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [FAIL][142] ([i915#2842]) -> [PASS][143] +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk9/igt@gem_exec_fair@basic-none@vecs0.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][144] ([i915#2842]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - {shard-rkl}:        [SKIP][146] ([i915#6251]) -> [PASS][147] +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-5/igt@gem_exec_fence@basic-wait@bcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-4/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_exec_parallel@engines@fds:
    - shard-iclb:         [INCOMPLETE][148] -> [PASS][149] +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb8/igt@gem_exec_parallel@engines@fds.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - {shard-rkl}:        [SKIP][150] ([i915#3281]) -> [PASS][151] +2 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][152] ([i915#2190]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][154] ([i915#4936]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][156] ([i915#644]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_pwrite_snooped:
    - {shard-rkl}:        [SKIP][158] ([i915#3282]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-4/igt@gem_pwrite_snooped.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-5/igt@gem_pwrite_snooped.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][160] ([i915#5566] / [i915#716]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-secure:
    - {shard-rkl}:        [SKIP][162] ([i915#2527]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][164] ([i915#6258]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][166] ([i915#454]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
    - {shard-rkl}:        [SKIP][168] ([i915#658]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@i915_pm_dc@dc6-psr.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-dg1}:        [SKIP][170] ([i915#1397]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rps@min-max-config-idle:
    - {shard-rkl}:        [FAIL][172] ([i915#4016]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_selftest@live@gt_pm:
    - {shard-tglu}:       [DMESG-FAIL][174] ([i915#3987]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglu-4/igt@i915_selftest@live@gt_pm.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglu-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][176] ([i915#3921]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-snb4/igt@i915_selftest@live@hangcheck.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - {shard-rkl}:        [SKIP][178] ([i915#1149] / [i915#4098]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - {shard-rkl}:        [SKIP][180] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@kms_color@pipe-b-ctm-green-to-red.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][182] -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - {shard-rkl}:        [SKIP][184] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][185] +5 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][186] ([i915#2122]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [DMESG-WARN][188] ([i915#180]) -> [PASS][189] +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][190] ([i915#180]) -> [PASS][191] +6 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - {shard-rkl}:        [SKIP][192] ([i915#3701]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - {shard-rkl}:        [SKIP][194] ([i915#1849] / [i915#4098]) -> [PASS][195] +25 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [FAIL][196] ([i915#1188]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@bad-source:
    - {shard-rkl}:        [SKIP][198] ([i915#1845] / [i915#4098]) -> [PASS][199] +16 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-5/igt@kms_pipe_crc_basic@bad-source.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - {shard-rkl}:        [SKIP][200] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [SKIP][202] ([i915#5235]) -> [PASS][203] +2 similar issues
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr@primary_mmap_gtt:
    - {shard-rkl}:        [SKIP][204] ([i915#1072]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-rkl-1/igt@kms_psr@primary_mmap_gtt.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][206] ([fdo#109441]) -> [PASS][207] +2 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [SKIP][208] ([i915#5519]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [FAIL][210] ([i915#43]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-glk9/igt@kms_vblank@pipe-b-accuracy-idle.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk9/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - {shard-dg1}:        [FAIL][212] ([i915#5234]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-12/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][214] ([i915#6117]) -> [SKIP][215] ([i915#4525])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][216] ([i915#658]) -> [SKIP][217] ([i915#588])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][218] ([i915#2920]) -> [SKIP][219] ([i915#658]) +1 similar issue
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][220] ([i915#2920]) -> [SKIP][221] ([fdo#111068] / [i915#658]) +1 similar issue
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][222] ([fdo#111068] / [i915#658]) -> [SKIP][223] ([i915#2920])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][224], [FAIL][225], [FAIL][226], [FAIL][227], [FAIL][228], [FAIL][229]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl1/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl3/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl1/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl6/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
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
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
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
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5357]: https://gitlab.freedesktop.org/drm/intel/issues/5357
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5871]: https://gitlab.freedesktop.org/drm/intel/issues/5871
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6541 -> IGTPW_7362

  CI-20190529: 20190529
  CI_DRM_11794: 529f44f159dbe70ba69b6f730280d5db9b7338bc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7362: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/index.html
  IGT_6541: 02153f109bd422d93cfce7f5aa9d7b0e22fab13c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/index.html

--===============1075484004502542470==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode: Test Cleanup</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105501/">https://patchwork.freedesktop.org/series/105501/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7362/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6541_full -&gt; IGTPW_7362_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7362_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7362_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7362=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding@pip=
e-d-hdmi-a-1-32x32.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding@pip=
e-d-hdmi-a-1-512x512.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitio=
ns.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7362/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transit=
ions.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7362/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">I=
NCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-a.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb5/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-b.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_color@pipe-d-invalid-gamma-lut-sizes:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-dg1-15/igt@kms_color@pipe-d-invalid-gamma-lu=
t-sizes.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b@hdmi-a-1:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-dg1-13/igt@kms_concurrent@pipe-b@hdmi-a-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg=
1-15/igt@kms_concurrent@pipe-b@hdmi-a-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding@pip=
e-b-hdmi-a-1-32x32.html">SKIP</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding@pip=
e-c-hdmi-a-1-512x512.html">SKIP</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-rkl-2/igt@kms_invalid_mode@bad-hsync-end.htm=
l">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-1/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#4278</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-=
rkl-2/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-2/=
igt@kms_invalid_mode@zero-clock.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6541_full and IGTPW_7362_full=
:</p>
<h3>New IGT tests (182)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.16, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7362_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb7/igt@f=
eature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325"=
>i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-kbl1/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@gem_eio@in-flight-1us.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i91=
5#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb6/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tg=
lb3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl3/=
igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard=
-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-glk9/=
igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6541/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/=
igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6541/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb=
6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-snb6/igt@gem_exec_suspend@basic-s3-devices@smem.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/sh=
ard-snb7/igt@gem_exec_suspend@basic-s3-devices@smem.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5871">i915#5871</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@gem_lmem_swapping@verify-random.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb3/igt@gem_pxp@verify-pxp-stale-ctx-execut=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb5/igt@gem_pxp@verify-pxp-stale-ctx-execut=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@gem_render_copy@yf-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb1/igt@gem_userptr_blits@access-control.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-glk2/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb1/igt@gen9_exec_parse@unaligned-jump.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb8/igt@gen9_exec_parse@unaligned-jump.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb3/igt@i91=
5_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-apl7/igt@i915=
_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-acc=
uracy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109289">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-acc=
uracy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.ht=
ml">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
81">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@kms_big_fb@4-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb8/igt@kms_big_fb@linear-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb7/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-glk7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-glk8/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-apl3/igt@kms_chamelium@hdmi-crc-nonplanar-fo=
rmats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb2/igt@kms_color@pipe-a-deep-color.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb7/igt@kms_color@pipe-d-ctm-0-5.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_color_chamelium@pipe-a-degamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +15 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-snb5/igt@kms_color_chamelium@pipe-a-degamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-0-5=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_color_chamelium@pipe-d-degamma=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding@pip=
e-d-hdmi-a-1-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362=
/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-re=
nder-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_flip@2x-dpms-vs-vblank-race.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_flip@2x-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +113 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +14 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +156 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6=
/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb6/igt@kms_hdr@bpc-switch-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_hdr@bpc-switch-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp=
-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb1/igt@kms_plane_scaling@plane-upscale-wit=
h-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues<=
/p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb6/igt@kms_plane_scaling@plane-upscale-wit=
h-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issues<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-apl2/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-25@pipe-b-dp-1.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +74 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb3/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb3/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-apl4/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb5/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-kbl3/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@=
kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-tglb2/igt@kms_psr@psr2_sprite_plane_onoff.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132=
">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3467">i915#3467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_psr@psr2_sprite_plane_onoff.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362=
/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb4/igt@kms_vblank@pipe-d-wait-forked.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
8">fdo#109278</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-apl1/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-kbl7/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-tglb5/igt@prime_nv_pcopy@test1_micro.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">=
fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-iclb6/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-apl3/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7362/shard-kbl3/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglu-3/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard=
-tglu-2/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb2/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shar=
d-tglb3/igt@gem_ctx_persistence@smoketest.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb6/igt@gem_ei=
o@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-dg1-16/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-dg1-15=
/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-4/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rk=
l-4/igt@gem_eio@unwedge-stress.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6259">i915#6259</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-=
rkl-6/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4=
525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
62/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk9/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shar=
d-glk3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard=
-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-5/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6251">i915#6251</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/sha=
rd-rkl-4/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb8/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shar=
d-iclb6/igt@gem_exec_parallel@engines@fds.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard=
-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt.html">PASS</a> +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-tglb2/=
igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4936">i91=
5#4936</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7362/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/sh=
ard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-4/igt@gem_pwrite_snooped.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-5/igt=
@gem_pwrite_snooped.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#=
716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
62/shard-glk3/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rk=
l-5/igt@gen9_exec_parse@bb-secure.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#6258=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/=
shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6541/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb5/igt@i9=
15_pm_dc@dc6-psr.html">PASS</a></p>
</li>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6541/shard-rkl-1/igt@i915_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@i9=
15_pm_dc@dc6-psr.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/=
shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/sh=
ard-rkl-4/igt@i915_pm_rps@min-max-config-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglu-4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/sh=
ard-tglu-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-snb4/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/=
shard-snb6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-4/igt@kms_color@pipe-a-ctm-blue-to-red.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915=
#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7362/shard-rkl-6/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-green-to-red:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-1/igt@kms_color@pipe-b-ctm-green-to-red.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i91=
5#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/407=
0">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7362/shard-rkl-6/igt@kms_color@pipe-b-ctm-green-to-red.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7362/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@ato=
mic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytile=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-render-ytiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a=
b-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7362/shard-glk5/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7362/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7362/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-yti=
le-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-sca=
ledprimary.html">PASS</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#=
1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
362/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-5/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#40=
98</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_736=
2/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> +16 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7362/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-al=
pha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-iclb8/igt@kms_plane_scaling@pl=
anes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">PASS</a> +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-rkl-1/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-rk=
l-6/igt@kms_psr@primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/sha=
rd-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7362/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-fl=
ip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-glk9/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-g=
lk9/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/=
shard-dg1-12/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#61=
17</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_736=
2/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shar=
d-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7362/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7362/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6541/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7362/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</=
a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6541/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6541/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6541/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#=
3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312"=
>i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7362/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7362/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
62/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7362/shard-kbl4/igt@runner@aborted.html">FA=
IL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/300=
2">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6541 -&gt; IGTPW_7362</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11794: 529f44f159dbe70ba69b6f730280d5db9b7338bc @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7362: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7362/index.htm=
l<br />
  IGT_6541: 02153f109bd422d93cfce7f5aa9d7b0e22fab13c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1075484004502542470==--

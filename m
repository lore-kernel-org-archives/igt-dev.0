Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6161989666594365657=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 17 Jun 2022 14:34:30 -0000
Message-ID: <165547647045.20133.261696956834306057@emeril.freedesktop.org>
References: <20220617041547.28298-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220617041547.28298-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Finvalid=5Fmode=2Ec=3A_Test_Cleanup?=
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

--===============6161989666594365657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode.c: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/105266/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11774_full -> IGTPW_7331_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7331_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7331_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/index.html

Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7331_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1.html

  * {igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html

  * {igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11774_full and IGTPW_7331_full:

### New IGT tests (174) ###

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
    - Exec time: [0.29, 0.31] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
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
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.31] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-htotal@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.29] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.31] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@clock-too-high@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@clock-too-high@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@kms_invalid_mode@int-max-clock@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_invalid_mode@int-max-clock@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.31] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@int-max-clock@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_invalid_mode@int-max-clock@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.30] s

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
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.31] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

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
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30] s

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
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_7331_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#1839])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#109314])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#109314])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-snb2/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#4525])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb1/igt@gem_exec_balancer@parallel.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-snb4/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk4/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][33] ([i915#2658]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4270])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4270])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#768])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][37] ([i915#4171])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl2/igt@gem_softpin@evict-single-offset.html
    - shard-glk:          NOTRUN -> [FAIL][38] ([i915#4171])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk3/igt@gem_softpin@evict-single-offset.html
    - shard-kbl:          NOTRUN -> [FAIL][39] ([i915#4171])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109290])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#110542])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [FAIL][42] ([i915#3318])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk8/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271]) +253 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-snb2/igt@gem_vm_create@invalid-create.html

  * igt@gen3_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109289]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#2527] / [i915#2856])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb1/igt@gen9_exec_parse@valid-registers.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#2856])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#454])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110892])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111644] / [i915#1397] / [i915#2411])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#4387])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#4387])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#4765])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#5286]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#5286]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111615]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110723])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615] / [i915#3689]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [i915#3886]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#6095]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3689] / [i915#3886]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3689] / [i915#6095])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3689]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271]) +183 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk1/igt@kms_chamelium@dp-hpd-enable-disable-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@kms_chamelium@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl4/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_chamelium@vga-hpd.html
    - shard-snb:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-snb7/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [i915#1149])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][78] ([i915#1319])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][79] ([i915#2105])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][80] ([i915#2105])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109279] / [i915#3359]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#3359]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3319]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#4103])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [i915#4103])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-tglb:         [PASS][87] -> [FAIL][88] ([i915#2346] / [i915#533])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [PASS][89] -> [FAIL][90] ([i915#2346] / [i915#533])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3528])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#3528])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#5287])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#5287])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109274]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109274] / [fdo#111825]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][97] -> [FAIL][98] ([i915#79])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [PASS][99] -> [FAIL][100] ([i915#79])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][101] -> [DMESG-WARN][102] ([i915#180]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-snb:          [PASS][103] -> [SKIP][104] ([fdo#109271]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-snb4/igt@kms_frontbuffer_tracking@basic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-snb4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-snb:          [PASS][105] -> [DMESG-WARN][106] ([i915#5090])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-snb4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109280]) +14 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109280] / [fdo#111825]) +14 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][109] -> [SKIP][110] ([i915#433])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][111] -> [FAIL][112] ([i915#1188])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          NOTRUN -> [FAIL][113] ([i915#1188]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-glk:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#533])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][115] ([fdo#108145] / [i915#265])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][116] ([fdo#108145] / [i915#265])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][117] ([i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271]) +102 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-128:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#109278]) +24 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_plane_cursor@pipe-d-overlay-size-128.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#5176]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#5176]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][122] ([fdo#109271]) +185 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#658]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][125] -> [SKIP][126] ([fdo#109441]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109441])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][128] ([i915#132] / [i915#3467]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][129] ([IGT#2])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_sysfs_edid_timing.html
    - shard-apl:          NOTRUN -> [FAIL][130] ([IGT#2])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl8/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][131] ([i915#180])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb3/igt@kms_vrr@flip-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][133] ([i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#2437])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#2437])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][136] ([i915#2530])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-iclb:         NOTRUN -> [SKIP][137] ([i915#2530])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][138] ([fdo#109289]) +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@perf@mi-rpc.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][139] ([fdo#109291]) +2 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_test@i915_import_cpu_mmap:
    - shard-iclb:         NOTRUN -> [SKIP][140] ([fdo#109291]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@prime_nv_test@i915_import_cpu_mmap.html

  * igt@sw_sync@sync_multi_timeline_wait:
    - shard-glk:          NOTRUN -> [FAIL][141] ([i915#6140])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk4/igt@sw_sync@sync_multi_timeline_wait.html

  * igt@sysfs_clients@busy:
    - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#2994]) +3 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk1/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-3:
    - shard-apl:          NOTRUN -> [SKIP][143] ([fdo#109271] / [i915#2994]) +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl6/igt@sysfs_clients@fair-3.html
    - shard-tglb:         NOTRUN -> [SKIP][144] ([i915#2994]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb3/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [SKIP][145] ([i915#2994]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb6/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          NOTRUN -> [SKIP][146] ([fdo#109271] / [i915#2994]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][147] ([i915#4525]) -> [PASS][148] +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][149] ([i915#2842]) -> [PASS][150] +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][151] ([i915#2842]) -> [PASS][152] +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][153] ([i915#2190]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][155] ([i915#5566] / [i915#716]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@gen9_exec_parse@allowed-single.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][157] ([i915#454]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][159] ([i915#5591]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-iclb:         [DMESG-WARN][161] ([i915#1888]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
    - shard-glk:          [DMESG-WARN][163] ([i915#118] / [i915#1888]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk4/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][165] ([i915#407]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk9/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][167] ([i915#180]) -> [PASS][168] +6 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [DMESG-WARN][169] ([i915#180]) -> [PASS][170] +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-c:
    - shard-kbl:          [SKIP][171] ([fdo#109271]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html
    - shard-apl:          [SKIP][173] ([fdo#109271]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html
    - shard-glk:          [SKIP][175] ([fdo#109271]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [SKIP][177] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][179] ([i915#4525]) -> [FAIL][180] ([i915#6117])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][181] ([i915#658]) -> [SKIP][182] ([i915#588])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][183] ([fdo#110892]) -> [INCOMPLETE][184] ([i915#4185])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][185] ([i915#2920]) -> [SKIP][186] ([fdo#111068] / [i915#658])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][187] ([fdo#111068] / [i915#658]) -> [SKIP][188] ([i915#2920])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl6/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl3/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl6/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl3/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl4/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl6/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl3/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl6/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl6/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4185]: https://gitlab.freedesktop.org/drm/intel/issues/4185
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#5090]: https://gitlab.freedesktop.org/drm/intel/issues/5090
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6533 -> IGTPW_7331
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11774: 4a54b767c0826e2b2661c039f0d3835286843333 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/index.html
  IGT_6533: 6b5107d91827962808441db6b98e478aa9e67bdb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/index.html

--===============6161989666594365657==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode.c: Test Cleanup</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105266/">https://patchwork.freedesktop.org/series/105266/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7331/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11774_full -&gt; IGTPW_7331_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7331_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7331_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/index.=
html</p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7331=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7331/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1.html">INC=
OMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-c.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-d.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11774_full and IGTPW_7331_=
full:</p>
<h3>New IGT tests (174)</h3>
<ul>
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
<li>Exec time: [0.29, 0.31] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.31] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
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
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [0.04] s</li>
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
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [0.29] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
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
<p>igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Exec time: [0.30] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [0.03] s</li>
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
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
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
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
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
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
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
<li>Exec time: [0.29, 0.30] s</li>
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
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
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
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Exec time: [0.30, 0.31] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [0.01] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<p>igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
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
<p>igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [0.01] s</li>
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
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7331_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb7/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb1/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb7/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb6/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb5/igt@gem_ctx_param@set-priority-not-supp=
orted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109314">fdo#109314</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb8/igt@gem_ctx_param@set-priority-not-supp=
orted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109314">fdo#109314</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-snb2/igt@gem_ctx_persistence@engines-mixed-p=
rocess.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-icl=
b5/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb3/igt@gem_exec_balancer@parallel-balance=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/=
shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/sh=
ard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-k=
bl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/s=
hard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-k=
bl3/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk1/igt@gem_lmem_swapping@heavy-verify-rand=
om-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl4/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-snb4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb5/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-glk4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb8/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb7/igt@gem_pxp@reject-modify-context-prote=
ction-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb6/igt@gem_pxp@reject-modify-context-prote=
ction-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl2/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-glk3/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl3/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb7/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb6/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk8/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-snb2/igt@gem_vm_create@invalid-create.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +253 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb2/igt@gen3_mixed_blits.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb1/igt@gen9_exec_parse@valid-registers.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb2/igt@gen9_exec_parse@valid-registers.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb3/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D110892">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb5/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb8/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-apl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/=
igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_ccs@pipe-a-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl3/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) +183 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-glk1/igt@kms_chamelium@dp-hpd-enable-disable-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +15 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb2/igt@kms_chamelium@dp-hpd-enable-disable=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl4/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_chamelium@hdmi-audio-edid.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_chamelium@vga-hpd.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827"=
>fdo#111827</a>) +10 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-snb7/igt@kms_chamelium@vga-hpd.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827"=
>fdo#111827</a>) +12 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_color_chamelium@pipe-d-degamma=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl6/igt@kms_content_protection@uevent.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">=
i915#2105</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl3/igt@kms_content_protection@uevent.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">=
i915#2105</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x51=
2-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3359">i915#3359</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x51=
2-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3319">i915#3319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@kms_cursor_legacy@flip-vs-curso=
r-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transit=
ions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7331/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-=
atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-pwr=
ite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-pwr=
ite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb1/igt@kms_flip@2x-dpms-vs-vblank-race-in=
terruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@kms_flip@2x-flip-vs-absolute-wf_vb=
lank.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111825">fdo#111825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7331/shard-glk8/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331=
/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7331/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-snb4/igt@kms_frontbuffer_tracking@basic.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-=
snb4/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/=
shard-snb4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5090">i915#5090</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +14 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-t=
glb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/s=
hard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188=
">i915#1188</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk6/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_plane_alpha_blend@pipe-d-alpha-=
transparent-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-overlay-size-128:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@kms_plane_cursor@pipe-d-overlay-si=
ze-128.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109278">fdo#109278</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-ed=
p-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb7/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk5/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +185=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-i=
clb1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10944=
1">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb1/igt@kms_psr@psr2_sprite_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl8/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</=
a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl4/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl1/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb8/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@perf@mi-rpc.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>)=
 +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-tglb2/igt@prime_nv_api@i915_nv_reimport_twic=
e_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_cpu_mmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-iclb4/igt@prime_nv_test@i915_import_cpu_mmap=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_multi_timeline_wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk4/igt@sw_sync@sync_multi_timeline_wait.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/61=
40">i915#6140</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-glk1/igt@sysfs_clients@busy.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-apl6/igt@sysfs_clients@fair-3.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-tglb3/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-iclb6/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7331/shard-kbl7/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7331/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/s=
hard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
31/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-tg=
lb8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7331/shard-kbl1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-iclb=
8/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-tglb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915=
#5591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7331/shard-tglb7/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-iclb8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7331/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html=
">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-glk4/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
18">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7331/shard-glk8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.ht=
ml">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/407">i915#407</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7331/shard-glk9/igt@kms_flip@2x-modeset-vs-vb=
lank-race-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
331/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +6 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7331/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PAS=
S</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7331/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">PASS=
</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7331/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">PASS=
</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11774/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7331/shard-glk6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">PASS=
</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109=
642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068"=
>fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7331/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a=
></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7331/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#11089=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331=
/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4185">i915#4185</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7331/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7331/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11774/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-apl6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11774/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7331/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/sh=
ard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7331/shard-apl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-apl=
3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7331/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i91=
5#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/525=
7">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11774/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11774/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11774/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1774/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11774/shard-kbl7/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1177=
4/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#7=
16</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
31/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shar=
d-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7331/shard-kbl6/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
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
<li>IGT: IGT_6533 -&gt; IGTPW_7331</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11774: 4a54b767c0826e2b2661c039f0d3835286843333 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7331/index.htm=
l<br />
  IGT_6533: 6b5107d91827962808441db6b98e478aa9e67bdb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6161989666594365657==--

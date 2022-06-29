Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1407531053296882969=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 29 Jun 2022 12:34:29 -0000
Message-ID: <165650606938.23229.8396683747970403287@emeril.freedesktop.org>
References: <20220628133220.26100-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220628133220.26100-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Finvalid=5Fmode=3A_Test_Cleanup_=28rev7=29?=
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

--===============1407531053296882969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode: Test Cleanup (rev7)
URL   : https://patchwork.freedesktop.org/series/105501/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11820_full -> IGTPW_7427_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7427_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a} (NEW):
    - shard-kbl:          NOTRUN -> [CRASH][1] +34 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a.html

  * {igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c} (NEW):
    - shard-apl:          NOTRUN -> [CRASH][2] +35 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c.html

  * {igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a} (NEW):
    - {shard-rkl}:        NOTRUN -> [CRASH][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-rkl-6/igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a.html

  * {igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a} (NEW):
    - shard-glk:          NOTRUN -> [CRASH][4] +65 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk1/igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a.html

  * {igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b} (NEW):
    - shard-iclb:         NOTRUN -> [CRASH][5] +20 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b.html

  * {igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d} (NEW):
    - {shard-dg1}:        NOTRUN -> [CRASH][6] +27 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-dg1-18/igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d.html

  * {igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][7] +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b.html

  * {igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][8] +39 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d.html

  * {igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl7/igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c.html

  * {igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb6/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html

  * {igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][11] +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb3/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * {igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a} (NEW):
    - {shard-tglu}:       NOTRUN -> [FAIL][12] +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglu-6/igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a.html

  * {igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-d} (NEW):
    - {shard-tglu}:       NOTRUN -> [CRASH][13] +26 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglu-6/igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-d.html

  * {igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a} (NEW):
    - shard-snb:          NOTRUN -> [CRASH][14] +23 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-snb7/igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - {shard-rkl}:        NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - {shard-rkl}:        NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11820_full and IGTPW_7427_full:

### New IGT tests (193) ###

  * igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-a:
    - Statuses : 1 fail(s)
    - Exec time: [0.14] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-b:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-c:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-a:
    - Statuses : 2 fail(s)
    - Exec time: [0.07, 0.13] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-b:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-c:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-b:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-c:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-d:
    - Statuses : 2 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-b:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-b:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-c:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-d:
    - Statuses : 2 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-htotal@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-b:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-d:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-a:
    - Statuses : 2 fail(s)
    - Exec time: [0.03, 0.11] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-c:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-b:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-c:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-d:
    - Statuses : 2 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@clock-too-high@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@int-max-clock@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-b:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@int-max-clock@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.03] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-b:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-c:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-d:
    - Statuses : 2 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@int-max-clock@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@int-max-clock@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-a:
    - Statuses : 2 fail(s)
    - Exec time: [0.03, 0.07] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-b:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-c:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-b:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-c:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-d:
    - Statuses : 2 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-clock@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.03] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-b:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-a:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-d:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-clock@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-b:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-d:
    - Statuses : 1 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-a:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-b:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-c:
    - Statuses : 2 crash(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-a:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-b:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-c:
    - Statuses : 1 crash(s) 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-d:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-a:
    - Statuses : 2 crash(s) 1 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-b:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-c:
    - Statuses : 3 crash(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-d:
    - Statuses : 2 crash(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-c:
    - Statuses : 1 crash(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-a:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-b:
    - Statuses : 1 crash(s)
    - Exec time: [0.01] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  

Known issues
------------

  Here are the changes found in IGTPW_7427_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#1839])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@feature_discovery@display-4x.html

  * igt@gem_busy@close-race:
    - shard-glk:          NOTRUN -> [INCOMPLETE][18] ([i915#5753])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk3/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#1099]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-snb4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#6117])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#6117])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#3778])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@gem_exec_endless@dispatch@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#2842]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109283])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@gem_exec_params@no-bsd.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb5/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#112283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@gem_exec_params@secure-non-root.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#112283])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_schedule@preempt-hang@vecs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][37] ([i915#6310])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk9/igt@gem_exec_schedule@preempt-hang@vecs0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb7/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl7/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#4613])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl2/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-snb7/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][45] ([i915#2658])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][46] ([i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb7/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#4270]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#4270]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_softpin@allocator-evict@bcs0:
    - shard-kbl:          [PASS][50] -> [INCOMPLETE][51] ([i915#6075])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@gem_softpin@allocator-evict@bcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl6/igt@gem_softpin@allocator-evict@bcs0.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3297])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb6/igt@gem_userptr_blits@access-control.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3297])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][54] ([i915#3318])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl1/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#2527] / [i915#2856])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#2856])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][57] ([i915#454])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
    - shard-kbl:          NOTRUN -> [FAIL][58] ([i915#454])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109289]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109506] / [i915#2411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@hwconfig_table:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#6245])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@i915_query@hwconfig_table.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#1769])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#5286]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#5286]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110725] / [fdo#111614])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111614])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111615] / [i915#3689]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#6095])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +173 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689] / [i915#6095]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#3886])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [i915#3886]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +8 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3689]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk3/igt@kms_chamelium@hdmi-crc-multiple.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_chamelium@hdmi-crc-multiple.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-snb:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb3/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][86] ([i915#1319])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109274]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3528])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3528])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:
    - shard-glk:          [PASS][90] -> [FAIL][91] ([i915#1888] / [i915#5160])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#5287])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#5287]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [FAIL][94] ([i915#4767])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:
    - shard-glk:          [PASS][96] -> [FAIL][97] ([i915#2122])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk9/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#2587])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-iclb:         [PASS][99] -> [SKIP][100] ([i915#3701])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271]) +72 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109280] / [fdo#111825]) +17 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109280]) +12 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [PASS][104] -> [FAIL][105] ([i915#1188])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][107] ([fdo#108145] / [i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          NOTRUN -> [FAIL][108] ([fdo#108145] / [i915#265])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][109] ([i915#265])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-dp-1:
    - shard-kbl:          NOTRUN -> [SKIP][110] ([fdo#109271]) +140 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#5176]) +7 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#5176]) +5 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#658]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2920]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#658])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#111068] / [i915#658])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#658]) +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109441])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][119] ([i915#132] / [i915#3467])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#3555]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb3/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#3555]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#2437])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][124] ([fdo#109271]) +100 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-snb4/igt@prime_nv_pcopy@test3_5.html
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109291])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_vgem@coherency-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([fdo#109292] / [fdo#109295])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@prime_vgem@coherency-gtt.html
    - shard-tglb:         NOTRUN -> [SKIP][127] ([fdo#109295] / [fdo#111656])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb7/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@create:
    - shard-kbl:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#2994])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#2994])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@sysfs_clients@create.html

  * igt@sysfs_clients@recycle:
    - shard-apl:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#2994]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl1/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-25:
    - shard-glk:          NOTRUN -> [SKIP][131] ([fdo#109271] / [i915#2994])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk2/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@dumb_buffer@create-clear:
    - shard-kbl:          [INCOMPLETE][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl6/igt@dumb_buffer@create-clear.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@dumb_buffer@create-clear.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][134] ([i915#5784]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@gem_eio@kms.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [SKIP][136] ([i915#4525]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb7/igt@gem_exec_balancer@parallel.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][138] ([i915#2842]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][140] ([i915#2842]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][142] ([i915#2842]) -> [PASS][143] +4 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][144] ([i915#2849]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@preempt-hang@vcs0:
    - shard-glk:          [INCOMPLETE][146] ([i915#6310]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk9/igt@gem_exec_schedule@preempt-hang@vcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][148] ([i915#180]) -> [PASS][149] +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][150] ([i915#5566] / [i915#716]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@gen9_exec_parse@allowed-single.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk:          [FAIL][152] ([i915#3743]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][154] ([i915#79]) -> [PASS][155] +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][156] ([i915#1188]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][158] ([fdo#109441]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-snb:          [SKIP][160] ([fdo#109271]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][162] ([i915#6117]) -> [SKIP][163] ([i915#4525])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][164] ([fdo#111068] / [i915#658]) -> [SKIP][165] ([i915#2920])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][166] ([i915#2920]) -> [SKIP][167] ([fdo#111068] / [i915#658]) +1 similar issue
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][175], [FAIL][176], [FAIL][177]) ([i915#3002] / [i915#4312] / [i915#5257])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl8/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl1/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl1/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl2/igt@runner@aborted.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl8/igt@runner@aborted.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl1/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][178], [FAIL][179], [FAIL][180]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][181], [FAIL][182]) ([i915#3002] / [i915#4312] / [i915#5257])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
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
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
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
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5160]: https://gitlab.freedesktop.org/drm/intel/issues/5160
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
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
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5753]: https://gitlab.freedesktop.org/drm/intel/issues/5753
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6075]: https://gitlab.freedesktop.org/drm/intel/issues/6075
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6310]: https://gitlab.freedesktop.org/drm/intel/issues/6310
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6549 -> IGTPW_7427
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7427: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/index.html
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/index.html

--===============1407531053296882969==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode: Test Cleanup (rev7)<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105501/">https://patchwork.freedesktop.org/series/105501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7427/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11820_full -&gt; IGTPW_7427_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7427=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl4/igt@kms_invalid_mode@bad-htotal@dp-1-pi=
pe-a.html">CRASH</a> +34 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_invalid_mode@bad-htotal@dp-1-pi=
pe-c.html">CRASH</a> +35 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-rkl-6/igt@kms_invalid_mode@bad-htotal@edp-1-=
pipe-a.html">CRASH</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-glk1/igt@kms_invalid_mode@bad-htotal@hdmi-a-=
2-pipe-a.html">CRASH</a> +65 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_invalid_mode@bad-vsync-start@e=
dp-1-pipe-b.html">CRASH</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-dg1-18/igt@kms_invalid_mode@bad-vsync-start@=
hdmi-a-3-pipe-d.html">CRASH</a> +27 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_invalid_mode@bad-vtotal@edp-1-=
pipe-b.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_invalid_mode@bad-vtotal@edp-1-=
pipe-d.html">FAIL</a> +39 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl7/igt@kms_invalid_mode@clock-too-high@dp-=
1-pipe-c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb6/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-c.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb3/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-d.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglu-6/igt@kms_invalid_mode@uint-max-clock@h=
dmi-a-1-pipe-a.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-d} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglu-6/igt@kms_invalid_mode@uint-max-clock@h=
dmi-a-1-pipe-d.html">CRASH</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-snb7/igt@kms_invalid_mode@zero-hdisplay@vga-=
1-pipe-a.html">CRASH</a> +23 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priorit=
y-all.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11820_full and IGTPW_7427_=
full:</p>
<h3>New IGT tests (193)</h3>
<ul>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@hdmi-a-3-pipe-d:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.03, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 crash(s) 1 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 crash(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 crash(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 crash(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7427_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb1/igt@feature_discovery@display-4x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-glk3/igt@gem_busy@close-race.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5753">i91=
5#5753</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-snb4/igt@gem_ctx_persistence@hang.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10=
99">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb2/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-kbl6/igt@gem_exec_balancer@parallel-ordering.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6117">i915#6117</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard=
-iclb6/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/=
shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-k=
bl4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-=
iclb5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-g=
lk1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb2/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb5/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb1/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb2/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-hang@vecs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-glk9/igt@gem_exec_schedule@preempt-hang@vecs=
0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/6310">i915#6310</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb7/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-kbl7/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb6/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-glk9/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl1/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gem_pxp@display-protected-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270=
">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb5/igt@gem_pxp@verify-pxp-stale-buf-optou=
t-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-evict@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@gem_softpin@allocator-evict@bcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shar=
d-kbl6/igt@gem_softpin@allocator-evict@bcs0.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6075">i915#6075</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb6/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl1/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb1/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i9=
15#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb7/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D110723">fdo#110723</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_ccs@pipe-a-bad-aux-stride-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +173 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-glk8/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_chamelium@hdmi-audio-edid.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-glk3/igt@kms_chamelium@hdmi-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_chamelium@hdmi-crc-multiple.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@kms_color_chamelium@pipe-a-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb3/igt@kms_color_chamelium@pipe-d-degamma=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtile=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7427/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5160">i915#5160</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-=
render-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i91=
5#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_flip@2x-plain-flip.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#=
109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
25">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk9/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7427/shard-glk1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122"=
>i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp=
-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +72 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +17 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-=
kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-d=
p-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@kms_plane_scaling@plane-downscale-w=
ith-rotation-factor-0-25@pipe-b-dp-1.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +140 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb2/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-kbl3/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">=
i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
467">i915#3467</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb3/igt@kms_setmode@basic-clone-single-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb7/igt@kms_setmode@basic-clone-single-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl3/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-snb4/igt@prime_nv_pcopy@test3_5.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +100 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb5/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#1=
09291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-iclb5/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo=
#109292</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb7/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo=
#109295</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
656">fdo#111656</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-kbl1/igt@sysfs_clients@create.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7427/shard-tglb2/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-apl1/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-glk2/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dumb_buffer@create-clear:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl6/igt@dumb_buffer@create-clear.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-=
kbl4/igt@dumb_buffer@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-tglb6/igt@ge=
m_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb7/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/sha=
rd-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/=
shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7427/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/=
shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
427/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-hang@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6310=
">i915#6310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7427/shard-glk9/igt@gem_exec_schedule@preempt-hang@vcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7427/shard-apl2/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7427/shard-kbl1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7427/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7427/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdm=
i-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7427/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427=
/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7427/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7427/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7427/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-c=
ontinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7427/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11820/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11820/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1820/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427=
/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7427/shard-apl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-=
apl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11820/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">=
i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7427/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5257">i915#5257</a>)</p>
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
<li>IGT: IGT_6549 -&gt; IGTPW_7427</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7427: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7427/index.htm=
l<br />
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1407531053296882969==--

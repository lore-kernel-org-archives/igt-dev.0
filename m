Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB62C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 22:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D1310E0CC;
	Sun,  6 Apr 2025 22:43:55 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7270510E044;
 Sun,  6 Apr 2025 22:43:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7963096545570088364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fsysfs=5Fs?=
 =?utf-8?q?cheduler=3A_Add_invalid_string_test_for_engine_sysfs_properties?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 22:43:54 -0000
Message-ID: <174397943444.41492.15005352360574640428@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401114529.1828868-1-sobin.thomas@intel.com>
In-Reply-To: <20250401114529.1828868-1-sobin.thomas@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============7963096545570088364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_scheduler: Add invalid string test for engine sysfs properties
URL   : https://patchwork.freedesktop.org/series/147056/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8297_FULL -> XEIGTPW_12895_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12895_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12895_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12895_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     [PASS][1] -> ([SKIP][2], [PASS][3]) +1 other test ( 1 pass, 1 skip )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][4], [PASS][5])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][6] -> ([SKIP][7], [SKIP][8]) ([Intel XE#309])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * {igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][9] +5 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs.html

  * {igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][10] +17 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string.html

  * {igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs} (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][11] +17 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs.html

  * igt@xe_wedged@basic-wedged-read:
    - shard-lnl:          [PASS][12] -> ([PASS][13], [DMESG-WARN][14])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@xe_wedged@basic-wedged-read.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@xe_wedged@basic-wedged-read.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_wedged@basic-wedged-read.html

  
New tests
---------

  New tests have been introduced between XEIGT_8297_FULL and XEIGTPW_12895_FULL:

### New IGT tests (18) ###

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string:
    - Statuses : 3 fail(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@bcs:
    - Statuses : 3 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@ccs:
    - Statuses : 3 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs:
    - Statuses : 3 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vcs:
    - Statuses : 3 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vecs:
    - Statuses : 3 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string:
    - Statuses : 2 fail(s)
    - Exec time: [0.03] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@bcs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@ccs:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@rcs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vcs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vecs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string:
    - Statuses : 2 fail(s)
    - Exec time: [0.03] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@bcs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@ccs:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vcs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vecs:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12895_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> ([SKIP][15], [SKIP][16]) ([Intel XE#3157])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][17], [SKIP][18]) ([Intel XE#3767]) +15 other tests ( 2 skip )
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-bmg:          [PASS][21] -> ([PASS][22], [INCOMPLETE][23]) ([Intel XE#3225])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#4543])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#1124] / [Intel XE#829])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][29] -> ([SKIP][30], [PASS][31]) ([Intel XE#2191]) +1 other test ( 1 pass, 1 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#367]) +1 other test ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#367])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#787]) +99 other tests ( 2 skip )
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +165 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#455] / [Intel XE#787]) +15 other tests ( 2 skip )
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][48], [INCOMPLETE][49]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][50], [SKIP][51]) ([Intel XE#4416]) +3 other tests ( 2 skip )
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#373])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-single.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#373]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#373]) +4 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#373]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1178])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][59] ([Intel XE#1178]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#3304])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1188]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1424]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> ([PASS][63], [SKIP][64]) ([Intel XE#309])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][65] -> ([SKIP][66], [PASS][67]) ([Intel XE#2291]) +6 other tests ( 1 pass, 1 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-dg2-set2:     [PASS][68] -> ([SKIP][69], [SKIP][70]) ([Intel XE#309]) +3 other tests ( 2 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][71] -> ([PASS][72], [SKIP][73]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][74] -> ([SKIP][75], [SKIP][76]) ([Intel XE#2291])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][77] -> ([SKIP][78], [PASS][79]) ([Intel XE#4302])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg2-set2:     [PASS][80] -> ([SKIP][81], [PASS][82]) ([Intel XE#4302])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][83] -> ([SKIP][84], [PASS][85]) ([Intel XE#1340])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#4356])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][88] -> ([SKIP][89], [PASS][90]) ([Intel XE#4331])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#455]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#4422])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][93] -> ([PASS][94], [SKIP][95]) ([Intel XE#2373])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][96], [PASS][97]) ([Intel XE#2882]) +2 other tests ( 1 fail, 1 pass )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][98] -> ([PASS][99], [SKIP][100]) ([Intel XE#310]) +9 other tests ( 1 pass, 1 skip )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][101] -> ([SKIP][102], [SKIP][103]) ([Intel XE#2316])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1421])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][105] -> [FAIL][106] ([Intel XE#3321]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][109] ([Intel XE#2049] / [Intel XE#2597])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#310])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [PASS][112] -> ([SKIP][113], [SKIP][114]) ([Intel XE#310]) +1 other test ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][115] -> ([PASS][116], [SKIP][117]) ([Intel XE#2316]) +9 other tests ( 1 pass, 1 skip )
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][118] -> ([FAIL][119], [PASS][120]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][121] -> [FAIL][122] ([Intel XE#886])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][123] ([Intel XE#301]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][124] -> ([INCOMPLETE][125], [PASS][126]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#886]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#455]) +1 other test ( 2 skip )
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#1401]) +1 other test ( 2 skip )
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#1401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#651]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#651]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][141] -> ([PASS][142], [SKIP][143]) ([Intel XE#656]) +9 other tests ( 1 pass, 1 skip )
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][144] -> ([SKIP][145], [SKIP][146]) ([Intel XE#656]) +1 other test ( 2 skip )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#656]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-dg2-set2:     [PASS][149] -> ([PASS][150], [SKIP][151]) ([Intel XE#783])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#656]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#651])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#653]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][156], [SKIP][157]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#656]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][159] -> ([PASS][160], [SKIP][161]) ([Intel XE#1503])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][162] -> ([SKIP][163], [PASS][164]) ([Intel XE#4328])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][165], [SKIP][166]) ([Intel XE#2927])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2-set2:     [PASS][167] -> ([PASS][168], [FAIL][169]) ([Intel XE#4445])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][170] -> [FAIL][171] ([Intel XE#4649])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-adlp:         [PASS][172] -> [DMESG-WARN][173] ([Intel XE#4173]) +6 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][174] ([Intel XE#616]) +2 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][175] -> ([SKIP][176], [PASS][177]) ([Intel XE#4596])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-dg2-set2:     [PASS][178] -> ([PASS][179], [SKIP][180]) ([Intel XE#4596])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-x.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-x.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> ([ABORT][181], [ABORT][182]) ([Intel XE#2705] / [Intel XE#4540])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][183] ([Intel XE#4212])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([ABORT][184], [ABORT][185]) ([Intel XE#4502] / [Intel XE#4540])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#2763]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#870])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#908])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][189] -> [SKIP][190] ([Intel XE#836])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][191] -> ([PASS][192], [SKIP][193]) ([Intel XE#836]) +1 other test ( 1 pass, 1 skip )
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#2893] / [Intel XE#4608])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#4608]) +1 other test ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#1489])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#2893])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][201], [SKIP][202]) ([Intel XE#1122])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> ([SKIP][204], [SKIP][205]) ([Intel XE#1406]) +1 other test ( 2 skip )
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][206], [SKIP][207]) ([Intel XE#4609])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#1406]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][209], [SKIP][210]) ([Intel XE#2850] / [Intel XE#929])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_psr@pr-sprite-render.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#3414])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][212] -> ([PASS][213], [SKIP][214]) ([Intel XE#455])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][215], [ABORT][216]) ([Intel XE#4540])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][217], [DMESG-WARN][218]) ([Intel XE#4212])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#1499])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][221], [SKIP][222]) ([Intel XE#1123])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#2905])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#2905] / [Intel XE#4259])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-3/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@xe_eudebug_online@reset-with-attention.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#2905])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#688])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#1392]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> ([PASS][230], [SKIP][231]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][232] -> ([SKIP][233], [SKIP][234]) ([Intel XE#1392]) +1 other test ( 2 skip )
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#1392])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][237] -> ([PASS][238], [SKIP][239]) ([Intel XE#1392]) +10 other tests ( 1 pass, 1 skip )
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#288]) +5 other tests ( 2 skip )
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#288]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#2360])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2229])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#378])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][248] -> ([PASS][249], [FAIL][250]) ([Intel XE#4208])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_module_load@reload-no-display.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2541] / [Intel XE#3573])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#2541] / [Intel XE#3573])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][254] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][255], [FAIL][256]) ([Intel XE#1173])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#2284] / [Intel XE#366])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][258] -> [ABORT][259] ([Intel XE#1794])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-9/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          NOTRUN -> ([PASS][260], [ABORT][261]) ([Intel XE#1794])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_pm@s4-exec-after.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][262] -> ([ABORT][263], [PASS][264]) ([Intel XE#1794])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][265] -> [ABORT][266] ([Intel XE#1794]) +1 other test abort
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#944])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][269] ([Intel XE#827]) -> ([PASS][270], [PASS][271]) +1 other test ( 2 pass )
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][272] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> ([PASS][273], [PASS][274])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][275] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][276], [PASS][277])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#309]) -> ([PASS][279], [PASS][280]) +2 other tests ( 2 pass )
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][281] ([Intel XE#2291]) -> ([PASS][282], [PASS][283]) +1 other test ( 2 pass )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#309]) -> [PASS][285] +1 other test pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#3009]) -> ([PASS][287], [PASS][288])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dp_aux_dev.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_dp_aux_dev.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][289] ([Intel XE#4354]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][291] ([Intel XE#2316]) -> [PASS][292] +1 other test pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][293] ([Intel XE#3321]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#310]) -> ([PASS][296], [PASS][297]) +2 other tests ( 2 pass )
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][298] ([Intel XE#2316]) -> ([PASS][299], [PASS][300]) +2 other tests ( 2 pass )
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#310]) -> [PASS][302] +2 other tests pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][303] ([Intel XE#2882]) -> ([PASS][304], [PASS][305]) +1 other test ( 2 pass )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [FAIL][306] ([Intel XE#3098] / [Intel XE#886]) -> ([PASS][307], [PASS][308])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [FAIL][309] ([Intel XE#886]) -> ([PASS][310], [PASS][311])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [FAIL][312] ([Intel XE#886]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:
    - shard-adlp:         [FAIL][314] -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#656]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#656]) -> ([PASS][319], [PASS][320]) +1 other test ( 2 pass )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][321] ([Intel XE#1503]) -> ([PASS][322], [PASS][323])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_hdr@static-toggle.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [FAIL][324] ([Intel XE#4426]) -> ([PASS][325], [PASS][326])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][327] ([Intel XE#4426]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [INCOMPLETE][329] -> ([PASS][330], [PASS][331]) +1 other test ( 2 pass )
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-6/igt@kms_plane_cursor@primary.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][332] ([Intel XE#4596]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][334] ([Intel XE#1435]) -> ([PASS][335], [PASS][336]) +1 other test ( 2 pass )
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][337] ([Intel XE#771]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [FAIL][339] ([Intel XE#4278]) -> ([PASS][340], [PASS][341]) +1 other test ( 2 pass )
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1392]) -> ([PASS][343], [PASS][344]) +8 other tests ( 2 pass )
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1392]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][347] ([Intel XE#4173]) -> [PASS][348] +1 other test pass
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][349] ([Intel XE#4541]) -> ([PASS][350], [PASS][351])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-4/igt@xe_oa@buffer-size.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-3/igt@xe_oa@buffer-size.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][352] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][354] ([Intel XE#1794]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][356] ([Intel XE#911]) -> ([FAIL][357], [PASS][358]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][359] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][360], [SKIP][361]) ([Intel XE#2314] / [Intel XE#2894])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#787]) -> ([SKIP][363], [SKIP][364]) ([Intel XE#455] / [Intel XE#787]) +21 other tests ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][366], [SKIP][367]) ([Intel XE#787])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][369] ([Intel XE#787]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#787]) -> [SKIP][371] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2907]) -> ([SKIP][373], [SKIP][374]) ([Intel XE#2907] / [Intel XE#829])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][375] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> ([PASS][376], [INCOMPLETE][377]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][378] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][379], [INCOMPLETE][380]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][382], [SKIP][383]) ([Intel XE#455] / [Intel XE#787] / [Intel XE#829])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][384] ([Intel XE#1178]) -> ([FAIL][385], [SKIP][386]) ([Intel XE#1178] / [Intel XE#2341]) +1 other test ( 1 fail, 1 skip )
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_content_protection@atomic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_content_protection@atomic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][387] ([Intel XE#1178]) -> ([FAIL][388], [SKIP][389]) ([Intel XE#1178] / [Intel XE#455])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [SKIP][390] ([Intel XE#2341]) -> ([SKIP][391], [FAIL][392]) ([Intel XE#1178] / [Intel XE#2341])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#455]) -> ([SKIP][394], [FAIL][395]) ([Intel XE#1178] / [Intel XE#455])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#455]) -> ([FAIL][397], [FAIL][398]) ([Intel XE#1188])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_content_protection@uevent.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_content_protection@uevent.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][399] ([Intel XE#2291]) -> ([SKIP][400], [PASS][401]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#309]) -> ([SKIP][403], [PASS][404]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#310]) -> ([PASS][406], [SKIP][407]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][408] ([Intel XE#2316]) -> ([FAIL][409], [PASS][410]) ([Intel XE#2882])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][411] ([Intel XE#301]) -> [SKIP][412] ([Intel XE#310])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][413] ([Intel XE#301]) -> ([PASS][414], [SKIP][415]) ([Intel XE#310])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#310]) -> ([INCOMPLETE][417], [SKIP][418]) ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#310])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][419] ([Intel XE#2316]) -> ([PASS][420], [SKIP][421]) ([Intel XE#2316])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][422] ([Intel XE#886]) -> ([PASS][423], [FAIL][424]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#656]) -> ([SKIP][426], [SKIP][427]) ([Intel XE#651] / [Intel XE#656]) +2 other tests ( 2 skip )
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][428] ([Intel XE#2312]) -> ([SKIP][429], [SKIP][430]) ([Intel XE#2311] / [Intel XE#2312]) +6 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#651]) -> ([SKIP][432], [SKIP][433]) ([Intel XE#651] / [Intel XE#783])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#656]) -> ([SKIP][435], [SKIP][436]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#656]) -> ([SKIP][438], [PASS][439]) ([Intel XE#656])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][440] ([Intel XE#4141]) -> [SKIP][441] ([Intel XE#2312])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][442] ([Intel XE#4141]) -> ([SKIP][443], [SKIP][444]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][445] ([Intel XE#2312]) -> ([SKIP][446], [SKIP][447]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][448] ([Intel XE#2312]) -> ([SKIP][449], [SKIP][450]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][451] ([Intel XE#2312]) -> [SKIP][452] ([Intel XE#4141])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][453] ([Intel XE#2311]) -> ([SKIP][454], [SKIP][455]) ([Intel XE#2311] / [Intel XE#2312]) +20 other tests ( 2 skip )
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#656]) -> [SKIP][457] ([Intel XE#651]) +6 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#656]) -> ([SKIP][459], [SKIP][460]) ([Intel XE#651] / [Intel XE#783])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][461] ([Intel XE#2312]) -> ([SKIP][462], [SKIP][463]) ([Intel XE#2311]) +11 other tests ( 2 skip )
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#651]) -> [SKIP][465] ([Intel XE#656]) +5 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#651]) -> ([SKIP][467], [SKIP][468]) ([Intel XE#656])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#651]) -> ([SKIP][470], [SKIP][471]) ([Intel XE#651] / [Intel XE#656]) +24 other tests ( 2 skip )
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][472] ([Intel XE#2313]) -> ([SKIP][473], [SKIP][474]) ([Intel XE#2312] / [Intel XE#2313]) +11 other tests ( 2 skip )
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][475] ([Intel XE#2312]) -> ([SKIP][476], [SKIP][477]) ([Intel XE#2312] / [Intel XE#2313]) +9 other tests ( 2 skip )
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#653]) -> [SKIP][479] ([Intel XE#656]) +5 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#656]) -> [SKIP][481] ([Intel XE#653]) +2 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#653]) -> ([SKIP][483], [SKIP][484]) ([Intel XE#656]) +4 other tests ( 2 skip )
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][485] ([Intel XE#2312]) -> ([SKIP][486], [SKIP][487]) ([Intel XE#2313]) +11 other tests ( 2 skip )
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#656]) -> ([SKIP][489], [SKIP][490]) ([Intel XE#653]) +6 other tests ( 2 skip )
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#653]) -> ([SKIP][492], [SKIP][493]) ([Intel XE#653] / [Intel XE#656]) +21 other tests ( 2 skip )
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][494] ([Intel XE#616]) -> ([PASS][495], [FAIL][496]) ([Intel XE#616]) +1 other test ( 1 fail, 1 pass )
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][497] ([Intel XE#4596]) -> ([SKIP][498], [SKIP][499]) ([Intel XE#2493])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][500] ([Intel XE#2893] / [Intel XE#4608]) -> [SKIP][501] ([Intel XE#2893]) +4 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#455]) -> ([PASS][503], [ABORT][504]) ([Intel XE#4540])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#362]) -> ([SKIP][506], [FAIL][507]) ([Intel XE#1729] / [Intel XE#362])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][508] ([Intel XE#2509]) -> ([SKIP][509], [SKIP][510]) ([Intel XE#2426] / [Intel XE#2509])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1500]) -> ([SKIP][512], [SKIP][513]) ([Intel XE#362])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#1061]) -> ([FAIL][515], [FAIL][516]) ([Intel XE#1173])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_peer2peer@write.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@write.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4445
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4649
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8297 -> IGTPW_12895
  * Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-2889-9368766ece6c78cc0001f9b53037563fe521f887

  IGTPW_12895: 94a41cc5919d23f540b33ca654dc71f3caa518ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-2889-9368766ece6c78cc0001f9b53037563fe521f887: 9368766ece6c78cc0001f9b53037563fe521f887

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/index.html

--===============7963096545570088364==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_scheduler: Add invalid =
string test for engine sysfs properties</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147056/">https://patchwork.freedesktop.org/series/147056/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12895/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12895/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8297_FULL -&gt; XEIGTPW_12895_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12895_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12895_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
895_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonbl=
ocking.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-dg2-464/igt@kms_atomic_transition@modeset-transiti=
on-nonblocking.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_atomic_transition@modeset-transi=
tion-nonblocking.html">PASS</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-long-non=
blocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_cursor_legacy=
@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12895/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/s=
hard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_sysfs_scheduler@job_timeout=
_ms-invalid-string@rcs.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@xe_sysfs_scheduler@preempt_timeo=
ut_us-invalid-string.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs} (NEW):=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@xe_sysfs_scheduler@timeslice_dur=
ation_us-invalid-string@rcs.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged-read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@xe_wedged@basic-wedged-read.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-ln=
l-4/igt@xe_wedged@basic-wedged-read.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_wedged@basic-w=
edged-read.html">DMESG-WARN</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8297_FULL and XEIGTPW_12895=
_FULL:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@bcs:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@ccs:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vcs:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vecs:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@bcs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@ccs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@rcs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vcs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vecs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@bcs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@ccs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vcs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vecs:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12895_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo=
-on-discrete.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discr=
ete.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/=
igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2=
-4-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/=
shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@k=
ms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12895/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-dis=
plays-1920x1080p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12895/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x=
2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-t=
iled-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +99 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-til=
ed-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) +165 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12895/shard-lnl-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-=
tiled-ccs@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-=
tiled-ccs@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_ccs@crc-primary-rot=
ation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12895/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-m=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-=
b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12895/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/441=
6">Intel XE#4416</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-sin=
gle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12895/shard-lnl-5/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Inte=
l XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-sto=
rm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-ena=
bled-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +4 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_content_protection@uevent@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128=
x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-l=
egacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/sha=
rd-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE=
#2291</a>) +6 other tests ( 1 pass, 1 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895=
/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Int=
el XE#309</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12895/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-at=
omic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomi=
c-transitions.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
5/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/i=
gt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
895/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2=
-432/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/sha=
rd-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_dit=
her@fb-8bpc-vs-panel-6bpc.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#=
4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
895/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2=
-435/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/sha=
rd-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_fea=
ture_discovery@display-2x.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank@=
ac-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-=
hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2882">Intel XE#2882</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/sh=
ard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms=
_flip@2x-dpms-vs-vblank-race.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +9 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4=
/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpm=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
1">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
95/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>=
) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ad=
-hdmi-a2-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb-interruptible.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/sha=
rd-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12895/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +9 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-ln=
l-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_flip@blocking=
-wf_vblank.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12895/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7=
/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@flip-vs-=
suspend.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 incom=
plete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
95/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">=
Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
5/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip_sc=
aled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-ln=
l-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-16bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">In=
tel XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer=
_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +3 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p=
-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other =
test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-bl=
t.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw=
-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-bl=
t.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb565-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb565-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@=
kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/=
shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt=
@kms_joiner@basic-force-big-joiner.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#=
2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr2=
4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12895/shard-dg2-432/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-=
xr24.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr2=
4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4445">Intel XE#4445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr2=
4@pipe-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-s=
anitycheck-xr24@pipe-b-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4649">Intel XE#4649</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_plane_m=
ultiple@2x-tiling-x.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/sha=
rd-dg2-466/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_p=
lane_multiple@2x-tiling-x.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_scaling@intel-max-s=
rc-size.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12895/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html"=
>ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_plane_scaling@intel-max-s=
rc-size@pipe-a-hdmi-a-6.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-hdmi-a-6.html">ABORT</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_pm_backlight@bad-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-=
464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895=
/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/i=
gt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other =
test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-pr=
imary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr2_sf@fbc=
-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4=
608</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr2_sf@pr-over=
lay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12895/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel X=
E#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12895/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove@edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12895/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_psr@pr-sprite-render.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
5/shard-dg2-432/igt@kms_psr@pr-sprite-render.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
895/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2=
-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_setmode@=
invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel X=
E#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_setmode@=
invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-WARN</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">In=
tel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear=
-0xfd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12895/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"=
>Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extende=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-3/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12895/shard-dg2-432/igt@xe_eudebug_online@reset-with-attention.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_eudebug_online@writes-cachi=
ng-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_evict@evict-beng-small.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
8">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-lnl-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-nu=
ll-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip =
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-n=
ull-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-def=
er-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895=
/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/i=
gt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +10 oth=
er tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_exec_fault_mode@many-execq=
ueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"=
>Intel XE#288</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_exec_fault_mode@twice-userp=
tr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinne=
r-interrupted-dma-fence.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_valid=
ate_ccs_kunit.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_module_load@reload-no-display.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/s=
hard-dg2-435/igt@xe_module_load@reload-no-display.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt=
@xe_module_load@reload-no-display.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_oa@oa-tlb-invalidate.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_oa@privileged-forked-acces=
s-vaddr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12895/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-9/igt=
@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@xe_pm@s4-exec-after.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-=
2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@xe_pm@s4-vm-bind-pre=
fetch.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl=
-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other t=
est abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12895/shard-dg2-432/igt@xe_query@multigpu-query-topology-l=
3-bank-mask.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12895/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS=
</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12895/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
95/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-h=
dmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12895/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-=
cc@pipe-b-hdmi-a-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_cursor_legacy@2x-=
nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +2 other tests =
( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flip=
b-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-var=
ying-size.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-tog=
gle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-dg2-435/igt@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_dp_aux_dev.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12895/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt=
@kms_flip@2x-flip-vs-modeset.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12895/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) +2 other test=
s ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recre=
ate-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank=
@a-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12895/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi=
-a3.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">=
Intel XE#3098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-=
vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12895/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
86">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-ed=
p1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12895/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">P=
ASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12895/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@=
c-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.h=
tml">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12895/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-cur-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">PASS</a>) +1 other =
test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/=
shard-bmg-1/igt@kms_hdr@static-toggle.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_hdr@static-=
toggle.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Intel XE#=
4426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt=
@kms_hdr@static-toggle-dpms.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/442=
6">Intel XE#4426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12895/shard-dg2-433/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-6/igt@kms_plane_cursor@primary.html">INCOMPLETE</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-lnl-7/igt@kms_plane_cursor@primary.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/igt@kms_plane_cursor@=
primary.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12895/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg=
-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>) +1 other test ( 2 p=
ass )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12895/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278=
">Intel XE#4278</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12895/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2895/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>=
) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebin=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12895/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bi=
ndexecqueue-userptr-rebind.html">PASS</a>) +8 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec=
-basic-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-=
xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@xe_fault_=
injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-4/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shar=
d-lnl-3/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-7/igt@xe_oa@buffer-size.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">I=
ntel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1=
794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2895/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-1/igt@kms_async_flip=
s@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-6/ig=
t@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/911">Intel XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_bw@connect=
ed-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_bw@connect=
ed-linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#28=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@bad-rotati=
on-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms=
_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg=
2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_ccs@ccs-on=
-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2907">Intel XE#2907</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shar=
d-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#=
1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_ccs@random-ccs-data-=
4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12895/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt=
@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) =
+1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12895/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/s=
hard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Int=
el XE#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12895/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-bmg-2/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12895/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard=
-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12895/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466=
/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12895/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-lega=
cy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12895/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/229=
1">Intel XE#2291</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_cursor_l=
egacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/=
igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12895/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12895/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12895/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/i=
gt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">I=
ntel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12895/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-4=
64/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12895/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt=
@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
86">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12895/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-ed=
p1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12895/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/88=
6">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">=
Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@km=
s_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer=
_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-s=
hrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
3">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
1">Intel XE#2311</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-46=
4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
2">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sh=
rfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"=
>Intel XE#656</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-466/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-464/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-432/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
895/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-435/igt@kms=
_plane_cursor@viewport.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, =
1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12895/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-bmg-1=
/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-lnl-5/igt@k=
ms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">=
Intel XE#2893</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12895/shard-dg2-433/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crt=
c-stealing.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12895/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895=
/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12895/shard-bmg-2/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12895/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/s=
hard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12895/shard-dg2-463/igt@xe_peer2peer@wr=
ite.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGTPW_12895</li>
<li>Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-2889-9=
368766ece6c78cc0001f9b53037563fe521f887</li>
</ul>
<p>IGTPW_12895: 94a41cc5919d23f540b33ca654dc71f3caa518ea @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9=
180336b156148e201<br />
  xe-2889-9368766ece6c78cc0001f9b53037563fe521f887: 9368766ece6c78cc0001f9b=
53037563fe521f887</p>

</body>
</html>

--===============7963096545570088364==--

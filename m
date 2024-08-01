Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1867EC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C951C10E900;
	Thu,  1 Aug 2024 10:51:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F3710E900;
 Thu,  1 Aug 2024 10:51:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5732316547709629236=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel=3A_Add_tests_to_r?=
 =?utf-8?q?un_suspend_without_display_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 10:51:54 -0000
Message-ID: <172250951459.487274.6673924274047072879@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
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

--===============5732316547709629236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add tests to run suspend without display (rev4)
URL   : https://patchwork.freedesktop.org/series/130239/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7950_full -> XEIGTPW_11511_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11511_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11511_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): shard-bmg 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11511_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_lease@lease-again:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_lease@lease-again.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_lease@lease-again.html

  * igt@kms_pm_rpm@i2c:
    - shard-lnl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-lnl:          [PASS][6] -> [SKIP][7] +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][10] -> [FAIL][11] +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html

  * {igt@xe_pm@s2idle-without-display} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_pm@s2idle-without-display.html
    - shard-lnl:          NOTRUN -> [FAIL][13] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_pm@s2idle-without-display.html
    - {shard-bmg}:        NOTRUN -> [FAIL][14] +2 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-6/igt@xe_pm@s2idle-without-display.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-lnl:          [ABORT][15] ([Intel XE#2421]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@core_hotunplug@hotrebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@core_hotunplug@hotrebind.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#1124]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][23] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][24] +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][25] ([Intel XE#2351]) -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][27] ([Intel XE#653]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][29] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][30] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][31] ([Intel XE#1439]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][33] ([Intel XE#1489]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][35] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_psr@psr2-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [SKIP][37] ([Intel XE#2423]) -> [INCOMPLETE][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_vrr@flip-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_vrr@flip-dpms.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          [SKIP][39] ([Intel XE#2229]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][41] +23 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][42]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - {shard-bmg}:        NOTRUN -> [SKIP][43] +167 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        NOTRUN -> [FAIL][44] +21 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        NOTRUN -> [TIMEOUT][45] +3 other tests timeout
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  
New tests
---------

  New tests have been introduced between XEIGT_7950_full and XEIGTPW_11511_full:

### New IGT tests (3) ###

  * igt@xe_pm@s2idle-without-display:
    - Statuses : 3 fail(s)
    - Exec time: [9.95, 13.19] s

  * igt@xe_pm@s3-without-display:
    - Statuses : 3 fail(s)
    - Exec time: [9.88, 12.93] s

  * igt@xe_pm@s4-without-display:
    - Statuses : 3 fail(s)
    - Exec time: [9.82, 13.06] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11511_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#2134])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@fbdev@eof.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@fbdev@eof.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1201] / [Intel XE#2134])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@fbdev@write.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1125])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#1659])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#2351]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1407]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1124]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#787]) +20 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1399]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#306])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#306]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#373]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#308])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#455])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1424]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-64x64.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2423]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#309]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          NOTRUN -> [FAIL][77] ([Intel XE#2028])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#776])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1138] / [Intel XE#1201])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1138])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1421]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][82] -> [INCOMPLETE][83] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][84] -> [DMESG-WARN][85] ([Intel XE#1551])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][86] -> [INCOMPLETE][87] ([Intel XE#1195])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#2049])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1401] / [Intel XE#1745])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#651]) +6 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#1201] / [Intel XE#2351]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#651]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#653]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#656]) +15 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb2-handle-closed:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_getfb@getfb2-handle-closed.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_getfb@getfb2-handle-closed.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1450]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1450] / [Intel XE#599]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_lease@invalid-create-leases.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_lease@invalid-create-leases.html

  * igt@kms_lease@lease-invalid-connector:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#1201] / [i915#2575]) +23 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_lease@lease-invalid-connector.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_lease@lease-invalid-connector.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-lnl:          [PASS][113] -> [SKIP][114] ([Intel XE#2423]) +32 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#616])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][116] ([Intel XE#1551])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][117] -> [DMESG-FAIL][118] ([Intel XE#324]) +1 other test dmesg-fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_plane@plane-position-hole.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#498]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2318]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#1201]) +15 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1128])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1122] / [Intel XE#1201])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#1649]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [PASS][129] -> [SKIP][130] ([Intel XE#2351]) +36 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_psr@psr-no-drrs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2351]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1091] / [Intel XE#1201])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1091])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][135] ([Intel XE#1050])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1447])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][137] -> [TIMEOUT][138] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#688]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1130]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1130]) +19 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_exec_balancer@once-parallel-userptr-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#1130] / [Intel XE#1201]) +58 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1392]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [FAIL][145] ([Intel XE#1069])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#288]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - shard-lnl:          [PASS][148] -> [SKIP][149] ([Intel XE#1130]) +85 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [PASS][150] -> [SKIP][151] ([Intel XE#1192])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@xe_live_ktest@xe_mocs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@short-reads:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#2419])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_oa@short-reads.html
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2419])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_oa@short-reads.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#979])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1420])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1130] / [Intel XE#1201]) +12 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [FAIL][157] ([Intel XE#1924] / [Intel XE#2028])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][158] ([Intel XE#1551] / [Intel XE#569])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#584])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][160] -> [ABORT][161] ([Intel XE#1794])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][162] -> [DMESG-WARN][163] ([Intel XE#2019] / [Intel XE#2280])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_pm@s4-vm-bind-unbind-all.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#944])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][165] -> [SKIP][166] ([Intel XE#1130]) +23 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#2134]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@fbdev@nullptr.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@fbdev@nullptr.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [INCOMPLETE][169] ([Intel XE#1195]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [i915#2575]) -> [PASS][172] +20 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#877]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][175] ([i915#2575]) -> [PASS][176] +13 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][178] +13 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip@busy-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201]) -> [PASS][180] +10 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][181] ([Intel XE#2351]) -> [PASS][182] +23 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          [FAIL][185] ([Intel XE#2028]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-lnl:          [SKIP][187] ([Intel XE#2423]) -> [PASS][188] +34 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_hdr@invalid-hdr.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2423] / [i915#2575]) -> [PASS][190] +5 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][191] ([Intel XE#616]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_plane_cursor@viewport.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][193] ([Intel XE#870]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [SKIP][195] -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_pm_rpm@drm-resources-equal.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][197] -> [PASS][198] +7 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_pm_rpm@universal-planes.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_pm_rpm@universal-planes.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][199] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][202] +66 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1130]) -> [PASS][204] +32 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@twice-null:
    - shard-lnl:          [SKIP][205] ([Intel XE#1130]) -> [PASS][206] +84 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_exec_basic@twice-null.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@xe_exec_basic@twice-null.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][207] ([Intel XE#2105]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [ABORT][209] ([Intel XE#2421]) -> [SKIP][210] ([Intel XE#1201])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@core_hotunplug@hotrebind.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [SKIP][211] -> [ABORT][212] ([Intel XE#2421])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@core_hotunplug@hotunbind-rebind.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
    - shard-lnl:          [SKIP][213] -> [ABORT][214] ([Intel XE#2421])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@core_hotunplug@hotunbind-rebind.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2-set2:     [SKIP][215] ([i915#2575]) -> [SKIP][216] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          [SKIP][217] ([Intel XE#660]) -> [SKIP][218] ([Intel XE#2423])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@unused-modifier:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2423] / [i915#2575]) -> [SKIP][220] ([Intel XE#1201] / [i915#2575])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_addfb_basic@unused-modifier.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][222] ([Intel XE#801]) +23 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#2351])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][226] ([Intel XE#1201])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][228] ([Intel XE#316])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][229] ([Intel XE#1407]) -> [SKIP][230] ([Intel XE#2351]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [SKIP][231] ([Intel XE#2351]) -> [DMESG-WARN][232] ([Intel XE#1725])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][234] ([Intel XE#316])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][235] -> [SKIP][236] ([Intel XE#1201] / [Intel XE#316])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#316])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-lnl:          [SKIP][239] ([Intel XE#2351]) -> [SKIP][240] ([Intel XE#1407]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201]) -> [SKIP][242] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201]) -> [SKIP][244] ([Intel XE#1124])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-lnl:          [SKIP][245] ([Intel XE#2351]) -> [SKIP][246] ([Intel XE#1124]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][248] ([Intel XE#1201]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][250] ([Intel XE#619])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][251] -> [SKIP][252] ([Intel XE#1124] / [Intel XE#1201])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][254] ([Intel XE#1124]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][256] ([Intel XE#2351])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1124]) -> [SKIP][258] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][259] ([Intel XE#1124]) -> [SKIP][260] ([Intel XE#2351]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#2351])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [i915#2575]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#367])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][265] ([i915#2575]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#367])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          [SKIP][267] ([Intel XE#2423]) -> [SKIP][268] ([Intel XE#2191])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [i915#2575]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#2191])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][272] ([Intel XE#2191]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][274] ([Intel XE#367]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#367]) -> [SKIP][276] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#367]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][280] ([Intel XE#2423] / [i915#2575])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
    - shard-lnl:          [SKIP][281] ([Intel XE#367]) -> [SKIP][282] ([Intel XE#2423])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          [SKIP][283] ([Intel XE#1512]) -> [SKIP][284] ([Intel XE#2423])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][285] -> [SKIP][286] ([Intel XE#455] / [Intel XE#787])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][288] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][290] ([Intel XE#787]) +48 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][291] ([Intel XE#1399]) -> [SKIP][292] ([Intel XE#2351]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][294] ([Intel XE#1201])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][297] -> [SKIP][298] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][300] ([Intel XE#1201]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#1252])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][304] ([Intel XE#455] / [Intel XE#787])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#787]) -> [SKIP][306] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          [SKIP][309] ([Intel XE#2351]) -> [SKIP][310] ([Intel XE#1399]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1252]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#1252])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][314] ([Intel XE#1201] / [i915#2575])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-lnl:          [SKIP][315] ([Intel XE#306]) -> [SKIP][316] ([Intel XE#2423])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#1201] / [Intel XE#306])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#373]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#373])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][323] ([i915#2575]) -> [SKIP][324] ([Intel XE#373])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][326] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][328] ([Intel XE#373]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#373]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [i915#2575]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#373])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][336] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-lnl:          [SKIP][337] ([Intel XE#373]) -> [SKIP][338] ([Intel XE#2423]) +6 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][340] ([Intel XE#373])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][341] ([i915#2575]) -> [SKIP][342] ([Intel XE#1201] / [Intel XE#373])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#373]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][346] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][347] ([Intel XE#1178]) -> [SKIP][348] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
    - shard-lnl:          [SKIP][349] ([Intel XE#599]) -> [SKIP][350] ([Intel XE#2423]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_content_protection@atomic-dpms.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [i915#2575]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#307])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-lnl:          [SKIP][355] ([Intel XE#1413]) -> [SKIP][356] ([Intel XE#2423]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1201] / [i915#2575]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#308])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          [SKIP][359] ([Intel XE#2423]) -> [SKIP][360] ([Intel XE#1413]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1201] / [i915#2575]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_cursor_crc@cursor-random-256x256.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          [SKIP][363] ([Intel XE#1424]) -> [SKIP][364] ([Intel XE#2423])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][366] ([Intel XE#308])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          [SKIP][369] ([Intel XE#2423]) -> [SKIP][370] ([Intel XE#1424])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#1201] / [Intel XE#308])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][373] ([Intel XE#309]) -> [SKIP][374] ([Intel XE#2423]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][375] ([Intel XE#2423]) -> [SKIP][376] ([Intel XE#309]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][378] ([Intel XE#2351])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][380] ([Intel XE#1201])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-lnl:          [SKIP][381] ([Intel XE#599]) -> [SKIP][382] ([Intel XE#2351]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][384] ([Intel XE#776])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1201] / [i915#2575]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#701])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          [SKIP][387] ([Intel XE#2423]) -> [SKIP][388] ([Intel XE#701])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_feature_discovery@chamelium.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][389] ([Intel XE#2423]) -> [SKIP][390] ([Intel XE#702])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_feature_discovery@display-2x.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][391] ([Intel XE#703]) -> [SKIP][392] ([Intel XE#2423])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_feature_discovery@display-3x.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][394] ([Intel XE#1201] / [i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          [SKIP][395] ([Intel XE#2423]) -> [SKIP][396] ([Intel XE#1421]) +4 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          [SKIP][397] ([Intel XE#1421]) -> [SKIP][398] ([Intel XE#2423]) +5 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [DMESG-WARN][399] ([Intel XE#2019]) -> [SKIP][400] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][402] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][403] ([Intel XE#1551]) -> [INCOMPLETE][404] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1201]) -> [SKIP][406] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#455]) -> [SKIP][408] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-lnl:          [SKIP][409] ([Intel XE#2351]) -> [SKIP][410] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#455]) -> [SKIP][412] ([Intel XE#1201]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
    - shard-lnl:          [SKIP][413] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][414] ([Intel XE#2351]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#455])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][417] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][418] ([Intel XE#2351])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][420] ([Intel XE#455]) +14 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][421] -> [SKIP][422] ([Intel XE#1201] / [Intel XE#455])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [i915#5274]) -> [SKIP][424] ([Intel XE#2423] / [i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-lnl:          [SKIP][425] ([Intel XE#352]) -> [SKIP][426] ([Intel XE#2423])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][427] ([Intel XE#651]) -> [SKIP][428] ([Intel XE#2351]) +11 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][429] -> [SKIP][430] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][432] ([Intel XE#651]) +14 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][433] -> [SKIP][434] ([Intel XE#651])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2351]) -> [SKIP][438] ([Intel XE#1201] / [Intel XE#651])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][439] ([Intel XE#2351]) -> [SKIP][440] ([Intel XE#656]) +13 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][441] ([Intel XE#656]) -> [SKIP][442] ([Intel XE#2351]) +29 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#651]) -> [SKIP][444] ([Intel XE#1201])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][445] ([Intel XE#2351]) -> [SKIP][446] ([Intel XE#651]) +10 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#651]) -> [SKIP][448] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201]) -> [SKIP][452] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][454] ([Intel XE#1201]) +13 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201]) -> [SKIP][456] ([Intel XE#651])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][458] ([Intel XE#658])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][459] -> [SKIP][460] ([Intel XE#653]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#653]) -> [SKIP][462] ([Intel XE#1201]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][464] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1201]) -> [SKIP][466] ([Intel XE#653])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][467] -> [SKIP][468] ([Intel XE#1201] / [Intel XE#658])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-lnl:          [SKIP][469] ([Intel XE#2351]) -> [SKIP][470] ([Intel XE#1469])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][472] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][474] ([Intel XE#653]) +14 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#653]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][477] -> [SKIP][478] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201]) -> [SKIP][480] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][482] ([Intel XE#2351])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][484] ([Intel XE#1201]) +9 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][486] ([Intel XE#2423] / [i915#2575])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
    - shard-lnl:          [SKIP][487] ([Intel XE#1470]) -> [SKIP][488] ([Intel XE#2423])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][489] ([i915#2575]) -> [SKIP][490] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][491] ([Intel XE#2423]) -> [SKIP][492] ([Intel XE#599]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2423] / [i915#2575]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#455])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [SKIP][495] ([i915#2575]) -> [DMESG-FAIL][496] ([Intel XE#1551])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1201] / [i915#2575]) -> [SKIP][498] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-lnl:          [SKIP][499] ([Intel XE#498]) -> [SKIP][500] ([Intel XE#2423])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][502] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][504] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          [SKIP][505] ([Intel XE#2423]) -> [SKIP][506] ([Intel XE#2318]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-lnl:          [SKIP][507] ([Intel XE#2318]) -> [SKIP][508] ([Intel XE#2423]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1201]) -> [SKIP][510] ([Intel XE#1201] / [Intel XE#870])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][512] ([Intel XE#870])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][514] ([Intel XE#1201])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201]) -> [SKIP][516] ([Intel XE#1122])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          [SKIP][517] ([Intel XE#2351]) -> [SKIP][518] ([Intel XE#736])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][519] ([Intel XE#1131]) -> [SKIP][520] ([Intel XE#2351])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][521] ([Intel XE#1430]) -> [SKIP][522] ([Intel XE#2351])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][524] ([Intel XE#1201])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][525] -> [SKIP][526] ([Intel XE#1201]) +4 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#1201]) -> [SKIP][528] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][530] ([Intel XE#1489]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][532] ([Intel XE#1201])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1489]) -> [SKIP][534] ([Intel XE#1201] / [Intel XE#1489])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][535] -> [SKIP][536] ([Intel XE#929])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-move.html
    - shard-lnl:          [SKIP][537] ([Intel XE#2351]) -> [SKIP][538] ([Intel XE#1406]) +1 other test skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#1201]) -> [SKIP][540] ([Intel XE#929])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][542] ([Intel XE#1201]) +3 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_psr@fbc-psr-primary-blt.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][544] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#929]) -> [SKIP][546] ([Intel XE#1201])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-render.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][548] ([Intel XE#929]) +8 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][550] ([Intel XE#929])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-blt.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][551] -> [SKIP][552] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#929]) -> [SKIP][554] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-render.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          [SKIP][555] ([Intel XE#1406]) -> [SKIP][556] ([Intel XE#2351]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#1201]) -> [SKIP][558] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_psr@psr2-sprite-blt.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][560] ([Intel XE#1149])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#1201] / [i915#2575]) -> [SKIP][562] ([Intel XE#1201] / [Intel XE#327])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          [SKIP][563] ([Intel XE#2423]) -> [SKIP][564] ([Intel XE#1437])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#1127]) -> [SKIP][566] ([Intel XE#1127] / [Intel XE#1201])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#327]) -> [SKIP][568] ([Intel XE#1201] / [i915#2575])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-lnl:          [SKIP][569] ([Intel XE#1437]) -> [SKIP][570] ([Intel XE#2423])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][572] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][574] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1201] / [i915#2575]) -> [SKIP][576] ([Intel XE#1201] / [Intel XE#1500])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-lnl:          [SKIP][577] ([Intel XE#2423]) -> [SKIP][578] ([Intel XE#362])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][579] ([Intel XE#2019]) -> [SKIP][580] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][582] ([Intel XE#2423] / [i915#2575])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_vrr@cmrr.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][584] ([Intel XE#1201] / [i915#2575])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html
    - shard-lnl:          [FAIL][585] -> [SKIP][586] ([Intel XE#2423])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][588] ([Intel XE#1201] / [i915#2575])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_writeback@writeback-check-output.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][590] ([Intel XE#2423] / [i915#2575])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          [SKIP][591] ([Intel XE#756]) -> [SKIP][592] ([Intel XE#2423]) +1 other test skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_writeback@writeback-fb-id.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][593] ([i915#2575]) -> [SKIP][594] ([Intel XE#756])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-lnl:          [SKIP][595] ([Intel XE#2423]) -> [SKIP][596] ([Intel XE#756])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][598] ([Intel XE#1091] / [Intel XE#1201])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][600] ([Intel XE#1123] / [Intel XE#1201])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][602] ([Intel XE#1126])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#1126]) -> [SKIP][604] ([Intel XE#1126] / [Intel XE#1201])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1130] / [Intel XE#1201]) -> [TIMEOUT][606] ([Intel XE#1473] / [Intel XE#392])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][607] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [SKIP][608] ([Intel XE#1130] / [Intel XE#1201])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][609] ([Intel XE#1473] / [Intel XE#402]) -> [INCOMPLETE][610] ([Intel XE#1195] / [Intel XE#1473])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1130]) -> [INCOMPLETE][612] ([Intel XE#1195] / [Intel XE#1473])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
    - shard-lnl:          [SKIP][613] ([Intel XE#1130]) -> [SKIP][614] ([Intel XE#688]) +3 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_evict@evict-beng-threads-large.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#1130]) -> [FAIL][616] ([Intel XE#1600])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][617] ([Intel XE#1473] / [Intel XE#392]) -> [SKIP][618] ([Intel XE#1130])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          [SKIP][619] ([Intel XE#688]) -> [SKIP][620] ([Intel XE#1130]) +6 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@xe_evict@evict-threads-small-multi-vm.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-lnl:          [SKIP][621] ([Intel XE#1392]) -> [SKIP][622] ([Intel XE#1130]) +2 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-lnl:          [SKIP][623] ([Intel XE#1130]) -> [SKIP][624] ([Intel XE#1392]) +3 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_exec_basic@multigpu-once-rebind.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][626] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][628] ([Intel XE#288])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][630] ([Intel XE#1130]) +2 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][632] ([Intel XE#1130] / [Intel XE#1201]) +10 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#1130]) -> [SKIP][634] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#288]) -> [SKIP][636] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][638] ([Intel XE#288]) +17 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][640] ([Intel XE#1201] / [Intel XE#2360])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1130]) -> [SKIP][642] ([Intel XE#1130] / [Intel XE#1201]) +7 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_reset@close-execqueues-close-fd.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][644] ([Intel XE#255])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][645] ([Intel XE#2136]) -> [DMESG-FAIL][646] ([Intel XE#2019])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_module_load@reload.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][648] ([Intel XE#2419]) +3 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_oa@mi-rpc.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#2419]) -> [SKIP][650] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#1337]) -> [SKIP][652] ([Intel XE#1201] / [Intel XE#1337])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#979]) -> [SKIP][654] ([Intel XE#1201] / [Intel XE#979])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][655] ([Intel XE#1130]) -> [SKIP][656] ([Intel XE#2284] / [Intel XE#366])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_pm@d3cold-basic.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_pm@d3cold-basic.html
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][658] ([Intel XE#2284] / [Intel XE#366])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_pm@d3cold-basic.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][660] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          [SKIP][661] ([Intel XE#1948]) -> [SKIP][662] ([Intel XE#1130])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@xe_pm@d3hot-mmap-vram.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1130]) -> [DMESG-WARN][664] ([Intel XE#1551] / [Intel XE#569])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-lnl:          [SKIP][665] ([Intel XE#1130]) -> [SKIP][666] ([Intel XE#584])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          [SKIP][667] ([Intel XE#584]) -> [SKIP][668] ([Intel XE#1130]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@xe_pm@s3-mocs.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][669] ([Intel XE#1551] / [Intel XE#569]) -> [SKIP][670] ([Intel XE#1130] / [Intel XE#1201])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [SKIP][671] ([Intel XE#1130]) -> [ABORT][672] ([Intel XE#1358])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][674] ([Intel XE#579])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          [SKIP][675] ([Intel XE#1130]) -> [SKIP][676] ([Intel XE#579])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [SKIP][677] ([Intel XE#1130]) -> [FAIL][678] ([Intel XE#958])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][680] ([Intel XE#1130])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          [SKIP][681] ([Intel XE#944]) -> [SKIP][682] ([Intel XE#1130]) +1 other test skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][684] ([Intel XE#944])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][686] ([Intel XE#1201] / [Intel XE#944])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#944]) -> [SKIP][688] ([Intel XE#1201] / [Intel XE#944])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][690] ([Intel XE#1130] / [Intel XE#1201])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          [SKIP][691] ([Intel XE#1130]) -> [SKIP][692] ([Intel XE#944]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#1130]) -> [SKIP][694] ([Intel XE#1201] / [Intel XE#944])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][696] ([Intel XE#944])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@large-split-misaligned-binds-1073741824:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][698] ([Intel XE#1130]) +5 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_vm@large-split-misaligned-binds-1073741824.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_vm@large-split-misaligned-binds-1073741824.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][699] ([Intel XE#2310]) -> [SKIP][700] ([Intel XE#1130])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2362
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2376
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2398]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2398
  [Intel XE#2400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2400
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2428
  [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
  [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/386
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7950 -> IGTPW_11511
  * Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -> xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d

  IGTPW_11511: 11511
  IGT_7950: 7950
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/index.html

--===============5732316547709629236==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel: Add tests to run suspend without display (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130239/">https://patchwork.freedesktop.org/series/130239/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7950_full -&gt; XEIGTPW_11511_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11511_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11511_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): shard-bmg </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11511_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_lease@lease-again.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_lease@lease-again.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_pm_rpm@i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s2idle-without-display} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_pm@s2idle-without-display.html">FAIL</a> +2 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_pm@s2idle-without-display.html">FAIL</a> +2 other tests fail</li>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-6/igt@xe_pm@s2idle-without-display.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@core_hotunplug@hotrebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_vrr@flip-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> +21 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> +3 other tests timeout</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7950_full and XEIGTPW_11511_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pm@s2idle-without-display:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [9.95, 13.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-without-display:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [9.88, 12.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-without-display:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [9.82, 13.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11511_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-closed:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_getfb@getfb2-handle-closed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_getfb@getfb2-handle-closed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_lease@invalid-create-leases.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_lease@lease-invalid-connector.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_lease@lease-invalid-connector.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_psr@psr-no-drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_exec_balancer@once-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +23 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_flip@busy-flip.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_hdr@invalid-hdr.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_pm_rpm@universal-planes.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_pm_rpm@universal-planes.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">PASS</a> +66 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_exec_basic@twice-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@xe_exec_basic@twice-null.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_addfb_basic@unused-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_addfb_basic@unused-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-4/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_exec_reset@close-execqueues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_exec_reset@close-execqueues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-435/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-466/igt@xe_vm@large-split-misaligned-binds-1073741824.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-dg2-432/igt@xe_vm@large-split-misaligned-binds-1073741824.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11511/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7950 -&gt; IGTPW_11511</li>
<li>Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -&gt; xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d</li>
</ul>
<p>IGTPW_11511: 11511<br />
  IGT_7950: 7950<br />
  xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055<br />
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d</p>

</body>
</html>

--===============5732316547709629236==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C33D41D4A
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 04:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EB910E260;
	Wed, 13 Nov 2024 04:03:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E510E260;
 Wed, 13 Nov 2024 04:03:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5858537978879016798=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/xe/pmu=3A_Add_pmu_tests?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 04:03:08 -0000
Message-ID: <173147058822.3252460.10495433563756260806@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113013643.4151537-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241113013643.4151537-1-vinay.belgaumkar@intel.com>
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

--===============5858537978879016798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe/pmu: Add pmu tests (rev3)
URL   : https://patchwork.freedesktop.org/series/140737/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8104_full -> XEIGTPW_12083_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12083_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12083_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12083_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-5.html

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-7/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-5/igt@xe_pm@s3-mocs.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pmu@c6 (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][8] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@xe_pmu@c6.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_pmu@c6.html
    - shard-lnl:          NOTRUN -> [FAIL][10] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@xe_pmu@c6.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#3309]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-5}:
    - shard-dg2-set2:     [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-5.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-5.html

  
New tests
---------

  New tests have been introduced between XEIGT_8104_full and XEIGTPW_12083_full:

### New IGT tests (2) ###

  * igt@xe_pmu@c6:
    - Statuses : 3 fail(s)
    - Exec time: [0.00, 0.03] s

  * igt@xe_pmu@frequency:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12083_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#2423])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@core_getclient.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@core_getclient.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#1885])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][19] -> [SKIP][20] ([Intel XE#2134]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@fbdev@read.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@fbdev@read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2233])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#3105])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#911]) +3 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2550]) +23 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#1701]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#1426]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2327]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2191])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1512])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2669]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +130 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#616]) +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#1195])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2887]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2252]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_color@ctm-0-75@pipe-b-edp-1:
    - shard-lnl:          [PASS][48] -> [DMESG-WARN][49] ([Intel XE#2929])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-b-edp-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-b-edp-1.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#1178]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2320])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2321]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#877]) +1 other test dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#1541])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#2141]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2375])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#301]) +5 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#301]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1421]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#2423] / [i915#2575]) +100 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_flip@busy-flip.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#886]) +5 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][74] -> [INCOMPLETE][75] ([Intel XE#1195])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2136] / [Intel XE#2351]) +15 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#455]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2351])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#651])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#651]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][86] ([Intel XE#2333]) +3 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#2136]) +29 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2136]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2313]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2350])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#653]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#3374])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][100] -> [FAIL][101] ([Intel XE#1430])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2446])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][103] ([Intel XE#2042])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2446]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2042])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-lnl:          [PASS][108] -> [DMESG-WARN][109] ([Intel XE#3184])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-32.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2893])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1489]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1489]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-render@edp-1:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#2808]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-8/igt@kms_psr@psr-cursor-render@edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_psr@psr-cursor-render@edp-1.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1280] / [Intel XE#455])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-dg2-set2:     NOTRUN -> [FAIL][117] ([Intel XE#2667])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2905]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2905]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][120] -> [TIMEOUT][121] ([Intel XE#1473])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#688])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-5/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2322]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#288]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][126] ([Intel XE#3343]) +5 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][127] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2229])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][129] ([Intel XE#2514])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#2514])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][131] ([Intel XE#1173])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2284] / [Intel XE#366])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1607])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@xe_pm@s4-basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#944])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_vm@large-misaligned-binds-2097152:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1130]) +20 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_vm@large-misaligned-binds-2097152.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1130]) +198 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#2423]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@core_getstats.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][141] -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@core_getversion@basic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@core_getversion@basic.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#2134]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@fbdev@eof.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@fbdev@eof.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [INCOMPLETE][145] -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][148] +11 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][149] -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][151] ([Intel XE#2929]) -> [PASS][152] +2 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@single-move:
    - shard-bmg:          [INCOMPLETE][153] ([Intel XE#3226]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@kms_cursor_legacy@single-move.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][155] ([Intel XE#301]) -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-lnl:          [FAIL][157] ([Intel XE#3097]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][159] ([Intel XE#301]) -> [PASS][160] +4 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [DMESG-WARN][161] -> [PASS][162] +6 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][163] ([Intel XE#886]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2136]) -> [PASS][166] +28 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#616]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#2423] / [i915#2575]) -> [PASS][170] +99 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][171] ([Intel XE#718]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [FAIL][173] ([Intel XE#3129]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#2446]) -> [PASS][176] +3 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [FAIL][177] -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][179] ([Intel XE#2042]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-WARN][181] ([Intel XE#3184]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [FAIL][183] -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_psr@psr2-sprite-plane-onoff.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][185] ([Intel XE#2883]) -> [PASS][186] +6 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-5/igt@kms_setmode@basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][187] ([Intel XE#899]) -> [PASS][188] +2 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][189] ([Intel XE#1523]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-5/igt@kms_vblank@accuracy-idle.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1130]) -> [PASS][192] +189 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][193] ([Intel XE#2136]) -> [PASS][194] +2 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_module_load@reload.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][195] ([Intel XE#1616]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#2280] / [Intel XE#3426]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][199] ([Intel XE#958]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2423] / [i915#2575]) -> [SKIP][202] ([Intel XE#623])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2423] / [i915#2575]) -> [SKIP][204] ([Intel XE#873])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2-set2:     [FAIL][205] ([Intel XE#1426]) -> [SKIP][206] ([Intel XE#2423] / [i915#2575])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2136]) -> [SKIP][208] ([Intel XE#316]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][210] ([Intel XE#316]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][212] ([Intel XE#877])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#316]) -> [SKIP][214] ([Intel XE#2136]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][216] ([Intel XE#619])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2136]) -> [SKIP][218] ([Intel XE#1124]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][220] ([Intel XE#1124]) +6 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1124]) -> [SKIP][222] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1124]) -> [SKIP][224] ([Intel XE#2136]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2423] / [i915#2575]) -> [SKIP][226] ([Intel XE#2191]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2191]) -> [SKIP][228] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2423] / [i915#2575]) -> [SKIP][230] ([Intel XE#367]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#367]) -> [SKIP][232] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][234] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2907]) -> [SKIP][236] ([Intel XE#2136]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][238] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][239] -> [SKIP][240] ([Intel XE#455] / [Intel XE#787])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][244] ([Intel XE#1195] / [Intel XE#1727])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][246] ([Intel XE#2136]) +17 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#373]) -> [SKIP][248] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#306]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2423] / [i915#2575]) -> [SKIP][252] ([Intel XE#306]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2423] / [i915#2575]) -> [SKIP][254] ([Intel XE#373]) +12 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][255] ([Intel XE#1178]) -> [SKIP][256] ([Intel XE#2423] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2423] / [i915#2575]) -> [SKIP][258] ([Intel XE#307])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#307]) -> [SKIP][260] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [FAIL][262] ([Intel XE#1178])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_content_protection@legacy.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][263] ([Intel XE#1188]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_content_protection@uevent.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#308]) -> [SKIP][266] ([Intel XE#2423] / [i915#2575])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2423] / [i915#2575]) -> [SKIP][268] ([Intel XE#308]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#323]) -> [SKIP][270] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][272] ([Intel XE#455]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#455]) -> [SKIP][274] ([Intel XE#2136]) +6 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#776])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#701]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_feature_discovery@chamelium.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2423] / [i915#2575]) -> [SKIP][280] ([Intel XE#1137])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][281] ([Intel XE#301]) -> [SKIP][282] ([Intel XE#2423] / [i915#2575])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2423] / [i915#2575]) -> [FAIL][284] ([Intel XE#301])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][285] ([Intel XE#886]) -> [FAIL][286] ([Intel XE#3149] / [Intel XE#886])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [FAIL][287] ([Intel XE#3403] / [Intel XE#886]) -> [FAIL][288] ([Intel XE#886])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#455]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455]) -> [SKIP][292] ([Intel XE#2136] / [Intel XE#2351])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#651]) -> [SKIP][294] ([Intel XE#2136]) +26 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][296] ([Intel XE#651]) +12 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#651]) +22 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#651]) -> [SKIP][300] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][302] ([Intel XE#658])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#1158])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#653]) -> [SKIP][306] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#653]) +22 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][310] ([Intel XE#653]) +9 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#653]) -> [SKIP][312] ([Intel XE#2136]) +27 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#455]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#346])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2927])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136]) -> [SKIP][320] ([Intel XE#2925])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2927]) -> [SKIP][322] ([Intel XE#2136])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [SKIP][324] ([Intel XE#356])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][325] ([Intel XE#361]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2423] / [i915#2575]) -> [SKIP][328] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][330] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136]) -> [SKIP][332] ([Intel XE#2938])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#870]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#908]) -> [SKIP][336] ([Intel XE#2136] / [Intel XE#2351])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2136]) -> [SKIP][338] ([Intel XE#1489]) +11 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1489]) -> [SKIP][340] ([Intel XE#2136]) +10 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1122]) -> [SKIP][342] ([Intel XE#2136])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][344] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][346] ([Intel XE#2136]) +12 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_psr@fbc-psr2-dpms.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][350] ([Intel XE#2351])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_psr@psr-cursor-plane-move.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][352] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][354] ([Intel XE#2939])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#3414]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1127]) -> [SKIP][358] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#3414]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#362]) -> [SKIP][362] ([Intel XE#2423] / [i915#2575])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1500]) -> [SKIP][364] ([Intel XE#2423] / [i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#330]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2423] / [i915#2575]) -> [SKIP][368] ([Intel XE#2168])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_vrr@cmrr.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2423] / [i915#2575]) -> [SKIP][370] ([Intel XE#455]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#756]) -> [SKIP][372] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2423] / [i915#2575]) -> [SKIP][374] ([Intel XE#1091] / [Intel XE#2849])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#1130]) -> [SKIP][376] ([Intel XE#1280] / [Intel XE#455])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1123]) -> [SKIP][378] ([Intel XE#1130])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1130]) -> [SKIP][380] ([Intel XE#1126]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2905]) -> [SKIP][382] ([Intel XE#1130]) +9 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1130]) -> [SKIP][384] ([Intel XE#2905]) +12 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][385] ([Intel XE#1600]) -> [SKIP][386] ([Intel XE#1130])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1130]) -> [SKIP][388] ([Intel XE#288]) +30 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#288]) -> [SKIP][390] ([Intel XE#1130]) +31 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1130]) -> [SKIP][392] ([Intel XE#2360])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2360]) -> [SKIP][394] ([Intel XE#1130])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][395] -> [SKIP][396] ([Intel XE#1130])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1130]) -> [DMESG-WARN][398] ([Intel XE#3343])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#255]) -> [SKIP][400] ([Intel XE#1130])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1130]) -> [SKIP][402] ([Intel XE#2541]) +10 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2541]) -> [SKIP][404] ([Intel XE#1130]) +4 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1130]) -> [SKIP][406] ([Intel XE#1337])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][408] ([Intel XE#1130])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][409] ([Intel XE#1173]) -> [SKIP][410] ([Intel XE#1061])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@xe_peer2peer@read.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1061]) -> [FAIL][412] ([Intel XE#1173])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_peer2peer@write.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][414] ([Intel XE#1130]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2284]) -> [SKIP][416] ([Intel XE#1130])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#579]) -> [SKIP][418] ([Intel XE#1130])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1130]) -> [SKIP][420] ([Intel XE#944]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#944]) -> [SKIP][422] ([Intel XE#1130]) +4 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_query@multigpu-query-topology.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1130]) -> [FAIL][424] ([Intel XE#2922])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_tlb@basic-tlb.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1130]) -> [ABORT][426] ([Intel XE#3421])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097
  [Intel XE#3105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105
  [Intel XE#3129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8104 -> IGTPW_12083
  * Linux: xe-2216-36fa6891eada99bfa3c71536479985bc6f42df38 -> xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b

  IGTPW_12083: 12083
  IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2216-36fa6891eada99bfa3c71536479985bc6f42df38: 36fa6891eada99bfa3c71536479985bc6f42df38
  xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/index.html

--===============5858537978879016798==
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
<tr><td><b>Series:</b></td><td>tests/xe/pmu: Add pmu tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140737/">https://patchwork.freedesktop.org/series/140737/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8104_full -&gt; XEIGTPW_12083_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12083_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12083_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12083_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-5.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-7/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-5/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-6/igt@xe_pm@s3-mocs.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@c6 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@xe_pmu@c6.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_pmu@c6.html">FAIL</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@xe_pmu@c6.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_dc@dc5-retention-flops:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-5}:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-5.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8104_full and XEIGTPW_12083_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pmu@c6:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@frequency:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12083_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@core_getclient.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105">Intel XE#3105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +130 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-7/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +100 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-8/igt@kms_psr@psr-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_psr@psr-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-5/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_vm@large-misaligned-binds-2097152.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +198 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@core_getstats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-3/igt@kms_cursor_legacy@single-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_cursor_legacy@single-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097">Intel XE#3097</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-dp2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> +99 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129">Intel XE#3129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_psr@psr2-sprite-plane-onoff.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-6/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-5/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> +189 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426">Intel XE#3426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403">Intel XE#3403</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-lnl-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-433/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-466/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8104/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12083/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8104 -&gt; IGTPW_12083</li>
<li>Linux: xe-2216-36fa6891eada99bfa3c71536479985bc6f42df38 -&gt; xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b</li>
</ul>
<p>IGTPW_12083: 12083<br />
  IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2216-36fa6891eada99bfa3c71536479985bc6f42df38: 36fa6891eada99bfa3c71536479985bc6f42df38<br />
  xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b</p>

</body>
</html>

--===============5858537978879016798==--

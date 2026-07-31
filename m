Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9341CC55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 07:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19C10F1AB;
	Fri, 31 Jul 2026 07:46:07 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EA710F1AC;
 Fri, 31 Jul 2026 07:45:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4481215509503730222=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tools/xe-perf-recorder=3A_?=
 =?utf-8?q?expose_some_OA_stream_open_properties_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jul 2026 07:45:34 -0000
Message-ID: <178548393454.8278.9145223753404680459@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731054543.3246926-1-shekhar.chauhan@intel.com>
In-Reply-To: <20260731054543.3246926-1-shekhar.chauhan@intel.com>
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

--===============4481215509503730222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/xe-perf-recorder: expose some OA stream open properties (rev2)
URL   : https://patchwork.freedesktop.org/series/171150/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9034_FULL -> XEIGTPW_15613_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15613_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#8714]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@core_getversion@basic.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2134]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#5177] / [Intel XE#8714])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@intel_hwmon@hwmon-write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#6969]) +10 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6969] / [Intel XE#7006])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1340] / [Intel XE#7435])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#8076])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#8714]) +754 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2229]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@xe_live_ktest@xe_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#6569])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][21] ([Intel XE#2134]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@fbdev@unaligned-read.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@fbdev@unaligned-read.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][23] ([Intel XE#301]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [SKIP][25] ([Intel XE#8714]) -> [PASS][26] +712 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][27] ([Intel XE#8399]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][29] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][31] ([Intel XE#8714]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][33] ([Intel XE#8714]) -> [SKIP][34] ([Intel XE#2233])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][35] ([Intel XE#8714]) -> [SKIP][36] ([Intel XE#2370])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][37] ([Intel XE#8714]) -> [SKIP][38] ([Intel XE#2327]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][39] ([Intel XE#2327]) -> [SKIP][40] ([Intel XE#8714]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][41] ([Intel XE#8714]) -> [SKIP][42] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][43] ([Intel XE#8714]) -> [SKIP][44] ([Intel XE#1124]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][45] ([Intel XE#8714]) -> [SKIP][46] ([Intel XE#607] / [Intel XE#7361])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][47] ([Intel XE#8714]) -> [SKIP][48] ([Intel XE#610] / [Intel XE#7387]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][49] ([Intel XE#8714]) -> [SKIP][50] ([Intel XE#2328] / [Intel XE#7367])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][51] ([Intel XE#1124]) -> [SKIP][52] ([Intel XE#8714]) +12 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][53] ([Intel XE#7679]) -> [SKIP][54] ([Intel XE#8714])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][55] ([Intel XE#8714]) -> [SKIP][56] ([Intel XE#367]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][57] ([Intel XE#367]) -> [SKIP][58] ([Intel XE#8714]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][59] ([Intel XE#8714]) -> [SKIP][60] ([Intel XE#2887]) +16 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][61] ([Intel XE#2887]) -> [SKIP][62] ([Intel XE#8714]) +18 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][63] ([Intel XE#3432]) -> [SKIP][64] ([Intel XE#8714]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][65] ([Intel XE#2652]) -> [SKIP][66] ([Intel XE#8714])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][67] ([Intel XE#8714]) -> [SKIP][68] ([Intel XE#3432]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][69] ([Intel XE#8714]) -> [SKIP][70] ([Intel XE#2652])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][71] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][72] ([Intel XE#8714])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_cdclk@plane-scaling.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][73] ([Intel XE#8714]) -> [SKIP][74] ([Intel XE#2252]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-9/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][75] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][76] ([Intel XE#8714])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][77] ([Intel XE#8714]) -> [SKIP][78] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          [SKIP][79] ([Intel XE#7358]) -> [SKIP][80] ([Intel XE#8714])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][81] ([Intel XE#8714]) -> [SKIP][82] ([Intel XE#7358]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][83] ([Intel XE#2252]) -> [SKIP][84] ([Intel XE#8714]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][85] ([Intel XE#6507]) -> [SKIP][86] ([Intel XE#8714])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][87] ([Intel XE#8714]) -> [SKIP][88] ([Intel XE#6969] / [Intel XE#7006])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [FAIL][89] ([Intel XE#3304] / [Intel XE#7374]) -> [SKIP][90] ([Intel XE#8714])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][91] ([Intel XE#8714]) -> [SKIP][92] ([Intel XE#2390] / [Intel XE#6974])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          [SKIP][93] ([Intel XE#6974]) -> [SKIP][94] ([Intel XE#8714])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][95] ([Intel XE#8714]) -> [SKIP][96] ([Intel XE#6974])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][97] ([Intel XE#8714]) -> [FAIL][98] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][99] ([Intel XE#8714]) -> [SKIP][100] ([Intel XE#7642])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_content_protection@lic-type-1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-9/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][101] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][102] ([Intel XE#8714]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@kms_content_protection@suspend-resume.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][103] ([Intel XE#2320]) -> [SKIP][104] ([Intel XE#8714]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][105] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][106] ([Intel XE#8714]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][107] ([Intel XE#8714]) -> [SKIP][108] ([Intel XE#2320]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][109] ([Intel XE#8714]) -> [SKIP][110] ([Intel XE#2321] / [Intel XE#7355])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][111] ([Intel XE#7571]) -> [SKIP][112] ([Intel XE#8714])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][113] ([Intel XE#8714]) -> [SKIP][114] ([Intel XE#2286] / [Intel XE#6035]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][115] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][116] ([Intel XE#8714])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][117] ([Intel XE#8714]) -> [SKIP][118] ([Intel XE#4354] / [Intel XE#5882])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][119] ([Intel XE#4354] / [Intel XE#5870]) -> [SKIP][120] ([Intel XE#8714])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][121] ([Intel XE#8265]) -> [SKIP][122] ([Intel XE#8714]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][123] ([Intel XE#8714]) -> [SKIP][124] ([Intel XE#8265]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][125] ([Intel XE#8714]) -> [SKIP][126] ([Intel XE#4422] / [Intel XE#7442])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][127] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][128] ([Intel XE#8714])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][129] ([Intel XE#8714]) -> [SKIP][130] ([Intel XE#4156] / [Intel XE#7425])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][131] ([Intel XE#8714]) -> [SKIP][132] ([Intel XE#8680])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][133] ([Intel XE#1138] / [Intel XE#7344]) -> [SKIP][134] ([Intel XE#8714])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_feature_discovery@display-4x.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][135] ([Intel XE#8714]) -> [SKIP][136] ([Intel XE#2375])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          [SKIP][137] ([Intel XE#8714]) -> [SKIP][138] ([Intel XE#7179])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][139] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][140] ([Intel XE#8714]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][141] ([Intel XE#8714]) -> [SKIP][142] ([Intel XE#7178] / [Intel XE#7351]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][143] ([Intel XE#8714]) -> [SKIP][144] ([Intel XE#7178] / [Intel XE#7349])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][145] ([Intel XE#2311]) -> [SKIP][146] ([Intel XE#8714]) +68 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][147] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][148] ([Intel XE#8714]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][149] ([Intel XE#8714]) -> [SKIP][150] ([Intel XE#4141]) +13 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][151] ([Intel XE#4141]) -> [SKIP][152] ([Intel XE#8714]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][153] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][154] ([Intel XE#8714])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][155] ([Intel XE#8714]) -> [SKIP][156] ([Intel XE#2311]) +66 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][157] ([Intel XE#7399]) -> [SKIP][158] ([Intel XE#8714]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][159] ([Intel XE#7061]) -> [SKIP][160] ([Intel XE#8714]) +8 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][161] ([Intel XE#8714]) -> [SKIP][162] ([Intel XE#7061]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#8714]) -> [SKIP][164] ([Intel XE#2313]) +60 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][165] ([Intel XE#8714]) -> [SKIP][166] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][167] ([Intel XE#8714]) -> [SKIP][168] ([Intel XE#7399])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][169] ([Intel XE#2313]) -> [SKIP][170] ([Intel XE#8714]) +67 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][171] ([Intel XE#6901]) -> [SKIP][172] ([Intel XE#8714])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][173] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][174] ([Intel XE#8714])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][175] ([Intel XE#8714]) -> [SKIP][176] ([Intel XE#4298] / [Intel XE#5873])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][177] ([Intel XE#8714]) -> [SKIP][178] ([Intel XE#6911] / [Intel XE#7378]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          [SKIP][179] ([Intel XE#8714]) -> [SKIP][180] ([Intel XE#8348])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][181] ([Intel XE#7591]) -> [SKIP][182] ([Intel XE#8714])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][183] ([Intel XE#7283]) -> [SKIP][184] ([Intel XE#8714]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][185] ([Intel XE#8714]) -> [SKIP][186] ([Intel XE#7283]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][187] ([Intel XE#8714]) -> [SKIP][188] ([Intel XE#2393])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][189] ([Intel XE#2393]) -> [SKIP][190] ([Intel XE#8714])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][191] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][192] ([Intel XE#8714])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][193] ([Intel XE#8714]) -> [SKIP][194] ([Intel XE#5021] / [Intel XE#7377])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][195] ([Intel XE#8714]) -> [SKIP][196] ([Intel XE#5020] / [Intel XE#7348])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][197] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][198] ([Intel XE#8714])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][199] ([Intel XE#8714]) -> [SKIP][200] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][201] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][202] ([Intel XE#8714])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@kms_pm_backlight@fade.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][203] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][204] ([Intel XE#8714])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][205] ([Intel XE#6927]) -> [SKIP][206] ([Intel XE#8714])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_pm_dc@dc5-pageflip-negative.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][207] ([Intel XE#8714]) -> [SKIP][208] ([Intel XE#7794])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][209] ([Intel XE#8714]) -> [SKIP][210] ([Intel XE#2499])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][211] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][212] ([Intel XE#8714]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][213] ([Intel XE#1489]) -> [SKIP][214] ([Intel XE#8714]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][215] ([Intel XE#8714]) -> [SKIP][216] ([Intel XE#1489]) +10 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][217] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][218] ([Intel XE#8714])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][219] ([Intel XE#8714]) -> [SKIP][220] ([Intel XE#2387] / [Intel XE#7429])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][221] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][222] ([Intel XE#8714]) +14 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][223] ([Intel XE#8714]) -> [SKIP][224] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][225] ([Intel XE#8714]) -> [SKIP][226] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][227] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][228] ([Intel XE#8714]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][229] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][230] ([Intel XE#8714]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][231] ([Intel XE#8714]) -> [SKIP][232] ([Intel XE#1435] / [Intel XE#8695])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][233] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][234] ([Intel XE#8714])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][235] ([Intel XE#6503]) -> [SKIP][236] ([Intel XE#8714]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-10/igt@kms_sharpness_filter@filter-basic.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][237] ([Intel XE#8714]) -> [SKIP][238] ([Intel XE#6503]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][239] ([Intel XE#8714]) -> [FAIL][240] ([Intel XE#1729] / [Intel XE#7424])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][241] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][242] ([Intel XE#8714])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][243] ([Intel XE#8714]) -> [SKIP][244] ([Intel XE#2450] / [Intel XE#5857])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][245] ([Intel XE#8714]) -> [SKIP][246] ([Intel XE#1499]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@kms_vrr@flip-basic.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][247] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][248] ([Intel XE#8714])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_vrr@lobf.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][249] ([Intel XE#8397]) -> [SKIP][250] ([Intel XE#8714])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@kms_vrr@lobf-dc3co.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][251] ([Intel XE#1499]) -> [SKIP][252] ([Intel XE#8714])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@kms_vrr@max-min.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][253] ([Intel XE#6599]) -> [SKIP][254] ([Intel XE#8714]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][255] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][256] ([Intel XE#8714])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][257] ([Intel XE#8714]) -> [SKIP][258] ([Intel XE#8370]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][259] ([Intel XE#8370]) -> [SKIP][260] ([Intel XE#8714])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][261] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][262] ([Intel XE#8714]) +8 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][263] ([Intel XE#8714]) -> [SKIP][264] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][265] ([Intel XE#8374]) -> [SKIP][266] ([Intel XE#8714]) +12 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][267] ([Intel XE#8714]) -> [SKIP][268] ([Intel XE#8374]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][269] ([Intel XE#8714]) -> [SKIP][270] ([Intel XE#8364]) +30 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][271] ([Intel XE#8364]) -> [SKIP][272] ([Intel XE#8714]) +29 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][273] ([Intel XE#8714]) -> [SKIP][274] ([Intel XE#8369]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][275] ([Intel XE#8369]) -> [SKIP][276] ([Intel XE#8714]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@xe_exec_reset@multi-queue-close-execqueues.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          [SKIP][277] ([Intel XE#8714]) -> [SKIP][278] ([Intel XE#8378]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][279] ([Intel XE#8378]) -> [SKIP][280] ([Intel XE#8714]) +13 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][281] ([Intel XE#8714]) -> [SKIP][282] ([Intel XE#6281] / [Intel XE#7426])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [SKIP][283] ([Intel XE#8714]) -> [ABORT][284] ([Intel XE#8007])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          [SKIP][285] ([Intel XE#6964] / [Intel XE#8714]) -> [SKIP][286] ([Intel XE#6964]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          [SKIP][287] ([Intel XE#6964]) -> [SKIP][288] ([Intel XE#6964] / [Intel XE#8714]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][289] ([Intel XE#7793]) -> [SKIP][290] ([Intel XE#8714]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][291] ([Intel XE#8714]) -> [SKIP][292] ([Intel XE#7793]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          [SKIP][293] ([Intel XE#8714]) -> [SKIP][294] ([Intel XE#7590])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][295] ([Intel XE#8714]) -> [SKIP][296] ([Intel XE#2245] / [Intel XE#7590])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][297] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][298] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8714])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-5/igt@xe_peer2peer@read.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][299] ([Intel XE#8714]) -> [SKIP][300] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_pm@d3cold-basic.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][301] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][302] ([Intel XE#8714]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-2/igt@xe_pm@d3cold-mocs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][303] ([Intel XE#8714]) -> [SKIP][304] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_pm@d3hot-i2c.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][305] ([Intel XE#8714]) -> [SKIP][306] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][307] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][308] ([Intel XE#8714]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][309] ([Intel XE#8714]) -> [SKIP][310] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][311] ([Intel XE#8714]) -> [SKIP][312] ([Intel XE#944])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][313] ([Intel XE#944]) -> [SKIP][314] ([Intel XE#8714]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][315] ([Intel XE#5545]) -> [SKIP][316] ([Intel XE#8714])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9034/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9034 -> IGTPW_15613
  * Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -> xe-5511-374d957e1908042c257b8c239974317bb93b83dc

  IGTPW_15613: 15613
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd
  xe-5511-374d957e1908042c257b8c239974317bb93b83dc: 374d957e1908042c257b8c239974317bb93b83dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/index.html

--===============4481215509503730222==
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
<tr><td><b>Series:</b></td><td>tools/xe-perf-recorder: expose some OA strea=
m open properties (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171150/">https://patchwork.freedesktop.org/series/171150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15613/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15613/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9034_FULL -&gt; XEIGTPW_15613_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15613_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@core_getversion@basic.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt=
@core_getversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@fbdev@=
nullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/i=
gt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-g=
reen-only@pipe-b-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-g=
reen-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue-userptr-invalid=
ate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_basic@once-bindexecqueue-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +754 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@x=
e_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-b=
mg-10/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@fbdev@unaligned-read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/sh=
ard-bmg-8/igt@fbdev@unaligned-read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15613/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5613/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +712 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard=
-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_evict@evict-be=
ng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_module_load@reload-no-display.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15613/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a></=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_atomic_tran=
sition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Int=
el XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15613/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15613/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15613/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">=
Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15613/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
610">Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7387">Intel XE#7387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_156=
13/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel =
XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target=
-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_bw@connected-linea=
r-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-1920x1080=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-=
target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-target-3840x2160=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-ta=
rget-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15613/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">=
Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled=
-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2652">Intel XE#2652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15613/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449"=
>Intel XE#7449</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15613/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15613/shard-bmg-9/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">=
Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15613/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358"=
>Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-ctm3=
x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15613/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6507">Intel XE#6507</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15613/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-onl=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6969">Intel XE#6969</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_content_protection@at=
omic-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15613/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-suspend-re=
sume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-res=
ume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_content_protection@dp-mst-=
type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15613/shard-bmg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_content_protection@lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15613/shard-bmg-9/igt@kms_content_protection@lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Inte=
l XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@kms_content_protection@suspend-resume.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">=
Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_content_prot=
ection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">=
Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15613/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321=
">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_cursor_crc@cursor-onscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15613/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320=
">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15613/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
21">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571=
">Intel XE#7571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15613/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE=
#4210</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7467">Intel XE#7467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15613/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5870">Intel XE#5870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel X=
E#8265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15613/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15613/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-di=
rty-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-t=
ests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_fbc_dirty_r=
ect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard=
-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard=
-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_feature_discovery@display-4x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel=
 XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7344">Intel XE#7344</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_feature_discovery@display-4x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15613/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-l=
inear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_flip_scaled_cr=
c@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-9/igt@kms_flip_scaled=
_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351"=
>Intel XE#7351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_flip_sca=
led_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel X=
E#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +68 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-=
render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuff=
er_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_frontbuffer_track=
ing@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">=
Intel XE#2352</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7399">Intel XE#7399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdr=
rshdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7399">Intel XE#7399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@kms_frontbuffer_tracking@f=
bchdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +60 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15613/shard-bmg-10/igt@kms_frontbuffer_tracking@=
fbcpsr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_15613/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +6=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6=
901</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5613/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">In=
tel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7466">Intel XE#7466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15613/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE=
#4298</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15613/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#69=
11</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/737=
8">Intel XE#7378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15613/shard-bmg-8/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7591">Intel XE#7591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifi=
er-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane@pixel=
-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-sour=
ce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_plane@pixel-format=
-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_156=
13/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2=
393</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5613/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel X=
E#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7377">Intel XE#7377</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15613/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE=
#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5613/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348"=
>Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_plane_scaling@plan=
es-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15613/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
38">Intel XE#2938</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">In=
tel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel X=
E#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8396">Intel XE#8396</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel=
 XE#6927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15613/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard=
-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/sh=
ard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Int=
el XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-=
exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_psr2_sf@fbc-pr=
-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15613/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-updat=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel=
 XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7429">Intel XE#7429</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
613/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Inte=
l XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15613/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1561=
3/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15613/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_rotation_crc@pri=
mary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_rotation_crc@pr=
imary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15613/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
5">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8695">Intel XE#8695</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_setmode@invalid-clone-e=
xclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-10/igt@kms_sharpness_filter@filter-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Int=
el XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15613/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Int=
el XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15613/shard-bmg-8/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE=
#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15613/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@kms_tiled_displa=
y@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15613/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2=
450</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
57">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shar=
d-bmg-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#74=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
613/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shar=
d-bmg-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-b=
mg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#659=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_156=
13/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504"=
>Intel XE#2504</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7319">Intel XE#7319</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7350">Intel XE#7350</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_create@multi=
gpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_evict@evict-small-external-multi-q=
ueue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8370">Intel XE#8370</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
70">Intel XE#8370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15613/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priorit=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@x=
e_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15613/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7372">Intel XE#7372</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8374">Intel XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_fault_mode@many-exe=
cqueues-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-5/igt@xe_exec_fault_mode@tw=
ice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userp=
tr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_exec_multi_queue@=
few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +30 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8364">Intel XE#8364</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_multi_queue@one-q=
ueue-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-second=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15613/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-c=
at-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@xe_exec_reset@multi-queue-close-execqueues.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
369">Intel XE#8369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execque=
ues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-3/igt@xe_exec_threads@threads-m=
ulti-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared=
-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_exec_threads=
@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp=
_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-9/igt@xe_fault_injection=
@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel=
 XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-2/igt@xe_fault_injecti=
on@inject-fault-probe-function-xe_ggtt_init_early.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6964">Intel XE#6964</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_multigpu_svm@mgpu-co=
ncurrent-access-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6964">Intel XE#6964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-ac=
cess-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7=
793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5613/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
613/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15613/shard-bmg-3/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590=
">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/s=
hard-bmg-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel =
XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_peer2peer@read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shar=
d-bmg-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-2/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel =
XE#7370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15613/shard-bmg-7/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15613/shard-b=
mg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#740=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5613/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Inte=
l XE#7329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15613/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bi=
nd-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15613/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-p=
ost-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15613/shard-bmg-8/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#=
944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
4">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15613/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9034/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">=
Intel XE#5545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15613/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9034 -&gt; IGTPW_15613</li>
<li>Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -&gt; xe-5511-3=
74d957e1908042c257b8c239974317bb93b83dc</li>
</ul>
<p>IGTPW_15613: 15613<br />
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9de=
f49b752b509dfd5fd<br />
  xe-5511-374d957e1908042c257b8c239974317bb93b83dc: 374d957e1908042c257b8c2=
39974317bb93b83dc</p>

</body>
</html>

--===============4481215509503730222==--

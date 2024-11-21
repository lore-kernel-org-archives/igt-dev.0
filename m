Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A01D75BB7
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 04:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F32010E86D;
	Thu, 21 Nov 2024 04:39:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80BF10E86D;
 Thu, 21 Nov 2024 04:39:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_runner=3A_Allow_limits_at_?=
 =?utf-8?q?dumping_dmesg_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 04:39:38 -0000
Message-ID: <173216397883.983405.12794527292017870791@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
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

== Series Details ==

Series: runner: Allow limits at dumping dmesg (rev2)
URL   : https://patchwork.freedesktop.org/series/140182/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12151_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12151_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12151_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12151_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_plane_multiple@tiling-none@pipe-a-dp-2:
    - shard-bmg:          [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_plane_multiple@tiling-none@pipe-a-dp-2.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_plane_multiple@tiling-none@pipe-a-dp-2.html

  * igt@kms_properties@plane-properties-atomic@pipe-a-edp-1:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_properties@plane-properties-atomic@pipe-a-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_properties@plane-properties-atomic@pipe-a-edp-1.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] +5 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-basic:
    - shard-lnl:          [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_exec_threads@threads-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][18] +1 other test dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#2136]) -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_feature_discovery@display-2x.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_feature_discovery@display-2x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][23] ([Intel XE#2333]) -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#2136]) -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][27] ([Intel XE#3374]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][29] ([Intel XE#2136]) -> [FAIL][30] +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_module_load@reload.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][31] ([Intel XE#1130]) -> [CRASH][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_tlb@basic-tlb.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@large-split-binds-4194304:
    - shard-dg2-set2:     [SKIP][33] ([Intel XE#1130]) -> [DMESG-WARN][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_vm@large-split-binds-4194304.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_vm@large-split-binds-4194304.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12151_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1885])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#3130] / [Intel XE#3249])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#2134]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@fbdev@write.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3279])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][41] ([Intel XE#2613]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1407])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#2136]) +37 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#3468]) +29 other tests dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2327]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1124]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1124]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1124]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2191]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2314] / [Intel XE#2894])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#367])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#367]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#787]) +132 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2887]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2887]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][61] ([Intel XE#3468]) +1 other test dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][62] ([Intel XE#3468])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1152]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#373]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#373])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2252]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#3278])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#307])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#1178]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#308])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1424])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2320]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2321])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#2577] / [Intel XE#3106]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2291]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#309]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][79] ([Intel XE#3468] / [Intel XE#877])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#2291]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#2705] / [Intel XE#3468])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1508])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1340])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#3070])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2244]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2244])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#2423] / [i915#2575]) +104 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_feature_discovery@display.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_feature_discovery@display.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1138])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1138])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [PASS][93] -> [FAIL][94] ([Intel XE#2882])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][95] -> [DMESG-WARN][96] ([Intel XE#3468]) +125 other tests dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][97] -> [FAIL][98] ([Intel XE#3321] / [Intel XE#3487])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1421]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2316]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2316])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#886]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1397] / [Intel XE#1745])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1397])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2380]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#455]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1401]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2293]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#651]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#651]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][116] ([Intel XE#2333]) +5 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][117] ([Intel XE#3468]) +5 other tests dmesg-fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2311]) +16 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#656]) +20 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2352])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2313]) +13 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#653]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2312]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#658])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1503])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][126] -> [DMESG-WARN][127] ([Intel XE#3468]) +2 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2423] / [i915#2575]) +33 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][129] -> [INCOMPLETE][130] ([Intel XE#3468]) +4 other tests incomplete
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-dg2-set2:     [PASS][131] -> [INCOMPLETE][132] ([Intel XE#1035] / [Intel XE#3468]) +1 other test incomplete
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][133] ([Intel XE#3468]) +20 other tests dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2763]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2763]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2763]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][138] -> [FAIL][139] ([Intel XE#718])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#2446]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1439] / [Intel XE#3141])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][143] -> [DMESG-WARN][144] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#2893]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#1489]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2387]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1128])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2136]) +31 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1406]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#3414]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#3414]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2330])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-bmg:          [PASS][156] -> [FAIL][157] ([Intel XE#899]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][158] -> [FAIL][159] ([Intel XE#2159]) +1 other test fail
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1499])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#756]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#756])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][163] -> [SKIP][164] ([Intel XE#2423]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@testdisplay.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1123])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-lnl:          [PASS][166] -> [DMESG-WARN][167] ([Intel XE#3514]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2905]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2905]) +6 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#2905])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][171] ([Intel XE#1473])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
    - shard-bmg:          NOTRUN -> [TIMEOUT][172] ([Intel XE#1473])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][173] -> [INCOMPLETE][174] ([Intel XE#1473] / [Intel XE#3468])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#688]) +4 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#1130]) +62 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2322]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#1392]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][179] -> [SKIP][180] ([Intel XE#1130]) +185 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#1727])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][183] ([Intel XE#1727])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#288])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [PASS][185] -> [DMESG-WARN][186] ([Intel XE#3467] / [Intel XE#3468])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][187] -> [DMESG-WARN][188] ([Intel XE#3467]) +1 other test dmesg-warn
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][189] -> [SKIP][190] ([Intel XE#1192])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][191] ([Intel XE#1999]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2457])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][193] -> [DMESG-WARN][194] ([Intel XE#3467])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_module_load@unload.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_module_load@unload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [PASS][195] -> [FAIL][196] ([Intel XE#2249])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][197] ([Intel XE#2249])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          [PASS][198] -> [FAIL][199] ([Intel XE#2514]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#2541]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2248])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][202] ([Intel XE#1173])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#2284] / [Intel XE#366])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2284])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][205] -> [DMESG-FAIL][206] ([Intel XE#1727] / [Intel XE#3468])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_pm@s3-mocs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][207] -> [ABORT][208] ([Intel XE#1794])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][209] -> [ABORT][210] ([Intel XE#1607] / [Intel XE#1794])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [PASS][211] -> [DMESG-WARN][212] ([Intel XE#2280] / [Intel XE#3468])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#584])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_prime_self_import@export-vs-gem_close-race:
    - shard-lnl:          [PASS][214] -> [DMESG-WARN][215] ([Intel XE#3466])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_prime_self_import@export-vs-gem_close-race.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@xe_prime_self_import@export-vs-gem_close-race.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#944]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#3342])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_tlb@basic-tlb:
    - shard-bmg:          [PASS][218] -> [CRASH][219] ([Intel XE#3212])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_tlb@basic-tlb.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][220] ([Intel XE#2919])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][221] ([Intel XE#2919])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][222] ([Intel XE#3421])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#3521]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1885]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#3453]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2134]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@fbdev@nullptr.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@fbdev@nullptr.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2423] / [i915#2575]) -> [PASS][232] +88 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][233] ([Intel XE#2613]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136]) -> [PASS][236] +26 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-FAIL][237] ([Intel XE#3468]) -> [PASS][238] +23 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][239] ([Intel XE#3466]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][241] ([Intel XE#2705]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][243] ([Intel XE#1475]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][245] ([Intel XE#301]) -> [PASS][246] +5 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][247] ([Intel XE#2597]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][249] ([Intel XE#3468]) -> [PASS][250] +128 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][251] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][253] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - shard-lnl:          [FAIL][255] ([Intel XE#886]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][258] +9 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][259] ([Intel XE#3466]) -> [PASS][260] +35 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-8/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][261] ([Intel XE#2566]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][263] ([Intel XE#718]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][265] ([Intel XE#3468]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2446]) -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][269] ([Intel XE#2864]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][271] ([Intel XE#2042]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-dg2-set2:     [DMESG-WARN][273] ([Intel XE#3468]) -> [PASS][274] +5 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [FAIL][275] ([Intel XE#3536]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][277] ([Intel XE#899]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][279] ([Intel XE#1727]) -> [PASS][280] +2 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][281] -> [PASS][282] +2 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1130]) -> [PASS][284] +160 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-lnl:          [DMESG-FAIL][285] ([Intel XE#3466]) -> [PASS][286] +4 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][287] ([Intel XE#3371]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][289] ([Intel XE#3467]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][291] ([Intel XE#2998]) -> [PASS][292] +1 other test pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][293] ([Intel XE#1192]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][295] ([Intel XE#569]) -> [PASS][296] +1 other test pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
    - shard-dg2-set2:     [DMESG-WARN][297] ([Intel XE#569]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][299] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][301] ([Intel XE#1727]) -> [PASS][302] +1 other test pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [DMESG-WARN][303] ([Intel XE#1727]) -> [PASS][304] +7 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
    - shard-dg2-set2:     [DMESG-WARN][305] ([Intel XE#1727]) -> [PASS][306] +4 other tests pass
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][307] ([Intel XE#3521]) -> [SKIP][308] ([Intel XE#1885])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2423] / [i915#2575]) -> [SKIP][310] ([Intel XE#623])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#873])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#316]) -> [SKIP][314] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][316] ([Intel XE#316])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#316]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#316]) -> [SKIP][320] ([Intel XE#2136]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136]) -> [SKIP][322] ([Intel XE#610]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][324] ([Intel XE#1124]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][326] ([Intel XE#619]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#607])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#1124]) +7 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1124]) -> [SKIP][332] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1124]) -> [SKIP][334] ([Intel XE#2136]) +13 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#2191]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2191]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#367]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [SKIP][342] ([Intel XE#367]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2907]) -> [SKIP][344] ([Intel XE#2136])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][346] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][348] ([Intel XE#2136]) +13 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#3442]) -> [SKIP][350] ([Intel XE#2136])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#2907]) +4 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][353] ([Intel XE#616]) -> [SKIP][354] ([Intel XE#2136])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][356] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136]) -> [SKIP][358] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][360] ([Intel XE#314])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#306]) -> [SKIP][362] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2423] / [i915#2575]) -> [SKIP][364] ([Intel XE#306]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#373]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2423] / [i915#2575]) -> [SKIP][368] ([Intel XE#373]) +12 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][369] ([Intel XE#1178]) -> [SKIP][370] ([Intel XE#2341])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_content_protection@atomic.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#307])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#307]) -> [SKIP][374] ([Intel XE#2423] / [i915#2575])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2423] / [i915#2575]) -> [SKIP][376] ([Intel XE#308])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#308]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2423] / [i915#2575]) -> [SKIP][380] ([Intel XE#455]) +7 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][381] ([Intel XE#1195] / [Intel XE#3226]) -> [SKIP][382] ([Intel XE#2423] / [i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2423] / [i915#2575]) -> [SKIP][384] ([Intel XE#323])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#323]) -> [SKIP][386] ([Intel XE#2423] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][387] ([Intel XE#877]) -> [SKIP][388] ([Intel XE#2291])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][389] ([Intel XE#2141]) -> [DMESG-FAIL][390] ([Intel XE#3468]) +1 other test dmesg-fail
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [DMESG-FAIL][391] ([Intel XE#3468]) -> [FAIL][392] ([Intel XE#1695])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#776]) -> [SKIP][394] ([Intel XE#2136])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2423] / [i915#2575]) -> [SKIP][396] ([Intel XE#703])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][397] ([Intel XE#2882]) -> [DMESG-WARN][398] ([Intel XE#3468])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][399] ([Intel XE#3321] / [Intel XE#3486]) -> [DMESG-WARN][400] ([Intel XE#3468])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][401] ([Intel XE#1727]) -> [SKIP][402] ([Intel XE#2423] / [i915#2575])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][403] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][404] ([Intel XE#2136])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][405] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][406] ([Intel XE#2136] / [Intel XE#2351])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#455]) +7 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#455]) -> [SKIP][410] ([Intel XE#2136] / [Intel XE#2351])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][412] ([Intel XE#455])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#455]) -> [SKIP][414] ([Intel XE#2136]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][415] ([i915#5274]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][418] ([Intel XE#651]) +8 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][419] ([Intel XE#2311]) -> [SKIP][420] ([Intel XE#2312]) +14 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136]) -> [SKIP][422] ([Intel XE#651]) +28 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#651]) -> [SKIP][424] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][425] ([Intel XE#2333]) -> [DMESG-FAIL][426] ([Intel XE#3468]) +8 other tests dmesg-fail
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][427] ([Intel XE#2333]) -> [INCOMPLETE][428] ([Intel XE#3468])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [INCOMPLETE][429] ([Intel XE#1195]) -> [SKIP][430] ([Intel XE#2136])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-bmg:          [INCOMPLETE][431] ([Intel XE#3468]) -> [FAIL][432] ([Intel XE#2333])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [DMESG-FAIL][433] ([Intel XE#3468]) -> [SKIP][434] ([Intel XE#2312])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][435] ([Intel XE#3468]) -> [FAIL][436] ([Intel XE#2333]) +7 other tests fail
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [INCOMPLETE][437] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][438] ([Intel XE#2136])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][439] ([Intel XE#2333]) -> [SKIP][440] ([Intel XE#2312]) +3 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2136]) -> [INCOMPLETE][442] ([Intel XE#3468]) +1 other test incomplete
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#658]) -> [SKIP][444] ([Intel XE#2136] / [Intel XE#2351])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#651]) -> [SKIP][446] ([Intel XE#2136]) +28 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#653]) +30 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][449] ([Intel XE#2313]) -> [SKIP][450] ([Intel XE#2312]) +11 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][452] ([Intel XE#653]) +5 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#653]) -> [SKIP][454] ([Intel XE#2136]) +27 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#653]) -> [SKIP][456] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#605]) -> [SKIP][458] ([Intel XE#2423] / [i915#2575])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#455]) -> [SKIP][460] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#2927])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2136]) -> [SKIP][464] ([Intel XE#346])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2925]) -> [SKIP][466] ([Intel XE#2136])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][467] ([Intel XE#616]) -> [SKIP][468] ([Intel XE#2423] / [i915#2575])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2423] / [i915#2575]) -> [SKIP][472] ([Intel XE#2763] / [Intel XE#455])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#870]) -> [SKIP][474] ([Intel XE#2136])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2136]) -> [SKIP][476] ([Intel XE#870])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2938]) -> [SKIP][478] ([Intel XE#2136])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][480] ([Intel XE#908])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2136]) -> [SKIP][482] ([Intel XE#908])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2446]) -> [ABORT][484] ([Intel XE#3468])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [ABORT][485] ([Intel XE#3468]) -> [SKIP][486] ([Intel XE#2446]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#2136]) -> [SKIP][488] ([Intel XE#1489]) +11 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1489]) -> [SKIP][490] ([Intel XE#2136]) +10 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1122]) -> [SKIP][492] ([Intel XE#2136])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][494] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-blt.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2136]) -> [SKIP][496] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][498] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr@pr-dpms.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#2351]) -> [SKIP][500] ([Intel XE#2850] / [Intel XE#929])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][502] ([Intel XE#2351])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][504] ([Intel XE#2136]) +14 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#3414]) -> [SKIP][506] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2423] / [i915#2575]) -> [SKIP][508] ([Intel XE#1127])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1127]) -> [SKIP][510] ([Intel XE#2423] / [i915#2575])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#2423] / [i915#2575]) -> [SKIP][512] ([Intel XE#3414]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2423] / [i915#2575]) -> [SKIP][514] ([Intel XE#2168]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_vrr@lobf.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#2423] / [i915#2575]) -> [SKIP][516] ([Intel XE#756])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#756]) -> [SKIP][518] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#2423] / [i915#2575]) -> [SKIP][520] ([Intel XE#1091] / [Intel XE#2849])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][522] ([Intel XE#1130]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#1123])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1130]) -> [SKIP][526] ([Intel XE#1126])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2905]) -> [SKIP][528] ([Intel XE#1130]) +15 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][529] ([Intel XE#1600]) -> [SKIP][530] ([Intel XE#1130])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1130]) -> [FAIL][532] ([Intel XE#1600])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][533] ([Intel XE#1473]) -> [SKIP][534] ([Intel XE#1130])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [INCOMPLETE][535] ([Intel XE#1195]) -> [SKIP][536] ([Intel XE#1130])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [DMESG-WARN][537] ([Intel XE#1727]) -> [SKIP][538] ([Intel XE#1130]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_exec_basic@twice-userptr.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#288]) -> [SKIP][540] ([Intel XE#1130]) +33 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1130]) -> [SKIP][542] ([Intel XE#288]) +30 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-imm.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1130]) -> [SKIP][544] ([Intel XE#2360])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#1130]) -> [SKIP][546] ([Intel XE#2905]) +13 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][547] ([Intel XE#3467]) -> [SKIP][548] ([Intel XE#1130]) +4 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130]) -> [DMESG-WARN][550] ([Intel XE#3467]) +1 other test dmesg-warn
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-dg2-set2:     [DMESG-WARN][551] ([Intel XE#3343]) -> [SKIP][552] ([Intel XE#1130])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][553] ([Intel XE#3343]) -> [DMESG-WARN][554] ([Intel XE#3343] / [Intel XE#3468])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][555] ([Intel XE#3467]) -> [FAIL][556] ([Intel XE#3499] / [Intel XE#3539])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][557] ([Intel XE#3499]) -> [DMESG-FAIL][558] ([Intel XE#3467])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][559] ([Intel XE#3499]) -> [FAIL][560] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [FAIL][561] ([Intel XE#3499]) -> [FAIL][562] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][563] ([Intel XE#3467]) -> [DMESG-WARN][564] ([Intel XE#3467] / [Intel XE#3468]) +3 other tests dmesg-warn
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          [DMESG-FAIL][565] ([Intel XE#3466]) -> [SKIP][566] ([Intel XE#1192])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#1192]) -> [FAIL][568] ([Intel XE#1999])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#1130]) -> [SKIP][570] ([Intel XE#560])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#2541]) -> [SKIP][572] ([Intel XE#1130]) +7 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1130]) -> [SKIP][574] ([Intel XE#2541]) +7 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1337]) -> [SKIP][576] ([Intel XE#1130])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1061]) -> [FAIL][578] ([Intel XE#1173])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_peer2peer@read.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][579] ([Intel XE#1173]) -> [SKIP][580] ([Intel XE#1061])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_peer2peer@write.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#1130]) -> [SKIP][582] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-FAIL][583] ([Intel XE#3468]) -> [DMESG-WARN][584] ([Intel XE#3468])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#1130]) -> [DMESG-WARN][586] ([Intel XE#3468] / [Intel XE#569])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@s3-basic.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][587] ([Intel XE#569]) -> [SKIP][588] ([Intel XE#1130])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][590] ([Intel XE#1130])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#579]) -> [SKIP][592] ([Intel XE#1130])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1130]) -> [SKIP][594] ([Intel XE#944]) +2 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#944]) -> [SKIP][596] ([Intel XE#1130]) +2 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#3342]) -> [SKIP][598] ([Intel XE#1130])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3536
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
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
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12151
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99

  IGTPW_12151: 12151
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99: 0cb17ecec562c61d45997a2fced4e5ed99b31f99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12151/index.html

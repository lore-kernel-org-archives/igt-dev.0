Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51479CD4851
	for <igt-dev@archiver.kernel.org>; Sat, 16 May 2026 00:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE5210E463;
	Sat, 16 May 2026 00:09:55 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0146010E463;
 Sat, 16 May 2026 00:09:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2169147799800141970=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/chamelium/kms=5Fcham?=
 =?utf-8?q?elium=5Faudio=3A_Add_suspend/resume_audio_tests_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 16 May 2026 00:09:37 -0000
Message-ID: <177889017799.75062.8164590530958791221@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515062733.732263-1-jeevan.b@intel.com>
In-Reply-To: <20260515062733.732263-1-jeevan.b@intel.com>
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

--===============2169147799800141970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium/kms_chamelium_audio: Add suspend/resume audio tests (rev4)
URL   : https://patchwork.freedesktop.org/series/166012/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8914_FULL -> XEIGTPW_15188_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15188_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15188_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15188_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_audio@dp-audio-after-suspend (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - shard-lnl:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_pmu@gt-frequency:
    - shard-bmg:          [PASS][7] -> [WARN][8] +1 other test warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-7/igt@xe_pmu@gt-frequency.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@xe_pmu@gt-frequency.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-bmg:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@xe_sriov_vram@vf-access-after-resize-down.html

  
New tests
---------

  New tests have been introduced between XEIGT_8914_FULL and XEIGTPW_15188_FULL:

### New IGT tests (2) ###

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15188_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2328] / [Intel XE#7367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1467] / [Intel XE#7367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2390] / [Intel XE#6974])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2244])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1421])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7179])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7351])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +15 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7399])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7905]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7061])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +24 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7865]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#7308])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#7915]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6901])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7591])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#599])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2393])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#7340])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2893] / [Intel XE#7304])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1489]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2387] / [Intel XE#7429])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1128] / [Intel XE#7413])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#3904] / [Intel XE#7342])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2413])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6503])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1499])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2142]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6599])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7636]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7636])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7140])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7482])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1392]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7136])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7136]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6874]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#6874]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7866])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#7956])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-1/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#7850])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7138])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7138]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7793])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-2/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7599])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4733] / [Intel XE#7417])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-down.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-bmg:          [INCOMPLETE][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][88] ([Intel XE#301]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][90] ([Intel XE#5208]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][92] -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][94] ([Intel XE#7850]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise:
    - shard-bmg:          [ABORT][96] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7893] / [Intel XE#7909]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise.html

  
#### Warnings ####

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          [ABORT][98] -> [SKIP][99] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          [ABORT][100] -> [SKIP][101] ([Intel XE#4608])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7909
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956


Build changes
-------------

  * IGT: IGT_8914 -> IGTPW_15188
  * Linux: xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035 -> xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b

  IGTPW_15188: 15188
  IGT_8914: 8914
  xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035: 2edbd77a2045d12d30c95dbb5842b831e3da0035
  xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b: b9819223b7e92173091b674c2212252b99ea6c4b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/index.html

--===============2169147799800141970==
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
<tr><td><b>Series:</b></td><td>tests/chamelium/kms_chamelium_audio: Add suspend/resume audio tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166012/">https://patchwork.freedesktop.org/series/166012/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8914_FULL -&gt; XEIGTPW_15188_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15188_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15188_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15188_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-7/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@xe_pmu@gt-frequency.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@xe_sriov_vram@vf-access-after-resize-down.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8914_FULL and XEIGTPW_15188_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15188_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-7/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-1/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-2/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-10/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-down.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-7/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7909">Intel XE#7909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-madvise.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8914/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15188/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8914 -&gt; IGTPW_15188</li>
<li>Linux: xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035 -&gt; xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b</li>
</ul>
<p>IGTPW_15188: 15188<br />
  IGT_8914: 8914<br />
  xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035: 2edbd77a2045d12d30c95dbb5842b831e3da0035<br />
  xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b: b9819223b7e92173091b674c2212252b99ea6c4b</p>

</body>
</html>

--===============2169147799800141970==--

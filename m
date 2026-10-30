Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F1606A335
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 20:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1610E0F8;
	Fri, 30 Oct 2026 20:08:35 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78A510E0F8;
 Fri, 30 Oct 2026 20:07:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8240895543294862779=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_reuse_pre-existing_configfs_group_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Oct 2026 20:07:41 -0000
Message-ID: <179339086186.95929.6979503237068149621@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030061440.2342301-2-sk.anirban@intel.com>
In-Reply-To: <20261030061440.2342301-2-sk.anirban@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8240895543294862779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: reuse pre-existing configfs group (rev3)
URL   : https://patchwork.freedesktop.org/series/171501/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9171_FULL -> XEIGTPW_16077_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_9171_FULL and XEIGTPW_16077_FULL:

### New IGT tests (3) ###

  * igt@xe_pm_residency@cpg-basic:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.02, 6.72] s

  * igt@xe_pm_residency@cpg-gt-toggle:
    - Statuses : 3 pass(s)
    - Exec time: [1.05, 1.06] s

  * igt@xe_sriov_flr@flr-each-isolation:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 25.12] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16077_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#8583])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5808]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5822]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7358])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#6969]) +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#3304] / [Intel XE#7374])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@srm:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7642])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5846])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#9522])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#656] / [Intel XE#7905]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7061] / [Intel XE#7356])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4141])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#6312]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#7061])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7905]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5812]) +11 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#7865]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7061])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#9312])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#7304])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#7345])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2234] / [Intel XE#2850])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-5/igt@kms_psr@pr-suspend.html
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#1406])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#5821])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#8618]) +4 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-10/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [FAIL][57] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#6540] / [Intel XE#688])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#5764])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-3/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7482]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7482]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5575] / [Intel XE#7484])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2322] / [Intel XE#7372])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#8374])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#8374])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#8364]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-5/igt@xe_exec_multi_queue@few-execs-close-fd-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#8364]) +8 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8364]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_reset@gt-stress-reset-pm-transition:
    - shard-ptl:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#8652])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-pm-transition.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-pm-transition.html

  * igt@xe_exec_system_allocator@fault-process-same-page-benchmark:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#7850])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-2/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#8378]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [PASS][74] -> [ABORT][75] ([Intel XE#6652] / [Intel XE#9470])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7954])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#6964])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-8/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6964])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@random:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7793])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@xe_page_reclaim@random.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][81] -> [ABORT][82] ([Intel XE#9362])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [PASS][83] -> [ABORT][84] ([Intel XE#9362])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#9254]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_query@multigpu-query-config.html
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#6019])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][89] -> [FAIL][90] ([Intel XE#6569])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [FAIL][92] ([Intel XE#8628]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][94] ([Intel XE#367]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - shard-bmg:          [FAIL][96] ([Intel XE#3098]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [FAIL][98] ([Intel XE#9313]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          [SKIP][100] ([Intel XE#7308]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-3/igt@kms_hdmi_inject@inject-audio.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_hdmi_inject@inject-audio.html
    - shard-bmg:          [SKIP][102] ([Intel XE#7308]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][104] ([Intel XE#7727]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-7/igt@xe_pm@s4-mocs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [ABORT][106] ([Intel XE#9362]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-2/igt@xe_pm@s4-multiple-execs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][108] ([Intel XE#9362]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][110] ([Intel XE#6569]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][112] ([Intel XE#9346]) -> [FAIL][113] ([Intel XE#9319] / [Intel XE#9346])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][114] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][115] ([Intel XE#3544])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470
  [Intel XE#9522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9522


Build changes
-------------

  * IGT: IGT_9171 -> IGTPW_16077
  * Linux: xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 -> xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b

  IGTPW_16077: 16077
  IGT_9171: 9171
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355
  xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b: d8a353e238652bec29fd452babdaae0044d30b9b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/index.html

--===============8240895543294862779==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: reuse pre-existing configfs group (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171501/">https://patchwork.freedesktop.org/series/171501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9171_FULL -&gt; XEIGTPW_16077_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9171_FULL and XEIGTPW_16077_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.02, 6.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-gt-toggle:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.05, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 25.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16077_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-6/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9522">Intel XE#9522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-5/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-10/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-3/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@xe_exec_balancer@once-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-5/igt@xe_exec_multi_queue@few-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-pm-transition:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-pm-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-pm-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-process-same-page-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-2/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470">Intel XE#9470</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-8/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-3/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-4/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-7/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-7/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-ptl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-ptl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9171/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16077/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9171 -&gt; IGTPW_16077</li>
<li>Linux: xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 -&gt; xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b</li>
</ul>
<p>IGTPW_16077: 16077<br />
  IGT_9171: 9171<br />
  xe-6031-e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355<br />
  xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b: d8a353e238652bec29fd452babdaae0044d30b9b</p>

</body>
</html>

--===============8240895543294862779==--

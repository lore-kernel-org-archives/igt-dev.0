Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B24C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 15:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3190910E855;
	Wed, 22 May 2024 15:17:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64F710E855;
 Wed, 22 May 2024 15:17:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2862967812554733873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe=5Ftlb=3A_Check?=
 =?utf-8?q?_TLB_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 May 2024 15:17:35 -0000
Message-ID: <171639105579.2167033.13322590605788653899@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
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

--===============2862967812554733873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_tlb: Check TLB invalidation
URL   : https://patchwork.freedesktop.org/series/133911/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7867_full -> XEIGTPW_11176_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11176_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11176_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11176_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +5 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@unused-offsets:
    - {shard-lnl}:        [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-1/igt@kms_addfb_basic@unused-offsets.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - {shard-lnl}:        [PASS][5] -> [ABORT][6] +3 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - {shard-lnl}:        NOTRUN -> [ABORT][7] +2 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-small-cm:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-3/igt@xe_evict@evict-beng-small-cm.html

  
New tests
---------

  New tests have been introduced between XEIGT_7867_full and XEIGTPW_11176_full:

### New IGT tests (1) ###

  * igt@xe_tlb@basic-tlb:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11176_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#623])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@unused-offsets:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#1201] / [i915#6077])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_addfb_basic@unused-offsets.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1201] / [Intel XE#1226]) +16 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +13 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#1252])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][25] ([Intel XE#1850])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][26] ([Intel XE#1713])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1178]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [PASS][34] -> [FAIL][35] ([Intel XE#581])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][36] ([Intel XE#282]) +2 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][37] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#282]) +1 other test dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#701])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#703])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#651]) +24 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#653]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#417])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_lease@lease-unleased-connector:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_lease@lease-unleased-connector.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][50] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][51] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][52] ([Intel XE#904] / [Intel XE#909])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][55] -> [DMESG-WARN][56] ([Intel XE#1214]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-hdmi-a-6.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1129] / [Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1122] / [Intel XE#1201])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#929]) +17 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#929])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#327]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][63] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#756])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1091] / [Intel XE#1201])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1050])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1123])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1123] / [Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#288]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#1045] / [Intel XE#1204])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][73] ([Intel XE#1214])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#979])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#1173]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@xe_peer2peer@write.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1162] / [Intel XE#1214]) +7 other tests dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][78] -> [DMESG-WARN][79] ([Intel XE#1162])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#579])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][82] ([Intel XE#1760])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [i915#6077]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_addfb_basic@unused-handle.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_addfb_basic@unused-handle.html
    - {shard-lnl}:        [SKIP][85] ([Intel XE#1661]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_addfb_basic@unused-handle.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][88] +5 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-lnl}:        [FAIL][89] ([Intel XE#1659]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - {shard-lnl}:        [SKIP][91] ([Intel XE#1733]) -> [PASS][92] +6 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-dg2-set2:     [ABORT][93] -> [PASS][94] +5 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][95] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#282]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][101] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][102] +6 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201]) -> [PASS][104] +7 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        [DMESG-WARN][105] ([Intel XE#1830]) -> [PASS][106] +3 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][107] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#1235]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - {shard-lnl}:        [SKIP][111] ([Intel XE#1646] / [Intel XE#1650]) -> [PASS][112] +2 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - {shard-lnl}:        [SKIP][113] ([Intel XE#1134]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_universal_plane@disable-primary-vs-flip:
    - {shard-lnl}:        [SKIP][115] ([Intel XE#829]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_universal_plane@disable-primary-vs-flip.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-8/igt@kms_universal_plane@disable-primary-vs-flip.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][117] ([Intel XE#1600]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-cm:
    - shard-dg2-set2:     [INCOMPLETE][119] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@xe_evict@evict-small-cm.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@many-basic-imm:
    - {shard-lnl}:        [SKIP][121] ([Intel XE#1699]) -> [PASS][122] +8 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@xe_exec_fault_mode@many-basic-imm.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-2/igt@xe_exec_fault_mode@many-basic-imm.html

  * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
    - shard-dg2-set2:     [ABORT][123] ([Intel XE#1908]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html

  * igt@xe_pat@prime-self-import-coh:
    - {shard-lnl}:        [SKIP][125] ([Intel XE#1130] / [Intel XE#1699]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@xe_pat@prime-self-import-coh.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@xe_pat@prime-self-import-coh.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [ABORT][127] ([Intel XE#1358]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][129] ([Intel XE#1081]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-7/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html

  * igt@xe_wedged@wedged-mode-toggle:
    - {shard-lnl}:        [ABORT][131] ([Intel XE#1441] / [Intel XE#1620] / [Intel XE#1760]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [DMESG-FAIL][133] ([Intel XE#1548]) -> [ABORT][134] ([Intel XE#1548])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@core_hotunplug@hotreplug.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#1214]) -> [ABORT][136] ([Intel XE#1548])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#316]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#316])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][140] ([Intel XE#316])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1124]) -> [SKIP][142] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][144] ([Intel XE#607])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#829])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][148] ([Intel XE#1124]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][150] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#346])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#367])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][156] ([Intel XE#367]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#367]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#787]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][162] ([Intel XE#787]) +13 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][168] ([Intel XE#455] / [Intel XE#787])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][170] ([Intel XE#314]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#373]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#1226])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][176] ([Intel XE#373]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#373]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#1226])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#1226])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#308]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-dg2-set2:     [DMESG-WARN][183] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][184] ([Intel XE#282]) +5 other tests dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cursor_crc@cursor-random-256x256.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#323]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#323])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][187] ([Intel XE#282]) -> [DMESG-WARN][188] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1138]) -> [SKIP][190] ([Intel XE#1138] / [Intel XE#1201])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#1226])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][198] ([Intel XE#455]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#651]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#1226])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][204] ([Intel XE#651]) +9 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#651]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [ABORT][209] -> [SKIP][210] ([Intel XE#1201] / [Intel XE#651])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#653]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#1226])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][218] ([Intel XE#653]) +10 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#498]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][228] ([Intel XE#305]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][230] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#305]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][236] ([Intel XE#908])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][238] ([Intel XE#929]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#929]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201]) -> [SKIP][246] ([Intel XE#929])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_psr@psr2-cursor-plane-move.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#1226]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_psr@psr2-dpms.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][250] ([Intel XE#1149])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][252] ([Intel XE#327])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][254] ([Intel XE#1127])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#455]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][260] ([Intel XE#1123])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][261] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][262] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#288]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][266] ([Intel XE#288]) +7 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][268] ([Intel XE#977])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#979]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#979])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#944]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][274] ([Intel XE#944])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@xe_query@multigpu-query-invalid-size.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1441
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1661]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1661
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
  [Intel XE#1713]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1713
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1850
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7867 -> IGTPW_11176
  * Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd -> xe-1325-60d912720ac9462b1170ace7f05f8af68f898204

  IGTPW_11176: cd14824e69fdc760b7376f39619ca8de8147563e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd
  xe-1325-60d912720ac9462b1170ace7f05f8af68f898204: 60d912720ac9462b1170ace7f05f8af68f898204

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/index.html

--===============2862967812554733873==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_tlb: Check TLB invalidation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133911/">https://patchwork.freedesktop.org/series/133911/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7867_full -&gt; XEIGTPW_11176_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11176_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11176_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11176_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-1/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@kms_addfb_basic@unused-offsets.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-3/igt@xe_evict@evict-beng-small-cm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7867_full and XEIGTPW_11176_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_tlb@basic-tlb:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11176_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1850">Intel XE#1850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1713">Intel XE#1713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_lease@lease-unleased-connector.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_addfb_basic@unused-handle.html">PASS</a></li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1661">Intel XE#1661</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@kms_addfb_basic@unused-handle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733">Intel XE#1733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-128x42.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646">Intel XE#1646</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650">Intel XE#1650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-6/igt@kms_universal_plane@disable-primary-vs-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-8/igt@kms_universal_plane@disable-primary-vs-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@xe_evict@evict-small-cm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@xe_evict@evict-small-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@xe_exec_fault_mode@many-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-2/igt@xe_exec_fault_mode@many-basic-imm.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-8/igt@xe_pat@prime-self-import-coh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-4/igt@xe_pat@prime-self-import-coh.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-7/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1441">Intel XE#1441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@core_hotunplug@hotreplug.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-466/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11176/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7867 -&gt; IGTPW_11176</li>
<li>Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd -&gt; xe-1325-60d912720ac9462b1170ace7f05f8af68f898204</li>
</ul>
<p>IGTPW_11176: cd14824e69fdc760b7376f39619ca8de8147563e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd<br />
  xe-1325-60d912720ac9462b1170ace7f05f8af68f898204: 60d912720ac9462b1170ace7f05f8af68f898204</p>

</body>
</html>

--===============2862967812554733873==--

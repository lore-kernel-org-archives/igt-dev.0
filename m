Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87388CD98CF
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 19:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A13E10E5FD;
	Mon, 15 Jun 2026 19:26:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA8F10E5F0;
 Mon, 15 Jun 2026 19:26:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7790402454101036107=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_intel=5Fvbt=5Fdecode=3A_fa?=
 =?utf-8?q?ll_back_to_guessing_PCI_ID_from_VBT_signature_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Jun 2026 19:26:10 -0000
Message-ID: <178155157043.80369.4279646427673150742@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1781522896.git.jani.nikula@intel.com>
In-Reply-To: <cover.1781522896.git.jani.nikula@intel.com>
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

--===============7790402454101036107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_vbt_decode: fall back to guessing PCI ID from VBT signature (rev2)
URL   : https://patchwork.freedesktop.org/series/168428/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8964_FULL -> XEIGTPW_15368_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15368_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15368_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15368_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pmu@gt-frequency:
    - shard-bmg:          [PASS][1] -> [WARN][2] +1 other test warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-4/igt@xe_pmu@gt-frequency.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@xe_pmu@gt-frequency.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15368_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6507])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2320]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2321] / [Intel XE#7355])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1340] / [Intel XE#7435])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#8265]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4156] / [Intel XE#7425])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178] / [Intel XE#7351])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +10 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7061]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3544] / [Intel XE#7916])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7916]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#7915]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7915]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7283])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#7340] / [Intel XE#7504])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#7340])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1489]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3904] / [Intel XE#7342])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6503])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1499])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-6/igt@kms_vrr@flipline.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-5/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7636]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7136]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6874]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7138]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#5694] / [Intel XE#7370])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4733] / [Intel XE#7417])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#944])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][46] ([Intel XE#6078]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][48] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][50] ([Intel XE#301]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][52] ([Intel XE#7308]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][54] ([Intel XE#7340]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][56] ([Intel XE#8007]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          [SKIP][58] ([Intel XE#1424]) -> [ABORT][59] ([Intel XE#8007])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-6/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-bmg:          [SKIP][60] ([Intel XE#2320]) -> [ABORT][61] ([Intel XE#8007])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x10.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][62] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][63] ([Intel XE#1729] / [Intel XE#7424])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8964 -> IGTPW_15368

  IGTPW_15368: 15368
  IGT_8964: 8964
  xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360: 0984dfdee2a4f9e1922fe919a6b469e115e23360

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/index.html

--===============7790402454101036107==
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
<tr><td><b>Series:</b></td><td>intel_vbt_decode: fall back to guessing PCI ID from VBT signature (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168428/">https://patchwork.freedesktop.org/series/168428/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8964_FULL -&gt; XEIGTPW_15368_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15368_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15368_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15368_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pmu@gt-frequency:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-4/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@xe_pmu@gt-frequency.html">WARN</a> +1 other test warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15368_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-6/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-5/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-lnl-6/igt@kms_cursor_crc@cursor-random-32x10.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x10.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15368/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8964 -&gt; IGTPW_15368</li>
</ul>
<p>IGTPW_15368: 15368<br />
  IGT_8964: 8964<br />
  xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360: 0984dfdee2a4f9e1922fe919a6b469e115e23360</p>

</body>
</html>

--===============7790402454101036107==--

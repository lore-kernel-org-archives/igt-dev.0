Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50E1FEC11D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 22:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A6210E126;
	Tue, 24 Mar 2026 22:39:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181C10E126;
 Tue, 24 Mar 2026 22:38:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6541006500821484145=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/chamelium/audio=3A_F?=
 =?utf-8?q?ix_resource_leaks_in_audio_tests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 24 Mar 2026 22:38:55 -0000
Message-ID: <177439193517.393007.2327242880643694624@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316114708.3342278-1-mohammed.bilal@intel.com>
In-Reply-To: <20260316114708.3342278-1-mohammed.bilal@intel.com>
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

--===============6541006500821484145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium/audio: Fix resource leaks in audio tests (rev5)
URL   : https://patchwork.freedesktop.org/series/162565/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8822_FULL -> XEIGTPW_14840_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14840_FULL:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_dp_aux_dev@basic}:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@kms_dp_aux_dev@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_dp_aux_dev@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14840_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2370])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367] / [Intel XE#7354])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7642])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#6707] / [Intel XE#7439])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2320]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2291]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#309] / [Intel XE#7343])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#7586])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2316])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1421])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#6312] / [Intel XE#651])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2352] / [Intel XE#7399])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2312]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#656]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#7308])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#1503])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@kms_hdr@static-swap.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6911] / [Intel XE#7378])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#7086])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7130]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#4596]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#5020] / [Intel XE#7348])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1489]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1406] / [Intel XE#7345])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#4609])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2234])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1435])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1435])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#1435])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@kms_setmode@invalid-clone-single-crtc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6503])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1499])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-7/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7636]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#6321])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1392])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7136]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6874])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6874]) +12 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_threads@threads-multi-queue-hang-basic:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7138]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-hang-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7138])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [PASS][67] -> [ABORT][68] ([Intel XE#7578]) +1 other test abort
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
    - shard-lnl:          [PASS][69] -> [ABORT][70] ([Intel XE#7145])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-lnl-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-6/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95]) -> ([PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [SKIP][119], [PASS][120], [PASS][121]) ([Intel XE#2457] / [Intel XE#7405])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-7/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-7/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-1/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-9/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-9/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-9/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-2/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#6964])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2245])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-4/igt@xe_pm@d3cold-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2284] / [Intel XE#7370])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_pm@d3hot-i2c.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#944])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][128] -> [FAIL][129] ([Intel XE#6569])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_survivability@i2c-functionality:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#6529] / [Intel XE#7331] / [Intel XE#7388])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-3/igt@xe_survivability@i2c-functionality.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#3119] / [Intel XE#7145])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][133] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][137] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][139] ([Intel XE#2316]) -> [PASS][140] +6 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][141] ([Intel XE#7086]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][143] ([Intel XE#4596]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][145] ([Intel XE#6361]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][147] ([Intel XE#1435]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][149] ([Intel XE#6321]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][151] ([Intel XE#5625]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          [FAIL][153] ([Intel XE#5937]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][155] ([Intel XE#6569]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][157] ([Intel XE#7621]) -> [SKIP][158] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [SKIP][159] ([Intel XE#7642]) -> [FAIL][160] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [FAIL][161] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][162] ([Intel XE#7642])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [SKIP][163] ([Intel XE#7642]) -> [FAIL][164] ([Intel XE#6707] / [Intel XE#7439])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][165] ([Intel XE#7586]) -> [FAIL][166] ([Intel XE#7571])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#2311]) +15 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][169] ([Intel XE#4141]) -> [SKIP][170] ([Intel XE#2312]) +6 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][171] ([Intel XE#2312]) -> [SKIP][172] ([Intel XE#4141]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][173] ([Intel XE#2311]) -> [SKIP][174] ([Intel XE#2312]) +18 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][175] ([Intel XE#2312]) -> [SKIP][176] ([Intel XE#2313]) +11 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][177] ([Intel XE#2313]) -> [SKIP][178] ([Intel XE#2312]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][179] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][180] ([Intel XE#3544])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][181] ([Intel XE#4596]) -> [SKIP][182] ([Intel XE#5021] / [Intel XE#7377])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][183] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][184] ([Intel XE#4596])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][185] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][186] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][187] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][188] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][189] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][190] ([Intel XE#1729] / [Intel XE#7424])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][191] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][192] ([Intel XE#2426] / [Intel XE#5848])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7145
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7586
  [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8822 -> IGTPW_14840
  * Linux: xe-4766-e16dd4cd56376becbd27bd43084526f42ca2eb23 -> xe-4770-4b7edcc15b85ee23b9928da304c47cc1cdb30e87

  IGTPW_14840: 14840
  IGT_8822: 8822
  xe-4766-e16dd4cd56376becbd27bd43084526f42ca2eb23: e16dd4cd56376becbd27bd43084526f42ca2eb23
  xe-4770-4b7edcc15b85ee23b9928da304c47cc1cdb30e87: 4b7edcc15b85ee23b9928da304c47cc1cdb30e87

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/index.html

--===============6541006500821484145==
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
<tr><td><b>Series:</b></td><td>tests/chamelium/audio: Fix resource leaks in=
 audio tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162565/">https://patchwork.freedesktop.org/series/162565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14840/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14840/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8822_FULL -&gt; XEIGTPW_14840_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
840_FULL:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_dp_aux_dev@basic}:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-4/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@=
kms_dp_aux_dev@basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14840_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe=
-d-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14840/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_content_protection@atomic-hd=
cp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_content_protection@uevent-hd=
cp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modes=
et-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_148=
40/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7586">Intel =
XE#7586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14840/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-3/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bm=
g-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-4/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@k=
ms_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-big-joiner.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14840/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/708=
6">Intel XE#7086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-=
bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@kms_plane_multiple@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#=
6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-on=
off@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-1/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-10/igt@kms_setmode@invalid-clone-single-crtc.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1484=
0/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#=
1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_sharpness_filter@invalid-pla=
ne-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-7/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userp=
tr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14840/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>=
) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-qu=
eue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-p=
reempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@xe_exec_threads@threads-multi-qu=
eue-hang-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-2/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_sriov_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14840/shard-bmg-9/igt@xe_fault_injection@inject-fault-pro=
be-function-xe_sriov_init.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>) +1 other test abort=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-lnl-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_allo=
c_regs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14840/shard-lnl-6/igt@xe_fault_injection@oa-add-config-fail-xe_=
oa_alloc_regs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7145">Intel XE#7145</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8822/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8822/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8822/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8822/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_8822/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8822/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shar=
d-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_882=
2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
8822/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-9/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8822/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8822/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14840/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/=
shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14840/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14840/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4840/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14840/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14840/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bm=
g-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14840/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14840/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">=
Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_multigpu_svm@mgpu-pagefault-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@xe_pat@pat-index-xelp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245"=
>Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-4/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel =
XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7328">Intel XE#7328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-1/ig=
t@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14840/shard-lnl-3/igt@xe_survivability@i2c-functionali=
ty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6529">Intel XE#6529</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7331">Intel XE#7331</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7388">Intel XE#7388</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard=
-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7145">In=
tel XE#7145</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@k=
ms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14840/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomi=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-10/igt@kms_cursor_legacy@c=
ursorb-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14840/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Inte=
l XE#7086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14840/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14840/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel X=
E#6361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14840/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14840/shard-bmg-8/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-lnl-3/igt@xe_exec_system_al=
locator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvf=
s-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on=
-vfs-disabling@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@xe_sr=
iov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE=
#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14840/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7621">Intel XE#7621</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">I=
ntel XE#7642</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14840/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178=
">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/117=
8">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_content_p=
rotection@lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">I=
ntel XE#7642</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14840/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707=
">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7586=
">Intel XE#7586</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14840/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14840/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14840/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
77">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel =
XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7377">Intel XE#7377</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-6/igt@kms_rot=
ation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#73=
42</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">I=
ntel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14840/shard-bmg-5/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5848">Intel XE#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14840/shard-bmg-4/igt@kms_tiled_display@basic-test-pa=
ttern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1729">Intel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8822/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14840/shard-bmg-3/igt@kms_tiled_displ=
ay@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8822 -&gt; IGTPW_14840</li>
<li>Linux: xe-4766-e16dd4cd56376becbd27bd43084526f42ca2eb23 -&gt; xe-4770-4=
b7edcc15b85ee23b9928da304c47cc1cdb30e87</li>
</ul>
<p>IGTPW_14840: 14840<br />
  IGT_8822: 8822<br />
  xe-4766-e16dd4cd56376becbd27bd43084526f42ca2eb23: e16dd4cd56376becbd27bd4=
3084526f42ca2eb23<br />
  xe-4770-4b7edcc15b85ee23b9928da304c47cc1cdb30e87: 4b7edcc15b85ee23b9928da=
304c47cc1cdb30e87</p>

</body>
</html>

--===============6541006500821484145==--

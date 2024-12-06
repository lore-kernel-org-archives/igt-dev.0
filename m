Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F430E77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 14:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A5510E2FD;
	Fri,  6 Dec 2024 14:56:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C810E27F;
 Fri,  6 Dec 2024 14:56:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5556788476694066838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/igt=5Fcore=3A_Add_help?=
 =?utf-8?q?er_detecting_CI_environment?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 14:56:25 -0000
Message-ID: <173349698536.3355602.9233813510942171537@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206082822.8648-1-lukasz.laguna@intel.com>
In-Reply-To: <20241206082822.8648-1-lukasz.laguna@intel.com>
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

--===============5556788476694066838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Add helper detecting CI environment
URL   : https://patchwork.freedesktop.org/series/142216/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8141_full -> XEIGTPW_12265_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12265_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12265_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12265_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@torture-move@pipe-c:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +2 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-1/igt@kms_cursor_legacy@torture-move@pipe-c.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-c.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][4] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - shard-lnl:          NOTRUN -> [ABORT][5] +4 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@xe_drm_fdinfo@utilization-others-idle.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html

  
#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][9] ([Intel XE#3468]) -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-WARN][11] ([Intel XE#3468]) -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12265_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1125])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1466])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2233])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#664])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:
    - shard-bmg:          [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1727]) +2 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3279])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][22] ([Intel XE#1725])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1477])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#607])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +14 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3432]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#3432]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +19 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2669]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +23 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2724]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#314])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#306]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2325]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +14 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3278]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#307]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2390]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2341])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2321])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2320]) +10 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424]) +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#309]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2291])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2286]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2291])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#323]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1508])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3383])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_display_modes@extended-mode-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2425])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2323])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][62] ([Intel XE#3468]) +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][63] ([Intel XE#2705]) +1 other test dmesg-fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2244])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2244]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#1695]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2372])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#701])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1138])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1138])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2374])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#3640])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1421]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2316])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [PASS][77] -> [DMESG-WARN][78] ([Intel XE#3468]) +32 other tests dmesg-warn
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp2:
    - shard-bmg:          [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#3468]) +5 other tests dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#2882]) +3 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2293]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1397]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2380]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1401]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#651]) +18 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#2333]) +15 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2311]) +37 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1469]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2352]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2350])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +34 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#656]) +47 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2312]) +21 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#3374] / [Intel XE#3544])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1503])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1503]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#346])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2934])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2501])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#356])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][106] ([Intel XE#3673]) +5 other tests abort
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][107] ([Intel XE#1035] / [Intel XE#2566] / [Intel XE#3468])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#599])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2393])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +35 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][111] ([Intel XE#2566] / [Intel XE#3468])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2763]) +14 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#736])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-bmg:          [PASS][115] -> [DMESG-WARN][116] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_pm_dc@dc9-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1439] / [Intel XE#836])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2893]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1489]) +13 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1128]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2387])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1406]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2234] / [Intel XE#2850]) +19 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2414])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#3414])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2330]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#3414]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2413]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][131] ([Intel XE#3468]) +35 other tests dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][132] -> [SKIP][133] ([Intel XE#1435])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#330])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2450])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@wait-forked@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][136] ([Intel XE#3468]) +4 other tests dmesg-fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_vblank@wait-forked@pipe-a-dp-2.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2168]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1499]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1499]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2905]) +14 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2905]) +11 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_eudebug@discovery-empty.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#688]) +14 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][143] ([Intel XE#1473] / [Intel XE#3468])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][144] ([Intel XE#2364])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1392]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][147] ([Intel XE#3343] / [Intel XE#3468])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][148] ([Intel XE#3467] / [Intel XE#3468])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][149] -> [DMESG-WARN][150] ([Intel XE#3467] / [Intel XE#3468])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [PASS][151] -> [INCOMPLETE][152] ([Intel XE#2998]) +1 other test incomplete
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#560])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_media_fill@media-fill.html
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2459] / [Intel XE#2596])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1416])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_mmap@vram.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][156] -> [FAIL][157] ([Intel XE#3625])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@xe_module_load@reload.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#2248])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2248])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-syncobj-wait-cfg@rcs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][160] ([Intel XE#1727]) +1 other test dmesg-warn
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@xe_oa@syncs-syncobj-wait-cfg@rcs-0.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2236])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#979])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1948])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          NOTRUN -> [ABORT][164] ([Intel XE#1358] / [Intel XE#3673])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2284]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [ABORT][166] ([Intel XE#1358] / [Intel XE#1616])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [PASS][167] -> [DMESG-WARN][168] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@xe_pm@s3-basic-exec.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#584])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][171] -> [DMESG-FAIL][172] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#944]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#944]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][175] ([Intel XE#2705])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@xe_vm@large-userptr-misaligned-binds-33554432.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [DMESG-WARN][176] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][178] ([Intel XE#3468]) -> [PASS][179] +101 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][180] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][182] ([Intel XE#2291]) -> [PASS][183] +4 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][184] ([Intel XE#3468]) -> [PASS][185] +12 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_draw_crc@draw-method-mmap-wc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][186] ([Intel XE#2316]) -> [PASS][187] +10 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][188] ([Intel XE#886]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][190] ([Intel XE#2882]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-FAIL][192] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][193] +4 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][194] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [DMESG-FAIL][196] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@kms_plane_lowres@tiling-x.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][198] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][200] ([Intel XE#718]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [DMESG-WARN][202] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@kms_pm_rpm@cursor.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_pm_rpm@cursor.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#1727]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_properties@plane-properties-atomic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][206] ([Intel XE#1435]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][208] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [DMESG-WARN][210] ([Intel XE#3467]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([SKIP][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237]) ([Intel XE#378]) -> ([PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][263] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][265] ([Intel XE#2280] / [Intel XE#3468]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_prime_self_import@reimport-vs-gem_close-race:
    - shard-bmg:          [DMESG-WARN][267] ([Intel XE#1727]) -> [PASS][268] +3 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_prime_self_import@reimport-vs-gem_close-race.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-full:
    - shard-bmg:          [DMESG-WARN][269] -> [PASS][270] +46 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@xe_vm@munmap-style-unbind-many-either-side-full.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@xe_vm@munmap-style-unbind-many-either-side-full.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][271] ([Intel XE#2341]) -> [FAIL][272] ([Intel XE#1178])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_content_protection@atomic.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][273] ([Intel XE#1178]) -> [SKIP][274] ([Intel XE#2341])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][275] ([Intel XE#877]) -> [SKIP][276] ([Intel XE#2291]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][277] ([Intel XE#877]) -> [DMESG-WARN][278] ([Intel XE#3468])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][279] ([Intel XE#2316]) -> [FAIL][280] ([Intel XE#2882])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#3468]) -> [SKIP][282] ([Intel XE#2316]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [DMESG-FAIL][283] ([Intel XE#3468]) -> [DMESG-WARN][284] ([Intel XE#3468])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][285] ([Intel XE#2311]) -> [SKIP][286] ([Intel XE#2312]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][287] ([Intel XE#3468]) -> [FAIL][288] ([Intel XE#2333]) +1 other test fail
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][289] ([Intel XE#2312]) -> [FAIL][290] ([Intel XE#2333]) +10 other tests fail
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][291] ([Intel XE#3468]) -> [SKIP][292] ([Intel XE#2312])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][293] ([Intel XE#2333]) -> [SKIP][294] ([Intel XE#2312]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][295] ([Intel XE#2333]) -> [DMESG-FAIL][296] ([Intel XE#3468]) +3 other tests dmesg-fail
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#2312]) -> [SKIP][298] ([Intel XE#2311]) +19 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][299] ([Intel XE#2312]) -> [SKIP][300] ([Intel XE#2313]) +17 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][301] ([Intel XE#2313]) -> [SKIP][302] ([Intel XE#2312]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][303] ([Intel XE#3544]) -> [SKIP][304] ([Intel XE#3374] / [Intel XE#3544])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_vblank@wait-forked:
    - shard-bmg:          [DMESG-WARN][305] ([Intel XE#3468]) -> [DMESG-FAIL][306] ([Intel XE#3468])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@kms_vblank@wait-forked.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_vblank@wait-forked.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][307] -> [DMESG-WARN][308] ([Intel XE#3468])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][309] ([Intel XE#3467]) -> [DMESG-WARN][310] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [ABORT][311] ([Intel XE#1616]) -> [ABORT][312] ([Intel XE#1616] / [Intel XE#3468]) +1 other test abort
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          [ABORT][313] ([Intel XE#3468] / [Intel XE#3673]) -> [ABORT][314] ([Intel XE#3673])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-bmg-7/igt@xe_pm@s2idle-exec-after.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625
  [Intel XE#3640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8141 -> IGTPW_12265
  * Linux: xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422 -> xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02

  IGTPW_12265: 8cb27f81db274c551c4ea297ff5089a4d834dd31 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422: e57b4b7cd137e0ae00d2601b4b55ab7f504da422
  xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02: 2e90353f058f2487798ad9236f0926df4ea54f02

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/index.html

--===============5556788476694066838==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Add helper detecting CI enviro=
nment</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142216/">https://patchwork.freedesktop.org/series/142216/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12265/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12265/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8141_full -&gt; XEIGTPW_12265_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12265_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12265_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
265_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-1/igt@kms_cursor_legacy@torture-move@pipe-c.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265=
/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-c.html">DMESG-WARN</a>=
 +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-=
size@pipe-a-hdmi-a-3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-com=
pressed-compfmt0-system-system.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265=
/shard-bmg-2/igt@xe_drm_fdinfo@utilization-others-idle.html">INCOMPLETE</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@xe_evict@evict-mixed-threads-lar=
ge.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@=
pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_ccs@crc-spri=
te-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">FAIL</a> +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@=
vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12265_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125=
">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1466">Intel XE#1466</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_async_flips@test-cursor.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12265/shard-bmg-7/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-=
2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +19 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonbloc=
king-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3383">Intel XE#3383</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_display_modes@mst-extended-m=
ode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_draw_crc@draw-method-blt@rgb=
565-4tiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_draw_crc@draw-method-blt@xrg=
b8888-4tiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test dmesg-fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Inte=
l XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
95">Intel XE#1695</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2372">Intel XE#2372</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3640">Intel XE#3640</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e@c-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12265/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank-inte=
rruptible@c-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +32 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265=
/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdm=
i-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@=
a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-sh=
rfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-til=
ing-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2333">Intel XE#2333</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +37 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1469">Intel XE#1469</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +34 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +47 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-=
crc@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3673">Intel XE#3673</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_plane@pixel-format-source-cl=
amping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/59=
9">Intel XE#599</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
93">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +35 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_plane_scaling@planes-upscale=
-factor-0-25.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@k=
ms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other=
 test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1128">Intel XE#1128</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_psr@pr-primary-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_psr@psr2-primary-page-flip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_sequence@get-idle.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>) +35 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12265/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_vblank@wait-forked@pipe-a-dp=
-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_eudebug@basic-connect.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_eudebug@discovery-empty.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_evict@evict-beng-cm-threads-s=
mall.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-t=
hreads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@xe_fault_injection@inject-fault-=
probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@inject-fault-=
probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_s=
cratch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_c=
reate_scratch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1226=
5/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">In=
tel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@xe_module_load@reload.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt=
@xe_module_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3625">Intel XE#3625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@xe_oa@syncs-syncobj-wait-cfg@rcs=
-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">=
Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_pm@s2idle-basic.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">In=
tel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_pm@s2idle-d3hot-basic-exec.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@x=
e_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7=
/igt@xe_pm_residency@cpg-basic.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@xe_vm@large-userptr-misaligned-b=
inds-33554432.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">=
Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@core_hotunplug@hotunbind-rebin=
d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-curs=
or@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_atomi=
c_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3.html">PASS</a> +1=
01 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_draw_crc@draw-method-mmap-wc.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12265/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html">PASS=
</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12265/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +10 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12265/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel =
XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12265/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xt=
ile-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12265/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64b=
pp-xtile-upscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel =
XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12265/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-wit=
h-pixel-format.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt=
@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-l=
nl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@kms_pm_rpm@cursor.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12265/shard-bmg-5/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_properties@plane-properties-atomic.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_properties@plane-properties-atomi=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12265/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@xe_exec_balancer@twice-cm-virtual-userptr-invali=
date-race.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_e=
xec_balancer@twice-cm-virtual-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_run.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@xe_fault_injection@vm-b=
ind-fail-xe_pt_update_ops_run.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-ln=
l-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8141/shard-lnl-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
141/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8141/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8141/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8141/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12265/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12265/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard=
-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
265/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12265/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12265/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-ln=
l-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12265/shard-lnl-8/igt@xe_module_load@load.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbin=
d-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Inte=
l XE#2280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_pm@s4-vm-bind-unbind-all.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@xe_prime_self_import@reimport-vs-gem_close-race.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_prime_self_import@reimpor=
t-vs-gem_close-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@xe_vm@munmap-style-unbind-many-either-side-full.=
html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12265/shard-bmg-5/igt@xe_vm@munmap-style-unbind-many-either-side=
-full.html">PASS</a> +46 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12265/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12265/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">In=
tel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#=
2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-t=
oggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12265/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12265/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@kms_frontbuffer_=
tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1=
 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +10 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shr=
fb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuff=
er_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3=
 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shr=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-8/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2265/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@kms_vblank@wait-forked.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12265/shard-bmg-7/igt@kms_vblank@wait-forked.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wopcm_init.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12265/shard-bmg-1/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_prepare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12265/shard-bmg-3/igt@xe_fault_injection@=
vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1226=
5/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8141/shard-bmg-7/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673"=
>Intel XE#3673</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12265/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE=
#3673</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8141 -&gt; IGTPW_12265</li>
<li>Linux: xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422 -&gt; xe-2332-2=
e90353f058f2487798ad9236f0926df4ea54f02</li>
</ul>
<p>IGTPW_12265: 8cb27f81db274c551c4ea297ff5089a4d834dd31 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422: e57b4b7cd137e0ae00d2601=
b4b55ab7f504da422<br />
  xe-2332-2e90353f058f2487798ad9236f0926df4ea54f02: 2e90353f058f2487798ad92=
36f0926df4ea54f02</p>

</body>
</html>

--===============5556788476694066838==--

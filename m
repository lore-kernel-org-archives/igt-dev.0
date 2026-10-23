Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7A606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 20:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE5E10E098;
	Fri, 23 Oct 2026 20:56:47 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F5010E098;
 Fri, 23 Oct 2026 20:55:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1422171254158128725=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_add_coverage_for_xe=5Fpxp?=
 =?utf-8?q?=5Fdebugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Oct 2026 20:55:56 -0000
Message-ID: <179278895699.63812.9125494584972408271@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
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

--===============1422171254158128725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add coverage for xe_pxp_debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/175588/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9161_FULL -> XEIGTPW_16037_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16037_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16037_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16037_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html

  
New tests
---------

  New tests have been introduced between XEIGT_9161_FULL and XEIGTPW_16037_FULL:

### New IGT tests (1) ###

  * igt@xe_pxp@pxp-debugfs-info:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16037_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5765])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#3157])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5901]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5808]) +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#367]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#8365])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5822]) +16 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2669] / [Intel XE#3433] / [Intel XE#7389]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#7008])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325] / [Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#5824]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#306] / [Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#8391]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7358])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6969]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#6969]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#3304] / [Intel XE#7374])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#7642]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#3304]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@kms_content_protection@suspend-resume@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7642])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5900]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#5846]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321] / [Intel XE#7355])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5962]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5962] / [Intel XE#7343])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1508])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#9531])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8265])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5907]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4422] / [Intel XE#7442])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8680])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#2316]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#301]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7178]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7178] / [Intel XE#7351])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656] / [Intel XE#7905]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +26 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#6312]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5812]) +63 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5800] / [Intel XE#6312]) +13 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6312] / [Intel XE#651])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#6312]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7865]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7905]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7061]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7061]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2313]) +29 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#7865]) +24 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2350] / [Intel XE#7503])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#9313])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#9312])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#9312])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#6900])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7283]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#8303]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#8303]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#7283]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7283]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#5021] / [Intel XE#7377])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#4596] / [Intel XE#5854])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#5020])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#5959])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2499])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5858]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4608])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4608] / [Intel XE#7304])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1489])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7304]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#7413])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#5835]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#1406]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#5821]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2413])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1435] / [Intel XE#8695])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#5910])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#6503]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [PASS][106] -> [FAIL][107] ([Intel XE#4227] / [Intel XE#7397]) +2 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-6/igt@kms_vrr@flip-basic-fastset.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][108] -> [FAIL][109] ([Intel XE#6293] / [Intel XE#7397])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5191])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_configfs@engines-allowed-invalid:
    - shard-bmg:          [PASS][111] -> [ABORT][112] ([Intel XE#9463])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@xe_configfs@engines-allowed-invalid.html

  * igt@xe_create@create-big-vram:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5853] / [Intel XE#7457])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][114] -> [INCOMPLETE][115] ([Intel XE#6321] / [Intel XE#8355])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#5764]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#7482]) +12 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1392])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#5575] / [Intel XE#7484]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#8374]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#8374]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#8374])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#9003])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#9003])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#8364]) +24 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@one-queue-priority:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#8364]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-priority.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#8364]) +11 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#8369]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#8369])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#8378]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#8378]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#8378]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#9657])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#5775])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#5100] / [Intel XE#7408])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#6964])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#6964]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#6259] / [Intel XE#7406])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_noexec_ping_pong@basic.html
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#7793])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@xe_page_reclaim@pde-vs-pd.html
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#7793]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pat@pat-index-xelp:
    - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#5771] / [Intel XE#7590])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2245] / [Intel XE#7590])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#584] / [Intel XE#7369])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#6867]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][148] -> [ABORT][149] ([Intel XE#9362]) +1 other test abort
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-3/igt@xe_pm@s4-mocs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#5611] / [Intel XE#7456])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#6019]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#944])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_ras@gpu-health:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#9588])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@xe_ras@gpu-health.html
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#9588])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@xe_ras@gpu-health.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#4273])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#6376] / [Intel XE#7422])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_sriov_vram@vf-access-after-resize-up.html

  * igt@xe_vm@out-of-memory:
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#5745] / [Intel XE#7892])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [ABORT][159] ([Intel XE#9463]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][161] ([Intel XE#8583]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-ptl:          [FAIL][163] ([Intel XE#5408]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [DMESG-WARN][165] ([Intel XE#9391]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][167] ([Intel XE#8578]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][169] ([Intel XE#9096] / [Intel XE#9297]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-ptl:          [FAIL][171] ([Intel XE#9096]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
    - shard-lnl:          [FAIL][173] ([Intel XE#9096]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-ptl:          [ABORT][175] ([Intel XE#9362]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-5/igt@xe_pm@s2idle-vm-bind-userptr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][177] ([Intel XE#9362]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][179] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][180] ([Intel XE#1729] / [Intel XE#7424])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][181] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][182] ([Intel XE#2509] / [Intel XE#7437])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [ABORT][183] ([Intel XE#9362]) -> [DMESG-WARN][184] ([Intel XE#7727])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-7/igt@xe_pm@s4-mocs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@xe_pm@s4-mocs.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5959]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531
  [Intel XE#9588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657


Build changes
-------------

  * IGT: IGT_9161 -> IGTPW_16037
  * Linux: xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5 -> xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c

  IGTPW_16037: 16037
  IGT_9161: 9161
  xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5: 2b2e3642e6d2095bbaae7b552da1c5ad164047a5
  xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c: a4c732aca52a51c32227b9a9a1364e1e533d275c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/index.html

--===============1422171254158128725==
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
<tr><td><b>Series:</b></td><td>add coverage for xe_pxp_debugfs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175588/">https://patchwork.freedesktop.org/series/175588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9161_FULL -&gt; XEIGTPW_16037_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16037_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16037_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16037_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdr@bpc-switch-dpms:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9161_FULL and XEIGTPW_16037_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_pxp@pxp-debugfs-info:<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16037_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@kms_content_protection@suspend-resume@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531">Intel XE#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959">Intel XE#5959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@kms_psr@fbc-psr2-primary-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-6/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@xe_configfs@engines-allowed-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853">Intel XE#5853</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-5/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_noexec_ping_pong@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_noexec_ping_pong@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324">Intel XE#7324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-3/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-1/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-4/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-3/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611">Intel XE#5611</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-9/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ras@gpu-health:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-6/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_vm@out-of-memory.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">Intel XE#5745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391">Intel XE#9391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297">Intel XE#9297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-5/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-5/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9161/shard-ptl-7/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16037/shard-ptl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9161 -&gt; IGTPW_16037</li>
<li>Linux: xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5 -&gt; xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c</li>
</ul>
<p>IGTPW_16037: 16037<br />
  IGT_9161: 9161<br />
  xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5: 2b2e3642e6d2095bbaae7b552da1c5ad164047a5<br />
  xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c: a4c732aca52a51c32227b9a9a1364e1e533d275c</p>

</body>
</html>

--===============1422171254158128725==--

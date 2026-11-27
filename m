Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B9606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058A310E622;
	Fri, 27 Nov 2026 18:28:55 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE410E276;
 Fri, 27 Nov 2026 18:27:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2108853387605196524=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2C1/9=5D_lib/igt=5Fdrm=5Fras=5Fnl=3A_Add_node_and_error_count?=
 =?utf-8?q?er_listing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Nov 2026 18:27:58 -0000
Message-ID: <179580407838.2085.6014410319339552986@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
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

--===============2108853387605196524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/9] lib/igt_drm_ras_nl: Add node and error counter listing
URL   : https://patchwork.freedesktop.org/series/179790/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9205_FULL -> XEIGTPW_16224_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16224_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16224_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16224_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-ptl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-6/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
    - shard-lnl:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-2/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * {igt@xe_drm_ras@retired-pages-info} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@xe_drm_ras@retired-pages-info.html

  * {igt@xe_drm_ras@retired-pages-inject} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@xe_drm_ras@retired-pages-inject.html
    - shard-ptl:          NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_drm_ras@retired-pages-inject.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-lnl:          [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
    - shard-ptl:          [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  
New tests
---------

  New tests have been introduced between XEIGT_9205_FULL and XEIGTPW_16224_FULL:

### New IGT tests (3) ###

  * igt@xe_drm_ras@retired-pages-info:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_drm_ras@retired-pages-inject:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@xe_drm_ras@retired-pages-invalid-node:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16224_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind-with-load:
    - shard-bmg:          NOTRUN -> [ABORT][12] ([Intel XE#9841])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@core_hotunplug@hotunbind-rebind-with-load.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#8583])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2233])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5765])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1466])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2370])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#5901])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#610] / [Intel XE#7387])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5855])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1428] / [Intel XE#7387])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5808]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#367]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5822]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#9204] / [Intel XE#9219]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#9219]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#9219]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2252]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2325] / [Intel XE#7358])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7358])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#8391])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#2252]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#373])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6969]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#3304] / [Intel XE#7374])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5832] / [Intel XE#6974])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6974])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#3304])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][54] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7642])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#6707] / [Intel XE#7439])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5846])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2321] / [Intel XE#7355])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5900]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1424])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5962])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#309] / [Intel XE#7343])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1340] / [Intel XE#7435])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#9536])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#9531])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#9535])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#5907])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#8265])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8265]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4156] / [Intel XE#7425])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-busy-flip:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#2316]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#3321]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#301])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7178] / [Intel XE#7349])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7178]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5828]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5800] / [Intel XE#6312]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2311]) +45 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#5812]) +40 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#6312]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#6312]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#7865]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#7061]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#7061])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#7061])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7399])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +42 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7905]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#7865]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#6911] / [Intel XE#7466])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#8348])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#6912])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#7283])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#7283])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#7283]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#5946])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#5959] / [Intel XE#9779])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010:
    - shard-bmg:          [PASS][109] -> [FAIL][110] ([Intel XE#9780]) +4 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#9779])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#9779]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#8396]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#1131])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#6927] / [Intel XE#8854])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#8399])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@package-g7:
    - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#6813])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5858]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2893] / [Intel XE#7304])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#7304]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1489]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2387] / [Intel XE#7429])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#1406]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406] / [Intel XE#7345])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_psr@fbc-psr2-basic@edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1406])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2234])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5821])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2413])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#6503])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [PASS][137] -> [FAIL][138] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#1499] / [Intel XE#9271])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-ptl:          NOTRUN -> [ABORT][140] ([Intel XE#8868])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@sriov_basic@pf-unbind-with-vf-probed.html
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#8866])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_err_injection@inject_core_compute_corr_error_once:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#9769])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@xe_err_injection@inject_core_compute_corr_error_once.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#5764]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#6540] / [Intel XE#688])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#8370])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][146] ([Intel XE#6144])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#7482]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#7482]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1392])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#8374]) +10 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#8374]) +4 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#8374]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#8364]) +8 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#8364]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#8364]) +18 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#8369]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
    - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#8369])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#8369])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][161] ([Intel XE#8378]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#8378]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#8378]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [PASS][164] -> [ABORT][165] ([Intel XE#9841] / [Intel XE#9845])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][166] -> [ABORT][167] ([Intel XE#9841]) +5 other tests abort
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2229])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#6964])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-ptl:          NOTRUN -> [SKIP][170] ([Intel XE#6964]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_multigpu_svm@mgpu-latency-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#6964])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#7793])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-ptl:          NOTRUN -> [SKIP][173] ([Intel XE#7590])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][176] ([Intel XE#5741])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][177] -> [ABORT][178] ([Intel XE#9362])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-ptl:          NOTRUN -> [SKIP][179] ([Intel XE#5611] / [Intel XE#7456])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-topology:
    - shard-ptl:          NOTRUN -> [SKIP][181] ([Intel XE#6019])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#944]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-ptl:          NOTRUN -> [SKIP][183] ([Intel XE#9597])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#9597])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][185] ([Intel XE#8963])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-ptl:          NOTRUN -> [DMESG-WARN][186] ([Intel XE#8963])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-lnl:          NOTRUN -> [DMESG-WARN][187] ([Intel XE#8963])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [ABORT][188] ([Intel XE#9841]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-10/igt@core_hotunplug@hotunbind-rebind.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][190] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:
    - shard-bmg:          [FAIL][192] ([Intel XE#9780]) -> [PASS][193] +9 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][194] ([Intel XE#8399]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-ptl:          [FAIL][196] ([Intel XE#9566]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-7/igt@kms_vblank@ts-continuation-modeset.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_vblank@ts-continuation-modeset.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [ABORT][198] ([Intel XE#9362]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-1/igt@xe_pm@s4-mocs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_pm@s4-mocs.html
    - shard-lnl:          [ABORT][200] ([Intel XE#9362]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-4/igt@xe_pm@s4-mocs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][202] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][203] ([Intel XE#301])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][204] ([Intel XE#9319] / [Intel XE#9346]) -> [FAIL][205] ([Intel XE#9346])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5959]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
  [Intel XE#9219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531
  [Intel XE#9535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535
  [Intel XE#9536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536
  [Intel XE#9566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9566
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
  [Intel XE#9769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841
  [Intel XE#9845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845


Build changes
-------------

  * IGT: IGT_9205 -> IGTPW_16224
  * Linux: xe-6245-b9ca025eaaa7b876bdd4a17bb77dc35d6d648648 -> xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83

  IGTPW_16224: 16224
  IGT_9205: 9205
  xe-6245-b9ca025eaaa7b876bdd4a17bb77dc35d6d648648: b9ca025eaaa7b876bdd4a17bb77dc35d6d648648
  xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83: 17f7eb2368b0eed1dfda22b10966fa181d9b2c83

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/index.html

--===============2108853387605196524==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/9] lib/igt_drm_ras_nl: Add node and error counter listing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179790/">https://patchwork.freedesktop.org/series/179790/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9205_FULL -&gt; XEIGTPW_16224_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16224_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16224_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16224_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-6/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">ABORT</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-2/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe_drm_ras@retired-pages-info} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@xe_drm_ras@retired-pages-info.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_drm_ras@retired-pages-inject} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@xe_drm_ras@retired-pages-inject.html">SKIP</a> +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_drm_ras@retired-pages-inject.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a></li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9205_FULL and XEIGTPW_16224_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_drm_ras@retired-pages-info:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_ras@retired-pages-inject:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_ras@retired-pages-invalid-node:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16224_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind-with-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@core_hotunplug@hotunbind-rebind-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-7/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855">Intel XE#5855</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204">Intel XE#9204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219">Intel XE#9219</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219">Intel XE#9219</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219">Intel XE#9219</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536">Intel XE#9536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531">Intel XE#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535">Intel XE#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946">Intel XE#5946</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959">Intel XE#5959</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-b-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@kms_pm_dc@dc5-psr-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@kms_psr@fbc-psr2-basic@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@kms_psr@fbc-psr2-basic@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-7/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@sriov_basic@pf-unbind-with-vf-probed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866">Intel XE#8866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_err_injection@inject_core_compute_corr_error_once:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-5/igt@xe_err_injection@inject_core_compute_corr_error_once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-4/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-6/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +6 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845">Intel XE#9845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-4/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_page_reclaim@pat-index-xd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611">Intel XE#5611</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-3/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-10/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-7/igt@kms_vblank@ts-continuation-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9566">Intel XE#9566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@kms_vblank@ts-continuation-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-ptl-1/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-ptl-6/igt@xe_pm@s4-mocs.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-4/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-3/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9205/shard-bmg-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16224/shard-bmg-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9205 -&gt; IGTPW_16224</li>
<li>Linux: xe-6245-b9ca025eaaa7b876bdd4a17bb77dc35d6d648648 -&gt; xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83</li>
</ul>
<p>IGTPW_16224: 16224<br />
  IGT_9205: 9205<br />
  xe-6245-b9ca025eaaa7b876bdd4a17bb77dc35d6d648648: b9ca025eaaa7b876bdd4a17bb77dc35d6d648648<br />
  xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83: 17f7eb2368b0eed1dfda22b10966fa181d9b2c83</p>

</body>
</html>

--===============2108853387605196524==--

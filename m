Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF5D3F281
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 20:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8AB10E980;
	Fri, 18 Oct 2024 20:17:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303C210E387;
 Fri, 18 Oct 2024 20:17:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7600582244528284312=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv2=2C1/2=5D_tests/chamelium/kms=5Fchamelium=5Fedid=3A_Use_exte?=
 =?utf-8?q?nded_flag_to_reduce_the_number_of_edid?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Oct 2024 20:17:57 -0000
Message-ID: <172928267718.1282733.10056593406651501072@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018035914.1740924-1-pranay.samala@intel.com>
In-Reply-To: <20241018035914.1740924-1-pranay.samala@intel.com>
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

--===============7600582244528284312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the number of edid
URL   : https://patchwork.freedesktop.org/series/140143/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8078_full -> XEIGTPW_11935_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11935_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11935_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11935_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@torture-move@all-pipes:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@kms_cursor_legacy@torture-move@all-pipes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_cursor_legacy@torture-move@all-pipes.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +6 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  
#### Warnings ####

  * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
    - shard-lnl:          [DMESG-FAIL][7] ([Intel XE#1620]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][9] ([Intel XE#1178]) -> [DMESG-FAIL][10] +7 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-1/igt@kms_content_protection@legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - {shard-bmg}:        [FAIL][11] ([Intel XE#1188]) -> [DMESG-FAIL][12] +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_content_protection@uevent.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [PASS][13] -> [DMESG-WARN][14] +140 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - {shard-bmg}:        [SKIP][15] ([Intel XE#3007]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][17] +3 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

  * igt@xe_live_ktest@xe_eudebug:
    - {shard-bmg}:        [SKIP][18] ([Intel XE#2833]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - {shard-bmg}:        [PASS][20] -> [SKIP][21] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11935_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1407])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#2890]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#619])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1512])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2351] / [Intel XE#2890])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195] / [Intel XE#2692])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#3113])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +76 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#314]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#373]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_color@deep-color:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#1195])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_color@deep-color.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1178]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#307])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#599])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#308]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#323]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#2932])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#703])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1421])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#301])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][59] ([Intel XE#1195]) +1 other test incomplete
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][60] -> [ABORT][61] ([Intel XE#2625])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886]) +3 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401] / [Intel XE#1745])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([i915#5274])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#651]) +19 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2890])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#651])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#658])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653]) +20 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#656]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#346])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#616]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#870])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1129]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#3129])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#2446])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1439])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#2042])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1489]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2893])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1122])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#2948]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#327])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1127])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#330])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#2443]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1126])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@resume-one:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2905]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#688])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][100] -> [TIMEOUT][101] ([Intel XE#1473])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#2754])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +15 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2905]) +9 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#1130]) +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][109] ([Intel XE#2961]) +1 other test timeout
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2833])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2229])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2541]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1061])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][115] -> [ABORT][116] ([Intel XE#1694])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#944]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][118] ([Intel XE#2919])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - {shard-bmg}:        [SKIP][119] ([Intel XE#2231]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][123] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][125] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#2423] / [i915#2575]) -> [PASS][128] +14 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][129] ([Intel XE#301]) -> [PASS][130] +2 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {shard-bmg}:        [FAIL][131] ([Intel XE#2882]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-4/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#1204]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#301]) -> [PASS][136] +6 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][137] ([Intel XE#2625]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][139] ([Intel XE#886]) -> [PASS][140] +8 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - {shard-bmg}:        [SKIP][141] -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - {shard-bmg}:        [SKIP][143] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2890]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][147] ([Intel XE#324]) -> [PASS][148] +5 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_plane@plane-position-covered.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_plane@plane-position-covered.html
    - {shard-bmg}:        [SKIP][149] ([Intel XE#829]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_plane@plane-position-covered.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][151] ([Intel XE#324]) -> [PASS][152] +11 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][153] ([Intel XE#718]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2446]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_pm_rpm@dpms-lpsp.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_prop_blob@basic:
    - {shard-bmg}:        [SKIP][157] ([Intel XE#3007]) -> [PASS][158] +11 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_prop_blob@basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][159] ([Intel XE#2948]) -> [PASS][160] +3 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-dpms:
    - shard-lnl:          [FAIL][161] ([Intel XE#1649]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-8/igt@kms_psr@psr2-dpms.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-3/igt@kms_psr@psr2-dpms.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#2883]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][165] ([Intel XE#1195]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][167] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1130]) -> [PASS][170] +20 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_exec_basic@many-basic-defer-bind.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][171] ([Intel XE#2754]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-rebind-bindexecqueue:
    - shard-lnl:          [INCOMPLETE][173] ([Intel XE#1169]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-6/igt@xe_exec_threads@threads-rebind-bindexecqueue.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@xe_exec_threads@threads-rebind-bindexecqueue.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [SKIP][175] ([Intel XE#1192]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@force-load:
    - {shard-bmg}:        [SKIP][177] ([Intel XE#2457]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-8/igt@xe_module_load@force-load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#378]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_module_load@force-load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_module_load@force-load.html
    - shard-lnl:          [SKIP][181] ([Intel XE#378]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@xe_module_load@force-load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload-no-display:
    - {shard-bmg}:        [FAIL][183] -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@xe_module_load@reload-no-display.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - {shard-bmg}:        [INCOMPLETE][185] ([Intel XE#1616]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [ABORT][187] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_spin_batch@spin-all:
    - {shard-bmg}:        [SKIP][189] ([Intel XE#1130]) -> [PASS][190] +28 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@xe_spin_batch@spin-all.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2890]) -> [SKIP][192] ([Intel XE#316])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][194] ([Intel XE#1124])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2890]) -> [SKIP][196] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2890]) -> [SKIP][198] ([Intel XE#2907])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][200] ([Intel XE#455] / [Intel XE#787])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#373]) -> [SKIP][202] ([Intel XE#2423] / [i915#2575])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2423] / [i915#2575]) -> [SKIP][204] ([Intel XE#373])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2423] / [i915#2575]) -> [SKIP][206] ([Intel XE#455])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_cursor_crc@cursor-random-32x32.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2890]) -> [SKIP][208] ([Intel XE#455])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#651]) -> [SKIP][210] ([Intel XE#2890]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2890]) -> [SKIP][212] ([Intel XE#651]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#651]) -> [SKIP][214] ([Intel XE#2351] / [Intel XE#2890])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#653]) -> [SKIP][216] ([Intel XE#2351] / [Intel XE#2890])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][218] ([Intel XE#653])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2890]) -> [SKIP][220] ([Intel XE#653]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#653]) -> [SKIP][222] ([Intel XE#2890])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2890]) -> [SKIP][224] ([Intel XE#2927])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][226] ([Intel XE#2423] / [i915#2575])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [INCOMPLETE][227] ([Intel XE#1620] / [Intel XE#2864]) -> [DMESG-WARN][228] ([Intel XE#2042])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1489]) -> [SKIP][230] ([Intel XE#2890])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2890]) -> [SKIP][232] ([Intel XE#1489])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][234] ([Intel XE#2850] / [Intel XE#929])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_psr@pr-sprite-render.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-sprite-render:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2890]) -> [SKIP][236] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_psr@psr-sprite-render.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#327]) -> [SKIP][238] ([Intel XE#2423] / [i915#2575])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@xe_eudebug@connect-user:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2905]) -> [SKIP][240] ([Intel XE#1130])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-433/igt@xe_eudebug@connect-user.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1130]) -> [SKIP][242] ([Intel XE#2905]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][243] ([Intel XE#1000]) -> [TIMEOUT][244] ([Intel XE#1473])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#288]) -> [SKIP][246] ([Intel XE#1130]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1130]) -> [SKIP][248] ([Intel XE#288]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2541]) -> [SKIP][250] ([Intel XE#1130])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@xe_oa@invalid-oa-metric-set-id.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1130]) -> [SKIP][252] ([Intel XE#2541])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8078 -> IGTPW_11935
  * Linux: xe-2075-81420006f741f9783adea6ab5620ce54697f1b20 -> xe-2086-8059169563b0ed0040968e476d451c436274e0ed

  IGTPW_11935: 11935
  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2075-81420006f741f9783adea6ab5620ce54697f1b20: 81420006f741f9783adea6ab5620ce54697f1b20
  xe-2086-8059169563b0ed0040968e476d451c436274e0ed: 8059169563b0ed0040968e476d451c436274e0ed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/index.html

--===============7600582244528284312==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the number of edid</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140143/">https://patchwork.freedesktop.org/series/140143/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8078_full -&gt; XEIGTPW_11935_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11935_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11935_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11935_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@torture-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@kms_cursor_legacy@torture-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_cursor_legacy@torture-move@all-pipes.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes-dpms@plane-77:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@kms_content_protection@legacy.html">DMESG-FAIL</a> +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">DMESG-WARN</a> +140 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11935_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_color@deep-color.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129">Intel XE#3129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> +5 other tests pass</li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_plane@plane-position-covered.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@kms_plane@plane-position-covered.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@kms_prop_blob@basic.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-8/igt@kms_psr@psr2-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-3/igt@kms_psr@psr2-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_exec_basic@many-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@xe_exec_basic@many-basic-defer-bind.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind-bindexecqueue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-6/igt@xe_exec_threads@threads-rebind-bindexecqueue.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-7/igt@xe_exec_threads@threads-rebind-bindexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-8/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@xe_module_load@force-load.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_module_load@force-load.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-3/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-8/igt@xe_module_load@force-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@xe_module_load@reload-no-display.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-4/igt@xe_module_load@reload-no-display.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-bmg-2/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-bmg-7/igt@xe_spin_batch@spin-all.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-434/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-433/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-464/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-466/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-436/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8078/shard-dg2-435/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11935/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8078 -&gt; IGTPW_11935</li>
<li>Linux: xe-2075-81420006f741f9783adea6ab5620ce54697f1b20 -&gt; xe-2086-8059169563b0ed0040968e476d451c436274e0ed</li>
</ul>
<p>IGTPW_11935: 11935<br />
  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2075-81420006f741f9783adea6ab5620ce54697f1b20: 81420006f741f9783adea6ab5620ce54697f1b20<br />
  xe-2086-8059169563b0ed0040968e476d451c436274e0ed: 8059169563b0ed0040968e476d451c436274e0ed</p>

</body>
</html>

--===============7600582244528284312==--

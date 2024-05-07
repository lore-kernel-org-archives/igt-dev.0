Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A79C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 03:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035EB10E409;
	Tue,  7 May 2024 03:17:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E0110E1EE;
 Tue,  7 May 2024 03:17:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8744528097090001023=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/kms=5Fccs=3A_Test_XRGB2?=
 =?utf-8?q?101010_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 May 2024 03:17:53 -0000
Message-ID: <171505187361.1960082.4971597857013121032@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240506133748.30321-1-ville.syrjala@linux.intel.com>
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

--===============8744528097090001023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: Test XRGB2101010 (rev2)
URL   : https://patchwork.freedesktop.org/series/133235/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7835_full -> XEIGTPW_11104_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11104_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11104_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11104_full prevented too many machines from booting.

  Missing    (2): shard-adlp shard-lnl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11104_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-16x16:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-16x16.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-16x16.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11104_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#787]) +59 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][7] ([Intel XE#1178])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#877])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#1201]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][16] ([Intel XE#1162] / [Intel XE#1214]) +12 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#1195])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:
    - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#650]) +51 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#616])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension:
    - shard-dg2-set2:     [PASS][24] -> [ABORT][25] ([Intel XE#1229] / [Intel XE#1303] / [Intel XE#1553])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-91x91:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#1553])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-91x91.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-91x91.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][28] -> [TIMEOUT][29] ([Intel XE#1473] / [Intel XE#392])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#1600])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [PASS][32] -> [DMESG-WARN][33] ([Intel XE#1214])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@xe_pm@s3-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@xe_pm@s3-basic.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2-set2:     [SKIP][34] ([Intel XE#1201] / [i915#6077]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][36] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][37] +4 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][39] +4 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][40] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][41] +11 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-handle-not-fb:
    - shard-dg2-set2:     [SKIP][42] ([Intel XE#1201] / [Intel XE#687]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_getfb@getfb-handle-not-fb.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_getfb@getfb-handle-not-fb.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][44] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1235]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_vblank@query-forked-hang:
    - shard-dg2-set2:     [DMESG-WARN][46] ([Intel XE#1214]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_vblank@query-forked-hang.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_vblank@query-forked-hang.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][48] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][50] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][52] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][53] +3 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_pm@s3-basic-exec.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [DMESG-FAIL][54] ([Intel XE#1162] / [Intel XE#1548]) -> [DMESG-FAIL][55] ([Intel XE#1548])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@core_hotunplug@hotreplug.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [DMESG-FAIL][56] ([Intel XE#1345] / [Intel XE#1548]) -> [DMESG-FAIL][57] ([Intel XE#1162] / [Intel XE#1345] / [Intel XE#1548])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][58] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][59] ([Intel XE#1201] / [Intel XE#829])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][60] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][61] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][63] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][64] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][65] ([Intel XE#1201] / [Intel XE#373])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][66] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][67] ([Intel XE#1201])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][68] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][69] ([Intel XE#1178])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_content_protection@atomic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][70] ([Intel XE#1178]) -> [SKIP][71] ([Intel XE#1201] / [Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-434/igt@kms_content_protection@srm.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][72] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][73] ([Intel XE#1201] / [Intel XE#308])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][75] ([Intel XE#1201] / [Intel XE#323])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#1226]) -> [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#282])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][79] ([Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][80] ([Intel XE#1214]) -> [INCOMPLETE][81] ([Intel XE#1195])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][82] ([Intel XE#1214]) -> [DMESG-WARN][83] ([Intel XE#1162] / [Intel XE#1214])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][85] ([Intel XE#1201] / [Intel XE#455])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][87] ([Intel XE#1201]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1235]) -> [SKIP][91] ([Intel XE#1201] / [Intel XE#651])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][93] ([Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][95] ([Intel XE#1201]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][97] ([Intel XE#1201])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][100] -> [FAIL][101] ([Intel XE#616]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][102] ([Intel XE#616]) -> [DMESG-FAIL][103] ([Intel XE#1162]) +1 other test dmesg-fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][105] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][106] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][107] ([Intel XE#904] / [Intel XE#909])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][108] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][109] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][110] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][111] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][115] ([Intel XE#1201]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_psr@psr-cursor-render.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_psr@psr-cursor-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#829])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][118] ([Intel XE#1729]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#362])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#362])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][122] ([Intel XE#1473]) -> [INCOMPLETE][123] ([Intel XE#1195] / [Intel XE#1473])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][124] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][125] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1229
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1303
  [Intel XE#1345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7835 -> IGTPW_11104

  IGTPW_11104: fbdfcefd020b7b909b0d06b94bcc6ec75f341da2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7835: 4b767566bbc6c3ac342b54620aec0fabc8cdd4bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1243-83e0d2a2621c7550c198b8936f4680b24f24a698: 83e0d2a2621c7550c198b8936f4680b24f24a698

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133235v2/index.html

--===============8744528097090001023==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: Test XRGB2101010 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133235/">https://patchwork.freedesktop.org/series/133235/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133235v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133235v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7835_full -&gt; XEIGTPW_11104_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11104_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11104_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11104_full prevented too many machines from booting.</p>
<p>Missing    (2): shard-adlp shard-lnl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11104_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-16x16:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-16x16.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-16x16.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11104_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +51 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1229">Intel XE#1229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1303">Intel XE#1303</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-91x91:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-91x91.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-91x91.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-not-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_getfb@getfb-handle-not-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_getfb@getfb-handle-not-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_vblank@query-forked-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_vblank@query-forked-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@core_hotunplug@hotreplug.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@core_hotunplug@hotreplug.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345">Intel XE#1345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345">Intel XE#1345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_cursor_legacy@single-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-463/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7835/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11104/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7835 -&gt; IGTPW_11104</li>
</ul>
<p>IGTPW_11104: fbdfcefd020b7b909b0d06b94bcc6ec75f341da2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7835: 4b767566bbc6c3ac342b54620aec0fabc8cdd4bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1243-83e0d2a2621c7550c198b8936f4680b24f24a698: 83e0d2a2621c7550c198b8936f4680b24f24a698</p>

</body>
</html>

--===============8744528097090001023==--

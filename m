Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEA6C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 04:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8110EF01;
	Fri, 12 Apr 2024 04:24:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D09310EE93;
 Fri, 12 Apr 2024 04:24:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8501362854529880584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/gem=5Fexec=5Fcapt?=
 =?utf-8?q?ure=3A_Fix_many-*_subtests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Apr 2024 04:24:15 -0000
Message-ID: <171289585536.1353756.13949739913101585281@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410174031.5840-1-me@petersenna.com>
In-Reply-To: <20240410174031.5840-1-me@petersenna.com>
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

--===============8501362854529880584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_capture: Fix many-* subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/132291/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7806_full -> XEIGTPW_11014_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11014_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][1] ([Intel XE#1548])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_addfb_basic@bad-pitch-65536:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#1201] / [i915#6077])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_addfb_basic@bad-pitch-65536.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#827])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][5] ([Intel XE#827])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#610])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][14] ([Intel XE#616]) +8 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#307])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#1178])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#282]) +10 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#877])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [i915#5274])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_lease@master-vs-lease:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#1201] / [Intel XE#1234])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_lease@master-vs-lease.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_lease@master-vs-lease.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#650]) +6 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][33] -> [FAIL][34] ([Intel XE#616]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][35] ([Intel XE#324])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#361])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#1201]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#870])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#294])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#327])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][51] -> [DMESG-WARN][52] ([Intel XE#1214]) +4 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#1201] / [Intel XE#455])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_vrr@negative-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1123] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1126] / [Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][58] -> [TIMEOUT][59] ([Intel XE#1473] / [Intel XE#392])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1068])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][62] -> [TIMEOUT][63] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) +1 other test timeout
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][64] -> [INCOMPLETE][65] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr-invalidate.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][68] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#1192] / [Intel XE#1201])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#512])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#378])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_module_load@force-load.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#366])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][74] ([Intel XE#1162])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  
#### Possible fixes ####

  * {igt@kms_big_joiner@invalid-modeset-force-joiner}:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_big_joiner@invalid-modeset-force-joiner.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][78] +3 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][79] ([Intel XE#1214]) -> [PASS][80] +2 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#1204]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-dg2-set2:     [FAIL][85] ([Intel XE#1259]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][87] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [DMESG-WARN][89] ([Intel XE#1214] / [Intel XE#1329]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][91] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#1256]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#355]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_pm@d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][100] ([Intel XE#1201])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [FAIL][101] ([Intel XE#650]) -> [SKIP][102] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][104] ([Intel XE#1201] / [Intel XE#829])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][106] ([Intel XE#1201]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][107] ([Intel XE#1178]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#455])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][110] ([Intel XE#1178])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_content_protection@srm.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][112] ([Intel XE#1201])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [FAIL][113] ([Intel XE#581]) -> [DMESG-WARN][114] ([Intel XE#1214] / [Intel XE#282])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][115] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][116] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_cursor_legacy@single-move.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_cursor_legacy@single-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][118] ([Intel XE#1201]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][120] ([Intel XE#1201]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#1234])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][123] ([Intel XE#616]) -> [DMESG-FAIL][124] ([Intel XE#1162]) +1 other test dmesg-fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-WARN][125] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][126] ([Intel XE#324])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][127] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][128] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][129] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][132] ([Intel XE#1201])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][134] ([Intel XE#1201]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-FAIL][135] ([Intel XE#1162] / [Intel XE#1551]) -> [FAIL][136] ([Intel XE#1043] / [Intel XE#845])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_pm@s4-basic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [FAIL][137] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][138] ([Intel XE#1162])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@s4-exec-after.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@xe_pm@s4-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7806 -> IGTPW_11014
  * Linux: xe-1078-47b56114d9fd714a477581fbba985e0d98053f80 -> xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223

  IGTPW_11014: 11014
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1078-47b56114d9fd714a477581fbba985e0d98053f80: 47b56114d9fd714a477581fbba985e0d98053f80
  xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223: 64a24a7dc774886c660a412a0d12c02f4bfec223

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132291v2/index.html

--===============8501362854529880584==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_capture: Fix many-* subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132291/">https://patchwork.freedesktop.org/series/132291/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132291v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132291v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7806_full -&gt; XEIGTPW_11014_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11014_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-65536:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_addfb_basic@bad-pitch-65536.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@master-vs-lease:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_lease@master-vs-lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_lease@master-vs-lease.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@xe_pm@s4-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@invalid-modeset-force-joiner}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_big_joiner@invalid-modeset-force-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-435/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_pm@s4-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-433/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@s4-exec-after.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11014/shard-dg2-464/igt@xe_pm@s4-exec-after.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGTPW_11014</li>
<li>Linux: xe-1078-47b56114d9fd714a477581fbba985e0d98053f80 -&gt; xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223</li>
</ul>
<p>IGTPW_11014: 11014<br />
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1078-47b56114d9fd714a477581fbba985e0d98053f80: 47b56114d9fd714a477581fbba985e0d98053f80<br />
  xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223: 64a24a7dc774886c660a412a0d12c02f4bfec223</p>

</body>
</html>

--===============8501362854529880584==--

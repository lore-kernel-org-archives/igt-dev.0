Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66B5C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 02:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF08310F0B7;
	Fri, 12 Apr 2024 02:36:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327FE10F0B7;
 Fri, 12 Apr 2024 02:36:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0637134043446091485=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_benchmarks/kms=5Ffb=5Fstress?=
 =?utf-8?q?=3A_benchmark_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arthur Grillo" <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Apr 2024 02:36:33 -0000
Message-ID: <171288939319.1353801.2867724158256799949@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
In-Reply-To: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
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

--===============0637134043446091485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/kms_fb_stress: benchmark formats
URL   : https://patchwork.freedesktop.org/series/132328/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7806_full -> XEIGTPW_11012_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11012_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11012_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11012_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11012_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][3] ([Intel XE#1548])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-dg2-set2:     [PASS][4] -> [SKIP][5] ([Intel XE#1201] / [i915#6077]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-999.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][6] ([Intel XE#650]) +10 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1185] / [Intel XE#1201]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#1201]) +14 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#610])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +84 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#616]) +9 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#307])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#1178])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][23] ([Intel XE#1162]) +1 other test dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-dg2-set2:     [PASS][24] -> [FAIL][25] ([Intel XE#581])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][26] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1200] / [Intel XE#1214])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][35] ([Intel XE#1214]) +10 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1235])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1214]) +5 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [i915#5274])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#1201] / [Intel XE#687])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_getfb@getfb2-handle-zero.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][45] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#1234])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#1211])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1201] / [Intel XE#1211])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prop_blob@blob-prop-core:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#780])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_prop_blob@blob-prop-core.html

  * igt@kms_prop_blob@invalid-set-prop:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#1201] / [Intel XE#780])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_prop_blob@invalid-set-prop.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_prop_blob@invalid-set-prop.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#1201] / [Intel XE#829]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#327])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_sequence@queue-busy:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1201] / [Intel XE#1234])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_sequence@queue-busy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_sequence@queue-busy.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][59] -> [DMESG-WARN][60] ([Intel XE#1162] / [Intel XE#1214])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1123] / [Intel XE#1201])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#1473])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][65] -> [TIMEOUT][66] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#1068])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][69] -> [TIMEOUT][70] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) +1 other test timeout
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][71] -> [TIMEOUT][72] ([Intel XE#1261] / [Intel XE#1356])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][73] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#512])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#378])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][78] -> [INCOMPLETE][79] ([Intel XE#1044] / [Intel XE#1195])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_module_load@many-reload.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-dg2-set2:     [PASS][80] -> [FAIL][81] ([Intel XE#1221])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_pm@d3-mmap-vram.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_pm@d3-mmap-vram.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#366])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#355])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@d3hot-multiple-execs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#1043] / [Intel XE#845])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_pm@s4-basic-exec.html

  
#### Possible fixes ####

  * {igt@kms_big_joiner@invalid-modeset-force-joiner}:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_big_joiner@invalid-modeset-force-joiner.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][88] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][89] +4 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][90] ([Intel XE#1214]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][92] ([Intel XE#1204]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_pm_rpm@cursor.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_pm_rpm@cursor.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][96] ([Intel XE#771] / [Intel XE#899]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][98] ([Intel XE#899]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#1259]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [FAIL][106] ([Intel XE#1256]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][108] ([Intel XE#355]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#829])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][117] ([Intel XE#1201])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#1234])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][121] ([Intel XE#1201])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][122] ([Intel XE#1178]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#455])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_content_protection@atomic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][125] ([Intel XE#1201])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][127] ([Intel XE#1178])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_content_protection@srm.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_content_protection@srm.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#581]) -> [DMESG-WARN][129] ([Intel XE#1214] / [Intel XE#282])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][130] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][131] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][132] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][133] ([Intel XE#1201])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][135] ([Intel XE#1201])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][137] ([Intel XE#1201]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#651])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#1234])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][143] ([Intel XE#1201]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#616]) -> [DMESG-FAIL][145] ([Intel XE#1162]) +1 other test dmesg-fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-FAIL][146] ([Intel XE#324]) -> [DMESG-WARN][147] ([Intel XE#1214] / [Intel XE#324]) +2 other tests dmesg-warn
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][148] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][149] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][150] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][151] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][152] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][153] ([Intel XE#909])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][154] ([Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][155] ([Intel XE#909])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201]) -> [INCOMPLETE][157] ([Intel XE#1195] / [Intel XE#909])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][159] ([Intel XE#1201]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-render.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_rmfb@close-fd:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#294]) -> [SKIP][161] ([Intel XE#1201])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_rmfb@close-fd.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_rmfb@close-fd.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#829])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][165] ([Intel XE#1201]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][166] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][167] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-FAIL][168] ([Intel XE#1162] / [Intel XE#1551]) -> [FAIL][169] ([Intel XE#1043] / [Intel XE#845])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_pm@s4-basic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][171] ([Intel XE#1162])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@s4-exec-after.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_pm@s4-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1185]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
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
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7806 -> IGTPW_11012
  * Linux: xe-1078-47b56114d9fd714a477581fbba985e0d98053f80 -> xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223

  IGTPW_11012: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11012/index.html
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1078-47b56114d9fd714a477581fbba985e0d98053f80: 47b56114d9fd714a477581fbba985e0d98053f80
  xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223: 64a24a7dc774886c660a412a0d12c02f4bfec223

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132328v1/index.html

--===============0637134043446091485==
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
<tr><td><b>Series:</b></td><td>benchmarks/kms_fb_stress: benchmark formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132328/">https://patchwork.freedesktop.org/series/132328/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132328v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132328v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7806_full -&gt; XEIGTPW_11012_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11012_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11012_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11012_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s2idle-d3hot-basic-exec:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@xe_pm@s2idle-d3hot-basic-exec.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11012_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185">Intel XE#1185</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_cursor_edge_walk@64x64-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_cursor_edge_walk@64x64-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200">Intel XE#1200</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_getfb@getfb2-handle-zero.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_getfb@getfb2-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-core:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_prop_blob@blob-prop-core.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_prop_blob@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_prop_blob@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_sequence@queue-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_sequence@queue-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_pm@d3-mmap-vram.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_pm@d3-mmap-vram.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_pm@d3hot-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@invalid-modeset-force-joiner}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-434/igt@kms_big_joiner@invalid-modeset-force-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_rmfb@close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_rmfb@close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-434/igt@xe_pm@s4-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-464/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7806/shard-dg2-463/igt@xe_pm@s4-exec-after.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11012/shard-dg2-436/igt@xe_pm@s4-exec-after.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGTPW_11012</li>
<li>Linux: xe-1078-47b56114d9fd714a477581fbba985e0d98053f80 -&gt; xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223</li>
</ul>
<p>IGTPW_11012: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11012/index.html<br />
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1078-47b56114d9fd714a477581fbba985e0d98053f80: 47b56114d9fd714a477581fbba985e0d98053f80<br />
  xe-1079-64a24a7dc774886c660a412a0d12c02f4bfec223: 64a24a7dc774886c660a412a0d12c02f4bfec223</p>

</body>
</html>

--===============0637134043446091485==--

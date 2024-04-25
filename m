Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEEFC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 15:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713F611A53E;
	Thu, 25 Apr 2024 15:18:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5211A53E;
 Thu, 25 Apr 2024 15:18:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7713804852422064795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe=5Fvm=3A_Always?=
 =?utf-8?q?_have_at_least_2_pages_bound_in_mmap_hammer_sections?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Apr 2024 15:18:03 -0000
Message-ID: <171405828335.1667640.5046654777010121344@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <f64507be1d789da9c6a22ece15e88d0f7d4a147c.1713994566.git.jagmeet.randhawa@intel.com>
In-Reply-To: <f64507be1d789da9c6a22ece15e88d0f7d4a147c.1713994566.git.jagmeet.randhawa@intel.com>
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

--===============7713804852422064795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Always have at least 2 pages bound in mmap hammer sections
URL   : https://patchwork.freedesktop.org/series/132869/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7823_full -> XEIGTPW_11066_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11066_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11066_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11066_full prevented too many machines from booting.

  Missing    (2): shard-adlp shard-lnl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11066_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11066_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1201] / [i915#6077])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#829])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1214]) +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#610])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +86 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1178])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#307])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][22] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#650]) +43 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#658])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#1201]) +16 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_lease@invalid-create-leases.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_multiple@tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [FAIL][34] ([Intel XE#361]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#870])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#1203])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#780])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1122] / [Intel XE#1201])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#327])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#756])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#1050])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1126] / [Intel XE#1201])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][50] -> [TIMEOUT][51] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#378])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1337])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1173]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#355])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_pm@d3hot-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][58] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2-set2:     [SKIP][60] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cdclk@plane-scaling.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][64] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][65] +5 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][66] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][68] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][70] ([Intel XE#1201]) -> [PASS][71] +4 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-dg2-set2:     [INCOMPLETE][72] ([Intel XE#1195]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_plane_multiple@tiling-none.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][76] ([Intel XE#771] / [Intel XE#899]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][78] ([Intel XE#899]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][80] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][82] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][84] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
    - shard-dg2-set2:     [ABORT][86] ([Intel XE#1304]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_module_load@many-reload.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [DMESG-FAIL][92] ([Intel XE#1162] / [Intel XE#1548]) -> [DMESG-FAIL][93] ([Intel XE#1548])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][95] ([Intel XE#1201] / [Intel XE#829])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][97] ([Intel XE#1201] / [Intel XE#607])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [FAIL][100] ([Intel XE#650]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#829])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][103] ([Intel XE#1201] / [Intel XE#829])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][105] ([Intel XE#1201]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][107] ([Intel XE#1178])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][109] ([Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][111] ([Intel XE#1214] / [Intel XE#282])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][113] ([Intel XE#1201])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#455] / [i915#3804]) -> [SKIP][115] ([Intel XE#1201] / [i915#3804])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][117] ([Intel XE#1201]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][119] ([Intel XE#1201]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#1234])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][127] ([Intel XE#1201]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#616]) -> [SKIP][129] ([Intel XE#1201])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][131] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][133] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][135] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][137] ([Intel XE#1201]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#829])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][142] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931]) -> [INCOMPLETE][143] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#1473]) -> [ABORT][145] ([Intel XE#1304])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][146] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][147] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][149] ([Intel XE#1162] / [Intel XE#1551])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7823 -> IGTPW_11066
  * Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -> xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8

  IGTPW_11066: 9c620055b8229590a2316f11d8eb2a908bb0b195 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132869v1/index.html

--===============7713804852422064795==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Always have at least 2 pages bound in mmap hammer sections</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132869/">https://patchwork.freedesktop.org/series/132869/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132869v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132869v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7823_full -&gt; XEIGTPW_11066_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11066_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11066_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11066_full prevented too many machines from booting.</p>
<p>Missing    (2): shard-adlp shard-lnl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11066_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11066_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_lease@invalid-create-leases.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_multiple@tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_plane_multiple@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-lifetime:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_prop_blob@blob-prop-lifetime.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_cdclk@plane-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_plane_multiple@tiling-none.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@kms_plane_multiple@tiling-none.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11066/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7823 -&gt; IGTPW_11066</li>
<li>Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -&gt; xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8</li>
</ul>
<p>IGTPW_11066: 9c620055b8229590a2316f11d8eb2a908bb0b195 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7<br />
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8</p>

</body>
</html>

--===============7713804852422064795==--

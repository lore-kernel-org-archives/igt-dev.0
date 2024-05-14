Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CDCC25B79
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 00:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8E510E2F9;
	Tue, 14 May 2024 00:49:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63A410E12C;
 Tue, 14 May 2024 00:49:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6327930792228829686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/3=5D_tests/intel/xe=5Fpm=3A_Rename_and_clarify_mocs=5Fsuspen?=
 =?utf-8?q?d=5Fresume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 May 2024 00:49:12 -0000
Message-ID: <171564775280.2095830.4929537543373542912@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
In-Reply-To: <20240513162435.952578-1-lucas.demarchi@intel.com>
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

--===============6327930792228829686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe_pm: Rename and clarify mocs_suspend_resume
URL   : https://patchwork.freedesktop.org/series/133562/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7850_full -> XEIGTPW_11135_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11135_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11135_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11135_full prevented too many machines from booting.

  Missing    (2): shard-adlp shard-lnl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11135_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pm@mocs-rpm} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@xe_pm@mocs-rpm.html

  
New tests
---------

  New tests have been introduced between XEIGT_7850_full and XEIGTPW_11135_full:

### New IGT tests (1) ###

  * igt@xe_pm@mocs-rpm:
    - Statuses : 1 fail(s)
    - Exec time: [10.53] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11135_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - shard-dg2-set2:     [PASS][2] -> [SKIP][3] ([Intel XE#1201] / [i915#6077]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1124] / [Intel XE#1201])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#787]) +49 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][7] ([Intel XE#616]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][9] ([Intel XE#1178])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1195]) +2 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#282]) +8 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#877])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_cursor_legacy@single-move@pipe-b.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#776])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#1201]) +12 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@busy-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#361])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_psr@pr-dpms.html

  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#294])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][27] -> [FAIL][28] ([Intel XE#899])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_universal_plane@universal-plane-functional:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_universal_plane@universal-plane-functional.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_universal_plane@universal-plane-functional.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1195] / [Intel XE#1473])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1214])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_module_load@unload.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_module_load@unload.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][36] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][39] +9 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][40] ([Intel XE#1201]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dp_aux_dev.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [INCOMPLETE][42] ([Intel XE#1195]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][44] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][45] +12 other tests pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][46] ([Intel XE#899]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][48] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][50] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][52] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [FAIL][54] ([Intel XE#1256]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [TIMEOUT][56] ([Intel XE#1093] / [Intel XE#1206]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@xe_module_load@many-reload.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3-mmap-system:
    - shard-dg2-set2:     [FAIL][58] ([Intel XE#1221]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_pm@d3-mmap-system.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][61] +8 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * {igt@xe_pm@s4-mocs}:
    - shard-dg2-set2:     [FAIL][62] ([Intel XE#1840]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_pm@s4-mocs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [DMESG-FAIL][64] ([Intel XE#1162] / [Intel XE#1548]) -> [DMESG-FAIL][65] ([Intel XE#1548])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [DMESG-FAIL][66] ([Intel XE#1345] / [Intel XE#1548]) -> [DMESG-FAIL][67] ([Intel XE#1162] / [Intel XE#1345] / [Intel XE#1548])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][68] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][69] ([Intel XE#1201] / [Intel XE#829])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][70] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][71] ([Intel XE#1124] / [Intel XE#1201])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][72] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][73] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][75] ([Intel XE#1201])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_big_joiner@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][77] ([Intel XE#1201] / [Intel XE#346])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][79] ([Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][81] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][83] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][85] ([Intel XE#1201] / [Intel XE#306])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][87] ([Intel XE#1201]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][91] ([Intel XE#1201] / [Intel XE#455])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_content_protection@content-type-change.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][93] ([Intel XE#1178])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_content_protection@legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][94] ([Intel XE#1162]) -> [FAIL][95] ([Intel XE#616]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [DMESG-WARN][96] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][97] ([Intel XE#1201])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][98] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][99] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_cursor_legacy@single-move.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_cursor_legacy@single-move.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201] / [i915#3804]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#455] / [i915#3804])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][103] ([Intel XE#1201]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dsc@dsc-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][105] ([Intel XE#1201]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][107] ([Intel XE#1201])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#1235])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][113] ([Intel XE#1201])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][117] ([Intel XE#1201]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#829])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#1226]) -> [FAIL][123] ([Intel XE#361])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][125] ([Intel XE#1201]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][131] ([Intel XE#1201])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][132] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][133] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][135] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1840]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1840
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7850 -> IGTPW_11135
  * Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -> xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5

  IGTPW_11135: 0cbcb9a97b616168c1ac621e9ecde25f2286364f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7850: 7850
  xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e
  xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html

--===============6327930792228829686==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe_pm: Rename and clarify mocs_suspend_resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133562/">https://patchwork.freedesktop.org/series/133562/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7850_full -&gt; XEIGTPW_11135_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11135_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11135_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11135_full prevented too many machines from booting.</p>
<p>Missing    (2): shard-adlp shard-lnl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11135_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_pm@mocs-rpm} (NEW):<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@xe_pm@mocs-rpm.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7850_full and XEIGTPW_11135_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_pm@mocs-rpm:<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [10.53] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11135_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_addfb_basic@addfb25-bad-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_universal_plane@universal-plane-functional.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_universal_plane@universal-plane-functional.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093">Intel XE#1093</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@xe_pm@d3-mmap-system.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s4-mocs}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_pm@s4-mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1840">Intel XE#1840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345">Intel XE#1345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345">Intel XE#1345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-434/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-434/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-435/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7850/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/shard-dg2-436/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7850 -&gt; IGTPW_11135</li>
<li>Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -&gt; xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5</li>
</ul>
<p>IGTPW_11135: 0cbcb9a97b616168c1ac621e9ecde25f2286364f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7850: 7850<br />
  xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e<br />
  xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5</p>

</body>
</html>

--===============6327930792228829686==--

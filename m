Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDFAC48260
	for <igt-dev@archiver.kernel.org>; Sat, 17 Feb 2024 00:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA0610ECF2;
	Sat, 17 Feb 2024 00:12:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DCB10E7AF;
 Sat, 17 Feb 2024 00:12:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0659975518815656695=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Intel_Xe_OA_IGT=27s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 17 Feb 2024 00:12:31 -0000
Message-ID: <170812875140.54115.8685270465121792927@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240216231703.845644-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240216231703.845644-1-ashutosh.dixit@intel.com>
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

--===============0659975518815656695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's
URL   : https://patchwork.freedesktop.org/series/130033/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7716_BAT -> XEIGTPW_10690_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10690_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10690_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10690_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +150 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +171 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +201 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +184 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          [SKIP][9] ([i915#6077]) -> [FAIL][10] +30 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#623]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][13] ([i915#6077]) -> [FAIL][14] +30 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          [SKIP][15] ([Intel XE#1024] / [Intel XE#782]) -> [FAIL][16] +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         [SKIP][17] ([Intel XE#1024] / [Intel XE#782]) -> [FAIL][18] +5 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][19] ([Intel XE#1024] / [Intel XE#784]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-pvc-2:          [SKIP][21] ([Intel XE#1024] / [Intel XE#784]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#455]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][25] ([Intel XE#455]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          [SKIP][27] ([Intel XE#1024] / [Intel XE#947]) -> [FAIL][28] +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][29] ([Intel XE#1024] / [Intel XE#947]) -> [FAIL][30] +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          [SKIP][31] ([Intel XE#540]) -> [FAIL][32] +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
    - bat-atsm-2:         [SKIP][33] ([Intel XE#540]) -> [FAIL][34] +3 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][35] ([i915#5274]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          [SKIP][37] ([Intel XE#1024] / [Intel XE#783]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [FAIL][39] ([Intel XE#616]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         [SKIP][41] ([Intel XE#1024] / [Intel XE#783]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#417]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlp-7:         [SKIP][45] ([Intel XE#417]) -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         [SKIP][47] ([i915#1836]) -> [FAIL][48] +6 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          [SKIP][49] ([Intel XE#829]) -> [FAIL][50] +6 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          [SKIP][51] ([Intel XE#780]) -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_prop_blob@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_prop_blob@basic.html
    - bat-atsm-2:         [SKIP][53] ([Intel XE#780]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_prop_blob@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][55] ([Intel XE#1000]) -> [FAIL][56] +3 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
    - bat-adlp-7:         [SKIP][57] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][58] +15 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][59] ([Intel XE#482]) -> [FAIL][60] +3 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][61] ([Intel XE#392]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][63] ([Intel XE#688]) -> [FAIL][64] +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][65] ([Intel XE#288]) -> [FAIL][66] +32 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][67] ([Intel XE#288]) -> [FAIL][68] +32 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][69] ([Intel XE#288]) -> [FAIL][70] +32 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          [SKIP][71] ([Intel XE#255]) -> [FAIL][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
    - bat-dg2-oem2:       [SKIP][73] ([Intel XE#255]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         [SKIP][75] ([Intel XE#255]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][77] ([Intel XE#532]) -> [FAIL][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_intel_bb@render.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][79] ([Intel XE#1008]) -> [FAIL][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_mmap@vram.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          [SKIP][81] ([Intel XE#977]) -> [FAIL][82] +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][83] ([Intel XE#977]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         [SKIP][85] ([Intel XE#977]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][87] ([Intel XE#977]) -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][89] ([Intel XE#979]) -> [FAIL][90] +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][91] ([Intel XE#979]) -> [FAIL][92] +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-atsm-2:         [SKIP][93] ([Intel XE#979]) -> [FAIL][94] +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
    - bat-pvc-2:          [SKIP][95] ([Intel XE#979]) -> [FAIL][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          [SKIP][97] ([Intel XE#531]) -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr-cursor-plane-move}:
    - bat-pvc-2:          [SKIP][99] ([Intel XE#1024]) -> [FAIL][100] +2 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-dg2-oem2:       [SKIP][101] ([Intel XE#929]) -> [FAIL][102] +2 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-adlp-7:         [PASS][103] -> [FAIL][104] +8 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * {igt@kms_psr@psr-primary-page-flip}:
    - bat-atsm-2:         [SKIP][105] ([Intel XE#1024]) -> [FAIL][106] +2 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * {igt@xe_create@create-invalid-mbz}:
    - bat-atsm-2:         [PASS][107] -> [FAIL][108] +5 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_create@create-invalid-mbz.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_create@create-invalid-mbz.html

  * {igt@xe_exec_atomic@basic-dec-all}:
    - bat-pvc-2:          [PASS][109] -> [FAIL][110] +3 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html
    - bat-dg2-oem2:       [PASS][111] -> [FAIL][112] +5 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html

  * {igt@xe_gt_freq@freq_range_idle}:
    - bat-pvc-2:          [SKIP][113] ([Intel XE#1021]) -> [FAIL][114] +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7716 -> IGTPW_10690
  * Linux: xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8 -> xe-794-b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9

  IGTPW_10690: 10690
  IGT_7716: 7716
  xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8: 55724f2a1075fcace79fd49ea0c2b7b5600d7ba8
  xe-794-b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9: b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/index.html

--===============0659975518815656695==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7716_BAT -&gt; XEIGTPW_10690_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10690_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10690_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10690_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_compute@compute-square.html">FAIL</a> +150 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +171 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +201 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +184 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_prop_blob@basic.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_prop_blob@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_intel_bb@render.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">FAIL</a> +1 other test fail</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr-cursor-plane-move}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-primary-page-flip}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-invalid-mbz}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_atomic@basic-dec-all}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_range_idle}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10690/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7716 -&gt; IGTPW_10690</li>
<li>Linux: xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8 -&gt; xe-794-b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9</li>
</ul>
<p>IGTPW_10690: 10690<br />
  IGT_7716: 7716<br />
  xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8: 55724f2a1075fcace79fd49ea0c2b7b5600d7ba8<br />
  xe-794-b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9: b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9</p>

</body>
</html>

--===============0659975518815656695==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E17CCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 13:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25C810E6B3;
	Tue,  7 Oct 2025 13:12:06 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EF510E696;
 Tue,  7 Oct 2025 13:12:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1450158518686754817=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/intel=5Fdevice=5Finfo?=
 =?utf-8?q?=3A_get_the_xe_=2Egraphics=5Frel_from_GMD=5FID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Oct 2025 13:12:06 -0000
Message-ID: <175984272614.14049.1054264543349721862@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007050554.340485-1-x.wang@intel.com>
In-Reply-To: <20251007050554.340485-1-x.wang@intel.com>
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

--===============1450158518686754817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_device_info: get the xe .graphics_rel from GMD_ID
URL   : https://patchwork.freedesktop.org/series/155527/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8575_BAT -> XEIGTPW_13865_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13865_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13865_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13865_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +153 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +198 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_intel_bb@simple-bb-ctx:
    - bat-adlp-vm:        [PASS][5] -> [FAIL][6] +134 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +203 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#623]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][11] ([i915#6077]) -> [FAIL][12] +30 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         [SKIP][13] ([Intel XE#1024] / [Intel XE#782]) -> [FAIL][14] +5 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][15] ([Intel XE#455]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#455]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         [SKIP][19] ([Intel XE#1024] / [Intel XE#784]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-atsm-2:         [SKIP][21] ([Intel XE#1024] / [Intel XE#947]) -> [FAIL][22] +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][23] ([Intel XE#1024] / [Intel XE#783]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         [SKIP][25] ([Intel XE#540]) -> [FAIL][26] +3 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][27] ([i915#1836]) -> [FAIL][28] +6 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][29] ([Intel XE#780]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_prop_blob@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [FAIL][32] +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][33] ([Intel XE#1024] / [Intel XE#1406]) -> [FAIL][34] +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#1091] / [Intel XE#2849]) -> [FAIL][36] +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][37] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [FAIL][38] +9 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        [SKIP][39] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [FAIL][40] +9 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         [SKIP][41] ([Intel XE#688]) -> [FAIL][42] +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        [SKIP][43] ([Intel XE#688]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][45] ([Intel XE#288]) -> [FAIL][46] +32 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][47] ([Intel XE#288]) -> [FAIL][48] +32 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
    - bat-adlp-vm:        [SKIP][49] ([Intel XE#288] / [Intel XE#5561]) -> [FAIL][50] +32 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][51] ([Intel XE#288] / [Intel XE#5561]) -> [FAIL][52] +32 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][53] ([Intel XE#255]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         [SKIP][55] ([Intel XE#255]) -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][57] ([Intel XE#1008] / [Intel XE#5591]) -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_mmap@vram.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_mmap@vram.html
    - bat-adlp-vm:        [SKIP][59] ([Intel XE#1008] / [Intel XE#5591]) -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_mmap@vram.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        [SKIP][61] ([Intel XE#977]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         [SKIP][63] ([Intel XE#977]) -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][65] ([Intel XE#977]) -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][67] ([Intel XE#977]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][69] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          [SKIP][71] ([Intel XE#1420]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][73] ([Intel XE#1420]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][75] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][77] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vm:        [SKIP][79] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][81] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][83] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][85] ([Intel XE#2245]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][87] ([Intel XE#2245]) -> [SKIP][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][89] ([Intel XE#977]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][91] ([Intel XE#977]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][93] ([Intel XE#979]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][95] ([Intel XE#2236]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][97] ([Intel XE#2236]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         [SKIP][99] ([Intel XE#979]) -> [FAIL][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][101] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-vm:        [SKIP][103] ([Intel XE#979]) -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       [SKIP][105] ([Intel XE#979]) -> [FAIL][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         [SKIP][107] ([Intel XE#979]) -> [FAIL][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       [SKIP][109] ([Intel XE#3342]) -> [FAIL][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_sysfs@read-all-entries}:
    - bat-adlp-vm:        [PASS][111] -> [FAIL][112] +3 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@core_sysfs@read-all-entries.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@core_sysfs@read-all-entries.html

  * {igt@xe_debugfs@xe-forcewake}:
    - bat-adlp-7:         [PASS][113] -> [FAIL][114] +3 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html
    - bat-dg2-oem2:       [PASS][115] -> [FAIL][116] +3 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html
    - bat-atsm-2:         [PASS][117] -> [FAIL][118] +3 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html

  * igt@xe_pat@pat-index-xelp:
    - {bat-ptl-2}:        [SKIP][119] ([Intel XE#5771]) -> [SKIP][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - {bat-ptl-1}:        [SKIP][121] ([Intel XE#5771]) -> [SKIP][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
    - {bat-ptl-vm}:       [SKIP][123] ([Intel XE#5771]) -> [SKIP][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - {bat-ptl-1}:        [SKIP][125] ([Intel XE#5780]) -> [SKIP][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - {bat-ptl-vm}:       [SKIP][127] ([Intel XE#5780]) -> [SKIP][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - {bat-ptl-2}:        [SKIP][129] ([Intel XE#5780]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13865_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xehpc:
    - {bat-ptl-vm}:       [SKIP][131] ([Intel XE#5777]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - {bat-ptl-2}:        [SKIP][133] ([Intel XE#5777]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - {bat-ptl-1}:        [SKIP][135] ([Intel XE#5777]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_8575 -> IGTPW_13865
  * Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -> xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3

  IGTPW_13865: 13865
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf
  xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/index.html

--===============1450158518686754817==
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
<tr><td><b>Series:</b></td><td>lib/intel_device_info: get the xe .graphics_rel from GMD_ID</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155527/">https://patchwork.freedesktop.org/series/155527/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8575_BAT -&gt; XEIGTPW_13865_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13865_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13865_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13865_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +153 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +198 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb-ctx:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +134 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> +203 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_prop_blob@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_evict@evict-beng-small.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +32 other tests fail</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_sysfs@read-all-entries}:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-vm/igt@core_sysfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-vm/igt@core_sysfs@read-all-entries.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_debugfs@xe-forcewake}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html">FAIL</a> +3 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html">FAIL</a> +3 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13865_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13865/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8575 -&gt; IGTPW_13865</li>
<li>Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -&gt; xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3</li>
</ul>
<p>IGTPW_13865: 13865<br />
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf<br />
  xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3</p>

</body>
</html>

--===============1450158518686754817==--

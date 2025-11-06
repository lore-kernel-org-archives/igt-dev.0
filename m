Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04046CCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 21:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B02E10E9D6;
	Thu,  6 Nov 2025 21:04:23 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8318C10E9D6;
 Thu,  6 Nov 2025 21:04:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2221842141597289682=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/xe/xe=5Fquery=3A_implem?=
 =?utf-8?q?ent_few_query_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 21:04:22 -0000
Message-ID: <176246306252.27760.5509639511885366361@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
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

--===============2221842141597289682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: implement few query helpers
URL   : https://patchwork.freedesktop.org/series/157140/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8613_BAT -> XEIGTPW_14013_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14013_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14013_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14013_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +157 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +202 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_intel_bb@reset-bb:
    - bat-ptl-vm:         [PASS][5] -> [FAIL][6] +171 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html

  * igt@xe_intel_bb@simple-bb-ctx:
    - bat-adlp-vm:        [PASS][7] -> [FAIL][8] +138 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] +207 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#623]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][13] ([i915#6077]) -> [FAIL][14] +30 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         [SKIP][15] ([Intel XE#1024] / [Intel XE#782]) -> [FAIL][16] +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][17] ([Intel XE#455]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#455]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         [SKIP][21] ([Intel XE#1024] / [Intel XE#784]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-atsm-2:         [SKIP][23] ([Intel XE#1024] / [Intel XE#947]) -> [FAIL][24] +3 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][25] ([Intel XE#1024] / [Intel XE#783]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         [SKIP][27] ([Intel XE#540]) -> [FAIL][28] +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][29] ([i915#1836]) -> [FAIL][30] +6 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][31] ([Intel XE#780]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_prop_blob@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [FAIL][34] +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][35] ([Intel XE#1024] / [Intel XE#1406]) -> [FAIL][36] +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#1091] / [Intel XE#2849]) -> [FAIL][38] +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][39] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [FAIL][40] +9 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         [SKIP][41] ([Intel XE#5764]) -> [FAIL][42] +10 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        [SKIP][43] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [FAIL][44] +9 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         [SKIP][45] ([Intel XE#688]) -> [FAIL][46] +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        [SKIP][47] ([Intel XE#688]) -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][49] ([Intel XE#288]) -> [FAIL][50] +32 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][51] ([Intel XE#288]) -> [FAIL][52] +32 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
    - bat-adlp-vm:        [SKIP][53] ([Intel XE#288] / [Intel XE#5561]) -> [FAIL][54] +32 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][55] ([Intel XE#288] / [Intel XE#5561]) -> [FAIL][56] +32 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][57] ([Intel XE#255]) -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         [SKIP][59] ([Intel XE#255]) -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         [SKIP][61] ([Intel XE#5776]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_mmap@vram.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_mmap@vram.html
    - bat-adlp-7:         [SKIP][63] ([Intel XE#1008] / [Intel XE#5591]) -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_mmap@vram.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_mmap@vram.html
    - bat-adlp-vm:        [SKIP][65] ([Intel XE#1008] / [Intel XE#5591]) -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_mmap@vram.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        [SKIP][67] ([Intel XE#977]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         [SKIP][69] ([Intel XE#977]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][71] ([Intel XE#977]) -> [FAIL][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][73] ([Intel XE#977]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         [SKIP][75] ([Intel XE#5777]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][77] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vm:        [SKIP][79] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][81] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][83] ([Intel XE#2838] / [Intel XE#979]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         [SKIP][85] ([Intel XE#5771]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         [SKIP][87] ([Intel XE#5780]) -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         [SKIP][89] ([Intel XE#979]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-vm:        [SKIP][91] ([Intel XE#979]) -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       [SKIP][93] ([Intel XE#979]) -> [FAIL][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         [SKIP][95] ([Intel XE#979]) -> [FAIL][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       [SKIP][97] ([Intel XE#3342]) -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
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
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
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

  * IGT: IGT_8613 -> IGTPW_14013
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-4060-9deffe4baace482f9414f36f53f3385868533fd6

  IGTPW_14013: 14013
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-4060-9deffe4baace482f9414f36f53f3385868533fd6: 9deffe4baace482f9414f36f53f3385868533fd6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/index.html

--===============2221842141597289682==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: implement few query helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157140/">https://patchwork.freedesktop.org/series/157140/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8613_BAT -&gt; XEIGTPW_14013_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14013_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14013_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14013_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +157 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +202 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@reset-bb:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html">FAIL</a> +171 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb-ctx:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +138 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> +207 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_prop_blob@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_evict@evict-beng-small.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +32 other tests fail</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_mmap@vram.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14013/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8613 -&gt; IGTPW_14013</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-4060-9deffe4baace482f9414f36f53f3385868533fd6</li>
</ul>
<p>IGTPW_14013: 14013<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad<br />
  xe-4060-9deffe4baace482f9414f36f53f3385868533fd6: 9deffe4baace482f9414f36f53f3385868533fd6</p>

</body>
</html>

--===============2221842141597289682==--

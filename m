Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9250D149E9
	for <igt-dev@archiver.kernel.org>; Sat, 26 Oct 2024 01:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C63B10E0DF;
	Sat, 26 Oct 2024 01:47:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE18C10E0DF;
 Sat, 26 Oct 2024 01:47:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1316719037283771787=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_xe=5Fexec=5Fthreads=3A_wait_fo?=
 =?utf-8?q?r_all_submissions_to_complete?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 26 Oct 2024 01:47:55 -0000
Message-ID: <172990727590.1334319.6697303434507233723@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241026010102.1470944-1-fei.yang@intel.com>
In-Reply-To: <20241026010102.1470944-1-fei.yang@intel.com>
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

--===============1316719037283771787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_threads: wait for all submissions to complete
URL   : https://patchwork.freedesktop.org/series/140530/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8086_BAT -> XEIGTPW_11989_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11989_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11989_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11989_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-adlp-vf:        [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-bmg-2:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-bmg-1:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-lnl-2:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
    - bat-lnl-1:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11989_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][17] -> [FAIL][18] ([Intel XE#886]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3230])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
    - bat-bmg-2:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3230])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
    - bat-lnl-2:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#3230])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#3230])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][27] -> [DMESG-WARN][28] ([Intel XE#3230])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-atsm-2:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#3230])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-adlp-vf:        [PASS][31] -> [DMESG-WARN][32] ([Intel XE#3230])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-bmg-1:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#3230])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-lnl-1:          [PASS][35] -> [FAIL][36] ([Intel XE#3001])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-lnl-2:          [PASS][37] -> [FAIL][38] ([Intel XE#3001])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][39] -> [SKIP][40] ([Intel XE#1192]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          NOTRUN -> [SKIP][41] ([Intel XE#2229]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][42] -> [INCOMPLETE][43] ([Intel XE#2874]) +1 other test incomplete
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][44] ([Intel XE#2229])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][45] ([Intel XE#2229])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][46] -> [SKIP][47] ([Intel XE#1192]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         NOTRUN -> [SKIP][48] ([Intel XE#2229]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][49] ([Intel XE#2229]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-pvc-2:          NOTRUN -> [SKIP][50] ([Intel XE#2229]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-pvc-2:          [DMESG-WARN][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [DMESG-WARN][53] ([Intel XE#3230]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [DMESG-WARN][55] ([Intel XE#3230]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [DMESG-WARN][57] ([Intel XE#3230]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [DMESG-WARN][59] ([Intel XE#3230]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-2:          [DMESG-WARN][61] ([Intel XE#3230]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [DMESG-WARN][63] ([Intel XE#3230]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [DMESG-WARN][65] ([Intel XE#3230]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][67] ([Intel XE#1192]) -> [PASS][68] +2 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-pvc-2:          [SKIP][69] ([Intel XE#1192]) -> [PASS][70] +2 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [SKIP][71] ([Intel XE#1192]) -> [PASS][72] +2 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [SKIP][73] ([Intel XE#1192]) -> [PASS][74] +2 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [SKIP][75] ([Intel XE#1192]) -> [PASS][76] +2 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [SKIP][77] ([Intel XE#1192]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#3001]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8086 -> IGTPW_11989
  * Linux: xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e -> xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306

  IGTPW_11989: c07422cb4076cb84a8e6844f4cb9ab21ae9971cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/index.html

--===============1316719037283771787==
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
<tr><td><b>Series:</b></td><td>xe_exec_threads: wait for all submissions to complete</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140530/">https://patchwork.freedesktop.org/series/140530/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8086_BAT -&gt; XEIGTPW_11989_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11989_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11989_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11989_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11989_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001">Intel XE#3001</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001">Intel XE#3001</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11989/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8086 -&gt; IGTPW_11989</li>
<li>Linux: xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e -&gt; xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306</li>
</ul>
<p>IGTPW_11989: c07422cb4076cb84a8e6844f4cb9ab21ae9971cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e<br />
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306</p>

</body>
</html>

--===============1316719037283771787==--

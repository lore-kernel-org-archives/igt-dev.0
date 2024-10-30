Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E7ED74954
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 02:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59410E3D8;
	Wed, 30 Oct 2024 02:09:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142810E3D8;
 Wed, 30 Oct 2024 02:09:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7834465195199381395=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Ignore_more_warns_in_xe=5Fwedg?=
 =?utf-8?q?ed_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Oct 2024 02:09:05 -0000
Message-ID: <173025414565.1362390.14297663437728634134@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
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

--===============7834465195199381395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ignore more warns in xe_wedged tests (rev2)
URL   : https://patchwork.freedesktop.org/series/140511/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8088_BAT -> XEIGTPW_11997_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11997_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11997_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11997_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4] +5 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@xe_wedged@basic-wedged:
    - bat-atsm-2:         NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-atsm-2/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - bat-adlp-vf:        NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-atsm-2:         NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-pvc-2:          [SKIP][10] ([Intel XE#2849]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11997_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][12] -> [SKIP][13] ([Intel XE#1885])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][14] -> [SKIP][15] ([Intel XE#1885])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-bmg-1:          [PASS][16] -> [SKIP][17] ([Intel XE#3007]) +51 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][18] -> [SKIP][19] ([i915#2575]) +49 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-1:          [PASS][20] -> [SKIP][21] ([Intel XE#2231])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [PASS][22] -> [SKIP][23] ([Intel XE#2231])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_prop_blob@basic:
    - bat-bmg-2:          [PASS][24] -> [SKIP][25] ([Intel XE#3007]) +34 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_prop_blob@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_prop_blob@basic.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][26] -> [SKIP][27] ([Intel XE#1130]) +191 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][28] -> [SKIP][29] ([Intel XE#1130]) +191 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][30] -> [SKIP][31] ([Intel XE#1130]) +185 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][32] -> [SKIP][33] ([Intel XE#1192]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-2:          [PASS][34] -> [FAIL][35] ([Intel XE#3099]) +7 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][36] -> [FAIL][37] ([Intel XE#3099]) +7 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][38] -> [SKIP][39] ([Intel XE#1130]) +157 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_wedged@basic-wedged:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][40] ([Intel XE#1958])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_wedged@basic-wedged.html
    - bat-adlp-vf:        NOTRUN -> [DMESG-WARN][41] ([Intel XE#2919])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-vf/igt@xe_wedged@basic-wedged.html
    - bat-lnl-1:          NOTRUN -> [DMESG-WARN][42] ([Intel XE#2919] / [Intel XE#3119])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-1/igt@xe_wedged@basic-wedged.html
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][43] ([Intel XE#2919])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_wedged@basic-wedged.html
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][44] ([Intel XE#2919])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_wedged@basic-wedged.html
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][45] ([Intel XE#2919])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@xe_wedged@basic-wedged.html
    - bat-lnl-2:          NOTRUN -> [ABORT][46] ([Intel XE#3119])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-2/igt@xe_wedged@basic-wedged.html
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][47] ([Intel XE#2919])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - bat-pvc-2:          NOTRUN -> [SKIP][48] ([Intel XE#1130])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-bmg-2:          NOTRUN -> [SKIP][49] ([Intel XE#1130])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-bmg-1:          NOTRUN -> [SKIP][50] ([Intel XE#1130])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][51] ([Intel XE#1130])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][52] ([Intel XE#2496]) -> [PASS][53] +31 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][54] ([Intel XE#1861]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [DMESG-WARN][56] ([Intel XE#3295]) -> [SKIP][57] ([Intel XE#1885])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          [SKIP][58] ([i915#6077]) -> [SKIP][59] ([Intel XE#3059]) +30 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          [SKIP][60] ([Intel XE#2233]) -> [SKIP][61] ([Intel XE#3007])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          [SKIP][62] ([Intel XE#2233]) -> [SKIP][63] ([Intel XE#3007])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-oem2:       [SKIP][64] ([Intel XE#623]) -> [SKIP][65] ([i915#2575])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][66] ([Intel XE#2489]) -> [SKIP][67] ([Intel XE#3007]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-pvc-2:          [SKIP][68] ([Intel XE#1024] / [Intel XE#782]) -> [SKIP][69] ([Intel XE#3059]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          [SKIP][70] ([Intel XE#1024] / [Intel XE#784]) -> [SKIP][71] ([Intel XE#2469] / [Intel XE#2852])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_dsc@dsc-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_dsc@dsc-basic.html
    - bat-bmg-2:          [SKIP][72] ([Intel XE#2489]) -> [SKIP][73] ([Intel XE#2231] / [Intel XE#2890])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_dsc@dsc-basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_dsc@dsc-basic.html
    - bat-bmg-1:          [SKIP][74] ([Intel XE#2244]) -> [SKIP][75] ([Intel XE#2231] / [Intel XE#2890])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][76] ([Intel XE#455]) -> [SKIP][77] ([Intel XE#2231])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          [SKIP][78] ([Intel XE#2482]) -> [SKIP][79] ([Intel XE#3007]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          [SKIP][80] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][81] ([Intel XE#3059]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          [SKIP][82] ([Intel XE#540]) -> [SKIP][83] ([Intel XE#3059]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][84] ([i915#5274]) -> [SKIP][85] ([i915#2575])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          [SKIP][86] ([Intel XE#1024] / [Intel XE#783]) -> [SKIP][87] ([Intel XE#2469] / [Intel XE#2852])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-bmg-2:          [SKIP][88] ([Intel XE#2434] / [Intel XE#2548]) -> [SKIP][89] ([Intel XE#2231])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [DMESG-WARN][90] ([Intel XE#3295]) -> [SKIP][91] ([i915#2575])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-pvc-2:          [SKIP][92] ([Intel XE#829]) -> [SKIP][93] ([Intel XE#3059]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          [SKIP][94] ([Intel XE#780]) -> [SKIP][95] ([Intel XE#3059])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_prop_blob@basic.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][96] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][97] ([Intel XE#2231]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-pvc-2:          [SKIP][98] ([Intel XE#1024]) -> [SKIP][99] ([Intel XE#2469] / [Intel XE#2852]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          [SKIP][100] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][101] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-1:          [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][103] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-pvc-2:          [SKIP][104] ([Intel XE#2849]) -> [SKIP][105] ([Intel XE#3059])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-bmg-2:          [SKIP][106] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][107] ([Intel XE#3007]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-bmg-1:          [SKIP][108] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][109] ([Intel XE#3007]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       [SKIP][110] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][111] ([i915#2575]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [DMESG-WARN][112] ([Intel XE#3295]) -> [SKIP][113] ([Intel XE#1130])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][114] ([Intel XE#288]) -> [SKIP][115] ([Intel XE#1130]) +32 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-pvc-2:          [SKIP][116] ([Intel XE#1021]) -> [SKIP][117] ([Intel XE#1130]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          [SKIP][118] ([Intel XE#255]) -> [SKIP][119] ([Intel XE#1130])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
    - bat-dg2-oem2:       [SKIP][120] ([Intel XE#255]) -> [SKIP][121] ([Intel XE#1130])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][122] ([Intel XE#532]) -> [SKIP][123] ([Intel XE#1130])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_intel_bb@render.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          [SKIP][124] ([Intel XE#2229]) -> [FAIL][125] ([Intel XE#3099])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          [SKIP][126] ([Intel XE#2229]) -> [FAIL][127] ([Intel XE#3099])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          [SKIP][128] ([Intel XE#977]) -> [SKIP][129] ([Intel XE#1130]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][130] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][131] ([Intel XE#1130])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          [SKIP][132] ([Intel XE#1420]) -> [SKIP][133] ([Intel XE#1130])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][134] ([Intel XE#1420]) -> [SKIP][135] ([Intel XE#1130])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][136] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][137] ([Intel XE#1130])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][138] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][139] ([Intel XE#1130])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][140] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][141] ([Intel XE#1130])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          [SKIP][142] ([Intel XE#979]) -> [SKIP][143] ([Intel XE#1130])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][144] ([Intel XE#2236]) -> [SKIP][145] ([Intel XE#1130])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][146] ([Intel XE#2236]) -> [SKIP][147] ([Intel XE#1130])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       [SKIP][148] ([Intel XE#979]) -> [SKIP][149] ([Intel XE#1130])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          [SKIP][150] ([Intel XE#531]) -> [SKIP][151] ([Intel XE#1130])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1958
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2469
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2852]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2852
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_8088 -> IGTPW_11997
  * Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -> xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f

  IGTPW_11997: 9156a7b175d9a24154d8ced92e5e8170aab14fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0
  xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/index.html

--===============7834465195199381395==
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
<tr><td><b>Series:</b></td><td>Ignore more warns in xe_wedged tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140511/">https://patchwork.freedesktop.org/series/140511/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8088_BAT -&gt; XEIGTPW_11997_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11997_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11997_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11997_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-atsm-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11997_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +191 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +191 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +185 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +157 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1958">Intel XE#1958</a>)</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-vf/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-lnl-2/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2469">Intel XE#2469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2852">Intel XE#2852</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2469">Intel XE#2469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2852">Intel XE#2852</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2469">Intel XE#2469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2852">Intel XE#2852</a>) +2 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3059">Intel XE#3059</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11997/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8088 -&gt; IGTPW_11997</li>
<li>Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -&gt; xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f</li>
</ul>
<p>IGTPW_11997: 9156a7b175d9a24154d8ced92e5e8170aab14fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0<br />
  xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f</p>

</body>
</html>

--===============7834465195199381395==--

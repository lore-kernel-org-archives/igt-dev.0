Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C9D1125865
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 19:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D58610E3DC;
	Wed, 11 Mar 2026 19:05:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E3B10E3DC;
 Wed, 11 Mar 2026 19:04:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3954887599868737897=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/intel=3A_switch_graphic?=
 =?utf-8?q?s/IP_version_queries_to_fd-based_APIs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Mar 2026 19:04:59 -0000
Message-ID: <177325589935.347435.11418423417193084405@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311062311.1623823-1-x.wang@intel.com>
In-Reply-To: <20260311062311.1623823-1-x.wang@intel.com>
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

--===============3954887599868737897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel: switch graphics/IP version queries to fd-based APIs
URL   : https://patchwork.freedesktop.org/series/162997/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8794_BAT -> XEIGTPW_14726_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14726_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14726_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 14)
------------------------------

  Additional (4): bat-adlp-7 bat-atsm-2 bat-ptl-2 bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14726_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-wcl-2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-2/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-2/igt@xe_compute@compute-square.html
    - bat-wcl-1:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-1/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-1/igt@xe_compute@compute-square.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_pat@pat-index-xelp.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        [SKIP][9] ([Intel XE#977]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#977]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][13] ([Intel XE#2245]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][15] ([Intel XE#2245]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][17] ([Intel XE#977]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-1:          [SKIP][19] ([Intel XE#7242]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][21] ([Intel XE#7242]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][23] ([Intel XE#977]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][25] ([Intel XE#5771]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14726_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - bat-atsm-2:         NOTRUN -> [SKIP][27] ([Intel XE#2134]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-2:          NOTRUN -> [SKIP][28] ([Intel XE#5765])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][29] ([i915#6077]) +30 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][30] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-ptl-2:          NOTRUN -> [SKIP][31] ([Intel XE#5774] / [Intel XE#5907] / [Intel XE#6203])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         NOTRUN -> [SKIP][32] ([Intel XE#2244] / [Intel XE#455])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][33] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][34] ([Intel XE#7483]) +12 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][35] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         NOTRUN -> [SKIP][36] ([Intel XE#540]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         NOTRUN -> [SKIP][37] ([Intel XE#829] / [i915#1836]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][38] ([Intel XE#780])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][39] ([Intel XE#1024] / [Intel XE#947]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][40] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_evict@evict-beng-small.html
    - bat-ptl-2:          NOTRUN -> [SKIP][41] ([Intel XE#5764]) +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][42] ([Intel XE#5764]) +10 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         NOTRUN -> [SKIP][43] ([Intel XE#5563] / [Intel XE#688]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-ptl-vm:         NOTRUN -> [SKIP][44] ([Intel XE#7482]) +17 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - bat-adlp-7:         NOTRUN -> [SKIP][45] ([Intel XE#7482]) +17 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - bat-ptl-2:          NOTRUN -> [SKIP][46] ([Intel XE#7482]) +17 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][47] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][48] ([Intel XE#288]) +32 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][49] ([Intel XE#255])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         NOTRUN -> [SKIP][50] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-ptl-2:          NOTRUN -> [SKIP][51] ([Intel XE#5775]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         NOTRUN -> [SKIP][52] ([Intel XE#2229])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][53] ([Intel XE#5775])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][54] ([Intel XE#2229] / [Intel XE#5488])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-2:          NOTRUN -> [SKIP][55] ([Intel XE#5776])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_mmap@vram.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][56] ([Intel XE#5776])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_mmap@vram.html
    - bat-adlp-7:         NOTRUN -> [SKIP][57] ([Intel XE#1008] / [Intel XE#5591])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][58] ([Intel XE#5777])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][59] ([Intel XE#2838] / [Intel XE#979])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][60] ([Intel XE#2838] / [Intel XE#979])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          NOTRUN -> [SKIP][61] ([Intel XE#5777])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][62] ([Intel XE#5780])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         NOTRUN -> [SKIP][63] ([Intel XE#979])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         NOTRUN -> [SKIP][64] ([Intel XE#979])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          NOTRUN -> [SKIP][65] ([Intel XE#5780])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_8794 -> IGTPW_14726

  IGTPW_14726: a4fed3bfeec0f7d6d1b5a59b498309c9c0f55687 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8794: 8794
  xe-4700-4a30f5fa0fe382b3915a8208a483d0044c40b9eb: 4a30f5fa0fe382b3915a8208a483d0044c40b9eb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/index.html

--===============3954887599868737897==
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
<tr><td><b>Series:</b></td><td>lib/intel: switch graphics/IP version queries to fd-based APIs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162997/">https://patchwork.freedesktop.org/series/162997/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8794_BAT -&gt; XEIGTPW_14726_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14726_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14726_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 14)</h2>
<p>Additional (4): bat-adlp-7 bat-atsm-2 bat-ptl-2 bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14726_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-2/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-1/igt@xe_compute@compute-square.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8794/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14726_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774">Intel XE#5774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203">Intel XE#6203</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14726/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8794 -&gt; IGTPW_14726</li>
</ul>
<p>IGTPW_14726: a4fed3bfeec0f7d6d1b5a59b498309c9c0f55687 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8794: 8794<br />
  xe-4700-4a30f5fa0fe382b3915a8208a483d0044c40b9eb: 4a30f5fa0fe382b3915a8208a483d0044c40b9eb</p>

</body>
</html>

--===============3954887599868737897==--

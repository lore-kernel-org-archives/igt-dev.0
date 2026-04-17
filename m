Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E48F8E4AB
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 06:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7468410E96B;
	Fri, 17 Apr 2026 06:30:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB44610E959;
 Fri, 17 Apr 2026 06:30:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0453674975785527732=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_lib/xe/oa=3A_Add_support_f?=
 =?utf-8?q?or_192B=5FMPEC8LL=5FNOA16_OAM_format_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Apr 2026 06:30:18 -0000
Message-ID: <177640741875.471198.15861545481297963604@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260417033334.933419-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260417033334.933419-1-ashutosh.dixit@intel.com>
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

--===============0453674975785527732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/oa: Add support for 192B_MPEC8LL_NOA16 OAM format (rev3)
URL   : https://patchwork.freedesktop.org/series/164949/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8863_FULL -> XEIGTPW_15006_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15006_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15006_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15006_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-2/igt@kms_pm_rpm@i2c.html

  * igt@xe_pat@pt-caching-update-pat-and-pte:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@xe_pat@pt-caching-update-pat-and-pte.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-5/igt@xe_pat@pt-caching-update-pat-and-pte.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15006_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#6974])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2311])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2234] / [Intel XE#2850])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-9/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1499])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-10/igt@kms_vrr@flip-dpms.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][10] ([Intel XE#7445]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][12] ([Intel XE#3321]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][14] ([Intel XE#6321]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:
    - shard-bmg:          [DMESG-WARN][16] ([Intel XE#7725]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][18], [PASS][19], [PASS][20], [SKIP][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-8/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-6/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-3/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-6/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-8/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-3/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-8/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-1/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-1/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-5/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-5/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-6/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-5/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-4/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-6/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-2/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-8/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][52], [PASS][53], [PASS][54], [PASS][55], [SKIP][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-8/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-5/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-7/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-8/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-8/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-6/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-6/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-7/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-1/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-9/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-2/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-10/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-5/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-7/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-9/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][86] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][87] ([Intel XE#2426] / [Intel XE#5848])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725


Build changes
-------------

  * IGT: IGT_8863 -> IGTPW_15006
  * Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -> xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f

  IGTPW_15006: 9854ea8994244d65a9dcb98222429fcd3521856e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454
  xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f: 3b9ca4c40814c96c38986ae2ba6651e43757ca5f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/index.html

--===============0453674975785527732==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>lib/xe/oa: Add support for 192B_MPEC8LL_NOA1=
6 OAM format (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164949/">https://patchwork.freedesktop.org/series/164949/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15006/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15006/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8863_FULL -&gt; XEIGTPW_15006_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15006_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15006_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
006_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-2/igt@kms_pm=
_rpm@i2c.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-update-pat-and-pte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-10/igt@xe_pat@pt-caching-update-pat-and-pte.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006=
/shard-bmg-5/igt@xe_pat@pt-caching-update-pat-and-pte.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15006_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15006/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15006/shard-bmg-5/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15006/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15006/shard-bmg-9/igt@kms_psr@fbc-psr2-primary-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15006/shard-bmg-10/igt@kms_vrr@flip-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1500=
6/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-=
a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15006/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15006/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-n=
ew-busy-nomemset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-8/igt@xe_exec_sys=
tem_allocator@many-large-execqueues-new-busy-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8863/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8863/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8863/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8863/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-ln=
l-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
863/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8863/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8863/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8863/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">I=
ntel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_15006/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15006/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-ln=
l-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15006/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8863/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8863/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8863/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8863/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_8863/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8863/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/=
shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_88=
63/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8863/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-9/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8863/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8863/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8863/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#245=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405=
">Intel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15006/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15006/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
006/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15006/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8863/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15006/shard-bmg-9/igt@kms_tiled_displa=
y@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8863 -&gt; IGTPW_15006</li>
<li>Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -&gt; xe-4919-3=
b9ca4c40814c96c38986ae2ba6651e43757ca5f</li>
</ul>
<p>IGTPW_15006: 9854ea8994244d65a9dcb98222429fcd3521856e @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940=
be1c73a63e231f454<br />
  xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f: 3b9ca4c40814c96c38986ae=
2ba6651e43757ca5f</p>

</body>
</html>

--===============0453674975785527732==--

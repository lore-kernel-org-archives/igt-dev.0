Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C86C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 06:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA97A10E6D8;
	Wed, 12 Mar 2025 06:26:03 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8364010E6D7;
 Wed, 12 Mar 2025 06:26:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1415749578059023472=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fmodule?=
 =?utf-8?q?=5Fload=3A_Do_not_skip_on_snd?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Mar 2025 06:26:03 -0000
Message-ID: <174176076352.22931.13260171730967942658@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311195339.1206647-1-lucas.demarchi@intel.com>
In-Reply-To: <20250311195339.1206647-1-lucas.demarchi@intel.com>
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

--===============1415749578059023472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_module_load: Do not skip on snd
URL   : https://patchwork.freedesktop.org/series/146170/
State : success

== Summary ==

CI Bug Log - changes from IGT_8271 -> IGTPW_12751
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_12751 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12751, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12751:

### IGT changes ###

#### Warnings ####

  * igt@i915_module_load@load:
    - bat-apl-1:          [SKIP][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-apl-1/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-apl-1/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_12751 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#13735]) +131 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - fi-bsw-nick:        [DMESG-WARN][5] ([i915#13736]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-bsw-nick/igt@core_auth@basic-auth.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-bsw-nick/igt@core_auth@basic-auth.html

  * igt@i915_module_load@load:
    - fi-bsw-n3050:       [SKIP][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-bsw-n3050/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-bsw-n3050/igt@i915_module_load@load.html
    - bat-arlh-2:         [SKIP][9] ([i915#11346]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arlh-2/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arlh-2/igt@i915_module_load@load.html
    - fi-rkl-11600:       [SKIP][11] ([i915#13896]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-rkl-11600/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-rkl-11600/igt@i915_module_load@load.html
    - bat-arlh-3:         [SKIP][13] ([i915#13896]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arlh-3/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arlh-3/igt@i915_module_load@load.html
    - fi-pnv-d510:        [SKIP][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-pnv-d510/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-pnv-d510/igt@i915_module_load@load.html
    - bat-dg1-7:          [SKIP][17] ([i915#13896]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg1-7/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg1-7/igt@i915_module_load@load.html
    - bat-dg2-13:         [SKIP][19] ([i915#13896]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-13/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-13/igt@i915_module_load@load.html
    - fi-glk-j4005:       [SKIP][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-glk-j4005/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-glk-j4005/igt@i915_module_load@load.html
    - bat-adlp-9:         [SKIP][23] ([i915#13896]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adlp-9/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adlp-9/igt@i915_module_load@load.html
    - bat-rpls-4:         [SKIP][25] ([i915#13896]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-rpls-4/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-rpls-4/igt@i915_module_load@load.html
    - bat-twl-1:          [SKIP][27] ([i915#13896]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-twl-1/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-twl-1/igt@i915_module_load@load.html
    - bat-arls-5:         [SKIP][29] ([i915#13896]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arls-5/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arls-5/igt@i915_module_load@load.html
    - bat-rplp-1:         [SKIP][31] ([i915#13896]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-rplp-1/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-rplp-1/igt@i915_module_load@load.html
    - fi-tgl-1115g4:      [SKIP][33] ([i915#13896]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-tgl-1115g4/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-tgl-1115g4/igt@i915_module_load@load.html
    - {bat-jsl-4}:        [SKIP][35] ([i915#13896]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-4/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-4/igt@i915_module_load@load.html
    - fi-cfl-guc:         [SKIP][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-guc/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-guc/igt@i915_module_load@load.html
    - bat-mtlp-6:         [SKIP][39] ([i915#13896]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-6/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-6/igt@i915_module_load@load.html
    - bat-dg2-9:          [SKIP][41] ([i915#13896]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-9/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-9/igt@i915_module_load@load.html
    - bat-adlp-11:        [SKIP][43] ([i915#13896]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adlp-11/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adlp-11/igt@i915_module_load@load.html
    - bat-dg1-6:          [SKIP][45] ([i915#13896]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg1-6/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg1-6/igt@i915_module_load@load.html
    - fi-ilk-650:         [SKIP][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-ilk-650/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-ilk-650/igt@i915_module_load@load.html
    - fi-blb-e6850:       [SKIP][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-blb-e6850/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-blb-e6850/igt@i915_module_load@load.html
    - bat-adlp-6:         [SKIP][51] ([i915#13896]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adlp-6/igt@i915_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adlp-6/igt@i915_module_load@load.html
    - bat-jsl-3:          [SKIP][53] ([i915#13896]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-3/igt@i915_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-3/igt@i915_module_load@load.html
    - bat-twl-2:          [SKIP][55] ([i915#13896]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-twl-2/igt@i915_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-twl-2/igt@i915_module_load@load.html
    - bat-dg2-11:         [SKIP][57] ([i915#13896]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-11/igt@i915_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-11/igt@i915_module_load@load.html
    - fi-cfl-8700k:       [SKIP][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-8700k/igt@i915_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-8700k/igt@i915_module_load@load.html
    - bat-dg2-14:         [SKIP][61] ([i915#13896]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-14/igt@i915_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-14/igt@i915_module_load@load.html
    - fi-bsw-nick:        [SKIP][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-bsw-nick/igt@i915_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-bsw-nick/igt@i915_module_load@load.html
    - bat-kbl-2:          [SKIP][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-kbl-2/igt@i915_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-kbl-2/igt@i915_module_load@load.html
    - bat-mtlp-9:         [SKIP][67] ([i915#13896]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-9/igt@i915_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-9/igt@i915_module_load@load.html
    - bat-arls-6:         [SKIP][69] ([i915#13896]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arls-6/igt@i915_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arls-6/igt@i915_module_load@load.html
    - fi-hsw-4770:        [SKIP][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-hsw-4770/igt@i915_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-hsw-4770/igt@i915_module_load@load.html
    - fi-ivb-3770:        [SKIP][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-ivb-3770/igt@i915_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-ivb-3770/igt@i915_module_load@load.html
    - bat-mtlp-8:         [SKIP][75] ([i915#13896]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-8/igt@i915_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-8/igt@i915_module_load@load.html
    - fi-kbl-guc:         [SKIP][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-kbl-guc/igt@i915_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-kbl-guc/igt@i915_module_load@load.html
    - bat-adls-6:         [SKIP][79] ([i915#13896]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adls-6/igt@i915_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adls-6/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-jsl-3:          [INCOMPLETE][81] ([i915#12445] / [i915#13241]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-3/igt@i915_selftest@live.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hugepages:
    - bat-jsl-3:          [INCOMPLETE][83] ([i915#12445]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-3/igt@i915_selftest@live@hugepages.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-3/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][85] ([i915#12061]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - fi-cfl-8109u:       [SKIP][87] -> [DMESG-WARN][88] ([i915#13735])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-8109u/igt@i915_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-8109u/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#13241]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13736]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736
  [i915#13896]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8271 -> IGTPW_12751
  * Linux: CI_DRM_16265 -> CI_DRM_16266

  CI-20190529: 20190529
  CI_DRM_16265: eb17816e52395a403aa0b447aa0befa9d2f86dd5 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16266: aba848f9b752cf51474c0c3b1abcf0f572f774dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12751: 12751
  IGT_8271: 8271

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/index.html

--===============1415749578059023472==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_module_load: Do not skip on snd</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146170/">https://patchwork.freedesktop.org/series/146170/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8271 -&gt; IGTPW_12751</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_12751 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12751, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12751:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-apl-1/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-apl-1/igt@i915_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12751 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@late_gt_pm:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +131 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-bsw-nick/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736">i915#13736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-bsw-nick/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-bsw-n3050/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-bsw-n3050/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arlh-2/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arlh-2/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-rkl-11600/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-rkl-11600/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arlh-3/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arlh-3/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-pnv-d510/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-pnv-d510/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg1-7/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg1-7/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-13/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-13/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-glk-j4005/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-glk-j4005/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adlp-9/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adlp-9/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-rpls-4/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-rpls-4/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-twl-1/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-twl-1/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arls-5/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arls-5/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-rplp-1/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-rplp-1/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-tgl-1115g4/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-tgl-1115g4/igt@i915_module_load@load.html">PASS</a></li>
<li>{bat-jsl-4}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-4/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-4/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-guc/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-guc/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-6/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-6/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-9/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-9/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adlp-11/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adlp-11/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg1-6/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg1-6/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-ilk-650/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-ilk-650/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-blb-e6850/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-blb-e6850/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adlp-6/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adlp-6/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-3/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-3/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-twl-2/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-twl-2/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-11/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-11/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-8700k/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-8700k/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-dg2-14/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-dg2-14/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-bsw-nick/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-bsw-nick/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-kbl-2/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-kbl-2/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-9/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-arls-6/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-arls-6/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-hsw-4770/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-hsw-4770/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-ivb-3770/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-ivb-3770/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-8/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-8/igt@i915_module_load@load.html">PASS</a></li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-kbl-guc/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-kbl-guc/igt@i915_module_load@load.html">PASS</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-adls-6/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13896">i915#13896</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-adls-6/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241">i915#13241</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-jsl-3/igt@i915_selftest@live@hugepages.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-jsl-3/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8271/fi-cfl-8109u/igt@i915_module_load@load.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12751/fi-cfl-8109u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8271 -&gt; IGTPW_12751</li>
<li>Linux: CI_DRM_16265 -&gt; CI_DRM_16266</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16265: eb17816e52395a403aa0b447aa0befa9d2f86dd5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16266: aba848f9b752cf51474c0c3b1abcf0f572f774dc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12751: 12751<br />
  IGT_8271: 8271</p>

</body>
</html>

--===============1415749578059023472==--

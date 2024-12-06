Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C653AE7716E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 02:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8467910E17C;
	Fri,  6 Dec 2024 02:32:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFD410E02D;
 Fri,  6 Dec 2024 02:32:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Update_skip_messages_in_s?=
 =?utf-8?q?caling_modes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 02:32:35 -0000
Message-ID: <173345235525.3172147.10913832610390469244@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
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

== Series Details ==

Series: Update skip messages in scaling modes (rev2)
URL   : https://patchwork.freedesktop.org/series/141850/
State : success

== Summary ==

CI Bug Log - changes from IGT_8139 -> IGTPW_12257
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12257 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_scaling_modes@scaling-mode-center:
    - fi-blb-e6850:       NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-blb-e6850/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - fi-ivb-3770:        NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-ivb-3770/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-dg1-6:          NOTRUN -> [SKIP][3] ([i915#12311]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-dg1-6/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-elk-e7500/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-dg2-8:          NOTRUN -> [SKIP][5] ([i915#3555]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-dg2-8/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-kbl-guc/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#3555]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adls-6/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-adlm-1:         NOTRUN -> [SKIP][8] ([i915#9900]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adlm-1/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-ilk-650:         NOTRUN -> [SKIP][9] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-ilk-650/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] ([i915#3555]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-tgl-1115g4/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-cfl-guc/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#9792]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-mtlp-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - bat-adlp-11:        NOTRUN -> [SKIP][13] ([i915#10470])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adlp-11/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - bat-arlh-3:         NOTRUN -> [SKIP][14] ([i915#11495]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-arlh-3/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg1-7:          NOTRUN -> [SKIP][15] ([i915#3555]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-dg1-7/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-glk-j4005/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-9:         NOTRUN -> [SKIP][17] ([i915#3555]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adlp-9/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-twl-2:          NOTRUN -> [SKIP][18] ([i915#11495])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-twl-2/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-11:         NOTRUN -> [SKIP][19] ([i915#3555]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-dg2-11/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-rpls-4:         NOTRUN -> [SKIP][20] ([i915#3555]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-rpls-4/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][21] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-kbl-7567u/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-cfl-8700k/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-twl-1:          NOTRUN -> [SKIP][23] ([i915#11495])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-twl-1/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-kbl-8809g/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-14:         NOTRUN -> [SKIP][25] ([i915#3555]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-dg2-14/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][26] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-bsw-nick/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-kbl-2:          NOTRUN -> [SKIP][27] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-kbl-2/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arls-5:         NOTRUN -> [SKIP][28] ([i915#12732]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-arls-5/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-rplp-1:         NOTRUN -> [SKIP][29] ([i915#3555] / [i915#5030])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-rplp-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arlh-2:         NOTRUN -> [SKIP][30] ([i915#11346]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-arlh-2/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][31] ([i915#3555]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-rkl-11600/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-jsl-3:          NOTRUN -> [SKIP][32] ([i915#3555] / [i915#5030])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-jsl-3/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-9:          NOTRUN -> [SKIP][33] ([i915#3555]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-dg2-9/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][34] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-kbl-x1275/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-11:        NOTRUN -> [SKIP][35] ([i915#10470] / [i915#10501]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adlp-11/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][36] +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-hsw-4770/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][37] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/fi-cfl-8109u/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][38] ([i915#3555] / [i915#5030] / [i915#9041])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-jsl-1:          NOTRUN -> [SKIP][39] ([i915#3555] / [i915#5030])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-jsl-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-6:         NOTRUN -> [SKIP][40] ([i915#3555] / [i915#5030])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adlp-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - bat-adlp-6:         NOTRUN -> [SKIP][41] ([i915#5030]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-adlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
    - bat-rplp-1:         NOTRUN -> [SKIP][42] ([i915#5030]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-rplp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
    - bat-jsl-3:          NOTRUN -> [SKIP][43] ([i915#5030]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-jsl-3/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][44] ([i915#5030]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1.html
    - bat-jsl-1:          NOTRUN -> [SKIP][45] ([i915#5030]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-jsl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1:
    - bat-twl-2:          NOTRUN -> [SKIP][46] ([i915#11495] / [i915#5030]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-twl-2/igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1.html
    - bat-twl-1:          NOTRUN -> [SKIP][47] ([i915#11495] / [i915#5030]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-twl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][48] ([i915#5030] / [i915#9041])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - {bat-mtlp-9}:       [DMESG-WARN][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-mtlp-9/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/bat-mtlp-9/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11495
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8139 -> IGTPW_12257
  * Linux: CI_DRM_15796 -> CI_DRM_15798

  CI-20190529: 20190529
  CI_DRM_15796: 1b7746f770882ce40dacae683e8e65657c40c2b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15798: 784dd0b20e39add60971ccdd5d2f7f3c27cf37bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12257: 8300741ee6be9aa2661f5585f1f6b2c2d9450d4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12257/index.html

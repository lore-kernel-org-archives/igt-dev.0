Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F4E77188
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 12:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A23110E372;
	Sat,  4 Jan 2025 12:32:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449DD10E230;
 Sat,  4 Jan 2025 12:32:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Update_skip_messages_in_s?=
 =?utf-8?q?caling_modes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 04 Jan 2025 12:32:05 -0000
Message-ID: <173599392527.3145308.771495718069321557@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250104113128.893119-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250104113128.893119-1-ramanaidu.naladala@intel.com>
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

Series: Update skip messages in scaling modes (rev3)
URL   : https://patchwork.freedesktop.org/series/141850/
State : success

== Summary ==

CI Bug Log - changes from IGT_8174 -> IGTPW_12387
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12387 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_scaling_modes@scaling-mode-center:
    - fi-blb-e6850:       NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-blb-e6850/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - fi-ivb-3770:        NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-ivb-3770/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-dg1-6:          NOTRUN -> [SKIP][3] ([i915#12311]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-dg1-6/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-elk-e7500/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-dg2-8:          NOTRUN -> [SKIP][5] ([i915#3555]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-dg2-8/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-kbl-guc/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#3555]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-adls-6/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-ilk-650:         NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-ilk-650/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] ([i915#3555]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-tgl-1115g4/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-cfl-guc/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#9792]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-mtlp-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - bat-adlp-11:        NOTRUN -> [SKIP][12] ([i915#10470])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-adlp-11/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - bat-arlh-3:         NOTRUN -> [SKIP][13] ([i915#11495]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-arlh-3/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg1-7:          NOTRUN -> [SKIP][14] ([i915#3555]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-dg1-7/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-9:         NOTRUN -> [SKIP][15] ([i915#3555]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-adlp-9/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-twl-2:          NOTRUN -> [SKIP][16] ([i915#11495])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-twl-2/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#3555]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-dg2-11/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-rpls-4:         NOTRUN -> [SKIP][18] ([i915#3555]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-rpls-4/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][19] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-kbl-7567u/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][20] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-cfl-8700k/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][21] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-kbl-8809g/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-14:         NOTRUN -> [SKIP][22] ([i915#3555]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-dg2-14/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][23] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-bsw-nick/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-kbl-2:          NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-kbl-2/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arls-5:         NOTRUN -> [SKIP][25] ([i915#9041]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-arls-5/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-rplp-1:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#5030])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-rplp-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arlh-2:         NOTRUN -> [SKIP][27] ([i915#11346]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-arlh-2/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][28] ([i915#3555]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-rkl-11600/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-atsm-1:         NOTRUN -> [SKIP][29] ([i915#6078]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-atsm-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-jsl-3:          NOTRUN -> [SKIP][30] ([i915#3555] / [i915#5030])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-jsl-3/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][31] +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-kbl-x1275/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-11:        NOTRUN -> [SKIP][32] ([i915#10470] / [i915#10501]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-adlp-11/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][33] +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-hsw-4770/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/fi-cfl-8109u/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][35] ([i915#3555] / [i915#5030] / [i915#9041])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-jsl-1:          NOTRUN -> [SKIP][36] ([i915#3555] / [i915#5030])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-jsl-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - bat-rplp-1:         NOTRUN -> [SKIP][37] ([i915#5030]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-rplp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
    - bat-jsl-3:          NOTRUN -> [SKIP][38] ([i915#5030]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-jsl-3/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][39] ([i915#5030]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1.html
    - bat-jsl-1:          NOTRUN -> [SKIP][40] ([i915#5030]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-jsl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1:
    - bat-twl-2:          NOTRUN -> [SKIP][41] ([i915#11495] / [i915#5030]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-twl-2/igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][42] ([i915#5030] / [i915#9041])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11495
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12387
  * Linux: CI_DRM_15892 -> CI_DRM_15903

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15903: 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12387: 274698a2b96b8a1881a09d41b3f1f3dbda27607e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12387/index.html

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF1D6D234
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 19:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34A10E30B;
	Wed, 27 Nov 2024 19:53:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9D710E30B;
 Wed, 27 Nov 2024 19:53:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Update_skip_messages_in_s?=
 =?utf-8?q?caling_modes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 19:53:57 -0000
Message-ID: <173273723796.3835350.5417158078517027285@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
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

Series: Update skip messages in scaling modes
URL   : https://patchwork.freedesktop.org/series/141850/
State : success

== Summary ==

CI Bug Log - changes from IGT_8127 -> IGTPW_12209
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): fi-glk-j4005 fi-snb-2520m bat-jsl-3 

Known issues
------------

  Here are the changes found in IGTPW_12209 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_scaling_modes@scaling-mode-center:
    - fi-blb-e6850:       NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-blb-e6850/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - fi-ivb-3770:        NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-ivb-3770/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-dg1-6:          NOTRUN -> [SKIP][3] ([i915#12311]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-dg1-6/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-elk-e7500/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-dg2-8:          NOTRUN -> [SKIP][5] ([i915#3555]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-dg2-8/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-kbl-guc/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#3555]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adls-6/igt@kms_scaling_modes@scaling-mode-full.html
    - bat-adlm-1:         NOTRUN -> [SKIP][8] ([i915#9900]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adlm-1/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-ilk-650:         NOTRUN -> [SKIP][9] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-ilk-650/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] ([i915#3555]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-tgl-1115g4/igt@kms_scaling_modes@scaling-mode-full.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-cfl-guc/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#9792]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-mtlp-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - bat-adlp-11:        NOTRUN -> [SKIP][13] ([i915#10470])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adlp-11/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - fi-skl-6600u:       NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-skl-6600u/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arlh-3:         NOTRUN -> [SKIP][15] ([i915#11495]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-arlh-3/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-pnv-d510/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg1-7:          NOTRUN -> [SKIP][17] ([i915#3555]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-dg1-7/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-9:         NOTRUN -> [SKIP][18] ([i915#3555]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adlp-9/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-twl-2:          NOTRUN -> [SKIP][19] ([i915#11495])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-twl-2/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#3555]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-dg2-11/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-rpls-4:         NOTRUN -> [SKIP][21] ([i915#3555]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-rpls-4/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-kbl-7567u/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][23] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-cfl-8700k/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-kbl-8809g/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-apl-1:          NOTRUN -> [SKIP][25] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-apl-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-14:         NOTRUN -> [SKIP][26] ([i915#3555]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-dg2-14/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][27] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-bsw-nick/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-kbl-2:          NOTRUN -> [SKIP][28] +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-kbl-2/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arls-5:         NOTRUN -> [SKIP][29] ([i915#12732]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-arls-5/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-rplp-1:         NOTRUN -> [SKIP][30] ([i915#3555] / [i915#5030])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-rplp-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-arlh-2:         NOTRUN -> [SKIP][31] ([i915#11346]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-arlh-2/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][32] ([i915#3555]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-rkl-11600/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-dg2-9:          NOTRUN -> [SKIP][33] ([i915#3555]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-dg2-9/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][34] +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-kbl-x1275/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-11:        NOTRUN -> [SKIP][35] ([i915#10470] / [i915#10501]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adlp-11/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][36] +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-hsw-4770/igt@kms_scaling_modes@scaling-mode-none.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][37] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/fi-cfl-8109u/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][38] ([i915#3555] / [i915#5030] / [i915#9041])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-jsl-1:          NOTRUN -> [SKIP][39] ([i915#3555] / [i915#5030])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-jsl-1/igt@kms_scaling_modes@scaling-mode-none.html
    - bat-adlp-6:         NOTRUN -> [SKIP][40] ([i915#3555] / [i915#5030])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adlp-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - bat-adlp-6:         NOTRUN -> [SKIP][41] ([i915#5030]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-adlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
    - bat-rplp-1:         NOTRUN -> [SKIP][42] ([i915#5030]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-rplp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][43] ([i915#5030]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1.html
    - bat-jsl-1:          NOTRUN -> [SKIP][44] ([i915#5030]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-jsl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-b-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1:
    - bat-twl-2:          NOTRUN -> [SKIP][45] ([i915#11495] / [i915#5030]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-twl-2/igt@kms_scaling_modes@scaling-mode-none@pipe-c-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - bat-mtlp-8:         NOTRUN -> [SKIP][46] ([i915#5030] / [i915#9041])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/bat-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  
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
  * IGT: IGT_8127 -> IGTPW_12209
  * Linux: CI_DRM_15749 -> CI_DRM_15754

  CI-20190529: 20190529
  CI_DRM_15749: 739a2506c44a0be22cc842d2c625a05ed21c1198 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15754: 24e36a5200d65a337d37827d4abcae11c9693f6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12209: 12209
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12209/index.html

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3EDC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 10:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C22710E280;
	Thu, 23 May 2024 10:35:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D6710E379;
 Thu, 23 May 2024 10:35:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4630377794110636236=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_fix_kms=5Fbw_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 May 2024 10:35:43 -0000
Message-ID: <171646054386.2168809.16566337378293676061@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523100248.230989-1-kunal1.joshi@intel.com>
In-Reply-To: <20240523100248.230989-1-kunal1.joshi@intel.com>
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

--===============4630377794110636236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix kms_bw test
URL   : https://patchwork.freedesktop.org/series/133956/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14808 -> IGTPW_11182
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11182 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11182, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/index.html

Participating hosts (42 -> 40)
------------------------------

  Additional (2): fi-cfl-8109u fi-kbl-8809g 
  Missing    (4): bat-dg2-11 bat-jsl-3 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11182:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@linear-tiling-1920x1080p@3-displays (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][1] +12 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg1-7/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][2] +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-twl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html

  * igt@kms_bw@linear-tiling-1920x1080p@4-displays (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlp-9/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html
    - {bat-rpls-4}:       NOTRUN -> [SKIP][4] +12 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-rpls-4/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html
    - bat-rplp-1:         NOTRUN -> [SKIP][5] +11 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-rplp-1/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html

  * igt@kms_bw@linear-tiling-2160x1440p@3-displays (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][6] +15 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-mtlp-8/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - bat-adls-6:         NOTRUN -> [SKIP][7] +9 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adls-6/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html
    - bat-jsl-1:          NOTRUN -> [SKIP][8] +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-jsl-1/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html

  * igt@kms_bw@linear-tiling-2560x1440p@1-display (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][9] +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-14/igt@kms_bw@linear-tiling-2560x1440p@1-display.html

  * igt@kms_bw@linear-tiling-2560x1440p@2-displays (NEW):
    - bat-arls-1:         NOTRUN -> [SKIP][10] +11 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-1/igt@kms_bw@linear-tiling-2560x1440p@2-displays.html
    - bat-arls-3:         NOTRUN -> [SKIP][11] +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-3/igt@kms_bw@linear-tiling-2560x1440p@2-displays.html

  * igt@kms_bw@linear-tiling-2560x1440p@4-displays (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][12] +12 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-tgl-1115g4/igt@kms_bw@linear-tiling-2560x1440p@4-displays.html

  * igt@kms_bw@linear-tiling-3840x2160p@1-display (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-rkl-11600/igt@kms_bw@linear-tiling-3840x2160p@1-display.html

  * igt@kms_bw@linear-tiling-3840x2160p@3-displays (NEW):
    - bat-arls-2:         NOTRUN -> [SKIP][14] +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-2/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html
    - bat-adln-1:         NOTRUN -> [SKIP][15] +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adln-1/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html
    - {bat-arls-4}:       NOTRUN -> [SKIP][16] +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-4/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html

  * igt@kms_bw@linear-tiling-3840x2160p@4-displays (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][17] +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlp-6/igt@kms_bw@linear-tiling-3840x2160p@4-displays.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14808 and IGTPW_11182:

### New IGT tests (20) ###

  * igt@kms_bw@linear-tiling-1920x1080p:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-1920x1080p@1-display:
    - Statuses : 24 pass(s) 5 skip(s)
    - Exec time: [0.02, 0.55] s

  * igt@kms_bw@linear-tiling-1920x1080p@2-displays:
    - Statuses : 2 pass(s) 27 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_bw@linear-tiling-1920x1080p@3-displays:
    - Statuses : 25 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_bw@linear-tiling-1920x1080p@4-displays:
    - Statuses : 13 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2160x1440p:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-2160x1440p@1-display:
    - Statuses : 23 pass(s) 6 skip(s)
    - Exec time: [0.02, 1.52] s

  * igt@kms_bw@linear-tiling-2160x1440p@2-displays:
    - Statuses : 2 pass(s) 27 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_bw@linear-tiling-2160x1440p@3-displays:
    - Statuses : 25 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2160x1440p@4-displays:
    - Statuses : 13 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2560x1440p:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-2560x1440p@1-display:
    - Statuses : 21 pass(s) 8 skip(s)
    - Exec time: [0.01, 1.52] s

  * igt@kms_bw@linear-tiling-2560x1440p@2-displays:
    - Statuses : 2 pass(s) 27 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_bw@linear-tiling-2560x1440p@3-displays:
    - Statuses : 25 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-2560x1440p@4-displays:
    - Statuses : 13 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-3840x2160p:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@linear-tiling-3840x2160p@1-display:
    - Statuses : 14 pass(s) 15 skip(s)
    - Exec time: [0.01, 1.61] s

  * igt@kms_bw@linear-tiling-3840x2160p@2-displays:
    - Statuses : 1 pass(s) 28 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_bw@linear-tiling-3840x2160p@3-displays:
    - Statuses : 25 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_bw@linear-tiling-3840x2160p@4-displays:
    - Statuses : 13 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11182 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][18] ([i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][19] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][20] ([i915#4613]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][21] ([i915#4613]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_bw@linear-tiling-1920x1080p (NEW):
    - bat-dg2-8:          NOTRUN -> [SKIP][22] ([i915#9197]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-8/igt@kms_bw@linear-tiling-1920x1080p.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][23] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-guc/igt@kms_bw@linear-tiling-1920x1080p.html
    - bat-adlm-1:         NOTRUN -> [SKIP][24] ([i915#9900]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlm-1/igt@kms_bw@linear-tiling-1920x1080p.html
    - bat-dg2-9:          NOTRUN -> [SKIP][25] ([i915#9197]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-9/igt@kms_bw@linear-tiling-1920x1080p.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][26] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-x1275/igt@kms_bw@linear-tiling-1920x1080p.html
    - bat-adlp-11:        NOTRUN -> [SKIP][27] ([i915#10470]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlp-11/igt@kms_bw@linear-tiling-1920x1080p.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][28] ([i915#9792]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-mtlp-6/igt@kms_bw@linear-tiling-1920x1080p.html

  * igt@kms_bw@linear-tiling-1920x1080p@1-display (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][29] +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-blb-e6850/igt@kms_bw@linear-tiling-1920x1080p@1-display.html

  * igt@kms_bw@linear-tiling-1920x1080p@2-displays (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][30] +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-elk-e7500/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html

  * igt@kms_bw@linear-tiling-1920x1080p@3-displays (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][31] +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-glk-j4005/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][32] +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-7567u/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html
    - {bat-apl-1}:        NOTRUN -> [SKIP][33] +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-apl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html

  * igt@kms_bw@linear-tiling-2160x1440p@1-display (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][34] +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-pnv-d510/igt@kms_bw@linear-tiling-2160x1440p@1-display.html

  * igt@kms_bw@linear-tiling-2160x1440p@2-displays (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][35] +9 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-guc/igt@kms_bw@linear-tiling-2160x1440p@2-displays.html

  * igt@kms_bw@linear-tiling-2160x1440p@3-displays (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][36] +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-ivb-3770/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html

  * igt@kms_bw@linear-tiling-2560x1440p (NEW):
    - bat-kbl-2:          NOTRUN -> [SKIP][37] +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-kbl-2/igt@kms_bw@linear-tiling-2560x1440p.html

  * igt@kms_bw@linear-tiling-2560x1440p@1-display (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][38] +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8700k/igt@kms_bw@linear-tiling-2560x1440p@1-display.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] +11 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-bsw-nick/igt@kms_bw@linear-tiling-2560x1440p@1-display.html

  * igt@kms_bw@linear-tiling-3840x2160p (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][40] ([i915#6078]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-atsm-1/igt@kms_bw@linear-tiling-3840x2160p.html

  * igt@kms_bw@linear-tiling-3840x2160p@1-display (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][41] +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-ilk-650/igt@kms_bw@linear-tiling-3840x2160p@1-display.html

  * igt@kms_bw@linear-tiling-3840x2160p@3-displays (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][42] +15 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8109u/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][43] +34 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [FAIL][44] ([i915#10378]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14808/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7869 -> IGTPW_11182

  CI-20190529: 20190529
  CI_DRM_14808: 7643e429e72c546f3779339624df885f6160124c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11182: 25ceef45566f94ea0746493133f85a118d1b678f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/index.html

--===============4630377794110636236==
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
<tr><td><b>Series:</b></td><td>fix kms_bw test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133956/">https://patchwork.freedesktop.org/series/133956/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14808 -&gt; IGTPW_11182</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11182 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11182, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Additional (2): fi-cfl-8109u fi-kbl-8809g <br />
  Missing    (4): bat-dg2-11 bat-jsl-3 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11182:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@3-displays (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg1-7/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +12 other tests skip</li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-twl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@4-displays (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlp-9/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html">SKIP</a> +11 other tests skip</li>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-rpls-4/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html">SKIP</a> +12 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-rplp-1/igt@kms_bw@linear-tiling-1920x1080p@4-displays.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@3-displays (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-mtlp-8/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +15 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adls-6/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +9 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-jsl-1/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@1-display (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-14/igt@kms_bw@linear-tiling-2560x1440p@1-display.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@2-displays (NEW):</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-1/igt@kms_bw@linear-tiling-2560x1440p@2-displays.html">SKIP</a> +11 other tests skip</li>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-3/igt@kms_bw@linear-tiling-2560x1440p@2-displays.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@4-displays (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-tgl-1115g4/igt@kms_bw@linear-tiling-2560x1440p@4-displays.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@1-display (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-rkl-11600/igt@kms_bw@linear-tiling-3840x2160p@1-display.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@3-displays (NEW):</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-2/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html">SKIP</a> +11 other tests skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adln-1/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html">SKIP</a> +7 other tests skip</li>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-arls-4/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@4-displays (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlp-6/igt@kms_bw@linear-tiling-3840x2160p@4-displays.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14808 and IGTPW_11182:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@1-display:</p>
<ul>
<li>Statuses : 24 pass(s) 5 skip(s)</li>
<li>Exec time: [0.02, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@2-displays:</p>
<ul>
<li>Statuses : 2 pass(s) 27 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@3-displays:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@4-displays:</p>
<ul>
<li>Statuses : 13 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@1-display:</p>
<ul>
<li>Statuses : 23 pass(s) 6 skip(s)</li>
<li>Exec time: [0.02, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@2-displays:</p>
<ul>
<li>Statuses : 2 pass(s) 27 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@3-displays:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@4-displays:</p>
<ul>
<li>Statuses : 13 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@1-display:</p>
<ul>
<li>Statuses : 21 pass(s) 8 skip(s)</li>
<li>Exec time: [0.01, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@2-displays:</p>
<ul>
<li>Statuses : 2 pass(s) 27 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@3-displays:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@4-displays:</p>
<ul>
<li>Statuses : 13 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@1-display:</p>
<ul>
<li>Statuses : 14 pass(s) 15 skip(s)</li>
<li>Exec time: [0.01, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@2-displays:</p>
<ul>
<li>Statuses : 1 pass(s) 28 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@3-displays:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@4-displays:</p>
<ul>
<li>Statuses : 13 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11182 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-8/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-guc/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlm-1/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +3 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-9/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-x1275/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-adlp-11/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-mtlp-6/igt@kms_bw@linear-tiling-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@1-display (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-blb-e6850/igt@kms_bw@linear-tiling-1920x1080p@1-display.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@2-displays (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-elk-e7500/igt@kms_bw@linear-tiling-1920x1080p@2-displays.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1920x1080p@3-displays (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-glk-j4005/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +7 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-7567u/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +7 other tests skip</li>
<li>{bat-apl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-apl-1/igt@kms_bw@linear-tiling-1920x1080p@3-displays.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@1-display (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-pnv-d510/igt@kms_bw@linear-tiling-2160x1440p@1-display.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@2-displays (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-guc/igt@kms_bw@linear-tiling-2160x1440p@2-displays.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2160x1440p@3-displays (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-ivb-3770/igt@kms_bw@linear-tiling-2160x1440p@3-displays.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p (NEW):</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-kbl-2/igt@kms_bw@linear-tiling-2560x1440p.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2560x1440p@1-display (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8700k/igt@kms_bw@linear-tiling-2560x1440p@1-display.html">SKIP</a> +9 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-bsw-nick/igt@kms_bw@linear-tiling-2560x1440p@1-display.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-atsm-1/igt@kms_bw@linear-tiling-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@1-display (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-ilk-650/igt@kms_bw@linear-tiling-3840x2160p@1-display.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3840x2160p@3-displays (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-cfl-8109u/igt@kms_bw@linear-tiling-3840x2160p@3-displays.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_lmem_swapping@basic@lmem0:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14808/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11182/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7869 -&gt; IGTPW_11182</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14808: 7643e429e72c546f3779339624df885f6160124c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11182: 25ceef45566f94ea0746493133f85a118d1b678f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4630377794110636236==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3049C27C53
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F63510E140;
	Sun,  9 Jun 2024 21:54:42 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8A810E140;
 Sun,  9 Jun 2024 21:54:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0819285234519386871=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_add_test_to_validate_fallba?=
 =?utf-8?q?ck?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 09 Jun 2024 21:54:39 -0000
Message-ID: <171797007911.30338.12842375007739032527@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
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

--===============0819285234519386871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback
URL   : https://patchwork.freedesktop.org/series/134660/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14904 -> IGTPW_11242
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/index.html

Participating hosts (44 -> 40)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (5): fi-snb-2520m bat-adlp-6 bat-atsm-1 bat-dg2-11 bat-mtlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11242:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dp_fallback@fallback} (NEW):
    - bat-arls-3:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_dp_fallback@fallback.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-9/igt@kms_dp_fallback@fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-8/igt@kms_dp_fallback@fallback.html
    - bat-dg2-8:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-8/igt@kms_dp_fallback@fallback.html
    - bat-adls-6:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adls-6/igt@kms_dp_fallback@fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-jsl-1/igt@kms_dp_fallback@fallback.html
    - bat-arls-1:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-1/igt@kms_dp_fallback@fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg1-7/igt@kms_dp_fallback@fallback.html
    - bat-adlp-9:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adlp-9/igt@kms_dp_fallback@fallback.html
    - {bat-rpls-4}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-rpls-4/igt@kms_dp_fallback@fallback.html
    - bat-adln-1:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adln-1/igt@kms_dp_fallback@fallback.html
    - {bat-twl-1}:        NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-twl-1/igt@kms_dp_fallback@fallback.html
    - {bat-arls-5}:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-5/igt@kms_dp_fallback@fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-rplp-1/igt@kms_dp_fallback@fallback.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-rkl-11600/igt@kms_dp_fallback@fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-tgl-1115g4/igt@kms_dp_fallback@fallback.html
    - bat-dg2-9:          NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-9/igt@kms_dp_fallback@fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adlp-11/igt@kms_dp_fallback@fallback.html
    - bat-arls-2:         NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-2/igt@kms_dp_fallback@fallback.html
    - {bat-arls-4}:       NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-4/igt@kms_dp_fallback@fallback.html
    - bat-dg2-14:         NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-14/igt@kms_dp_fallback@fallback.html
    - bat-adlm-1:         NOTRUN -> [SKIP][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adlm-1/igt@kms_dp_fallback@fallback.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14904 and IGTPW_11242:

### New IGT tests (1) ###

  * igt@kms_dp_fallback@fallback:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_11242 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][23] ([i915#1849])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-kbl-2/igt@fbdev@info.html
    - bat-arls-3:         [PASS][24] -> [SKIP][25] ([i915#1849])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@fbdev@info.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - bat-arls-3:         [PASS][26] -> [SKIP][27] ([i915#11191]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@fbdev@nullptr.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@fbdev@nullptr.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][28] +40 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@client:
    - bat-arls-1:         [PASS][29] -> [DMESG-FAIL][30] ([i915#10262]) +27 other tests dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-1/igt@i915_selftest@live@client.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-1/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@gt_pm:
    - bat-arls-1:         [PASS][31] -> [DMESG-WARN][32] ([i915#10341])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-1/igt@i915_selftest@live@gt_pm.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@guc:
    - bat-dg2-8:          [PASS][33] -> [DMESG-WARN][34] ([i915#10014])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-dg2-8/igt@i915_selftest@live@guc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-8/igt@i915_selftest@live@guc.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-arls-3:         [PASS][35] -> [SKIP][36] ([i915#11190] / [i915#11204]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * {igt@kms_dp_fallback@fallback} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-ivb-3770/igt@kms_dp_fallback@fallback.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-guc/igt@kms_dp_fallback@fallback.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-bsw-n3050/igt@kms_dp_fallback@fallback.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-pnv-d510/igt@kms_dp_fallback@fallback.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-glk-j4005/igt@kms_dp_fallback@fallback.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-7567u/igt@kms_dp_fallback@fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-8809g/igt@kms_dp_fallback@fallback.html
    - {bat-apl-1}:        NOTRUN -> [SKIP][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-apl-1/igt@kms_dp_fallback@fallback.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-cfl-guc/igt@kms_dp_fallback@fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-x1275/igt@kms_dp_fallback@fallback.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-cfl-8109u/igt@kms_dp_fallback@fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-ilk-650/igt@kms_dp_fallback@fallback.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-blb-e6850/igt@kms_dp_fallback@fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-cfl-8700k/igt@kms_dp_fallback@fallback.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-elk-e7500/igt@kms_dp_fallback@fallback.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-bsw-nick/igt@kms_dp_fallback@fallback.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-arls-3:         NOTRUN -> [SKIP][53] ([i915#3637]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-3:         [PASS][54] -> [SKIP][55] ([i915#4342] / [i915#5354])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_frontbuffer_tracking@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-arls-3:         NOTRUN -> [SKIP][56] ([i915#11190] / [i915#11204]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-arls-3:         [PASS][57] -> [SKIP][58] ([i915#11204] / [i915#3708])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@prime_vgem@basic-fence-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [INCOMPLETE][59] ([i915#9413]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - {bat-mtlp-9}:       [DMESG-WARN][61] ([i915#11009]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html

  * igt@kms_flip@basic-plain-flip@c-dp6:
    - {bat-mtlp-9}:       [FAIL][63] ([i915#6121]) -> [PASS][64] +2 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-arls-3:         [SKIP][65] ([i915#10202]) -> [SKIP][66] ([i915#11190] / [i915#11204]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-3:         [SKIP][67] ([i915#9886]) -> [SKIP][68] ([i915#11190] / [i915#11204])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_dsc@dsc-basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10014]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10014
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11191]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191
  [i915#11204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11204
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7880 -> IGTPW_11242

  CI-20190529: 20190529
  CI_DRM_14904: 2bea08bd31298d60d416b2a6ed346bb53dd28037 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11242: 36180119622cea9c9a8e670cbfed7a74e50d8da6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/index.html

--===============0819285234519386871==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14904 -&gt; IGTPW_11242</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/index.html</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (5): fi-snb-2520m bat-adlp-6 bat-atsm-1 bat-dg2-11 bat-mtlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11242:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_dp_fallback@fallback} (NEW):<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-9/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-8/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-8/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adls-6/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-jsl-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg1-7/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adlp-9/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-rpls-4/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adln-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>{bat-twl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-twl-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>{bat-arls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-5/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-rplp-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-rkl-11600/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-tgl-1115g4/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-9/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adlp-11/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-2/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-4/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-14/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adlm-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14904 and IGTPW_11242:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_fallback@fallback:<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11242 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191">i915#11191</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-1/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-1/igt@i915_selftest@live@client.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) +27 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-1/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-1/igt@i915_selftest@live@gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-dg2-8/igt@i915_selftest@live@guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-dg2-8/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10014">i915#10014</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11204">i915#11204</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@fallback} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-ivb-3770/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-guc/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-bsw-n3050/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-pnv-d510/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-glk-j4005/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-7567u/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-8809g/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>{bat-apl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-apl-1/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-cfl-guc/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-kbl-x1275/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-cfl-8109u/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-ilk-650/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-blb-e6850/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-cfl-8700k/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-elk-e7500/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/fi-bsw-nick/igt@kms_dp_fallback@fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-arls-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11204">i915#11204</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11204">i915#11204</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11204">i915#11204</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/bat-arls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11242/bat-arls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11204">i915#11204</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7880 -&gt; IGTPW_11242</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14904: 2bea08bd31298d60d416b2a6ed346bb53dd28037 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11242: 36180119622cea9c9a8e670cbfed7a74e50d8da6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0819285234519386871==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC75C54E49
	for <igt-dev@archiver.kernel.org>; Sun,  3 Mar 2024 18:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCBB10F0E3;
	Sun,  3 Mar 2024 18:08:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BD410F0E3;
 Sun,  3 Mar 2024 18:07:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9003415789889405004=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_revamp_big_joiner_test_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 03 Mar 2024 18:07:59 -0000
Message-ID: <170948927953.486221.3072214202421644236@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240303172216.254535-1-kunal1.joshi@intel.com>
In-Reply-To: <20240303172216.254535-1-kunal1.joshi@intel.com>
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

--===============9003415789889405004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: revamp big joiner test (rev3)
URL   : https://patchwork.freedesktop.org/series/130572/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14379 -> IGTPW_10766
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10766 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10766, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/index.html

Participating hosts (39 -> 37)
------------------------------

  Additional (1): fi-glk-j4005 
  Missing    (3): bat-mtlp-8 bat-arls-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10766:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hugepages:
    - bat-dg2-9:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-dg2-9/igt@i915_selftest@live@hugepages.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-9/igt@i915_selftest@live@hugepages.html

  * igt@kms_big_joiner@basic:
    - bat-dg1-7:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg1-7/igt@kms_big_joiner@basic.html
    - bat-adlp-9:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlp-9/igt@kms_big_joiner@basic.html
    - bat-dg2-11:         NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-11/igt@kms_big_joiner@basic.html
    - bat-dg2-14:         NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-14/igt@kms_big_joiner@basic.html
    - bat-rplp-1:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rplp-1/igt@kms_big_joiner@basic.html

  * {igt@kms_big_joiner@force-joiner-basic} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-mtlp-6/igt@kms_big_joiner@force-joiner-basic.html

  * {igt@kms_big_joiner@force-joiner-basic@1x-joiner} (NEW):
    - {bat-adls-6}:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adls-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adlp-6:         NOTRUN -> [DMESG-WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlp-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - {bat-rpls-3}:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html
    - bat-adln-1:         NOTRUN -> [DMESG-WARN][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adln-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-rkl-11600/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - {bat-rpls-3}:       NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_big_joiner@force-joiner-invalid-modeset.html
    - {bat-adls-6}:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adls-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe} (NEW):
    - bat-jsl-3:          NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-3/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html
    - bat-jsl-1:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-1/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html

  * igt@kms_big_joiner@invalid-modeset:
    - bat-jsl-3:          NOTRUN -> [SKIP][18] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html
    - bat-dg2-9:          NOTRUN -> [SKIP][19] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-9/igt@kms_big_joiner@invalid-modeset.html
    - bat-adln-1:         NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adln-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-dg2-8:          NOTRUN -> [SKIP][21] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-8/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlm-1:         NOTRUN -> [SKIP][22] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-jsl-1:          NOTRUN -> [SKIP][23] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][24] +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-tgl-1115g4/igt@kms_big_joiner@invalid-modeset.html
    - bat-arls-1:         NOTRUN -> [SKIP][25] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html
    - bat-adlp-6:         NOTRUN -> [SKIP][26] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlp-6/igt@kms_big_joiner@invalid-modeset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_joiner@invalid-modeset:
    - {bat-arls-4}:       NOTRUN -> [SKIP][27] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@invalid-modeset.html
    - {bat-adls-6}:       NOTRUN -> [SKIP][28] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_busy@basic:
    - {bat-rpls-3}:       NOTRUN -> [SKIP][29] +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {bat-rpls-3}:       [SKIP][30] ([i915#4103]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {bat-rpls-3}:       [PASS][32] -> [SKIP][33] +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - {bat-rpls-3}:       [SKIP][34] ([i915#3555] / [i915#3840] / [i915#9886]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-rpls-3/igt@kms_dsc@dsc-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_dsc@dsc-basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14379 and IGTPW_10766:

### New IGT tests (4) ###

  * igt@kms_big_joiner@force-joiner-basic:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@force-joiner-basic@1x-joiner:
    - Statuses : 2 dmesg-warn(s) 2 fail(s) 7 pass(s)
    - Exec time: [0.51, 3.75] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset:
    - Statuses : 27 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe:
    - Statuses : 2 fail(s) 7 pass(s)
    - Exec time: [0.03, 1.34] s

  

Known issues
------------

  Here are the changes found in IGTPW_10766 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-glk-j4005/igt@gem_lmem_swapping@basic.html

  * igt@kms_big_joiner@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][39] ([fdo#109271]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-pnv-d510/igt@kms_big_joiner@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][40] ([fdo#109271]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-skl-guc/igt@kms_big_joiner@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][41] ([fdo#109271]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-kbl-7567u/igt@kms_big_joiner@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][42] ([fdo#109271]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-cfl-8700k/igt@kms_big_joiner@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][43] ([fdo#109271]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-bsw-nick/igt@kms_big_joiner@basic.html
    - bat-kbl-2:          NOTRUN -> [SKIP][44] ([fdo#109271]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-kbl-2/igt@kms_big_joiner@basic.html

  * {igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][45] ([fdo#109271]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-skl-6600u/igt@kms_big_joiner@force-joiner-invalid-modeset.html

  * igt@kms_big_joiner@invalid-modeset:
    - fi-cfl-guc:         NOTRUN -> [SKIP][46] ([fdo#109271]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-cfl-guc/igt@kms_big_joiner@invalid-modeset.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][47] ([fdo#109271]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-kbl-x1275/igt@kms_big_joiner@invalid-modeset.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][48] ([fdo#109271]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-cfl-8109u/igt@kms_big_joiner@invalid-modeset.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][49] ([fdo#109271]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][50] ([fdo#109271]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-elk-e7500/igt@kms_big_joiner@invalid-modeset.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][51] ([fdo#109271]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-kbl-guc/igt@kms_big_joiner@invalid-modeset.html
    - fi-ilk-650:         NOTRUN -> [SKIP][52] ([fdo#109271]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-ilk-650/igt@kms_big_joiner@invalid-modeset.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][53] ([fdo#109271]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-blb-e6850/igt@kms_big_joiner@invalid-modeset.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][54] ([i915#9792]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-mtlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][55] ([fdo#109271]) +14 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][56] ([fdo#109271]) +21 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9920]: https://gitlab.freedesktop.org/drm/intel/issues/9920


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7742 -> IGTPW_10766

  CI-20190529: 20190529
  CI_DRM_14379: 511ffdbe886328239e946608243048f8296fa095 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10766: 10766
  IGT_7742: 7742


Testlist changes
----------------

+igt@kms_big_joiner@force-joiner-basic
+igt@kms_big_joiner@force-joiner-invalid-modeset
-igt@kms_atomic@plane-cursor-solid-fill
-igt@kms_atomic@plane-primary-solid-fill
-igt@kms_big_joiner@2x-modeset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/index.html

--===============9003415789889405004==
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
<tr><td><b>Series:</b></td><td>revamp big joiner test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130572/">https://patchwork.freedesktop.org/series/130572/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14379 -&gt; IGTPW_10766</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10766 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10766, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Additional (1): fi-glk-j4005 <br />
  Missing    (3): bat-mtlp-8 bat-arls-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10766:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-dg2-9/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-9/igt@i915_selftest@live@hugepages.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg1-7/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlp-9/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-11/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-14/igt@kms_big_joiner@basic.html">SKIP</a> +3 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rplp-1/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-basic} (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-mtlp-6/igt@kms_big_joiner@force-joiner-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-basic@1x-joiner} (NEW):</p>
<ul>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adls-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlp-6/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">DMESG-WARN</a></li>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">FAIL</a></li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adln-1/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-rkl-11600/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a></li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adls-6/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe} (NEW):</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-3/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-1/igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-9/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adln-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-dg2-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlm-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-jsl-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-tgl-1115g4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>{bat-arls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
<li>{bat-adls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-adls-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>{bat-rpls-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_busy@basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14379/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-rpls-3/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14379 and IGTPW_10766:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_big_joiner@force-joiner-basic:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-basic@1x-joiner:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 2 fail(s) 7 pass(s)</li>
<li>Exec time: [0.51, 3.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset:</p>
<ul>
<li>Statuses : 27 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@force-joiner-invalid-modeset@big_joiner_on_last_pipe:</p>
<ul>
<li>Statuses : 2 fail(s) 7 pass(s)</li>
<li>Exec time: [0.03, 1.34] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10766 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-glk-j4005/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-pnv-d510/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-skl-guc/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-kbl-7567u/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-cfl-8700k/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-bsw-nick/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-kbl-2/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@force-joiner-invalid-modeset} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-skl-6600u/igt@kms_big_joiner@force-joiner-invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-cfl-guc/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-kbl-x1275/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-cfl-8109u/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-ivb-3770/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-elk-e7500/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-kbl-guc/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-ilk-650/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-blb-e6850/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-mtlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7742 -&gt; IGTPW_10766</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14379: 511ffdbe886328239e946608243048f8296fa095 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10766: 10766<br />
  IGT_7742: 7742</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@force-joiner-basic<br />
+igt@kms_big_joiner@force-joiner-invalid-modeset<br />
-igt@kms_atomic@plane-cursor-solid-fill<br />
-igt@kms_atomic@plane-primary-solid-fill<br />
-igt@kms_big_joiner@2x-modeset</p>

</body>
</html>

--===============9003415789889405004==--

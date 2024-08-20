Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E070C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 07:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60645892CA;
	Tue, 20 Aug 2024 07:35:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE0F10E275;
 Tue, 20 Aug 2024 07:35:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4623202819576660333=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_HAX/DO=5FNOT=5FMERGE=3A_Pro?=
 =?utf-8?q?file_kms=5Fflip_tests_=28i915_Vs_XE=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Aug 2024 07:35:38 -0000
Message-ID: <172413933825.698595.5726831336787464057@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820062728.2996242-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240820062728.2996242-1-bhanuprakash.modem@intel.com>
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

--===============4623202819576660333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: HAX/DO_NOT_MERGE: Profile kms_flip tests (i915 Vs XE)
URL   : https://patchwork.freedesktop.org/series/137493/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7978 -> IGTPW_11601
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11601 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11601, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/index.html

Participating hosts (41 -> 34)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (8): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 fi-cfl-8109u fi-pnv-d510 bat-jsl-1 bat-mtlp-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11601:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@absolute-wf_vblank@a-dp1:
    - bat-adls-6:         NOTRUN -> [FAIL][1] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adls-6/igt@kms_flip@absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:
    - bat-apl-1:          NOTRUN -> [FAIL][2] +8 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-apl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-vga1 (NEW):
    - fi-ivb-3770:        NOTRUN -> [FAIL][3] +16 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-ivb-3770/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - bat-twl-2:          NOTRUN -> [FAIL][4] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-twl-2/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  
New tests
---------

  New tests have been introduced between IGT_7978 and IGTPW_11601:

### New IGT tests (29) ###

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.18] s

  * igt@kms_flip@absolute-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.20] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.18] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.20] s

  * igt@kms_flip@blocking-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@bo-too-big-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_flip@bo-too-big@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_flip@busy-flip@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.48] s

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-vga1:
    - Statuses : 1 fail(s)
    - Exec time: [6.09] s

  * igt@kms_flip@flip-vs-expired-vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [13.82] s

  * igt@kms_flip@flip-vs-panning-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.19] s

  * igt@kms_flip@flip-vs-panning@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.20] s

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.15] s

  * igt@kms_flip@flip-vs-rmfb@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.17] s

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_flip@modeset-vs-vblank-race@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [3.80] s

  * igt@kms_flip@nonexisting-fb-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip@nonexisting-fb@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-vga1:
    - Statuses : 1 fail(s)
    - Exec time: [5.05] s

  * igt@kms_flip@plain-flip-fb-recreate@c-vga1:
    - Statuses : 1 fail(s)
    - Exec time: [14.45] s

  * igt@kms_flip@plain-flip-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-vga1:
    - Statuses : 1 fail(s)
    - Exec time: [6.13] s

  * igt@kms_flip@plain-flip-ts-check@c-vga1:
    - Statuses : 1 fail(s)
    - Exec time: [14.54] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@wf_vblank-ts-check@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  

Known issues
------------

  Here are the changes found in IGTPW_11601 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - bat-adlm-1:         NOTRUN -> [SKIP][5] ([i915#3637]) +28 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adlm-1/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - bat-dg2-9:          NOTRUN -> [SKIP][6] ([i915#5354]) +28 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-dg2-9/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
    - bat-adlp-11:        NOTRUN -> [SKIP][7] ([i915#3637]) +28 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adlp-11/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@b-vga1:
    - fi-blb-e6850:       NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-blb-e6850/igt@kms_flip@bo-too-big-interruptible@b-vga1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][9] +28 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-kbl-x1275/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - bat-arlh-2:         NOTRUN -> [SKIP][10] ([i915#11346]) +28 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-arlh-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][11] +31 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-kbl-8809g/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][12] +28 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-kbl-guc/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:
    - bat-adls-6:         NOTRUN -> [FAIL][13] ([i915#2122]) +9 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adls-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:
    - bat-apl-1:          NOTRUN -> [FAIL][14] ([i915#2122]) +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-apl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - fi-ilk-650:         NOTRUN -> [FAIL][15] ([i915#2122]) +10 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-ilk-650/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - bat-rplp-1:         NOTRUN -> [FAIL][16] ([i915#2122]) +11 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - fi-cfl-guc:         NOTRUN -> [FAIL][17] ([i915#2122])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-cfl-guc/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@b-dp1:
    - bat-dg2-8:          NOTRUN -> [FAIL][18] ([i915#2122]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-dg2-8/igt@kms_flip@wf_vblank-ts-check@b-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:
    - bat-dg2-14:         NOTRUN -> [FAIL][19] ([i915#2122]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-dg2-14/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7978 -> IGTPW_11601

  CI-20190529: 20190529
  CI_DRM_15263: 4d24271792fac837e728f7bb6237a94ee46cc76e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11601: 11601
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/index.html

--===============4623202819576660333==
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
<tr><td><b>Series:</b></td><td>HAX/DO_NOT_MERGE: Profile kms_flip tests (i915 Vs XE)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137493/">https://patchwork.freedesktop.org/series/137493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7978 -&gt; IGTPW_11601</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11601 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11601, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/index.html</p>
<h2>Participating hosts (41 -&gt; 34)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (8): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 fi-cfl-8109u fi-pnv-d510 bat-jsl-1 bat-mtlp-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11601:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-dp1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adls-6/igt@kms_flip@absolute-wf_vblank@a-dp1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-apl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-vga1 (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-ivb-3770/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-vga1.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-edp1:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-twl-2/igt@kms_flip@wf_vblank-ts-check@c-edp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7978 and IGTPW_11601:</p>
<h3>New IGT tests (29)</h3>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-vga1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [14.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-vga1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [14.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.49] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11601 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adlm-1/igt@kms_flip@absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-dg2-9/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +28 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adlp-11/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@b-vga1:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-blb-e6850/igt@kms_flip@bo-too-big-interruptible@b-vga1.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-kbl-x1275/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-arlh-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-kbl-8809g/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">SKIP</a> +31 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-kbl-guc/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-adls-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-apl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-vga1:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-ilk-650/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-rplp-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/fi-cfl-guc/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-dp1:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-dg2-8/igt@kms_flip@wf_vblank-ts-check@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11601/bat-dg2-14/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7978 -&gt; IGTPW_11601</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15263: 4d24271792fac837e728f7bb6237a94ee46cc76e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11601: 11601<br />
  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4623202819576660333==--

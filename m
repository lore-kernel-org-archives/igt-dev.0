Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49193C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 10:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0974010E207;
	Mon, 19 Aug 2024 10:36:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C052510E207;
 Mon, 19 Aug 2024 10:36:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5808677585695219168=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_test_to_validate_fallba?=
 =?utf-8?q?ck_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 Aug 2024 10:36:02 -0000
Message-ID: <172406376278.678250.13491289531744293884@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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

--===============5808677585695219168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev3)
URL   : https://patchwork.freedesktop.org/series/134660/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15255 -> IGTPW_11593
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11593 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11593, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11593:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-rkl-11600/igt@kms_fallback@dp-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-tgl-1115g4/igt@kms_fallback@dp-fallback.html
    - bat-arls-2:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-2/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-mtlp-8/igt@kms_fallback@dp-fallback.html
    - bat-adls-6:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adls-6/igt@kms_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-jsl-1/igt@kms_fallback@dp-fallback.html
    - bat-arls-1:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-1/igt@kms_fallback@dp-fallback.html
    - bat-adlp-6:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlp-6/igt@kms_fallback@dp-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arlh-2/igt@kms_fallback@dp-fallback.html
    - {bat-arlh-3}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arlh-3/igt@kms_fallback@dp-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg1-7/igt@kms_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-twl-2/igt@kms_fallback@dp-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg2-11/igt@kms_fallback@dp-fallback.html
    - bat-rpls-4:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-rpls-4/igt@kms_fallback@dp-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-twl-1/igt@kms_fallback@dp-fallback.html
    - bat-dg2-14:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg2-14/igt@kms_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-rplp-1/igt@kms_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15255 and IGTPW_11593:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 1 fail(s) 6 pass(s) 31 skip(s)
    - Exec time: [0.0, 22.68] s

  

Known issues
------------

  Here are the changes found in IGTPW_11593 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlm-1:         [PASS][18] -> [INCOMPLETE][19] ([i915#9413])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][20] -> [DMESG-WARN][21] ([i915#11349] / [i915#11378])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-2/igt@i915_selftest@live@hangcheck.html
    - bat-arls-1:         [PASS][22] -> [DMESG-WARN][23] ([i915#11349] / [i915#11378])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-guc/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][25] ([i915#9792])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-mtlp-6/igt@kms_fallback@dp-fallback.html
    - bat-dg2-9:          NOTRUN -> [SKIP][26] ([i915#9197])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg2-9/igt@kms_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][28] ([i915#10470])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlp-11/igt@kms_fallback@dp-fallback.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-ivb-3770/igt@kms_fallback@dp-fallback.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-kbl-guc/igt@kms_fallback@dp-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-ilk-650/igt@kms_fallback@dp-fallback.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-blb-e6850/igt@kms_fallback@dp-fallback.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-bsw-n3050/igt@kms_fallback@dp-fallback.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-pnv-d510/igt@kms_fallback@dp-fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-elk-e7500/igt@kms_fallback@dp-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-kbl-2/igt@kms_fallback@dp-fallback.html
    - bat-adlm-1:         NOTRUN -> [SKIP][38] ([i915#9900])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlm-1/igt@kms_fallback@dp-fallback.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@ring_submission:
    - fi-cfl-8109u:       [DMESG-WARN][39] ([i915#11621]) -> [PASS][40] +81 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
    - fi-cfl-8109u:       [DMESG-WARN][41] ([i915#11621] / [i915#9925]) -> [PASS][42] +37 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7975 -> IGTPW_11593

  CI-20190529: 20190529
  CI_DRM_15255: 02f693a1a747b2784cedbbd7f6cf35be9a652d94 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11593: 11593
  IGT_7975: 7975

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/index.html

--===============5808677585695219168==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15255 -&gt; IGTPW_11593</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11593 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11593, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11593:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-rkl-11600/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-tgl-1115g4/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-mtlp-8/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adls-6/igt@kms_fallback@dp-fallback.html">FAIL</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-jsl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arlh-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arlh-3/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg1-7/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-twl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg2-11/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-rpls-4/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-twl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg2-14/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-rplp-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15255 and IGTPW_11593:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 1 fail(s) 6 pass(s) 31 skip(s)</li>
<li>Exec time: [0.0, 22.68] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11593 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fallback@dp-fallback (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-mtlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-dg2-9/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlp-11/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-ivb-3770/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-kbl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-ilk-650/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-blb-e6850/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-bsw-n3050/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-pnv-d510/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-elk-e7500/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-kbl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/bat-adlm-1/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11593/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7975 -&gt; IGTPW_11593</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15255: 02f693a1a747b2784cedbbd7f6cf35be9a652d94 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11593: 11593<br />
  IGT_7975: 7975</p>

</body>
</html>

--===============5808677585695219168==--

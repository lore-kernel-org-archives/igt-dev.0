Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3632C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 22:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E13210E41E;
	Mon, 26 Feb 2024 22:20:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DFC10E3AB;
 Mon, 26 Feb 2024 22:20:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2797198960765722644=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_IGT_tests_for_the_KMS_Color?=
 =?utf-8?q?_Pipeline_API_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 22:20:19 -0000
Message-ID: <170898601926.299097.8882589418358643099@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226211416.100660-1-harry.wentland@amd.com>
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
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

--===============2797198960765722644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT tests for the KMS Color Pipeline API (rev5)
URL   : https://patchwork.freedesktop.org/series/123448/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14345 -> IGTPW_10738
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-mtlp-8 bat-jsl-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10738 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - bat-atsm-1:         [INCOMPLETE][1] ([i915#10094] / [i915#10137]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - bat-arls-2:         [DMESG-WARN][3] ([i915#10194]) -> [ABORT][4] ([i915#10194])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-2/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-arls-2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-mtlp-6:         [SKIP][5] ([i915#9673] / [i915#9732] / [i915#9792]) -> [SKIP][6] ([i915#9732] / [i915#9792]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-9:         [SKIP][7] ([i915#9673] / [i915#9732]) -> [SKIP][8] ([i915#9732]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-rplp-1:         [SKIP][9] ([i915#9673] / [i915#9732]) -> [SKIP][10] ([i915#9732]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-9:          [SKIP][11] ([i915#9673] / [i915#9732]) -> [SKIP][12] ([i915#9732]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-dg2-8:          [SKIP][13] ([i915#9673] / [i915#9732]) -> [SKIP][14] ([i915#9732]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10094]: https://gitlab.freedesktop.org/drm/intel/issues/10094
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7731 -> IGTPW_10738

  CI-20190529: 20190529
  CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10738: 10738
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf
+igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf
+igt@kms_colorop@plane-xr24-xr24-bt2020_oetf
+igt@kms_colorop@plane-xr24-xr24-bypass
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate
+igt@kms_colorop@plane-xr24-xr24-multiply_125
+igt@kms_colorop@plane-xr24-xr24-multiply_inv_125
+igt@kms_colorop@plane-xr24-xr24-pq_125_eotf
+igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf
+igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
+igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf
+igt@kms_colorop@plane-xr24-xr24-pq_eotf
+igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf
+igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf
+igt@kms_colorop@plane-xr24-xr24-srgb_eotf
+igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf
+igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf
+igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf
+igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut
+igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut
+igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf
+igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf
+igt@kms_colorop@plane-xr30-xr30-bt2020_oetf
+igt@kms_colorop@plane-xr30-xr30-bypass
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate
+igt@kms_colorop@plane-xr30-xr30-multiply_125
+igt@kms_colorop@plane-xr30-xr30-multiply_inv_125
+igt@kms_colorop@plane-xr30-xr30-pq_125_eotf
+igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf
+igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
+igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf
+igt@kms_colorop@plane-xr30-xr30-pq_eotf
+igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf
+igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf
+igt@kms_colorop@plane-xr30-xr30-srgb_eotf
+igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf
+igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf
+igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf
+igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut
+igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut
+igt@kms_properties@colorop-properties-atomic
+igt@kms_properties@colorop-properties-legacy
+igt@kms_properties@colorop-properties-legacy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/index.html

--===============2797198960765722644==
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
<tr><td><b>Series:</b></td><td>IGT tests for the KMS Color Pipeline API (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123448/">https://patchwork.freedesktop.org/series/123448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14345 -&gt; IGTPW_10738</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-mtlp-8 bat-jsl-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10738 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gem_contexts:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10094">i915#10094</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-2/igt@i915_selftest@live@gem_contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-arls-2/igt@i915_selftest@live@gem_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-rplp-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-dg2-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10738/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7731 -&gt; IGTPW_10738</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10738: 10738<br />
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf<br />
+igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf<br />
+igt@kms_colorop@plane-xr24-xr24-bt2020_oetf<br />
+igt@kms_colorop@plane-xr24-xr24-bypass<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive<br />
+igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate<br />
+igt@kms_colorop@plane-xr24-xr24-multiply_125<br />
+igt@kms_colorop@plane-xr24-xr24-multiply_inv_125<br />
+igt@kms_colorop@plane-xr24-xr24-pq_125_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-pq_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-srgb_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf<br />
+igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut<br />
+igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut<br />
+igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf<br />
+igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf<br />
+igt@kms_colorop@plane-xr30-xr30-bt2020_oetf<br />
+igt@kms_colorop@plane-xr30-xr30-bypass<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive<br />
+igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate<br />
+igt@kms_colorop@plane-xr30-xr30-multiply_125<br />
+igt@kms_colorop@plane-xr30-xr30-multiply_inv_125<br />
+igt@kms_colorop@plane-xr30-xr30-pq_125_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-pq_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-srgb_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf<br />
+igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut<br />
+igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut<br />
+igt@kms_properties@colorop-properties-atomic<br />
+igt@kms_properties@colorop-properties-legacy<br />
+igt@kms_properties@colorop-properties-legacy</p>

</body>
</html>

--===============2797198960765722644==--

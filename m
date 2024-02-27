Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE20C48BF6
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 00:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5A510F07F;
	Tue, 27 Feb 2024 00:45:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE6E10E834;
 Tue, 27 Feb 2024 00:45:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3573298517094710340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_More_updates_for_MTL_workar?=
 =?utf-8?q?ounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Feb 2024 00:45:31 -0000
Message-ID: <170899473106.299097.11954731905985931753@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
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

--===============3573298517094710340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: More updates for MTL workarounds
URL   : https://patchwork.freedesktop.org/series/130416/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14345 -> IGTPW_10739
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10739 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10739, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (2): fi-apl-guc fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10739:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
Known issues
------------

  Here are the changes found in IGTPW_10739 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_exec_fence@basic-busy@ccs0:
    - bat-arls-1:         [PASS][4] -> [DMESG-WARN][5] ([i915#10194])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][6] ([fdo#109271]) +39 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [PASS][7] -> [INCOMPLETE][8] ([i915#9413])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic@smem:
    - bat-arls-1:         [DMESG-WARN][9] ([i915#10194]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_create@basic@smem.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-atsm-1:         [INCOMPLETE][11] ([i915#10094] / [i915#10137]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10094]: https://gitlab.freedesktop.org/drm/intel/issues/10094
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7731 -> IGTPW_10739

  CI-20190529: 20190529
  CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10739: 10739
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf
-igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf
-igt@kms_colorop@plane-xr24-xr24-bt2020_oetf
-igt@kms_colorop@plane-xr24-xr24-bypass
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate
-igt@kms_colorop@plane-xr24-xr24-multiply_125
-igt@kms_colorop@plane-xr24-xr24-multiply_inv_125
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
-igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf
-igt@kms_colorop@plane-xr24-xr24-pq_eotf
-igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf
-igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf
-igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf
-igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut
-igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut
-igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf
-igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf
-igt@kms_colorop@plane-xr30-xr30-bt2020_oetf
-igt@kms_colorop@plane-xr30-xr30-bypass
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate
-igt@kms_colorop@plane-xr30-xr30-multiply_125
-igt@kms_colorop@plane-xr30-xr30-multiply_inv_125
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
-igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf
-igt@kms_colorop@plane-xr30-xr30-pq_eotf
-igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf
-igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf
-igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf
-igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut
-igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut
-igt@kms_properties@colorop-properties-atomic
-igt@kms_properties@colorop-properties-legacy
-igt@kms_properties@colorop-properties-legacy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html

--===============3573298517094710340==
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
<tr><td><b>Series:</b></td><td>More updates for MTL workarounds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130416/">https://patchwork.freedesktop.org/series/130416/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14345 -&gt; IGTPW_10739</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10739 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10739, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (2): fi-apl-guc fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10739:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10739 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10094">i915#10094</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7731 -&gt; IGTPW_10739</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10739: 10739<br />
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf<br />
-igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf<br />
-igt@kms_colorop@plane-xr24-xr24-bt2020_oetf<br />
-igt@kms_colorop@plane-xr24-xr24-bypass<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive<br />
-igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate<br />
-igt@kms_colorop@plane-xr24-xr24-multiply_125<br />
-igt@kms_colorop@plane-xr24-xr24-multiply_inv_125<br />
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-pq_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf<br />
-igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut<br />
-igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut<br />
-igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf<br />
-igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf<br />
-igt@kms_colorop@plane-xr30-xr30-bt2020_oetf<br />
-igt@kms_colorop@plane-xr30-xr30-bypass<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive<br />
-igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate<br />
-igt@kms_colorop@plane-xr30-xr30-multiply_125<br />
-igt@kms_colorop@plane-xr30-xr30-multiply_inv_125<br />
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-pq_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf<br />
-igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut<br />
-igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut<br />
-igt@kms_properties@colorop-properties-atomic<br />
-igt@kms_properties@colorop-properties-legacy<br />
-igt@kms_properties@colorop-properties-legacy</p>

</body>
</html>

--===============3573298517094710340==--

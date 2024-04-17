Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5AC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 12:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39CB1134A8;
	Wed, 17 Apr 2024 12:55:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280051134A6;
 Wed, 17 Apr 2024 12:55:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5142233247020594772=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Align_Xe_header_and_restore?=
 =?utf-8?q?_some_uAPI_flags_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Apr 2024 12:55:42 -0000
Message-ID: <171335854216.1465249.122018614093137780@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412142159.6-1-francois.dugast@intel.com>
In-Reply-To: <20240412142159.6-1-francois.dugast@intel.com>
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

--===============5142233247020594772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Align Xe header and restore some uAPI flags (rev4)
URL   : https://patchwork.freedesktop.org/series/131816/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14593 -> IGTPW_11030
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11030 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11030, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (3): fi-kbl-7567u bat-atsm-1 fi-bsw-n3050 
  Missing    (3): bat-kbl-2 fi-snb-2520m bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11030:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-arls-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-arls-2/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-arls-2/igt@kms_flip@basic-plain-flip@d-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_11030 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - bat-atsm-1:         NOTRUN -> [FAIL][4] ([i915#10563])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][6] +19 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][7] ([i915#4083])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#4079]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-atsm-1:         NOTRUN -> [SKIP][9] ([i915#6621])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gem:
    - bat-atsm-1:         NOTRUN -> [ABORT][10] ([i915#10182] / [i915#10564])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@i915_selftest@live@gem.html
    - bat-dg2-14:         [PASS][11] -> [ABORT][12] ([i915#10366])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-dg2-14/igt@i915_selftest@live@gem.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-dg2-14/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [PASS][13] -> [INCOMPLETE][14] ([i915#9413])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_addfb_basic@size-max:
    - bat-atsm-1:         NOTRUN -> [SKIP][15] ([i915#6077]) +37 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         NOTRUN -> [SKIP][16] ([i915#6078]) +22 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][17] +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-atsm-1:         NOTRUN -> [SKIP][18] ([i915#6093]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-1:         NOTRUN -> [SKIP][19] ([i915#1836]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][20] ([i915#7357])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-atsm-1:         NOTRUN -> [SKIP][21] ([i915#6094])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-atsm-1:         NOTRUN -> [SKIP][22] ([i915#4077]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         NOTRUN -> [SKIP][23] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7:
    - {bat-mtlp-9}:       [DMESG-WARN][24] ([i915#10435]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10182]: https://gitlab.freedesktop.org/drm/intel/issues/10182
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10435]: https://gitlab.freedesktop.org/drm/intel/issues/10435
  [i915#10563]: https://gitlab.freedesktop.org/drm/intel/issues/10563
  [i915#10564]: https://gitlab.freedesktop.org/drm/intel/issues/10564
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#9157]: https://gitlab.freedesktop.org/drm/intel/issues/9157
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7810 -> IGTPW_11030

  CI-20190529: 20190529
  CI_DRM_14593: 75418ec1fe7737396419e6447005b10e666aeaec @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11030: 4f618d806f39801e16d361470d7bfad537810ea1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/index.html

--===============5142233247020594772==
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
<tr><td><b>Series:</b></td><td>Align Xe header and restore some uAPI flags (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131816/">https://patchwork.freedesktop.org/series/131816/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14593 -&gt; IGTPW_11030</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11030 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11030, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (3): fi-kbl-7567u bat-atsm-1 fi-bsw-n3050 <br />
  Missing    (3): bat-kbl-2 fi-snb-2520m bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11030:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-arls-2/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-arls-2/igt@kms_flip@basic-plain-flip@d-edp1.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11030 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@gem_huc_copy@huc-copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10563">i915#10563</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@i915_selftest@live@gem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10182">i915#10182</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10564">i915#10564</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-dg2-14/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-dg2-14/igt@i915_selftest@live@gem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6093">i915#6093</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6094">i915#6094</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10435">i915#10435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11030/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7810 -&gt; IGTPW_11030</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14593: 75418ec1fe7737396419e6447005b10e666aeaec @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11030: 4f618d806f39801e16d361470d7bfad537810ea1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5142233247020594772==--

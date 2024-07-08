Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF71C3DA41
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 17:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A33710E2BB;
	Mon,  8 Jul 2024 17:09:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24F010E2BB;
 Mon,  8 Jul 2024 17:09:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7972793232125590362=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Extend_mocs-rpm_test_to_sup?=
 =?utf-8?q?port_d3_cold?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 08 Jul 2024 17:09:35 -0000
Message-ID: <172045857585.67503.2905507909411125399@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708145607.272869-1-badal.nilawar@intel.com>
In-Reply-To: <20240708145607.272869-1-badal.nilawar@intel.com>
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

--===============7972793232125590362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend mocs-rpm test to support d3 cold
URL   : https://patchwork.freedesktop.org/series/135849/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15045 -> IGTPW_11383
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/index.html

Participating hosts (41 -> 34)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (8): bat-kbl-2 fi-snb-2520m fi-glk-j4005 fi-elk-e7500 bat-dg2-11 bat-arls-1 bat-jsl-1 bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11383 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] +30 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - bat-dg2-8:          [PASS][4] -> [FAIL][5] ([i915#11379])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11379]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7919 -> IGTPW_11383

  CI-20190529: 20190529
  CI_DRM_15045: 1b010bec39a554cbbd0b51cbf49142e2f218013d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11383: 295a7a108eb7cfed44f88d5c6819c36d0738f484 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/index.html

--===============7972793232125590362==
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
<tr><td><b>Series:</b></td><td>Extend mocs-rpm test to support d3 cold</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135849/">https://patchwork.freedesktop.org/series/135849/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15045 -&gt; IGTPW_11383</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/index.html</p>
<h2>Participating hosts (41 -&gt; 34)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (8): bat-kbl-2 fi-snb-2520m fi-glk-j4005 fi-elk-e7500 bat-dg2-11 bat-arls-1 bat-jsl-1 bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11383 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15045/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11383/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379">i915#11379</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7919 -&gt; IGTPW_11383</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15045: 1b010bec39a554cbbd0b51cbf49142e2f218013d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11383: 295a7a108eb7cfed44f88d5c6819c36d0738f484 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7972793232125590362==--

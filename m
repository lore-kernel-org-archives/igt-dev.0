Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974D5C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 02:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F2110F707;
	Wed, 17 Apr 2024 02:01:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2951510F707;
 Wed, 17 Apr 2024 02:01:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4220640066601001242=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_add_check_f?=
 =?utf-8?q?or_deadlock_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Apr 2024 02:01:06 -0000
Message-ID: <171331926616.1463550.2725314196829066461@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417011701.321744-1-jesse.zhang@amd.com>
In-Reply-To: <20240417011701.321744-1-jesse.zhang@amd.com>
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

--===============4220640066601001242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add check for deadlock test (rev3)
URL   : https://patchwork.freedesktop.org/series/132427/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14591 -> IGTPW_11028
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/index.html

Participating hosts (39 -> 36)
------------------------------

  Additional (2): fi-kbl-7567u fi-kbl-8809g 
  Missing    (5): bat-mtlp-9 fi-bsw-n3050 fi-apl-guc fi-snb-2520m fi-cfl-8109u 

Known issues
------------

  Here are the changes found in IGTPW_11028 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [PASS][5] -> [FAIL][6] ([i915#10378])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14591/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][7] +11 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][8] +30 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - bat-adls-6:         [TIMEOUT][9] ([i915#10795]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14591/bat-adls-6/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/bat-adls-6/igt@i915_selftest@live@execlists.html

  
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10795]: https://gitlab.freedesktop.org/drm/intel/issues/10795
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7809 -> IGTPW_11028

  CI-20190529: 20190529
  CI_DRM_14591: 6eb009a883a7ae925b3b0f0363b64a026bb4333a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11028: 0a9e0425f7878505b0c1509fd435ebaee54edfbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/index.html

--===============4220640066601001242==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add check for deadlock test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132427/">https://patchwork.freedesktop.org/series/132427/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14591 -&gt; IGTPW_11028</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Additional (2): fi-kbl-7567u fi-kbl-8809g <br />
  Missing    (5): bat-mtlp-9 fi-bsw-n3050 fi-apl-guc fi-snb-2520m fi-cfl-8109u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11028 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14591/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +11 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14591/bat-adls-6/igt@i915_selftest@live@execlists.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10795">i915#10795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11028/bat-adls-6/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7809 -&gt; IGTPW_11028</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14591: 6eb009a883a7ae925b3b0f0363b64a026bb4333a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11028: 0a9e0425f7878505b0c1509fd435ebaee54edfbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4220640066601001242==--

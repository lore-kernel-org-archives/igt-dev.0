Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D32CD1288
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 16:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73B710F2FE;
	Mon,  1 Apr 2024 16:45:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1210F2F7;
 Mon,  1 Apr 2024 16:45:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0758919012390782696=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL3hlOiBVcGRhdGUgX194ZV9l?=
 =?utf-8?b?eGVjX3F1ZXVlX2NyZWF0ZSgpIChyZXYyKQ==?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Apr 2024 16:45:27 -0000
Message-ID: <171198992780.1117021.2653834302629481686@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240328031021.8356-1-niranjana.vishwanathapura@intel.com>
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

--===============0758919012390782696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe: Update __xe_exec_queue_create() (rev2)
URL   : https://patchwork.freedesktop.org/series/131723/
State : success

== Summary ==

CI Bug Log - changes from IGT_7793 -> IGTPW_10959
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/index.html

Participating hosts (31 -> 29)
------------------------------

  Additional (1): fi-bsw-nick 
  Missing    (3): fi-glk-j4005 bat-adlm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10959 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] +19 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adls-6:         [PASS][2] -> [DMESG-WARN][3] ([i915#5591])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7793/bat-adls-6/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/bat-adls-6/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [WARN][4] ([i915#10436]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7793/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-mtlp-9}:       [DMESG-WARN][6] ([i915#9522]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7793/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#9522]: https://gitlab.freedesktop.org/drm/intel/issues/9522


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7793 -> IGTPW_10959

  CI-20190529: 20190529
  CI_DRM_14511: a585b19932157f2c96293bf00288968ada86d435 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10959: 10959
  IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/index.html

--===============0758919012390782696==
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
<tr><td><b>Series:</b></td><td>lib/xe: Update __xe_exec_queue_create() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131723/">https://patchwork.freedesktop.org/series/131723/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7793 -&gt; IGTPW_10959</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/index.html</p>
<h2>Participating hosts (31 -&gt; 29)</h2>
<p>Additional (1): fi-bsw-nick <br />
  Missing    (3): fi-glk-j4005 bat-adlm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10959 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7793/bat-adls-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/bat-adls-6/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7793/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10436">i915#10436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7793/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9522">i915#9522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10959/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7793 -&gt; IGTPW_10959</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14511: a585b19932157f2c96293bf00288968ada86d435 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10959: 10959<br />
  IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0758919012390782696==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC283C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 14:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9710E25B;
	Mon, 20 May 2024 14:28:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CABF10E25B;
 Mon, 20 May 2024 14:28:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0205318694932546680=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fbig=5Ffb?=
 =?utf-8?q?=3A_Restrict_runs_on_simulation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 20 May 2024 14:28:33 -0000
Message-ID: <171621531357.2157358.13482199949792187789@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240520050155.435110-1-pranay.samala@intel.com>
In-Reply-To: <20240520050155.435110-1-pranay.samala@intel.com>
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

--===============0205318694932546680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_fb: Restrict runs on simulation
URL   : https://patchwork.freedesktop.org/series/133797/
State : success

== Summary ==

CI Bug Log - changes from IGT_7864 -> IGTPW_11158
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (1): fi-glk-j4005 

Known issues
------------

  Here are the changes found in IGTPW_11158 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_module_load@load:
    - bat-adlp-6:         [PASS][3] -> [DMESG-WARN][4] ([i915#8449])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-adlp-6/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-adlp-6/igt@i915_module_load@load.html
    - bat-arls-3:         [PASS][5] -> [ABORT][6] ([i915#11041])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-arls-3/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-arls-3/igt@i915_module_load@load.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       NOTRUN -> [SKIP][7] +10 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][8] ([i915#10800]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-arls-1:         [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-arls-1/igt@i915_selftest@live@gem_contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-arls-1/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-6:         [ABORT][12] ([i915#10021]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-adlp-6/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-adlp-6/igt@i915_selftest@live@hangcheck.html

  
  [i915#10021]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10021
  [i915#10800]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10800
  [i915#11041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#8449]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8449


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7864 -> IGTPW_11158

  CI-20190529: 20190529
  CI_DRM_14785: 1ba62f8cea9c797427d45108df1d453f4b343240 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11158: 11158
  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html

--===============0205318694932546680==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_fb: Restrict runs on simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133797/">https://patchwork.freedesktop.org/series/133797/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7864 -&gt; IGTPW_11158</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html</p>
<h2>Participating hosts (41 -&gt; 42)</h2>
<p>Additional (1): fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11158 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-adlp-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-adlp-6/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8449">i915#8449</a>)</li>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-arls-3/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-arls-3/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041">i915#11041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10800">i915#10800</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-arls-1/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-arls-1/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/bat-adlp-6/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/bat-adlp-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7864 -&gt; IGTPW_11158</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14785: 1ba62f8cea9c797427d45108df1d453f4b343240 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11158: 11158<br />
  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0205318694932546680==--

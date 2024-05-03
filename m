Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21561C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 23:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9B112A66;
	Fri,  3 May 2024 23:28:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD1D10EECE;
 Fri,  3 May 2024 23:28:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4955409858945560623=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_tests/intel/xe=5Fpm=3A_Reword_*-basic_description?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 May 2024 23:28:27 -0000
Message-ID: <171477890756.1888398.4002965381674104838@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
In-Reply-To: <20240503224745.14890-1-lucas.demarchi@intel.com>
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

--===============4955409858945560623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe_pm: Reword *-basic description
URL   : https://patchwork.freedesktop.org/series/133198/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14710 -> IGTPW_11099
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/index.html

Participating hosts (41 -> 35)
------------------------------

  Missing    (6): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-kbl-8809g fi-bsw-nick bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11099 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [DMESG-FAIL][1] ([i915#9500]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14710/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - {bat-mtlp-9}:       [DMESG-WARN][3] ([i915#10435]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14710/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7832 -> IGTPW_11099

  CI-20190529: 20190529
  CI_DRM_14710: ca96a1c62451ea534391d1eafe3a0b5691658c02 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11099: 555181cd03fe89ea46787e61d601fb041de44ed7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/index.html

--===============4955409858945560623==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe_pm: Reword *-basic description</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133198/">https://patchwork.freedesktop.org/series/133198/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14710 -&gt; IGTPW_11099</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/index.html</p>
<h2>Participating hosts (41 -&gt; 35)</h2>
<p>Missing    (6): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-kbl-8809g fi-bsw-nick bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11099 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14710/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14710/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435">i915#10435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11099/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7832 -&gt; IGTPW_11099</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14710: ca96a1c62451ea534391d1eafe3a0b5691658c02 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11099: 555181cd03fe89ea46787e61d601fb041de44ed7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4955409858945560623==--

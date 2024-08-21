Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E423C5321D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 00:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7910E563;
	Wed, 21 Aug 2024 00:11:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186810E563;
 Wed, 21 Aug 2024 00:11:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5282242960263624064=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Parse_GSC-based_HuC_firmwar?=
 =?utf-8?q?e_layout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Aug 2024 00:11:36 -0000
Message-ID: <172419909626.717042.1739296916595594205@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
In-Reply-To: <20240820232928.458248-1-lucas.demarchi@intel.com>
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

--===============5282242960263624064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Parse GSC-based HuC firmware layout (rev2)
URL   : https://patchwork.freedesktop.org/series/137473/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15267 -> IGTPW_11605
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/index.html

Participating hosts (42 -> 37)
------------------------------

  Missing    (5): bat-arlh-3 fi-bsw-n3050 fi-snb-2520m fi-elk-e7500 fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_11605 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - bat-arls-1:         [DMESG-FAIL][1] ([i915#10262]) -> [PASS][2] +20 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15267/bat-arls-1/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/bat-arls-1/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@objects:
    - bat-arls-1:         [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15267/bat-arls-1/igt@i915_selftest@live@objects.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/bat-arls-1/igt@i915_selftest@live@objects.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [DMESG-FAIL][5] ([i915#10262]) -> [DMESG-WARN][6] ([i915#11349])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15267/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7981 -> IGTPW_11605

  CI-20190529: 20190529
  CI_DRM_15267: 0729ba6a553ae595a4092ceb27300ea218c2efae @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11605: 11605
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/index.html

--===============5282242960263624064==
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
<tr><td><b>Series:</b></td><td>Parse GSC-based HuC firmware layout (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137473/">https://patchwork.freedesktop.org/series/137473/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15267 -&gt; IGTPW_11605</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/index.html</p>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Missing    (5): bat-arlh-3 fi-bsw-n3050 fi-snb-2520m fi-elk-e7500 fi-kbl-8809g </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11605 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15267/bat-arls-1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/bat-arls-1/igt@i915_selftest@live@execlists.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15267/bat-arls-1/igt@i915_selftest@live@objects.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/bat-arls-1/igt@i915_selftest@live@objects.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15267/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11605/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7981 -&gt; IGTPW_11605</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15267: 0729ba6a553ae595a4092ceb27300ea218c2efae @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11605: 11605<br />
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5282242960263624064==--

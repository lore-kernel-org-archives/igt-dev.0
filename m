Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F00CA0FF0
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 19:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7601510E516;
	Mon,  1 Sep 2025 19:46:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0FE10E47B;
 Mon,  1 Sep 2025 19:46:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0153929848436069541=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Madvise_Tests_in_IGT_=28r?=
 =?utf-8?q?ev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Sep 2025 19:46:14 -0000
Message-ID: <175675597437.290291.5040581848885693757@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250901164044.1028046-1-nishit.sharma@intel.com>
In-Reply-To: <20250901164044.1028046-1-nishit.sharma@intel.com>
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

--===============0153929848436069541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Madvise Tests in IGT (rev6)
URL   : https://patchwork.freedesktop.org/series/153335/
State : success

== Summary ==

CI Bug Log - changes from IGT_8519 -> IGTPW_13671
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13671 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][1] ([i915#13890]) -> [PASS][2] +78 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8519/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8519 -> IGTPW_13671
  * Linux: CI_DRM_17094 -> CI_DRM_17105

  CI-20190529: 20190529
  CI_DRM_17094: 99f4b32d88cb9718c944d44ea96cb04f4f70a773 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17105: f2856d85f7452831ece60ff0d26aa6aa4d6a3a55 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13671: 13671
  IGT_8519: 8519

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/index.html

--===============0153929848436069541==
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
<tr><td><b>Series:</b></td><td>Madvise Tests in IGT (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153335/">https://patchwork.freedesktop.org/series/153335/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8519 -&gt; IGTPW_13671</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13671 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8519/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13671/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8519 -&gt; IGTPW_13671</li>
<li>Linux: CI_DRM_17094 -&gt; CI_DRM_17105</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17094: 99f4b32d88cb9718c944d44ea96cb04f4f70a773 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17105: f2856d85f7452831ece60ff0d26aa6aa4d6a3a55 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13671: 13671<br />
  IGT_8519: 8519</p>

</body>
</html>

--===============0153929848436069541==--

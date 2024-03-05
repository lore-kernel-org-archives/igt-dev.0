Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E416C54E41
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 11:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B03112A38;
	Tue,  5 Mar 2024 11:15:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00D4112A38;
 Tue,  5 Mar 2024 11:15:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4535044396859806794=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_IGT_documentation_refactori?=
 =?utf-8?q?ng_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Piecielska" <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Mar 2024 11:15:46 -0000
Message-ID: <170963734698.524258.15559348478142862919@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301090844.671493-1-katarzyna.piecielska@intel.com>
In-Reply-To: <20240301090844.671493-1-katarzyna.piecielska@intel.com>
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

--===============4535044396859806794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT documentation refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/130555/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14376 -> IGTPW_10762
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10762 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-arls-2:         [PASS][2] -> [ABORT][3] ([i915#10373])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14376/bat-arls-2/igt@i915_selftest@live@gem_contexts.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/bat-arls-2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][4] ([fdo#109271]) +17 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [INCOMPLETE][5] ([i915#9413]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14376/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10373]: https://gitlab.freedesktop.org/drm/intel/issues/10373
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7741 -> IGTPW_10762

  CI-20190529: 20190529
  CI_DRM_14376: 320f2374b2d52629a6a52c6c3059f02efd73c0a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10762: 10762
  IGT_7741: 7741

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html

--===============4535044396859806794==
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
<tr><td><b>Series:</b></td><td>IGT documentation refactoring (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130555/">https://patchwork.freedesktop.org/series/130555/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14376 -&gt; IGTPW_10762</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10762 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14376/bat-arls-2/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/bat-arls-2/igt@i915_selftest@live@gem_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10373">i915#10373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14376/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7741 -&gt; IGTPW_10762</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14376: 320f2374b2d52629a6a52c6c3059f02efd73c0a5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10762: 10762<br />
  IGT_7741: 7741</p>

</body>
</html>

--===============4535044396859806794==--

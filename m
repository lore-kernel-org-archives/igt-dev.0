Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EC2C36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 19:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628E810E54D;
	Mon,  7 Apr 2025 19:15:29 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF110E556;
 Mon,  7 Apr 2025 19:15:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2722475734267042445=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_check_for_display_before_?=
 =?utf-8?q?cursor_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Apr 2025 19:15:28 -0000
Message-ID: <174405332859.44481.15891245618141392144@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
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

--===============2722475734267042445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: check for display before cursor size
URL   : https://patchwork.freedesktop.org/series/147337/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8310 -> IGTPW_12932
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12932 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12932, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12932:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem:
    - bat-arlh-2:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-arlh-2/igt@i915_selftest@live@gem.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [INCOMPLETE][2] ([i915#13971]) -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8310/bat-arlh-2/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-arlh-2/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_12932 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][4] -> [DMESG-WARN][5] ([i915#13494])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8310/bat-mtlp-9/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-mtlp-9/igt@i915_module_load@load.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - bat-arlh-2:         [INCOMPLETE][6] ([i915#13971]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8310/bat-arlh-2/igt@i915_selftest@live@gt_pm.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-arlh-2/igt@i915_selftest@live@gt_pm.html

  
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13971]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13971


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8310 -> IGTPW_12932

  CI-20190529: 20190529
  CI_DRM_16377: a33da369e8cde6c7208381a592866cd61f1ce188 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12932: 12932
  IGT_8310: 4b22256d016daa2f133092b62c03230ff121a3fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/index.html

--===============2722475734267042445==
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
<tr><td><b>Series:</b></td><td>check for display before cursor size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147337/">https://patchwork.freedesktop.org/series/147337/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8310 -&gt; IGTPW_12932</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12932 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12932, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12932:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gem:<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-arlh-2/igt@i915_selftest@live@gem.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8310/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13971">i915#13971</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12932 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8310/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8310/bat-arlh-2/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13971">i915#13971</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12932/bat-arlh-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8310 -&gt; IGTPW_12932</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16377: a33da369e8cde6c7208381a592866cd61f1ce188 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12932: 12932<br />
  IGT_8310: 4b22256d016daa2f133092b62c03230ff121a3fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2722475734267042445==--

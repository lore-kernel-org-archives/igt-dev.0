Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D595FC48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 15:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532710E79B;
	Wed, 21 Feb 2024 15:44:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E735B10E79A;
 Wed, 21 Feb 2024 15:44:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2054025423009127757=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/amdgpu/amd=5Fmultidis?=
 =?utf-8?q?play=5Fmodeset=3A_Run_mode_set_and_display_enable_for_multidispla?=
 =?utf-8?q?ys_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 15:44:23 -0000
Message-ID: <170853026394.179839.11853287318453992397@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221144400.258131-1-hersenxs.wu@amd.com>
In-Reply-To: <20240221144400.258131-1-hersenxs.wu@amd.com>
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

--===============2054025423009127757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_multidisplay_modeset: Run mode set and display enable for multidisplays (rev3)
URL   : https://patchwork.freedesktop.org/series/130136/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14308 -> IGTPW_10712
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10712 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10712, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10712:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_contexts:
    - bat-jsl-3:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-jsl-3/igt@i915_selftest@live@gt_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/bat-jsl-3/igt@i915_selftest@live@gt_contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_10712 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - {bat-arls-1}:       [DMESG-WARN][3] ([i915#10194]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7719 -> IGTPW_10712

  CI-20190529: 20190529
  CI_DRM_14308: e520d7c9e8738c2d1f6602cf43d6e761e5a93668 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10712: 10712
  IGT_7719: 7719


Testlist changes
----------------

-igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz
-igt@xe_query@multigpu-query-uc-fw-version-guc
-igt@xe_query@multigpu-query-uc-fw-version-huc
-igt@xe_query@query-invalid-uc-fw-version-mbz
-igt@xe_query@query-uc-fw-version-guc
-igt@xe_query@query-uc-fw-version-huc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/index.html

--===============2054025423009127757==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_multidisplay_modeset: Run mode set and display enable for multidisplays (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130136/">https://patchwork.freedesktop.org/series/130136/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14308 -&gt; IGTPW_10712</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10712 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10712, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10712:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_contexts:<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-jsl-3/igt@i915_selftest@live@gt_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/bat-jsl-3/igt@i915_selftest@live@gt_contexts.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10712 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@ccs0:<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14308/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10712/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7719 -&gt; IGTPW_10712</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14308: e520d7c9e8738c2d1f6602cf43d6e761e5a93668 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10712: 10712<br />
  IGT_7719: 7719</p>
<h2>Testlist changes</h2>
<p>-igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz<br />
-igt@xe_query@multigpu-query-uc-fw-version-guc<br />
-igt@xe_query@multigpu-query-uc-fw-version-huc<br />
-igt@xe_query@query-invalid-uc-fw-version-mbz<br />
-igt@xe_query@query-uc-fw-version-guc<br />
-igt@xe_query@query-uc-fw-version-huc</p>

</body>
</html>

--===============2054025423009127757==--

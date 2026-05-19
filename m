Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2724CD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 18:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892510E1BE;
	Tue, 19 May 2026 18:22:12 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6DD10E1BE;
 Tue, 19 May 2026 18:21:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6659996735365671755=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fsetmode=3A_Ad?=
 =?utf-8?q?d_HDMI_2=2E0_clock_limit_for_mode_selection_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 May 2026 18:21:53 -0000
Message-ID: <177921491329.86973.15404356419897227652@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519041750.1199802-1-jeevan.b@intel.com>
In-Reply-To: <20260519041750.1199802-1-jeevan.b@intel.com>
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

--===============6659996735365671755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Add HDMI 2.0 clock limit for mode selection (rev4)
URL   : https://patchwork.freedesktop.org/series/160881/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8921 -> IGTPW_15202
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15202 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15202, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/index.html

Participating hosts (42 -> 37)
------------------------------

  Missing    (5): fi-snb-2520m bat-rpls-4 bat-adls-6 bat-dg2-13 fi-skl-6600u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15202:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8921/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/bat-arlh-3/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_15202 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-adlp-6:         [DMESG-WARN][3] ([i915#15976]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8921/bat-adlp-6/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/bat-adlp-6/igt@i915_selftest@live.html

  
  [i915#15976]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15976


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8921 -> IGTPW_15202
  * Linux: CI_DRM_18521 -> CI_DRM_18523

  CI-20190529: 20190529
  CI_DRM_18521: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18523: d6f1da57da786bff18677325ed3672fd15f1f5f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15202: 15202
  IGT_8921: 8921

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/index.html

--===============6659996735365671755==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Add HDMI 2.0 clock limit for mode selection (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160881/">https://patchwork.freedesktop.org/series/160881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8921 -&gt; IGTPW_15202</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15202 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15202, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/index.html</p>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Missing    (5): fi-snb-2520m bat-rpls-4 bat-adls-6 bat-dg2-13 fi-skl-6600u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15202:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8921/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15202 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8921/bat-adlp-6/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15976">i915#15976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15202/bat-adlp-6/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8921 -&gt; IGTPW_15202</li>
<li>Linux: CI_DRM_18521 -&gt; CI_DRM_18523</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18521: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18523: d6f1da57da786bff18677325ed3672fd15f1f5f8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15202: 15202<br />
  IGT_8921: 8921</p>

</body>
</html>

--===============6659996735365671755==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8D0CA5FC4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 18:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECA210E0CD;
	Wed, 30 Sep 2026 18:09:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B46510E0CD;
 Wed, 30 Sep 2026 18:08:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7970619367377333106=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/intel=5Fcompute=3A_En?=
 =?utf-8?q?able_thread-group_preemption_on_NVL-P?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Sep 2026 18:08:29 -0000
Message-ID: <179079170953.225503.935087625646087035@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930141309.228834-1-jan.maslak@intel.com>
In-Reply-To: <20260930141309.228834-1-jan.maslak@intel.com>
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

--===============7970619367377333106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute: Enable thread-group preemption on NVL-P
URL   : https://patchwork.freedesktop.org/series/175307/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9118 -> IGTPW_15926
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15926 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15926, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/index.html

Participating hosts (38 -> 38)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15926:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@migrate:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9118/bat-arlh-3/igt@i915_selftest@live@migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/bat-arlh-3/igt@i915_selftest@live@migrate.html

  
Known issues
------------

  Here are the changes found in IGTPW_15926 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][3] -> [INCOMPLETE][4] ([i915#16547])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9118/bat-arlh-3/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/bat-arlh-3/igt@i915_selftest@live.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9118 -> IGTPW_15926
  * Linux: CI_DRM_19240 -> CI_DRM_19245

  CI-20190529: 20190529
  CI_DRM_19240: f59db4a7bc845221736d574ec8a3bbb117eb23e4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19245: 71ee29e1a20f63cd880cf336e9dff825d87f025d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15926: 5e4e4d49b94a65e08acb982b62a891132898f642 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/index.html

--===============7970619367377333106==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute: Enable thread-group preemption on NVL-P</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175307/">https://patchwork.freedesktop.org/series/175307/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9118 -&gt; IGTPW_15926</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15926 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15926, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15926:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@migrate:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9118/bat-arlh-3/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/bat-arlh-3/igt@i915_selftest@live@migrate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15926 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9118/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15926/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9118 -&gt; IGTPW_15926</li>
<li>Linux: CI_DRM_19240 -&gt; CI_DRM_19245</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19240: f59db4a7bc845221736d574ec8a3bbb117eb23e4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19245: 71ee29e1a20f63cd880cf336e9dff825d87f025d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15926: 5e4e4d49b94a65e08acb982b62a891132898f642 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7970619367377333106==--

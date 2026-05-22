Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D95FCD5BAB
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 00:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9736B10E1EE;
	Fri, 22 May 2026 00:06:52 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC2510E1EE;
 Fri, 22 May 2026 00:06:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5134635000188454194=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_xe=3A_Test_LR_and_fault_m?=
 =?utf-8?q?ode_workloads_across_suspend/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 May 2026 00:06:33 -0000
Message-ID: <177940839376.97871.42246166175366332@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
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

--===============5134635000188454194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Test LR and fault mode workloads across suspend/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/167026/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8933 -> IGTPW_15223
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15223 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15223, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15223:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@coherency:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8933/bat-arlh-3/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/bat-arlh-3/igt@i915_selftest@live@coherency.html

  
Known issues
------------

  Here are the changes found in IGTPW_15223 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][3] -> [INCOMPLETE][4] ([i915#16139])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8933/bat-arlh-3/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/bat-arlh-3/igt@i915_selftest@live.html

  
  [i915#16139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8933 -> IGTPW_15223

  CI-20190529: 20190529
  CI_DRM_18537: f103db97c610a41177720b08aa4a2a05f9b42d49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15223: 15223
  IGT_8933: 8933

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/index.html

--===============5134635000188454194==
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
<tr><td><b>Series:</b></td><td>xe: Test LR and fault mode workloads across suspend/resume (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167026/">https://patchwork.freedesktop.org/series/167026/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8933 -&gt; IGTPW_15223</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15223 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15223, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15223:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@coherency:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8933/bat-arlh-3/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/bat-arlh-3/igt@i915_selftest@live@coherency.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15223 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8933/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15223/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139">i915#16139</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8933 -&gt; IGTPW_15223</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18537: f103db97c610a41177720b08aa4a2a05f9b42d49 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15223: 15223<br />
  IGT_8933: 8933</p>

</body>
</html>

--===============5134635000188454194==--

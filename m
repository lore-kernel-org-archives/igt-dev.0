Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5DC606A31C
	for <igt-dev@archiver.kernel.org>; Sat, 28 Nov 2026 00:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3A10EAF3;
	Sat, 28 Nov 2026 00:46:22 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892E410EAF3;
 Sat, 28 Nov 2026 00:45:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1997133923046251818=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_intel-ci=3A_Update_blockl?=
 =?utf-8?q?ist_for_CRI_core_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Venkateswara Rao Muppidi" <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 28 Nov 2026 00:45:23 -0000
Message-ID: <179582672355.3057.3878957188186196587@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127122818.5410-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20261127122818.5410-1-venkateswara.rao.muppidi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1997133923046251818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Update blocklist for CRI core (rev2)
URL   : https://patchwork.freedesktop.org/series/179868/
State : success

== Summary ==

CI Bug Log - changes from IGT_9210 -> IGTPW_16235
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16235 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arls-6:         [PASS][1] -> [SKIP][2] ([i915#17751])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/bat-arls-6/igt@i915_pm_rpm@module-reload.html
    - bat-arls-5:         [PASS][3] -> [SKIP][4] ([i915#17751])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-5/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/bat-arls-5/igt@i915_pm_rpm@module-reload.html
    - bat-jsl-5:          [PASS][5] -> [FAIL][6] ([i915#17751])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-jsl-5/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/bat-jsl-5/igt@i915_pm_rpm@module-reload.html

  
  [i915#17751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9210 -> IGTPW_16235
  * Linux: CI_DRM_19626 -> CI_DRM_19627

  CI-20190529: 20190529
  CI_DRM_19626: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19627: e6fdf86e5b6ee6e33eaa2872df4b64d3ee991138 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16235: 16235
  IGT_9210: 9210

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/index.html

--===============1997133923046251818==
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
<tr><td><b>Series:</b></td><td>intel-ci: Update blocklist for CRI core (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179868/">https://patchwork.freedesktop.org/series/179868/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9210 -&gt; IGTPW_16235</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16235 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/bat-arls-6/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-5/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/bat-arls-5/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-jsl-5/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16235/bat-jsl-5/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9210 -&gt; IGTPW_16235</li>
<li>Linux: CI_DRM_19626 -&gt; CI_DRM_19627</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19626: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19627: e6fdf86e5b6ee6e33eaa2872df4b64d3ee991138 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16235: 16235<br />
  IGT_9210: 9210</p>

</body>
</html>

--===============1997133923046251818==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE636CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 22:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60C10E0A5;
	Tue,  6 Oct 2026 22:01:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D0E10E0A5;
 Tue,  6 Oct 2026 22:00:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4702518834319615577=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Fos=3A_Fix_igt?=
 =?utf-8?q?=5Frequire=5Fmemory_error_messages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Oct 2026 22:00:49 -0000
Message-ID: <179132404952.245285.9470168637135820448@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006204430.100929-1-jonathan.cavitt@intel.com>
In-Reply-To: <20261006204430.100929-1-jonathan.cavitt@intel.com>
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

--===============4702518834319615577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_os: Fix igt_require_memory error messages
URL   : https://patchwork.freedesktop.org/series/175634/
State : success

== Summary ==

CI Bug Log - changes from IGT_9131 -> IGTPW_15947
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Known issues
------------

  Here are the changes found in IGTPW_15947 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [INCOMPLETE][1] ([i915#16547]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9131/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - bat-arlh-3:         [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9131/bat-arlh-3/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/bat-arlh-3/igt@i915_selftest@live@gt_pm.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9131 -> IGTPW_15947
  * Linux: CI_DRM_19288 -> CI_DRM_19291

  CI-20190529: 20190529
  CI_DRM_19288: bdf99d9c06ef75bab68de0d8911442cd29c93717 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19291: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15947: 15947
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/index.html

--===============4702518834319615577==
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
<tr><td><b>Series:</b></td><td>lib/igt_os: Fix igt_require_memory error messages</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175634/">https://patchwork.freedesktop.org/series/175634/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9131 -&gt; IGTPW_15947</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15947 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9131/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9131/bat-arlh-3/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15947/bat-arlh-3/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9131 -&gt; IGTPW_15947</li>
<li>Linux: CI_DRM_19288 -&gt; CI_DRM_19291</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19288: bdf99d9c06ef75bab68de0d8911442cd29c93717 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19291: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15947: 15947<br />
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4702518834319615577==--

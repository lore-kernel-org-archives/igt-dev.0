Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F8C79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572010E2CA;
	Thu, 10 Sep 2026 19:21:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB75010E248;
 Thu, 10 Sep 2026 19:21:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8328571836831473467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm-uapi=3A_Sync_drm=5Fmo?=
 =?utf-8?q?de=2Eh_with_drm-next_up_to_1258f9c9ff1d?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 19:21:03 -0000
Message-ID: <178906806395.147924.2191297605405078959@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910151342.266876-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260910151342.266876-1-kamil.konieczny@linux.intel.com>
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

--===============8328571836831473467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi: Sync drm_mode.h with drm-next up to 1258f9c9ff1d
URL   : https://patchwork.freedesktop.org/series/173800/
State : success

== Summary ==

CI Bug Log - changes from IGT_9090 -> IGTPW_15827
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15827 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@migrate:
    - fi-bsw-nick:        [PASS][1] -> [DMESG-FAIL][2] ([i915#16997]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9090/fi-bsw-nick/igt@i915_selftest@live@migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/fi-bsw-nick/igt@i915_selftest@live@migrate.html

  
  [i915#16997]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16997


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9090 -> IGTPW_15827
  * Linux: CI_DRM_19120 -> CI_DRM_19122

  CI-20190529: 20190529
  CI_DRM_19120: b8885acadfe9e40109912dd45986112b007b0d98 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19122: aeaac9b539af202c51c1d8419fa36261d864b390 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15827: 38ec757c32bfa3c60bdeb56ff46e92b535e08cfa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9090: 9090

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/index.html

--===============8328571836831473467==
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
<tr><td><b>Series:</b></td><td>drm-uapi: Sync drm_mode.h with drm-next up to 1258f9c9ff1d</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173800/">https://patchwork.freedesktop.org/series/173800/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9090 -&gt; IGTPW_15827</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15827 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@migrate:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9090/fi-bsw-nick/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15827/fi-bsw-nick/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16997">i915#16997</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9090 -&gt; IGTPW_15827</li>
<li>Linux: CI_DRM_19120 -&gt; CI_DRM_19122</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19120: b8885acadfe9e40109912dd45986112b007b0d98 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19122: aeaac9b539af202c51c1d8419fa36261d864b390 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15827: 38ec757c32bfa3c60bdeb56ff46e92b535e08cfa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9090: 9090</p>

</body>
</html>

--===============8328571836831473467==--

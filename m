Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F232606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 16:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C751112BFD;
	Fri, 23 Oct 2026 16:11:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF26112BF7;
 Fri, 23 Oct 2026 16:09:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6711438240606888777=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Fsysfs=3A_fix_un?=
 =?utf-8?q?initialized_var_in_vram_d3cold_threshold_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Oct 2026 16:09:48 -0000
Message-ID: <179277178851.62817.13904443906809828239@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023054845.4907-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261023054845.4907-1-shivtej.eknath.patil@intel.com>
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
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6711438240606888777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_sysfs: fix uninitialized var in vram d3cold threshold helper
URL   : https://patchwork.freedesktop.org/series/176689/
State : success

== Summary ==

CI Bug Log - changes from IGT_9161 -> IGTPW_16038
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16038/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9161 -> IGTPW_16038
  * Linux: CI_DRM_19388 -> CI_DRM_19390

  CI-20190529: 20190529
  CI_DRM_19388: d6c8f78b0a1bb599990dcae731e1f6a29daeb9d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19390: a4c732aca52a51c32227b9a9a1364e1e533d275c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16038: 16038
  IGT_9161: 9161

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16038/index.html

--===============6711438240606888777==
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
<tr><td><b>Series:</b></td><td>lib/igt_sysfs: fix uninitialized var in vram d3cold threshold helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176689/">https://patchwork.freedesktop.org/series/176689/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16038/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9161 -&gt; IGTPW_16038</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16038/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9161 -&gt; IGTPW_16038</li>
<li>Linux: CI_DRM_19388 -&gt; CI_DRM_19390</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19388: d6c8f78b0a1bb599990dcae731e1f6a29daeb9d4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19390: a4c732aca52a51c32227b9a9a1364e1e533d275c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16038: 16038<br />
  IGT_9161: 9161</p>

</body>
</html>

--===============6711438240606888777==--

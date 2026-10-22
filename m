Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14273606A31B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 08:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF837112410;
	Thu, 22 Oct 2026 08:43:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE721112414;
 Thu, 22 Oct 2026 08:42:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4344944333950110136=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_add_coverage_for_xe=5Fpxp?=
 =?utf-8?q?=5Fdebugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Oct 2026 08:42:25 -0000
Message-ID: <179265854570.55582.3515182530084258275@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
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

--===============4344944333950110136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add coverage for xe_pxp_debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/175588/
State : success

== Summary ==

CI Bug Log - changes from IGT_9158 -> IGTPW_16031
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16031/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9158 -> IGTPW_16031

  CI-20190529: 20190529
  CI_DRM_19382: dccfdbc40b10720efe537dfc63de84eed983fc8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16031: 16031
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16031/index.html

--===============4344944333950110136==
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
<tr><td><b>Series:</b></td><td>add coverage for xe_pxp_debugfs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175588/">https://patchwork.freedesktop.org/series/175588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16031/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16031/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9158 -&gt; IGTPW_16031</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16031/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9158 -&gt; IGTPW_16031</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19382: dccfdbc40b10720efe537dfc63de84eed983fc8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16031: 16031<br />
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4344944333950110136==--

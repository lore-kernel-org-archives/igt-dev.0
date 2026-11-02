Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10131606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 04:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1710E4B5;
	Mon,  2 Nov 2026 04:57:08 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4B810EB1D;
 Mon,  2 Nov 2026 04:56:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4527797466521099327=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fs?=
 =?utf-8?q?ystem=5Fallocator=3A_Skip_reserved_PAT_madvise_indices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Nov 2026 04:56:16 -0000
Message-ID: <179359537617.100045.17007554840045360456@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102035218.1579371-1-nishit.sharma@intel.com>
In-Reply-To: <20261102035218.1579371-1-nishit.sharma@intel.com>
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

--===============4527797466521099327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Skip reserved PAT madvise indices (rev2)
URL   : https://patchwork.freedesktop.org/series/177074/
State : success

== Summary ==

CI Bug Log - changes from IGT_9173 -> IGTPW_16081
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16081/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9173 -> IGTPW_16081
  * Linux: CI_DRM_19420 -> CI_DRM_19422

  CI-20190529: 20190529
  CI_DRM_19420: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19422: e381c39629d83fbe9de2c94a98a2bbb0b875cf28 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16081: 16081
  IGT_9173: 9173

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16081/index.html

--===============4527797466521099327==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Skip reserved PAT madvise indices (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177074/">https://patchwork.freedesktop.org/series/177074/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16081/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16081/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9173 -&gt; IGTPW_16081</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16081/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9173 -&gt; IGTPW_16081</li>
<li>Linux: CI_DRM_19420 -&gt; CI_DRM_19422</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19420: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19422: e381c39629d83fbe9de2c94a98a2bbb0b875cf28 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16081: 16081<br />
  IGT_9173: 9173</p>

</body>
</html>

--===============4527797466521099327==--

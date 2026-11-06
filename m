Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C29606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 01:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6B10E0A2;
	Fri,  6 Nov 2026 01:48:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BD410E0A2;
 Fri,  6 Nov 2026 01:47:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4152374809169891973=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5F?=
 =?utf-8?q?injection=3A_drop_xe=5Fwopcm=5Finit_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Nov 2026 01:47:59 -0000
Message-ID: <179392967958.129615.15315322005201810175@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
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

--===============4152374809169891973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: drop xe_wopcm_init subtest
URL   : https://patchwork.freedesktop.org/series/177908/
State : success

== Summary ==

CI Bug Log - changes from IGT_9180 -> IGTPW_16113
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16113/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9180 -> IGTPW_16113
  * Linux: CI_DRM_19458 -> CI_DRM_19460

  CI-20190529: 20190529
  CI_DRM_19458: be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19460: 939254095daf14bd6ed8b6ec575d9b0ac390d781 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16113: 16113
  IGT_9180: 9180

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16113/index.html

--===============4152374809169891973==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: drop xe_wopcm_init subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177908/">https://patchwork.freedesktop.org/series/177908/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16113/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16113/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9180 -&gt; IGTPW_16113</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16113/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9180 -&gt; IGTPW_16113</li>
<li>Linux: CI_DRM_19458 -&gt; CI_DRM_19460</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19458: be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19460: 939254095daf14bd6ed8b6ec575d9b0ac390d781 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16113: 16113<br />
  IGT_9180: 9180</p>

</body>
</html>

--===============4152374809169891973==--

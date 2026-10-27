Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2DA606A324
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 19:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635B710E47D;
	Tue, 27 Oct 2026 19:30:23 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135110E47D;
 Tue, 27 Oct 2026 19:29:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6882510537066914410=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_xe/shaders=3A_remove_expl?=
 =?utf-8?q?icit_regioning_and_channel_offsets?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Oct 2026 19:29:33 -0000
Message-ID: <179312937312.78159.11395242066754574847@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027-remove_gpu_asm_annotations-v1-1-55a0fb61b96d@intel.com>
In-Reply-To: <20261027-remove_gpu_asm_annotations-v1-1-55a0fb61b96d@intel.com>
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

--===============6882510537066914410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/shaders: remove explicit regioning and channel offsets
URL   : https://patchwork.freedesktop.org/series/176973/
State : success

== Summary ==

CI Bug Log - changes from IGT_9168 -> IGTPW_16054
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9168 -> IGTPW_16054
  * Linux: CI_DRM_19399 -> CI_DRM_19400

  CI-20190529: 20190529
  CI_DRM_19399: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19400: 5e5b89446954adf0d9b74ba4228862403f71eec4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16054: 16054
  IGT_9168: 9168

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html

--===============6882510537066914410==
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
<tr><td><b>Series:</b></td><td>xe/shaders: remove explicit regioning and channel offsets</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176973/">https://patchwork.freedesktop.org/series/176973/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9168 -&gt; IGTPW_16054</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9168 -&gt; IGTPW_16054</li>
<li>Linux: CI_DRM_19399 -&gt; CI_DRM_19400</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19399: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19400: 5e5b89446954adf0d9b74ba4228862403f71eec4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16054: 16054<br />
  IGT_9168: 9168</p>

</body>
</html>

--===============6882510537066914410==--

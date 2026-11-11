Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C4606A321
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 06:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189110E108;
	Wed, 11 Nov 2026 06:48:13 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1C610E108;
 Wed, 11 Nov 2026 06:47:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5552641989456997355=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_imagination=3A_Update_all?=
 =?utf-8?q?ocation_flags_for_buffers_in_submit_job_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brajesh Gupta" <brajesh.gupta@imgtec.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Nov 2026 06:47:16 -0000
Message-ID: <179437963669.7234.5120676230995323326@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
In-Reply-To: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
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

--===============5552641989456997355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: imagination: Update allocation flags for buffers in submit job (rev2)
URL   : https://patchwork.freedesktop.org/series/177153/
State : success

== Summary ==

CI Bug Log - changes from IGT_9186 -> IGTPW_16130
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16130/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9186 -> IGTPW_16130
  * Linux: CI_DRM_19484 -> CI_DRM_19487

  CI-20190529: 20190529
  CI_DRM_19484: c8d0fb6110b86aa64eb59502df08b529e221f232 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19487: 2ccdda2d799a18f4f5aae513e475bc6b937760f0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16130: 16130
  IGT_9186: 9186

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16130/index.html

--===============5552641989456997355==
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
<tr><td><b>Series:</b></td><td>imagination: Update allocation flags for buffers in submit job (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177153/">https://patchwork.freedesktop.org/series/177153/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16130/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16130/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9186 -&gt; IGTPW_16130</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16130/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9186 -&gt; IGTPW_16130</li>
<li>Linux: CI_DRM_19484 -&gt; CI_DRM_19487</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19484: c8d0fb6110b86aa64eb59502df08b529e221f232 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19487: 2ccdda2d799a18f4f5aae513e475bc6b937760f0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16130: 16130<br />
  IGT_9186: 9186</p>

</body>
</html>

--===============5552641989456997355==--

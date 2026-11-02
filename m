Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A399F606A326
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 19:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1BB10E158;
	Mon,  2 Nov 2026 19:25:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700E010E158;
 Mon,  2 Nov 2026 19:24:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3413001573787203485=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fwriteback=3A_?=
 =?utf-8?q?Check_CRC_capture_survives_writeback_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aditya Tipre" <tipreaditya@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Nov 2026 19:24:10 -0000
Message-ID: <179364745045.106341.6491100783819435639@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261025182420.52258-1-tipreaditya@gmail.com>
In-Reply-To: <20261025182420.52258-1-tipreaditya@gmail.com>
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

--===============3413001573787203485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: Check CRC capture survives writeback (rev3)
URL   : https://patchwork.freedesktop.org/series/176841/
State : success

== Summary ==

CI Bug Log - changes from IGT_9175 -> IGTPW_16083
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/index.html

Participating hosts (38 -> 39)
------------------------------

  Additional (2): bat-arls-5 bat-adls-6 
  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16083 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-adls-6:         NOTRUN -> [FAIL][1] ([i915#17747])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/bat-adls-6/igt@runner@aborted.html
    - bat-arls-5:         NOTRUN -> [FAIL][2] ([i915#17747])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/bat-arls-5/igt@runner@aborted.html

  
  [i915#17747]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9175 -> IGTPW_16083
  * Linux: CI_DRM_19430 -> CI_DRM_19431

  CI-20190529: 20190529
  CI_DRM_19430: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19431: 2cd78713d917a02987f21b437561a5e1e13ddda2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16083: 16083
  IGT_9175: 9175

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/index.html

--===============3413001573787203485==
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
<tr><td><b>Series:</b></td><td>tests/kms_writeback: Check CRC capture survives writeback (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176841/">https://patchwork.freedesktop.org/series/176841/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9175 -&gt; IGTPW_16083</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/index.html</p>
<h2>Participating hosts (38 -&gt; 39)</h2>
<p>Additional (2): bat-arls-5 bat-adls-6 <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16083 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/bat-adls-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747">i915#17747</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16083/bat-arls-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747">i915#17747</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9175 -&gt; IGTPW_16083</li>
<li>Linux: CI_DRM_19430 -&gt; CI_DRM_19431</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19430: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19431: 2cd78713d917a02987f21b437561a5e1e13ddda2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16083: 16083<br />
  IGT_9175: 9175</p>

</body>
</html>

--===============3413001573787203485==--

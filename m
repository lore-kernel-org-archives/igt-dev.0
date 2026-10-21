Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09413606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 07:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F1710FC16;
	Wed, 21 Oct 2026 07:23:02 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756010FBF0;
 Wed, 21 Oct 2026 07:22:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5055451520768890111=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Feld=3A_Avoid_as?=
 =?utf-8?q?serting_on_malformed_SAD_fields?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Oct 2026 07:22:14 -0000
Message-ID: <179256733441.50726.6390626991832756187@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021054606.2731711-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261021054606.2731711-1-chaitanya.kumar.borah@intel.com>
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

--===============5055451520768890111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_eld: Avoid asserting on malformed SAD fields
URL   : https://patchwork.freedesktop.org/series/176529/
State : success

== Summary ==

CI Bug Log - changes from IGT_9156 -> IGTPW_16020
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16020/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9156 -> IGTPW_16020
  * Linux: CI_DRM_19366 -> CI_DRM_19372

  CI-20190529: 20190529
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19372: f3bbda7128124e54c4881b56958249a18d79a110 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16020: 16020
  IGT_9156: 9156

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16020/index.html

--===============5055451520768890111==
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
<tr><td><b>Series:</b></td><td>lib/igt_eld: Avoid asserting on malformed SAD fields</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176529/">https://patchwork.freedesktop.org/series/176529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16020/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16020/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9156 -&gt; IGTPW_16020</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16020/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9156 -&gt; IGTPW_16020</li>
<li>Linux: CI_DRM_19366 -&gt; CI_DRM_19372</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19372: f3bbda7128124e54c4881b56958249a18d79a110 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16020: 16020<br />
  IGT_9156: 9156</p>

</body>
</html>

--===============5055451520768890111==--

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14199606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF7310E050;
	Thu, 22 Oct 2026 05:59:44 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157510E050;
 Thu, 22 Oct 2026 05:58:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0673924257180163735=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fcompute=3A_Ad?=
 =?utf-8?q?d_missing_graphics_IP_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Oct 2026 05:58:45 -0000
Message-ID: <179264872526.54969.14642557499784523734@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261022044903.823091-1-jan.maslak@intel.com>
In-Reply-To: <20261022044903.823091-1-jan.maslak@intel.com>
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

--===============0673924257180163735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute: Add missing graphics IP support
URL   : https://patchwork.freedesktop.org/series/176603/
State : success

== Summary ==

CI Bug Log - changes from IGT_9156 -> IGTPW_16029
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16029/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-atsm-1 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9156 -> IGTPW_16029
  * Linux: CI_DRM_19366 -> CI_DRM_19382

  CI-20190529: 20190529
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19382: dccfdbc40b10720efe537dfc63de84eed983fc8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16029: 16029
  IGT_9156: 9156

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16029/index.html

--===============0673924257180163735==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute: Add missing graphics IP support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176603/">https://patchwork.freedesktop.org/series/176603/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16029/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16029/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9156 -&gt; IGTPW_16029</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16029/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-atsm-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9156 -&gt; IGTPW_16029</li>
<li>Linux: CI_DRM_19366 -&gt; CI_DRM_19382</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19382: dccfdbc40b10720efe537dfc63de84eed983fc8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16029: 16029<br />
  IGT_9156: 9156</p>

</body>
</html>

--===============0673924257180163735==--

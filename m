Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D2C3DA7A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 20:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5586F10E2D1;
	Wed, 14 Oct 2026 20:27:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BCC10E2D1;
 Wed, 14 Oct 2026 20:27:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5391255741521442383=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fforce=5Fconne?=
 =?utf-8?q?ctor=5Fbasic=3A_Add_EDID_bit-banging_read_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Oct 2026 20:27:09 -0000
Message-ID: <179200962907.25990.5738340284658836954@221881a7231d>
X-Patchwork-Hint: ignore
References: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
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

--===============5391255741521442383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: Add EDID bit-banging read test (rev2)
URL   : https://patchwork.freedesktop.org/series/175249/
State : success

== Summary ==

CI Bug Log - changes from IGT_9146 -> IGTPW_15987
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15987/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-jsl-5 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9146 -> IGTPW_15987
  * Linux: CI_DRM_19336 -> CI_DRM_19340

  CI-20190529: 20190529
  CI_DRM_19336: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19340: ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15987: a7a9818e410da1d1410e8f3376ca8bd19683384d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15987/index.html

--===============5391255741521442383==
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
<tr><td><b>Series:</b></td><td>tests/kms_force_connector_basic: Add EDID bit-banging read test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175249/">https://patchwork.freedesktop.org/series/175249/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15987/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9146 -&gt; IGTPW_15987</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15987/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-jsl-5 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9146 -&gt; IGTPW_15987</li>
<li>Linux: CI_DRM_19336 -&gt; CI_DRM_19340</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19336: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19340: ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15987: a7a9818e410da1d1410e8f3376ca8bd19683384d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5391255741521442383==--

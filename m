Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF2EC55184
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 13:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232A010EA4D;
	Tue,  4 Aug 2026 13:13:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB710EA4D;
 Tue,  4 Aug 2026 13:12:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5606817608255421611=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdp=5Fli?=
 =?utf-8?q?nktrain=5Ffallback=3A_Add_UHBR-to-HBR_fallback_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S, Sowmiya" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Aug 2026 13:12:56 -0000
Message-ID: <178584917657.17168.8729174838182319111@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803080514.687715-1-sowmiya.s@intel.com>
In-Reply-To: <20260803080514.687715-1-sowmiya.s@intel.com>
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

--===============5606817608255421611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/170685/
State : success

== Summary ==

CI Bug Log - changes from IGT_9036 -> IGTPW_15622
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15622/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9036 -> IGTPW_15622
  * Linux: CI_DRM_18932 -> CI_DRM_18938

  CI-20190529: 20190529
  CI_DRM_18932: f9ef9f302ee01854066ec6da30550da6ea6cb03a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18938: f8d080b47819f01011c1b9c3c875badbb67ec955 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15622: bf17f26a80603db6df60e5976ae280a99c2134f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9036: 9036

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15622/index.html

--===============5606817608255421611==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170685/">https://patchwork.freedesktop.org/series/170685/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15622/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15622/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9036 -&gt; IGTPW_15622</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15622/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9036 -&gt; IGTPW_15622</li>
<li>Linux: CI_DRM_18932 -&gt; CI_DRM_18938</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18932: f9ef9f302ee01854066ec6da30550da6ea6cb03a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18938: f8d080b47819f01011c1b9c3c875badbb67ec955 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15622: bf17f26a80603db6df60e5976ae280a99c2134f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9036: 9036</p>

</body>
</html>

--===============5606817608255421611==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DC7C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 12:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A0689E9E;
	Tue, 28 Jul 2026 12:08:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCC210E891;
 Tue, 28 Jul 2026 12:07:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6653768148321700138=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_gem=5Fwsim=3A_fix_batch_p?=
 =?utf-8?q?remature_completion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jul 2026 12:07:55 -0000
Message-ID: <178524047557.230937.12550439017707768930@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
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

--===============6653768148321700138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_wsim: fix batch premature completion
URL   : https://patchwork.freedesktop.org/series/171174/
State : success

== Summary ==

CI Bug Log - changes from IGT_9027 -> IGTPW_15601
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15601/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): bat-dg2-13 bat-arls-6 fi-snb-2520m fi-pnv-d510 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9027 -> IGTPW_15601
  * Linux: CI_DRM_18902 -> CI_DRM_18910

  CI-20190529: 20190529
  CI_DRM_18902: 3cbfb56ee0481aaabc9369045a4b120a20dfccc4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18910: d6eac0e9ec8128a0ae16cd8c06b9220a4a185f15 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15601: 15601
  IGT_9027: 9027

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15601/index.html

--===============6653768148321700138==
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
<tr><td><b>Series:</b></td><td>gem_wsim: fix batch premature completion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171174/">https://patchwork.freedesktop.org/series/171174/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15601/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15601/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9027 -&gt; IGTPW_15601</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15601/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): bat-dg2-13 bat-arls-6 fi-snb-2520m fi-pnv-d510 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9027 -&gt; IGTPW_15601</li>
<li>Linux: CI_DRM_18902 -&gt; CI_DRM_18910</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18902: 3cbfb56ee0481aaabc9369045a4b120a20dfccc4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18910: d6eac0e9ec8128a0ae16cd8c06b9220a4a185f15 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15601: 15601<br />
  IGT_9027: 9027</p>

</body>
</html>

--===============6653768148321700138==--

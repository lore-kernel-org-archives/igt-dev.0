Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EB7CCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 14:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C38C10E1A2;
	Tue,  7 Oct 2025 14:29:00 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405A310E69F;
 Tue,  7 Oct 2025 14:28:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2979389802087964945=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/gem=5Feio=3A_Resolve_?=
 =?utf-8?q?timing_issues_in_stress_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Oct 2025 14:28:59 -0000
Message-ID: <175984733925.14049.11676968904312968666@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007113910.3336564-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251007113910.3336564-7-janusz.krzysztofik@linux.intel.com>
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

--===============2979389802087964945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_eio: Resolve timing issues in stress subtests
URL   : https://patchwork.freedesktop.org/series/155531/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8575_BAT -> XEIGTPW_13866_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8575 -> IGTPW_13866
  * Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -> xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3

  IGTPW_13866: c78d6b84bca74d29e4ee768aa3d140de9683e61d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf
  xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13866/index.html

--===============2979389802087964945==
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
<tr><td><b>Series:</b></td><td>tests/gem_eio: Resolve timing issues in stress subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155531/">https://patchwork.freedesktop.org/series/155531/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13866/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8575_BAT -&gt; XEIGTPW_13866_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8575 -&gt; IGTPW_13866</li>
<li>Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -&gt; xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3</li>
</ul>
<p>IGTPW_13866: c78d6b84bca74d29e4ee768aa3d140de9683e61d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf<br />
  xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3</p>

</body>
</html>

--===============2979389802087964945==--

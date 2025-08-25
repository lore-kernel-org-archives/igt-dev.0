Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0383CA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 18:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5310E535;
	Mon, 25 Aug 2025 18:52:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F3B10E27C;
 Mon, 25 Aug 2025 18:52:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1703229183561052185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_Unbind_before_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Aug 2025 18:52:36 -0000
Message-ID: <175614795693.268230.9436022290221580213@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
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

--===============1703229183561052185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: Unbind before tests (rev2)
URL   : https://patchwork.freedesktop.org/series/153175/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8507_BAT -> XEIGTPW_13632_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13632_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8507 -> IGTPW_13632

  IGTPW_13632: 75734f3f8d20a3af9e559bc8ee0bd941867876a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8507: 8507
  xe-3613-18d3cf2c98bae56e1e393a788980d9d26442f729: 18d3cf2c98bae56e1e393a788980d9d26442f729

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13632/index.html

--===============1703229183561052185==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: Unbind before tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153175/">https://patchwork.freedesktop.org/series/153175/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13632/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13632/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8507_BAT -&gt; XEIGTPW_13632_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13632_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8507 -&gt; IGTPW_13632</li>
</ul>
<p>IGTPW_13632: 75734f3f8d20a3af9e559bc8ee0bd941867876a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8507: 8507<br />
  xe-3613-18d3cf2c98bae56e1e393a788980d9d26442f729: 18d3cf2c98bae56e1e393a788980d9d26442f729</p>

</body>
</html>

--===============1703229183561052185==--

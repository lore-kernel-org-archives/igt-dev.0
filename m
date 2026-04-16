Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5919F8E48C
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 22:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823B710E943;
	Thu, 16 Apr 2026 22:58:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABFC10E947;
 Thu, 16 Apr 2026 22:58:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6590354847321130306=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_lib/kms=3A_Introduce_for=5Feach=5Fplane=5Fformat=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Apr 2026 22:58:13 -0000
Message-ID: <177638029349.470125.11937741394339967032@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
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

--===============6590354847321130306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/kms: Introduce for_each_plane_format()
URL   : https://patchwork.freedesktop.org/series/165004/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8863_BAT -> XEIGTPW_15000_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8863 -> IGTPW_15000
  * Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -> xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55

  IGTPW_15000: fb76a241e005de7f25e0e14b619eac3ec736008a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454
  xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55: 2a1c604bebed8cbbe6aea00f761777eed424dc55

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15000/index.html

--===============6590354847321130306==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] lib/kms: Introduce for_each_plane_format()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165004/">https://patchwork.freedesktop.org/series/165004/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15000/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15000/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8863_BAT -&gt; XEIGTPW_15000_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8863 -&gt; IGTPW_15000</li>
<li>Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -&gt; xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55</li>
</ul>
<p>IGTPW_15000: fb76a241e005de7f25e0e14b619eac3ec736008a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454<br />
  xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55: 2a1c604bebed8cbbe6aea00f761777eed424dc55</p>

</body>
</html>

--===============6590354847321130306==--

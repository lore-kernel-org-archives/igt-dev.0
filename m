Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FD2C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 21:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F11710E6A4;
	Tue, 19 Mar 2024 21:17:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181110E25F;
 Tue, 19 Mar 2024 21:17:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0945375799144863820=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fasync=5Fflips=3A_E?=
 =?utf-8?q?xtend_the_=22async_flip_needs_an_extra_frame=22_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Mar 2024 21:17:44 -0000
Message-ID: <171088306413.906748.7090854058226123168@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319202443.27951-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240319202443.27951-1-ville.syrjala@linux.intel.com>
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

--===============0945375799144863820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Extend the "async flip needs an extra frame" logic
URL   : https://patchwork.freedesktop.org/series/131345/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7770_BAT -> XEIGTPW_10863_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7770 -> IGTPW_10863
  * Linux: xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85 -> xe-960-38507920a9f9bd379ae008903e42fd7419b346c3

  IGTPW_10863: 10863
  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85: 8bce3f2c9e8b3c23a242b11e32c62e662e722d85
  xe-960-38507920a9f9bd379ae008903e42fd7419b346c3: 38507920a9f9bd379ae008903e42fd7419b346c3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10863/index.html

--===============0945375799144863820==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Extend the &quot;async flip needs an extra frame&quot; logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131345/">https://patchwork.freedesktop.org/series/131345/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10863/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10863/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7770_BAT -&gt; XEIGTPW_10863_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7770 -&gt; IGTPW_10863</li>
<li>Linux: xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85 -&gt; xe-960-38507920a9f9bd379ae008903e42fd7419b346c3</li>
</ul>
<p>IGTPW_10863: 10863<br />
  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-955-8bce3f2c9e8b3c23a242b11e32c62e662e722d85: 8bce3f2c9e8b3c23a242b11e32c62e662e722d85<br />
  xe-960-38507920a9f9bd379ae008903e42fd7419b346c3: 38507920a9f9bd379ae008903e42fd7419b346c3</p>

</body>
</html>

--===============0945375799144863820==--

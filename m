Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EC9CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 22:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550A10E5A5;
	Wed, 17 Sep 2025 22:35:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA6E10E5A5;
 Wed, 17 Sep 2025 22:35:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3781205809537574869=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fpipe=5Fstress?=
 =?utf-8?q?=3A_lower_minimum_iterations_in_simulation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Sep 2025 22:35:32 -0000
Message-ID: <175814853273.342794.10868309476434918600@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250917090411.376984-1-swati2.sharma@intel.com>
In-Reply-To: <20250917090411.376984-1-swati2.sharma@intel.com>
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

--===============3781205809537574869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_pipe_stress: lower minimum iterations in simulation
URL   : https://patchwork.freedesktop.org/series/154637/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8543_BAT -> XEIGTPW_13764_BAT
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

  * IGT: IGT_8543 -> IGTPW_13764
  * Linux: xe-3784-d84b3514a845885db8cf928cc246c8efbd80a00e -> xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd

  IGTPW_13764: 13764
  IGT_8543: 8543
  xe-3784-d84b3514a845885db8cf928cc246c8efbd80a00e: d84b3514a845885db8cf928cc246c8efbd80a00e
  xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd: 877cacfae04717ab0cbb9c9eac7b4179000280cd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13764/index.html

--===============3781205809537574869==
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
<tr><td><b>Series:</b></td><td>tests/kms_pipe_stress: lower minimum iterations in simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154637/">https://patchwork.freedesktop.org/series/154637/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13764/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13764/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8543_BAT -&gt; XEIGTPW_13764_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8543 -&gt; IGTPW_13764</li>
<li>Linux: xe-3784-d84b3514a845885db8cf928cc246c8efbd80a00e -&gt; xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd</li>
</ul>
<p>IGTPW_13764: 13764<br />
  IGT_8543: 8543<br />
  xe-3784-d84b3514a845885db8cf928cc246c8efbd80a00e: d84b3514a845885db8cf928cc246c8efbd80a00e<br />
  xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd: 877cacfae04717ab0cbb9c9eac7b4179000280cd</p>

</body>
</html>

--===============3781205809537574869==--

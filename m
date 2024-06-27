Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FF4C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 03:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C4D10E9FE;
	Thu, 27 Jun 2024 03:29:06 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EC310E9FE;
 Thu, 27 Jun 2024 03:29:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4789307600055551133=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/km=5Fpm=5Fbrightness=2Ec?=
 =?utf-8?q?=3A_check_for_flickers_while_adjusting_the_brightness=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jun 2024 03:29:05 -0000
Message-ID: <171945894526.163493.1514132677501536568@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
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

--===============4789307600055551133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/km_pm_brightness.c: check for flickers while adjusting the brightness.
URL   : https://patchwork.freedesktop.org/series/135463/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7904_BAT -> XEIGTPW_11324_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11324_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {bat-lnl-1}:        [DMESG-WARN][1] ([Intel XE#1330]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11324/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330


Build changes
-------------

  * IGT: IGT_7904 -> IGTPW_11324
  * Linux: xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954 -> xe-1537-6580bd2882edc6ea84200f2968d3d12b69b3ce40

  IGTPW_11324: 11324
  IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954: c02b84a0d04c551044f5b479e6599692c7c1f954
  xe-1537-6580bd2882edc6ea84200f2968d3d12b69b3ce40: 6580bd2882edc6ea84200f2968d3d12b69b3ce40

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11324/index.html

--===============4789307600055551133==
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
<tr><td><b>Series:</b></td><td>tests/km_pm_brightness.c: check for flickers while adjusting the brightness.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135463/">https://patchwork.freedesktop.org/series/135463/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11324/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11324/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7904_BAT -&gt; XEIGTPW_11324_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11324_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11324/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7904 -&gt; IGTPW_11324</li>
<li>Linux: xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954 -&gt; xe-1537-6580bd2882edc6ea84200f2968d3d12b69b3ce40</li>
</ul>
<p>IGTPW_11324: 11324<br />
  IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954: c02b84a0d04c551044f5b479e6599692c7c1f954<br />
  xe-1537-6580bd2882edc6ea84200f2968d3d12b69b3ce40: 6580bd2882edc6ea84200f2968d3d12b69b3ce40</p>

</body>
</html>

--===============4789307600055551133==--

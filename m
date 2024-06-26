Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD5FC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 21:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08510E165;
	Wed, 26 Jun 2024 21:51:16 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4C10E165;
 Wed, 26 Jun 2024 21:51:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0331095432619940878=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_New_test_to_validate_link-off_?=
 =?utf-8?q?between_active_regions_=28LOBF=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jun 2024 21:51:15 -0000
Message-ID: <171943867513.162560.8971770051997996393@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626191537.1507452-1-jeevan.b@intel.com>
In-Reply-To: <20240626191537.1507452-1-jeevan.b@intel.com>
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

--===============0331095432619940878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New test to validate link-off between active regions (LOBF)
URL   : https://patchwork.freedesktop.org/series/135446/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7904_BAT -> XEIGTPW_11322_BAT
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

  Here are the changes found in XEIGTPW_11322_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {bat-lnl-1}:        [DMESG-WARN][1] ([Intel XE#1330]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330


Build changes
-------------

  * IGT: IGT_7904 -> IGTPW_11322
  * Linux: xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954 -> xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada

  IGTPW_11322: 150ef53ebad688eb29c91c116c66131f358abd85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954: c02b84a0d04c551044f5b479e6599692c7c1f954
  xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada: 39235fee2ef6c0933097ee921c86a676dba72ada

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/index.html

--===============0331095432619940878==
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
<tr><td><b>Series:</b></td><td>New test to validate link-off between active regions (LOBF)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135446/">https://patchwork.freedesktop.org/series/135446/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7904_BAT -&gt; XEIGTPW_11322_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11322_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7904/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11322/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7904 -&gt; IGTPW_11322</li>
<li>Linux: xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954 -&gt; xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada</li>
</ul>
<p>IGTPW_11322: 150ef53ebad688eb29c91c116c66131f358abd85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1535-c02b84a0d04c551044f5b479e6599692c7c1f954: c02b84a0d04c551044f5b479e6599692c7c1f954<br />
  xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada: 39235fee2ef6c0933097ee921c86a676dba72ada</p>

</body>
</html>

--===============0331095432619940878==--

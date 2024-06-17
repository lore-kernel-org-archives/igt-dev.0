Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0293C27C6E
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 08:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4EB10E049;
	Mon, 17 Jun 2024 08:59:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874710E049;
 Mon, 17 Jun 2024 08:59:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5988847771322939954=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/intel=5Fchipset=3A_add_Bat?=
 =?utf-8?q?tlemage_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Jun 2024 08:59:20 -0000
Message-ID: <171861476042.97055.3594551478643771229@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
In-Reply-To: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
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

--===============5988847771322939954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_chipset: add Battlemage support
URL   : https://patchwork.freedesktop.org/series/134937/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7889_BAT -> XEIGTPW_11263_BAT
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

  Here are the changes found in XEIGTPW_11263_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11263/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7889 -> IGTPW_11263
  * Linux: xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2 -> xe-1478-9063661ba438a2b1f01b73b6035be9a7156c4345

  IGTPW_11263: 11263
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2
  xe-1478-9063661ba438a2b1f01b73b6035be9a7156c4345: 9063661ba438a2b1f01b73b6035be9a7156c4345

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11263/index.html

--===============5988847771322939954==
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
<tr><td><b>Series:</b></td><td>lib/intel_chipset: add Battlemage support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134937/">https://patchwork.freedesktop.org/series/134937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11263/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11263/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7889_BAT -&gt; XEIGTPW_11263_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11263_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7889/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11263/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7889 -&gt; IGTPW_11263</li>
<li>Linux: xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2 -&gt; xe-1478-9063661ba438a2b1f01b73b6035be9a7156c4345</li>
</ul>
<p>IGTPW_11263: 11263<br />
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2<br />
  xe-1478-9063661ba438a2b1f01b73b6035be9a7156c4345: 9063661ba438a2b1f01b73b6035be9a7156c4345</p>

</body>
</html>

--===============5988847771322939954==--

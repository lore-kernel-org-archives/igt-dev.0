Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2236C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 20:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D54A10EAEF;
	Mon, 13 Jul 2026 20:26:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9D210EAEF;
 Mon, 13 Jul 2026 20:26:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0705220846225479991=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fmul?=
 =?utf-8?q?ti=5Fqueue=3A_Check_PXP_is_rejected_on_multi-queue_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jul 2026 20:26:13 -0000
Message-ID: <178397437329.185203.6192533471750171251@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <a5d7b699ffcbd7b590f824f67a7ca162eb59bf37.1783969453.git.jagmeet.randhawa@intel.com>
In-Reply-To: <a5d7b699ffcbd7b590f824f67a7ca162eb59bf37.1783969453.git.jagmeet.randhawa@intel.com>
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

--===============0705220846225479991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue (rev2)
URL   : https://patchwork.freedesktop.org/series/170148/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9005_BAT -> XEIGTPW_15523_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15523_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][1] -> [ABORT][2] ([Intel XE#8543])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9005/bat-wcl-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15523/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#8543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8543


Build changes
-------------

  * IGT: IGT_9005 -> IGTPW_15523
  * Linux: xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218 -> xe-5395-b4ff3505d3eacce720d43e24651ce84f2a0d7f56

  IGTPW_15523: 15523
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218: 83d782d98f4ebb4a10b8ee107e3a389917e0b218
  xe-5395-b4ff3505d3eacce720d43e24651ce84f2a0d7f56: b4ff3505d3eacce720d43e24651ce84f2a0d7f56

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15523/index.html

--===============0705220846225479991==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170148/">https://patchwork.freedesktop.org/series/170148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15523/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15523/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9005_BAT -&gt; XEIGTPW_15523_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15523_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9005/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15523/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8543">Intel XE#8543</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9005 -&gt; IGTPW_15523</li>
<li>Linux: xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218 -&gt; xe-5395-b4ff3505d3eacce720d43e24651ce84f2a0d7f56</li>
</ul>
<p>IGTPW_15523: 15523<br />
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5391-83d782d98f4ebb4a10b8ee107e3a389917e0b218: 83d782d98f4ebb4a10b8ee107e3a389917e0b218<br />
  xe-5395-b4ff3505d3eacce720d43e24651ce84f2a0d7f56: b4ff3505d3eacce720d43e24651ce84f2a0d7f56</p>

</body>
</html>

--===============0705220846225479991==--

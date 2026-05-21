Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC1CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 09:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0566C10E244;
	Thu, 21 May 2026 09:57:04 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5E10E244;
 Thu, 21 May 2026 09:56:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1893504311852126917=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Update_pre-Xe_large-buffer_?=
 =?utf-8?q?compute_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 May 2026 09:56:44 -0000
Message-ID: <177935740493.95471.9647225251122132567@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
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

--===============1893504311852126917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update pre-Xe large-buffer compute support (rev2)
URL   : https://patchwork.freedesktop.org/series/166926/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8928_BAT -> XEIGTPW_15214_BAT
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

  Here are the changes found in XEIGTPW_15214_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [ABORT][1] ([Intel XE#8007] / [Intel XE#8023]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8928/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15214/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * IGT: IGT_8928 -> IGTPW_15214
  * Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -> xe-5107-0ffb3694ec23fd2b68338a9d596a90e9283d991e

  IGTPW_15214: 203a350ca766ee560b744724fb44ccfacf0487b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8928: 8928
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed
  xe-5107-0ffb3694ec23fd2b68338a9d596a90e9283d991e: 0ffb3694ec23fd2b68338a9d596a90e9283d991e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15214/index.html

--===============1893504311852126917==
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
<tr><td><b>Series:</b></td><td>Update pre-Xe large-buffer compute support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166926/">https://patchwork.freedesktop.org/series/166926/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15214/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15214/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8928_BAT -&gt; XEIGTPW_15214_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15214_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8928/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15214/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8928 -&gt; IGTPW_15214</li>
<li>Linux: xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed -&gt; xe-5107-0ffb3694ec23fd2b68338a9d596a90e9283d991e</li>
</ul>
<p>IGTPW_15214: 203a350ca766ee560b744724fb44ccfacf0487b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8928: 8928<br />
  xe-5106-a7f4472d401c5c4ee7710c20b7350b6958b8bbed: a7f4472d401c5c4ee7710c20b7350b6958b8bbed<br />
  xe-5107-0ffb3694ec23fd2b68338a9d596a90e9283d991e: 0ffb3694ec23fd2b68338a9d596a90e9283d991e</p>

</body>
</html>

--===============1893504311852126917==--

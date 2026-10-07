Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A4CA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 22:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DAF10F810;
	Wed,  7 Oct 2026 22:24:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FCE10E6EF;
 Wed,  7 Oct 2026 22:23:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3759220973883504374=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_dmesg_ignore_regexes_wi?=
 =?utf-8?q?th_backslash_escapes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Oct 2026 22:23:22 -0000
Message-ID: <179141180251.250221.8162173599389569234@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
In-Reply-To: <20261007210603.1350158-1-shuicheng.lin@intel.com>
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

--===============3759220973883504374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix dmesg ignore regexes with backslash escapes
URL   : https://patchwork.freedesktop.org/series/175714/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9134_BAT -> XEIGTPW_15957_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9134 -> IGTPW_15957
  * Linux: xe-5902-c55090c5898a23460a6b17613532bef0ec028ea7 -> xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211

  IGTPW_15957: aceade775f4b2f8e3dadd2442c56c5a7f2138e45 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5902-c55090c5898a23460a6b17613532bef0ec028ea7: c55090c5898a23460a6b17613532bef0ec028ea7
  xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211: e2193f15b4b009baae0b7cb7fc337a6fe80dd211

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15957/index.html

--===============3759220973883504374==
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
<tr><td><b>Series:</b></td><td>Fix dmesg ignore regexes with backslash escapes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175714/">https://patchwork.freedesktop.org/series/175714/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15957/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15957/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9134_BAT -&gt; XEIGTPW_15957_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9134 -&gt; IGTPW_15957</li>
<li>Linux: xe-5902-c55090c5898a23460a6b17613532bef0ec028ea7 -&gt; xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211</li>
</ul>
<p>IGTPW_15957: aceade775f4b2f8e3dadd2442c56c5a7f2138e45 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5902-c55090c5898a23460a6b17613532bef0ec028ea7: c55090c5898a23460a6b17613532bef0ec028ea7<br />
  xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211: e2193f15b4b009baae0b7cb7fc337a6fe80dd211</p>

</body>
</html>

--===============3759220973883504374==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D310CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 23:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C48510EA7D;
	Thu, 30 Oct 2025 23:09:06 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEC710EA7D;
 Thu, 30 Oct 2025 23:09:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6708934093849282670=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=5Ftransi?=
 =?utf-8?q?tion=3A_Fix_dynamic_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ngai-Mint Kwan" <ngai-mint.kwan@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Oct 2025 23:09:04 -0000
Message-ID: <176186574464.2568.6921856084744441995@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
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

--===============6708934093849282670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition: Fix dynamic subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/156518/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8603_BAT -> XEIGTPW_13967_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8603 -> IGTPW_13967
  * Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -> xe-4015-54a9b2250675164ff39f81674a9a818e92cbccaf

  IGTPW_13967: 13967
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63
  xe-4015-54a9b2250675164ff39f81674a9a818e92cbccaf: 54a9b2250675164ff39f81674a9a818e92cbccaf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13967/index.html

--===============6708934093849282670==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition: Fix dynamic subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156518/">https://patchwork.freedesktop.org/series/156518/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13967/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13967/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8603_BAT -&gt; XEIGTPW_13967_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8603 -&gt; IGTPW_13967</li>
<li>Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -&gt; xe-4015-54a9b2250675164ff39f81674a9a818e92cbccaf</li>
</ul>
<p>IGTPW_13967: 13967<br />
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63<br />
  xe-4015-54a9b2250675164ff39f81674a9a818e92cbccaf: 54a9b2250675164ff39f81674a9a818e92cbccaf</p>

</body>
</html>

--===============6708934093849282670==--

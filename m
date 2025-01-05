Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977B2E77197
	for <igt-dev@archiver.kernel.org>; Sun,  5 Jan 2025 08:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0256610E42C;
	Sun,  5 Jan 2025 08:26:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABE110E050;
 Sun,  5 Jan 2025 08:26:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0702250180617720610=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_lib/amdgpu=3A_Extract_PCI_device_address_from_file_descriptor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 05 Jan 2025 08:26:46 -0000
Message-ID: <173606560642.3656620.949004558269202567@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250105071551.113830-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250105071551.113830-1-vitaly.prosyak@amd.com>
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

--===============0702250180617720610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] lib/amdgpu: Extract PCI device address from file descriptor
URL   : https://patchwork.freedesktop.org/series/143116/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8174_BAT -> XEIGTPW_12388_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8174 -> IGTPW_12388
  * Linux: xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642 -> xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10

  IGTPW_12388: 12388
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642
  xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10: 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12388/index.html

--===============0702250180617720610==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] lib/amdgpu: Extract PCI device address from file descriptor</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143116/">https://patchwork.freedesktop.org/series/143116/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12388/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12388/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8174_BAT -&gt; XEIGTPW_12388_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8174 -&gt; IGTPW_12388</li>
<li>Linux: xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642 -&gt; xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10</li>
</ul>
<p>IGTPW_12388: 12388<br />
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642<br />
  xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10: 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10</p>

</body>
</html>

--===============0702250180617720610==--

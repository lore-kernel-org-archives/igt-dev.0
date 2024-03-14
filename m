Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C843BC5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 11:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B60E10FA9E;
	Thu, 14 Mar 2024 11:47:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1C610FAA0;
 Thu, 14 Mar 2024 11:47:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7036474544822328766=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_More_improvements_to_scripts/x?=
 =?utf-8?q?ls=5Fto=5Fdoc=2Epy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Mar 2024 11:47:03 -0000
Message-ID: <171041682370.753906.15208475146360286776@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
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

--===============7036474544822328766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: More improvements to scripts/xls_to_doc.py
URL   : https://patchwork.freedesktop.org/series/131130/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7762_BAT -> XEIGTPW_10834_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10834_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1238])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7762/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10834/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * IGT: IGT_7762 -> IGTPW_10834

  IGTPW_10834: 10834
  IGT_7762: 7725ae2998aed37bcc2e38926e404e5eec143451 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-939-9bedef916cef04bba9e98430c1c1de637219a573: 9bedef916cef04bba9e98430c1c1de637219a573

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10834/index.html

--===============7036474544822328766==
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
<tr><td><b>Series:</b></td><td>More improvements to scripts/xls_to_doc.py</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131130/">https://patchwork.freedesktop.org/series/131130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10834/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10834/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7762_BAT -&gt; XEIGTPW_10834_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10834_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7762/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10834/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7762 -&gt; IGTPW_10834</li>
</ul>
<p>IGTPW_10834: 10834<br />
  IGT_7762: 7725ae2998aed37bcc2e38926e404e5eec143451 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-939-9bedef916cef04bba9e98430c1c1de637219a573: 9bedef916cef04bba9e98430c1c1de637219a573</p>

</body>
</html>

--===============7036474544822328766==--

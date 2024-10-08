Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6341CED24D
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 00:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8E110E0EB;
	Tue,  8 Oct 2024 00:32:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ADE10E0EB;
 Tue,  8 Oct 2024 00:32:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8027702545031482355=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_xe=5Fexec=5Fcapture=3A_Add_xe?=
 =?utf-8?q?=5Fexec=5Fcapture_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Oct 2024 00:32:25 -0000
Message-ID: <172834754598.1201166.15338482850984370800@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007221348.3559076-1-zhanjun.dong@intel.com>
In-Reply-To: <20241007221348.3559076-1-zhanjun.dong@intel.com>
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

--===============8027702545031482355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_capture: Add xe_exec_capture test (rev2)
URL   : https://patchwork.freedesktop.org/series/135328/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8054_BAT -> XEIGTPW_11884_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-lnl-2 

Known issues
------------

  Here are the changes found in XEIGTPW_11884_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#1861]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11884/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * IGT: IGT_8054 -> IGTPW_11884
  * Linux: xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965 -> xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79

  IGTPW_11884: 35010bfcc05b46535133f2b79cb001deb9488754 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965: 92d12099cc768f36cf676ee1b014442a5c5ba965
  xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79: e11d55841ddeeb378c8850fca72eb6a270aafd79

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11884/index.html

--===============8027702545031482355==
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
<tr><td><b>Series:</b></td><td>xe_exec_capture: Add xe_exec_capture test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135328/">https://patchwork.freedesktop.org/series/135328/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11884/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11884/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8054_BAT -&gt; XEIGTPW_11884_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11884_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11884/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8054 -&gt; IGTPW_11884</li>
<li>Linux: xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965 -&gt; xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79</li>
</ul>
<p>IGTPW_11884: 35010bfcc05b46535133f2b79cb001deb9488754 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965: 92d12099cc768f36cf676ee1b014442a5c5ba965<br />
  xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79: e11d55841ddeeb378c8850fca72eb6a270aafd79</p>

</body>
</html>

--===============8027702545031482355==--

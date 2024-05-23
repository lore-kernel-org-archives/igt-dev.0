Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0D5C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 10:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947710E259;
	Thu, 23 May 2024 10:50:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7370710E259;
 Thu, 23 May 2024 10:50:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1940343431409014528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_fix_kms=5Fbw_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 May 2024 10:50:38 -0000
Message-ID: <171646143846.2169849.12326483019962153475@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523100248.230989-1-kunal1.joshi@intel.com>
In-Reply-To: <20240523100248.230989-1-kunal1.joshi@intel.com>
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

--===============1940343431409014528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix kms_bw test
URL   : https://patchwork.freedesktop.org/series/133956/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7869_BAT -> XEIGTPW_11182_BAT
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

  Here are the changes found in XEIGTPW_11182_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] ([Intel XE#1908])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11182/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908


Build changes
-------------

  * IGT: IGT_7869 -> IGTPW_11182
  * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-1333-7643e429e72c546f3779339624df885f6160124c

  IGTPW_11182: 25ceef45566f94ea0746493133f85a118d1b678f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
  xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11182/index.html

--===============1940343431409014528==
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
<tr><td><b>Series:</b></td><td>fix kms_bw test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133956/">https://patchwork.freedesktop.org/series/133956/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11182/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11182/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7869_BAT -&gt; XEIGTPW_11182_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11182_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11182/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7869 -&gt; IGTPW_11182</li>
<li>Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -&gt; xe-1333-7643e429e72c546f3779339624df885f6160124c</li>
</ul>
<p>IGTPW_11182: 25ceef45566f94ea0746493133f85a118d1b678f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921<br />
  xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c</p>

</body>
</html>

--===============1940343431409014528==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB802C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 15:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D7C10E994;
	Thu, 22 Feb 2024 15:51:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0016110E994;
 Thu, 22 Feb 2024 15:51:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4268754451941036208=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/igt=5Fdraw=3A_Don=27t_call?=
 =?utf-8?q?_i915_specific_ioctls_on_xe_in_draw_rectangle?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Feb 2024 15:51:54 -0000
Message-ID: <170861711400.217031.16359350262435292511@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222131803.61066-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240222131803.61066-1-zbigniew.kempczynski@intel.com>
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

--===============4268754451941036208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_draw: Don't call i915 specific ioctls on xe in draw rectangle
URL   : https://patchwork.freedesktop.org/series/130256/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7723_BAT -> XEIGTPW_10721_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10721_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10721_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10721_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7723/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10721/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  


Build changes
-------------

  * IGT: IGT_7723 -> IGTPW_10721
  * Linux: xe-823-661a9b14c215bc3ba24badcac80ce4eb3f57d3ff -> xe-824-ae1e283133b83b0de46f00b0ac0bca913e159216

  IGTPW_10721: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10721/index.html
  IGT_7723: 7723
  xe-823-661a9b14c215bc3ba24badcac80ce4eb3f57d3ff: 661a9b14c215bc3ba24badcac80ce4eb3f57d3ff
  xe-824-ae1e283133b83b0de46f00b0ac0bca913e159216: ae1e283133b83b0de46f00b0ac0bca913e159216

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10721/index.html

--===============4268754451941036208==
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
<tr><td><b>Series:</b></td><td>lib/igt_draw: Don&#x27;t call i915 specific ioctls on xe in draw rectangle</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130256/">https://patchwork.freedesktop.org/series/130256/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10721/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10721/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7723_BAT -&gt; XEIGTPW_10721_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10721_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10721_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10721_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7723/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10721/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7723 -&gt; IGTPW_10721</li>
<li>Linux: xe-823-661a9b14c215bc3ba24badcac80ce4eb3f57d3ff -&gt; xe-824-ae1e283133b83b0de46f00b0ac0bca913e159216</li>
</ul>
<p>IGTPW_10721: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10721/index.html<br />
  IGT_7723: 7723<br />
  xe-823-661a9b14c215bc3ba24badcac80ce4eb3f57d3ff: 661a9b14c215bc3ba24badcac80ce4eb3f57d3ff<br />
  xe-824-ae1e283133b83b0de46f00b0ac0bca913e159216: ae1e283133b83b0de46f00b0ac0bca913e159216</p>

</body>
</html>

--===============4268754451941036208==--

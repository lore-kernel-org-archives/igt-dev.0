Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E93C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 21:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C470112C91;
	Mon, 11 Mar 2024 21:36:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD4D112C91;
 Mon, 11 Mar 2024 21:36:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1062995896507242988=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Fqueue?=
 =?utf-8?q?=5Fproperty=3A_fix_documentation_output?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 11 Mar 2024 21:36:05 -0000
Message-ID: <171019296551.681939.12973347622132130095@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311130212.982578-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240311130212.982578-1-mauro.chehab@linux.intel.com>
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

--===============1062995896507242988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_queue_property: fix documentation output
URL   : https://patchwork.freedesktop.org/series/130980/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7754_BAT -> XEIGTPW_10803_BAT
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

  Here are the changes found in XEIGTPW_10803_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#906]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7754/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10803/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906


Build changes
-------------

  * IGT: IGT_7754 -> IGTPW_10803
  * Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -> xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad

  IGTPW_10803: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/index.html
  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10803/index.html

--===============1062995896507242988==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_queue_property: fix documentation output</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130980/">https://patchwork.freedesktop.org/series/130980/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10803/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10803/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7754_BAT -&gt; XEIGTPW_10803_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10803_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7754/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10803/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7754 -&gt; IGTPW_10803</li>
<li>Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -&gt; xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad</li>
</ul>
<p>IGTPW_10803: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/index.html<br />
  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54<br />
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad</p>

</body>
</html>

--===============1062995896507242988==--

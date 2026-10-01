Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6044FCA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 03:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570410E046;
	Thu,  1 Oct 2026 03:48:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1454D10E046;
 Thu,  1 Oct 2026 03:47:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2188849894043668741=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_don=27t_verif?=
 =?utf-8?q?y_dispatch_results_after_a_cancelled_submission?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Oct 2026 03:47:22 -0000
Message-ID: <179082644207.226969.17292935678378396440@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930201005.66857-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260930201005.66857-1-vitaly.prosyak@amd.com>
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

--===============2188849894043668741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: don't verify dispatch results after a cancelled submission
URL   : https://patchwork.freedesktop.org/series/175329/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9119_BAT -> XEIGTPW_15928_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15928_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9119/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15928/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9119 -> IGTPW_15928
  * Linux: xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02 -> xe-5857-bfcd7480a7729861f46a8f56582ab8fcec0dae5f

  IGTPW_15928: 0f3bd0126c385dd41705b2ddbf71dddd58967039 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9119: 9985dcc24949e018ed6dfde5313846780c4f2d21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02: ca49a4ff83ac55b037d9ef66a17c3000b5127b02
  xe-5857-bfcd7480a7729861f46a8f56582ab8fcec0dae5f: bfcd7480a7729861f46a8f56582ab8fcec0dae5f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15928/index.html

--===============2188849894043668741==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: don&#x27;t verify dispatch results after a cancelled submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175329/">https://patchwork.freedesktop.org/series/175329/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15928/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15928/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9119_BAT -&gt; XEIGTPW_15928_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15928_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9119/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15928/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9119 -&gt; IGTPW_15928</li>
<li>Linux: xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02 -&gt; xe-5857-bfcd7480a7729861f46a8f56582ab8fcec0dae5f</li>
</ul>
<p>IGTPW_15928: 0f3bd0126c385dd41705b2ddbf71dddd58967039 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9119: 9985dcc24949e018ed6dfde5313846780c4f2d21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5855-ca49a4ff83ac55b037d9ef66a17c3000b5127b02: ca49a4ff83ac55b037d9ef66a17c3000b5127b02<br />
  xe-5857-bfcd7480a7729861f46a8f56582ab8fcec0dae5f: bfcd7480a7729861f46a8f56582ab8fcec0dae5f</p>

</body>
</html>

--===============2188849894043668741==--

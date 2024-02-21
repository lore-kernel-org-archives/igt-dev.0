Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17877C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 11:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFE310E5C7;
	Wed, 21 Feb 2024 11:35:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2F710E5C7;
 Wed, 21 Feb 2024 11:35:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3845655764741489202=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_print_info_in_core=5Fgetversio?=
 =?utf-8?q?n_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 11:35:27 -0000
Message-ID: <170851532736.179839.4240376123831483290@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
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

--===============3845655764741489202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: print info in core_getversion (rev2)
URL   : https://patchwork.freedesktop.org/series/130111/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7718_BAT -> XEIGTPW_10709_BAT
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

  Here are the changes found in XEIGTPW_10709_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1169])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7718/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10709/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169


Build changes
-------------

  * IGT: IGT_7718 -> IGTPW_10709
  * Linux: xe-803-f12bce6493b6443870b55f36b1462d65e450d29d -> xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805

  IGTPW_10709: 10709
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-803-f12bce6493b6443870b55f36b1462d65e450d29d: f12bce6493b6443870b55f36b1462d65e450d29d
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10709/index.html

--===============3845655764741489202==
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
<tr><td><b>Series:</b></td><td>print info in core_getversion (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130111/">https://patchwork.freedesktop.org/series/130111/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10709/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10709/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7718_BAT -&gt; XEIGTPW_10709_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10709_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7718/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10709/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7718 -&gt; IGTPW_10709</li>
<li>Linux: xe-803-f12bce6493b6443870b55f36b1462d65e450d29d -&gt; xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805</li>
</ul>
<p>IGTPW_10709: 10709<br />
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-803-f12bce6493b6443870b55f36b1462d65e450d29d: f12bce6493b6443870b55f36b1462d65e450d29d<br />
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805</p>

</body>
</html>

--===============3845655764741489202==--

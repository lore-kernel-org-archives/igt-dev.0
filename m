Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2227E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 12:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F47210EB93;
	Wed, 18 Dec 2024 12:24:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3856610EB8A;
 Wed, 18 Dec 2024 12:24:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4987894355775072402=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Chec?=
 =?utf-8?q?k_negative_cases_for_vm=5Fcreate/destroy_ioctl_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 12:24:47 -0000
Message-ID: <173452468722.36144.18290410067918291742@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217130429.673208-1-pravalika.gurram@intel.com>
In-Reply-To: <20241217130429.673208-1-pravalika.gurram@intel.com>
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

--===============4987894355775072402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Check negative cases for vm_create/destroy ioctl (rev2)
URL   : https://patchwork.freedesktop.org/series/142580/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8161_BAT -> XEIGTPW_12333_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12333_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#3429]) -> [PASS][2] +31 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#1861]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429


Build changes
-------------

  * IGT: IGT_8161 -> IGTPW_12333
  * Linux: xe-2393-561947cbde53a2d22434977709610f42e4f0229b -> xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c

  IGTPW_12333: b318689d8d76b1ba8eb0f54d6f930e76e3ece206 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8161: f7cc6398cc4f21b2647138fa190695b65cfe9e15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2393-561947cbde53a2d22434977709610f42e4f0229b: 561947cbde53a2d22434977709610f42e4f0229b
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/index.html

--===============4987894355775072402==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Check negative cases for vm_create/destroy ioctl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142580/">https://patchwork.freedesktop.org/series/142580/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8161_BAT -&gt; XEIGTPW_12333_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12333_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8161/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12333/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8161 -&gt; IGTPW_12333</li>
<li>Linux: xe-2393-561947cbde53a2d22434977709610f42e4f0229b -&gt; xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c</li>
</ul>
<p>IGTPW_12333: b318689d8d76b1ba8eb0f54d6f930e76e3ece206 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8161: f7cc6398cc4f21b2647138fa190695b65cfe9e15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2393-561947cbde53a2d22434977709610f42e4f0229b: 561947cbde53a2d22434977709610f42e4f0229b<br />
  xe-2394-1d0ef0c9b38ec3433a841e26e6fb553d820ba32c: 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c</p>

</body>
</html>

--===============4987894355775072402==--

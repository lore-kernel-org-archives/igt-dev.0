Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3661CE7B0B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 13:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAE110EA5A;
	Fri,  6 Sep 2024 13:23:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10310EA5A;
 Fri,  6 Sep 2024 13:23:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4382825480986718914=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_validate_async_flips_during_su?=
 =?utf-8?q?spend_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Sep 2024 13:23:29 -0000
Message-ID: <172562900995.954651.6856509321437406607@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906072824.509607-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240906072824.509607-1-santhosh.reddy.guddati@intel.com>
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

--===============4382825480986718914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: validate async flips during suspend resume
URL   : https://patchwork.freedesktop.org/series/138302/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8007_BAT -> XEIGTPW_11712_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in XEIGTPW_11712_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-bmg-1:          [DMESG-WARN][1] ([Intel XE#877]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8007/bat-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11712/bat-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8007 -> IGTPW_11712
  * Linux: xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d -> xe-1903-d4b15a4609f1b768b0301fd238022ab8d07d15bc

  IGTPW_11712: 796e99676ca8cbbcba7100d578cf111ff0f3e56c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d
  xe-1903-d4b15a4609f1b768b0301fd238022ab8d07d15bc: d4b15a4609f1b768b0301fd238022ab8d07d15bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11712/index.html

--===============4382825480986718914==
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
<tr><td><b>Series:</b></td><td>validate async flips during suspend resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138302/">https://patchwork.freedesktop.org/series/138302/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11712/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11712/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8007_BAT -&gt; XEIGTPW_11712_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11712_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8007/bat-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11712/bat-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8007 -&gt; IGTPW_11712</li>
<li>Linux: xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d -&gt; xe-1903-d4b15a4609f1b768b0301fd238022ab8d07d15bc</li>
</ul>
<p>IGTPW_11712: 796e99676ca8cbbcba7100d578cf111ff0f3e56c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d<br />
  xe-1903-d4b15a4609f1b768b0301fd238022ab8d07d15bc: d4b15a4609f1b768b0301fd238022ab8d07d15bc</p>

</body>
</html>

--===============4382825480986718914==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC7FCCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 05:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0ED10E2D4;
	Thu, 16 Oct 2025 05:48:27 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284B910E2D3;
 Thu, 16 Oct 2025 05:48:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1358739355461561195=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_Check_DSC_slices_for_force_ultra_joiner_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Oct 2025 05:48:26 -0000
Message-ID: <176059370615.20530.7678539264829979445@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016043157.691206-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251016043157.691206-1-santhosh.reddy.guddati@intel.com>
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

--===============1358739355461561195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Check DSC slices for force ultra joiner (rev3)
URL   : https://patchwork.freedesktop.org/series/155022/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8587_BAT -> XEIGTPW_13910_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13910_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8587/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13910/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8587 -> IGTPW_13910
  * Linux: xe-3927-69ca30df000b382e7657f300148be505083377f2 -> xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8

  IGTPW_13910: d8f02366e523b6359d2b85d0a2523383daba1972 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8587: 8587
  xe-3927-69ca30df000b382e7657f300148be505083377f2: 69ca30df000b382e7657f300148be505083377f2
  xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8: 7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13910/index.html

--===============1358739355461561195==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Check DSC slices for force ultra joiner (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155022/">https://patchwork.freedesktop.org/series/155022/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13910/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13910/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8587_BAT -&gt; XEIGTPW_13910_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13910_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8587/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13910/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8587 -&gt; IGTPW_13910</li>
<li>Linux: xe-3927-69ca30df000b382e7657f300148be505083377f2 -&gt; xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8</li>
</ul>
<p>IGTPW_13910: d8f02366e523b6359d2b85d0a2523383daba1972 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8587: 8587<br />
  xe-3927-69ca30df000b382e7657f300148be505083377f2: 69ca30df000b382e7657f300148be505083377f2<br />
  xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8: 7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8</p>

</body>
</html>

--===============1358739355461561195==--

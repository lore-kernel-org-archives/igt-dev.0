Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A07CCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 16:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4477110E6E5;
	Tue,  7 Oct 2025 16:18:41 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEC710E6E5;
 Tue,  7 Oct 2025 16:18:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0693370898852948139=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/syncobj=5Ftimeline=3A?=
 =?utf-8?q?_Exercise_signaling_of_awaited_points_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Oct 2025 16:18:39 -0000
Message-ID: <175985391990.14049.5036293023636616503@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
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

--===============0693370898852948139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/syncobj_timeline: Exercise signaling of awaited points (rev3)
URL   : https://patchwork.freedesktop.org/series/154590/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8575_BAT -> XEIGTPW_13867_BAT
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

  Here are the changes found in XEIGTPW_13867_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13867/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8575 -> IGTPW_13867
  * Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -> xe-3882-90c02675d5fedea7f1d28c4e5c45f958de9bfee4

  IGTPW_13867: 13867
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf
  xe-3882-90c02675d5fedea7f1d28c4e5c45f958de9bfee4: 90c02675d5fedea7f1d28c4e5c45f958de9bfee4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13867/index.html

--===============0693370898852948139==
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
<tr><td><b>Series:</b></td><td>tests/syncobj_timeline: Exercise signaling of awaited points (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154590/">https://patchwork.freedesktop.org/series/154590/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13867/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13867/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8575_BAT -&gt; XEIGTPW_13867_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13867_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8575/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13867/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8575 -&gt; IGTPW_13867</li>
<li>Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -&gt; xe-3882-90c02675d5fedea7f1d28c4e5c45f958de9bfee4</li>
</ul>
<p>IGTPW_13867: 13867<br />
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf<br />
  xe-3882-90c02675d5fedea7f1d28c4e5c45f958de9bfee4: 90c02675d5fedea7f1d28c4e5c45f958de9bfee4</p>

</body>
</html>

--===============0693370898852948139==--

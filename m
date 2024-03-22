Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA4FC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 14:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C905610F0E4;
	Fri, 22 Mar 2024 14:21:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAC310F0E2;
 Fri, 22 Mar 2024 14:21:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0397877719356111002=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Ffb=3A_fix_intel_modi?=
 =?utf-8?q?fiers_for_fb_copying_on_xe_driver_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Mar 2024 14:21:49 -0000
Message-ID: <171111730911.961261.2946884528173766245@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322120914.205342-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240322120914.205342-1-juhapekka.heikkila@gmail.com>
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

--===============0397877719356111002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: fix intel modifiers for fb copying on xe driver (rev3)
URL   : https://patchwork.freedesktop.org/series/131490/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7777_BAT -> XEIGTPW_10886_BAT
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

  Here are the changes found in XEIGTPW_10886_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1169])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7777/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10886/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169


Build changes
-------------

  * IGT: IGT_7777 -> IGTPW_10886
  * Linux: xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32 -> xe-977-a19e6423c2c21b8dc7ad79ca95cc24637b248bd0

  IGTPW_10886: 10886
  IGT_7777: 7777
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32
  xe-977-a19e6423c2c21b8dc7ad79ca95cc24637b248bd0: a19e6423c2c21b8dc7ad79ca95cc24637b248bd0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10886/index.html

--===============0397877719356111002==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: fix intel modifiers for fb copying on xe driver (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131490/">https://patchwork.freedesktop.org/series/131490/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10886/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10886/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7777_BAT -&gt; XEIGTPW_10886_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10886_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7777/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10886/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7777 -&gt; IGTPW_10886</li>
<li>Linux: xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32 -&gt; xe-977-a19e6423c2c21b8dc7ad79ca95cc24637b248bd0</li>
</ul>
<p>IGTPW_10886: 10886<br />
  IGT_7777: 7777<br />
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32<br />
  xe-977-a19e6423c2c21b8dc7ad79ca95cc24637b248bd0: a19e6423c2c21b8dc7ad79ca95cc24637b248bd0</p>

</body>
</html>

--===============0397877719356111002==--

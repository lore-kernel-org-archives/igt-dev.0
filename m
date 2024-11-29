Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922D6D70E16
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 04:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B38A10E2A8;
	Fri, 29 Nov 2024 04:49:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B610E2A8;
 Fri, 29 Nov 2024 04:49:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7722066590545825101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Skip_test_if_joiner_display?=
 =?utf-8?q?_is_connected_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 04:49:18 -0000
Message-ID: <173285575877.158663.6003308319420062703@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129042746.701796-1-jeevan.b@intel.com>
In-Reply-To: <20241129042746.701796-1-jeevan.b@intel.com>
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

--===============7722066590545825101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip test if joiner display is connected (rev5)
URL   : https://patchwork.freedesktop.org/series/141614/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8130_BAT -> XEIGTPW_12218_BAT
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

  Here are the changes found in XEIGTPW_12218_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3429]) +31 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429


Build changes
-------------

  * IGT: IGT_8130 -> IGTPW_12218
  * Linux: xe-2291-5379d0a88558b73308ad82f163e80b863626e90b -> xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee

  IGTPW_12218: 12218
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2291-5379d0a88558b73308ad82f163e80b863626e90b: 5379d0a88558b73308ad82f163e80b863626e90b
  xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee: 709349e154b56980b3957b3f72af3f67cfdd7aee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/index.html

--===============7722066590545825101==
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
<tr><td><b>Series:</b></td><td>Skip test if joiner display is connected (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141614/">https://patchwork.freedesktop.org/series/141614/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8130_BAT -&gt; XEIGTPW_12218_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12218_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@bad-pitch-0:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8130 -&gt; IGTPW_12218</li>
<li>Linux: xe-2291-5379d0a88558b73308ad82f163e80b863626e90b -&gt; xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee</li>
</ul>
<p>IGTPW_12218: 12218<br />
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2291-5379d0a88558b73308ad82f163e80b863626e90b: 5379d0a88558b73308ad82f163e80b863626e90b<br />
  xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee: 709349e154b56980b3957b3f72af3f67cfdd7aee</p>

</body>
</html>

--===============7722066590545825101==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83349C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 18:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9C10E3B3;
	Wed, 28 Feb 2024 18:16:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24CA10E3B3;
 Wed, 28 Feb 2024 18:16:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5325360232731827094=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_intel-buf_changes_for_xe_rende?=
 =?utf-8?q?r-copy_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Feb 2024 18:16:21 -0000
Message-ID: <170914418192.375617.13480147652524380055@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

--===============5325360232731827094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-buf changes for xe render-copy tests
URL   : https://patchwork.freedesktop.org/series/130508/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7733_BAT -> XEIGTPW_10748_BAT
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

  Here are the changes found in XEIGTPW_10748_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-dg2-oem2:       [FAIL][1] ([i915#2346]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7733/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10748/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7733 -> IGTPW_10748

  IGTPW_10748: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10748/index.html
  IGT_7733: aef5f474230d00901e4e80da00ce696eb99f71e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-870-3bdccc6629ee909a167daedd6a8b75f6967ab726: 3bdccc6629ee909a167daedd6a8b75f6967ab726

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10748/index.html

--===============5325360232731827094==
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
<tr><td><b>Series:</b></td><td>intel-buf changes for xe render-copy tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130508/">https://patchwork.freedesktop.org/series/130508/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10748/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10748/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7733_BAT -&gt; XEIGTPW_10748_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10748_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7733/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10748/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7733 -&gt; IGTPW_10748</li>
</ul>
<p>IGTPW_10748: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10748/index.html<br />
  IGT_7733: aef5f474230d00901e4e80da00ce696eb99f71e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-870-3bdccc6629ee909a167daedd6a8b75f6967ab726: 3bdccc6629ee909a167daedd6a8b75f6967ab726</p>

</body>
</html>

--===============5325360232731827094==--

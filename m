Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD251CA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 15:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A410E9B8;
	Thu, 21 Aug 2025 15:04:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6353610E9B8;
 Thu, 21 Aug 2025 15:04:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5264108179349003605=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2Ci-g-t=2C1/3=5D_lib/dsc=3A_Add_helpers_to_disable_force_dsc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Aug 2025 15:04:34 -0000
Message-ID: <175578867439.257383.14726254808038031063@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
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

--===============5264108179349003605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,i-g-t,1/3] lib/dsc: Add helpers to disable force dsc
URL   : https://patchwork.freedesktop.org/series/153277/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8503_BAT -> XEIGTPW_13611_BAT
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

  Here are the changes found in XEIGTPW_13611_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8503/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [PASS][3] -> [FAIL][4] ([Intel XE#5507]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8503/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507


Build changes
-------------

  * IGT: IGT_8503 -> IGTPW_13611

  IGTPW_13611: 66610a9dfd04011fe06360bfca11253f8b4b7864 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8503: 8503
  xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 16e133c7e6922a9f224b272a48ac172cf06e3408

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/index.html

--===============5264108179349003605==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,i-g-t,1/3] lib/dsc: Add helpers to disable force dsc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153277/">https://patchwork.freedesktop.org/series/153277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8503_BAT -&gt; XEIGTPW_13611_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13611_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8503/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8503/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13611/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8503 -&gt; IGTPW_13611</li>
</ul>
<p>IGTPW_13611: 66610a9dfd04011fe06360bfca11253f8b4b7864 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8503: 8503<br />
  xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 16e133c7e6922a9f224b272a48ac172cf06e3408</p>

</body>
</html>

--===============5264108179349003605==--

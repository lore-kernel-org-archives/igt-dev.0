Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B39CD6E6E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 21:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22CA11A13D;
	Thu,  4 Jun 2026 21:13:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C540911A13D;
 Thu,  4 Jun 2026 21:13:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5975444589478126394=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_dsc+bigjoiner_subtest_?=
 =?utf-8?q?=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jun 2026 21:13:01 -0000
Message-ID: <178060758180.45116.14511192989750541205@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604201102.2583200-1-swati2.sharma@intel.com>
In-Reply-To: <20260604201102.2583200-1-swati2.sharma@intel.com>
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

--===============5975444589478126394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dsc+bigjoiner subtest (rev10)
URL   : https://patchwork.freedesktop.org/series/128266/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8948_BAT -> XEIGTPW_15306_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_15306_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15306_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15306_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][1] ([Intel XE#2244]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][3] ([Intel XE#2244] / [Intel XE#455]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-bmg-1:          [SKIP][5] ([Intel XE#2244]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-wcl-1:          [SKIP][7] ([Intel XE#7244]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-wcl-1/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15306_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-ptl-2:          [SKIP][9] ([Intel XE#5774] / [Intel XE#5907] / [Intel XE#6203]) -> [SKIP][10] ([Intel XE#5907])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-ptl-2/igt@kms_dsc@dsc-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-ptl-2/igt@kms_dsc@dsc-basic.html

  
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#5774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203
  [Intel XE#7244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7244


Build changes
-------------

  * IGT: IGT_8948 -> IGTPW_15306
  * Linux: xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9 -> xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3

  IGTPW_15306: 69a9b8385ec48291d5c534d45cd570c84b490e47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8948: 8948
  xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9: b22c3c5987e81692562be2f094eddea94614b7b9
  xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3: 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/index.html

--===============5975444589478126394==
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
<tr><td><b>Series:</b></td><td>Add dsc+bigjoiner subtest (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128266/">https://patchwork.freedesktop.org/series/128266/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8948_BAT -&gt; XEIGTPW_15306_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_15306_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15306_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15306_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7244">Intel XE#7244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15306_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8948/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774">Intel XE#5774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203">Intel XE#6203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15306/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8948 -&gt; IGTPW_15306</li>
<li>Linux: xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9 -&gt; xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3</li>
</ul>
<p>IGTPW_15306: 69a9b8385ec48291d5c534d45cd570c84b490e47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8948: 8948<br />
  xe-5200-b22c3c5987e81692562be2f094eddea94614b7b9: b22c3c5987e81692562be2f094eddea94614b7b9<br />
  xe-5205-406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3: 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3</p>

</body>
</html>

--===============5975444589478126394==--

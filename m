Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBAC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 23:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E868A10E6F1;
	Tue,  5 Mar 2024 23:55:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284A510E6ED;
 Tue,  5 Mar 2024 23:55:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8805847254450769549=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_benchmarks/kms=5Ffb=5Fstress?=
 =?utf-8?q?=3A_Test_all_possible_combinations_of_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arthur Grillo" <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Mar 2024 23:55:35 -0000
Message-ID: <170968293516.524851.6292166380935921155@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net>
In-Reply-To: <20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net>
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

--===============8805847254450769549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/kms_fb_stress: Test all possible combinations of formats
URL   : https://patchwork.freedesktop.org/series/130770/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7746_BAT -> XEIGTPW_10781_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10781_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10781_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10781_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7746/bat-adlp-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10781/bat-adlp-7/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_7746 -> IGTPW_10781
  * Linux: xe-897-98da761379cfaa31b32641ad648f83c90a8e629e -> xe-903-8f85c978aed193f293da17e783a817844e72a569

  IGTPW_10781: 10781
  IGT_7746: 7746
  xe-897-98da761379cfaa31b32641ad648f83c90a8e629e: 98da761379cfaa31b32641ad648f83c90a8e629e
  xe-903-8f85c978aed193f293da17e783a817844e72a569: 8f85c978aed193f293da17e783a817844e72a569

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10781/index.html

--===============8805847254450769549==
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
<tr><td><b>Series:</b></td><td>benchmarks/kms_fb_stress: Test all possible combinations of formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130770/">https://patchwork.freedesktop.org/series/130770/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10781/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10781/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7746_BAT -&gt; XEIGTPW_10781_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10781_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10781_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10781_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7746/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10781/bat-adlp-7/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7746 -&gt; IGTPW_10781</li>
<li>Linux: xe-897-98da761379cfaa31b32641ad648f83c90a8e629e -&gt; xe-903-8f85c978aed193f293da17e783a817844e72a569</li>
</ul>
<p>IGTPW_10781: 10781<br />
  IGT_7746: 7746<br />
  xe-897-98da761379cfaa31b32641ad648f83c90a8e629e: 98da761379cfaa31b32641ad648f83c90a8e629e<br />
  xe-903-8f85c978aed193f293da17e783a817844e72a569: 8f85c978aed193f293da17e783a817844e72a569</p>

</body>
</html>

--===============8805847254450769549==--

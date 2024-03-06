Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4273BC54E49
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 04:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF34010EAAD;
	Wed,  6 Mar 2024 04:54:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4258D10EAAB;
 Wed,  6 Mar 2024 04:54:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5781016246029420587=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv4=2C1/4=5D_lib/igt=5Fsysfs=3A_Use_same_var_for_sizeof=28=29_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Mar 2024 04:54:54 -0000
Message-ID: <170970089426.524851.7175798439251262133@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
In-Reply-To: <20240228223134.3908035-1-lucas.demarchi@intel.com>
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

--===============5781016246029420587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/4] lib/igt_sysfs: Use same var for sizeof() (rev3)
URL   : https://patchwork.freedesktop.org/series/130530/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7746_BAT -> XEIGTPW_10783_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10783_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10783_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10783_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7746/bat-adlp-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10783/bat-adlp-7/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_7746 -> IGTPW_10783
  * Linux: xe-897-98da761379cfaa31b32641ad648f83c90a8e629e -> xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4

  IGTPW_10783: 10783
  IGT_7746: 7746
  xe-897-98da761379cfaa31b32641ad648f83c90a8e629e: 98da761379cfaa31b32641ad648f83c90a8e629e
  xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4: dd08fd912fdc1b72984a39852fdbee49b97b8ce4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10783/index.html

--===============5781016246029420587==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/4] lib/igt_sysfs: Use same var for sizeof() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130530/">https://patchwork.freedesktop.org/series/130530/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10783/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10783/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7746_BAT -&gt; XEIGTPW_10783_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10783_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10783_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10783_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7746/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10783/bat-adlp-7/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7746 -&gt; IGTPW_10783</li>
<li>Linux: xe-897-98da761379cfaa31b32641ad648f83c90a8e629e -&gt; xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4</li>
</ul>
<p>IGTPW_10783: 10783<br />
  IGT_7746: 7746<br />
  xe-897-98da761379cfaa31b32641ad648f83c90a8e629e: 98da761379cfaa31b32641ad648f83c90a8e629e<br />
  xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4: dd08fd912fdc1b72984a39852fdbee49b97b8ce4</p>

</body>
</html>

--===============5781016246029420587==--

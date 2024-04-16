Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53564C04FF8
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 17:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC133112D9D;
	Tue, 16 Apr 2024 17:40:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BC710F26F;
 Tue, 16 Apr 2024 17:40:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2722048490581462101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_intel=5Freg=3A_Move_decoding_b?=
 =?utf-8?q?ehind_an_option?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Apr 2024 17:40:39 -0000
Message-ID: <171328923980.1444339.9430501621331251083@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416154338.102157-1-lucas.demarchi@intel.com>
In-Reply-To: <20240416154338.102157-1-lucas.demarchi@intel.com>
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

--===============2722048490581462101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_reg: Move decoding behind an option
URL   : https://patchwork.freedesktop.org/series/132506/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7809_BAT -> XEIGTPW_11026_BAT
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

  Here are the changes found in XEIGTPW_11026_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#616]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7809 -> IGTPW_11026
  * Linux: xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266 -> xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76

  IGTPW_11026: 6b23aeaad54511c44da516424e2a94c3898a1c83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266: 29eafe20a133980d6b66d3cb97c66d1723636266
  xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76: a761439bd7de146bbb362b8c614a2863bf6d8d76

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/index.html

--===============2722048490581462101==
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
<tr><td><b>Series:</b></td><td>intel_reg: Move decoding behind an option</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132506/">https://patchwork.freedesktop.org/series/132506/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7809_BAT -&gt; XEIGTPW_11026_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11026_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7809 -&gt; IGTPW_11026</li>
<li>Linux: xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266 -&gt; xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76</li>
</ul>
<p>IGTPW_11026: 6b23aeaad54511c44da516424e2a94c3898a1c83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266: 29eafe20a133980d6b66d3cb97c66d1723636266<br />
  xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76: a761439bd7de146bbb362b8c614a2863bf6d8d76</p>

</body>
</html>

--===============2722048490581462101==--

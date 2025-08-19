Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BADCA0EEB
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 21:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51510E49A;
	Tue, 19 Aug 2025 21:51:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D8F10E49A;
 Tue, 19 Aug 2025 21:51:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1756827968005516181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_Unbind_before_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Aug 2025 21:51:46 -0000
Message-ID: <175564030606.250091.10858305787847333332@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
In-Reply-To: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
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

--===============1756827968005516181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: Unbind before tests
URL   : https://patchwork.freedesktop.org/series/153175/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8498_BAT -> XEIGTPW_13603_BAT
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

  Here are the changes found in XEIGTPW_13603_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8498/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13603/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8498 -> IGTPW_13603
  * Linux: xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -> xe-3579-8093b67375779a975c13b9a23c8fcc25cb1e9c83

  IGTPW_13603: f0b2e9c1f549c9c32434c1d72dc515bb14bd8e87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8498: 8498
  xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa
  xe-3579-8093b67375779a975c13b9a23c8fcc25cb1e9c83: 8093b67375779a975c13b9a23c8fcc25cb1e9c83

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13603/index.html

--===============1756827968005516181==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: Unbind before tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153175/">https://patchwork.freedesktop.org/series/153175/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13603/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13603/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8498_BAT -&gt; XEIGTPW_13603_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13603_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8498/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13603/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8498 -&gt; IGTPW_13603</li>
<li>Linux: xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -&gt; xe-3579-8093b67375779a975c13b9a23c8fcc25cb1e9c83</li>
</ul>
<p>IGTPW_13603: f0b2e9c1f549c9c32434c1d72dc515bb14bd8e87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8498: 8498<br />
  xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa<br />
  xe-3579-8093b67375779a975c13b9a23c8fcc25cb1e9c83: 8093b67375779a975c13b9a23c8fcc25cb1e9c83</p>

</body>
</html>

--===============1756827968005516181==--

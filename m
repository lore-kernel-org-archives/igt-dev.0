Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA15C28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 05:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C032910E109;
	Tue, 11 Mar 2025 05:34:38 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8624B10E0C3;
 Tue, 11 Mar 2025 05:34:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2628324613269042201=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Fcrc?=
 =?utf-8?q?=2E=3A_Test_async_cursor_crc_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Mar 2025 05:34:37 -0000
Message-ID: <174167127754.16744.10515613817639749537@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311043002.127979-1-shekhar.chauhan@intel.com>
In-Reply-To: <20250311043002.127979-1-shekhar.chauhan@intel.com>
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

--===============2628324613269042201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc.: Test async cursor crc (rev2)
URL   : https://patchwork.freedesktop.org/series/146062/
State : success

== Summary ==

CI Bug Log - changes from IGT_8270 -> IGTPW_12741
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): bat-arlh-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12741 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][1] ([i915#13494]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8270/bat-mtlp-9/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/bat-mtlp-9/igt@i915_module_load@load.html

  
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8270 -> IGTPW_12741
  * Linux: CI_DRM_16259 -> CI_DRM_16261

  CI-20190529: 20190529
  CI_DRM_16259: fd356d116b876e8778d2a52820c832f95dcdd3d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16261: 003c44ec0b7d86569bd13d4a810ee24176c3d034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12741: 12741
  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html

--===============2628324613269042201==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc.: Test async cursor crc (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146062/">https://patchwork.freedesktop.org/series/146062/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8270 -&gt; IGTPW_12741</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): bat-arlh-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12741 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8270/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8270 -&gt; IGTPW_12741</li>
<li>Linux: CI_DRM_16259 -&gt; CI_DRM_16261</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16259: fd356d116b876e8778d2a52820c832f95dcdd3d5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16261: 003c44ec0b7d86569bd13d4a810ee24176c3d034 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12741: 12741<br />
  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2628324613269042201==--

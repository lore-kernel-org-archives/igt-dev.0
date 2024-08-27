Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DFBC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3D10E05F;
	Tue, 27 Aug 2024 05:56:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F293510E02A;
 Tue, 27 Aug 2024 05:56:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9085320759680996213=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_test/amdgpu=3A_fix_unknow_test?=
 =?utf-8?q?_issue_for_amdgpu_queue_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Aug 2024 05:56:40 -0000
Message-ID: <172473820098.786266.10330882777239124874@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827051932.74382-1-jesse.zhang@amd.com>
In-Reply-To: <20240827051932.74382-1-jesse.zhang@amd.com>
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

--===============9085320759680996213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/amdgpu: fix unknow test issue for amdgpu queue test
URL   : https://patchwork.freedesktop.org/series/137822/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7993_BAT -> XEIGTPW_11639_BAT
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

  Here are the changes found in XEIGTPW_11639_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [DMESG-WARN][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7993 -> IGTPW_11639

  IGTPW_11639: 11639
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/index.html

--===============9085320759680996213==
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
<tr><td><b>Series:</b></td><td>test/amdgpu: fix unknow test issue for amdgpu queue test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137822/">https://patchwork.freedesktop.org/series/137822/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7993_BAT -&gt; XEIGTPW_11639_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11639_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11639/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7993 -&gt; IGTPW_11639</li>
</ul>
<p>IGTPW_11639: 11639<br />
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b</p>

</body>
</html>

--===============9085320759680996213==--

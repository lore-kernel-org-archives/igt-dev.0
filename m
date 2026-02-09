Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B38FEF06EE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 02:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36BC10E25D;
	Mon,  9 Feb 2026 02:58:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885A810E130;
 Mon,  9 Feb 2026 02:58:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2652368105229421905=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/1=5D_Skip_kms=5Fflip_for_mtk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiandong Wang" <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Feb 2026 02:58:17 -0000
Message-ID: <177060589753.236561.4399496723803722349@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209020357.32744-1-xiandong.wang@mediatek.com>
In-Reply-To: <20260209020357.32744-1-xiandong.wang@mediatek.com>
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

--===============2652368105229421905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/1] Skip kms_flip for mtk
URL   : https://patchwork.freedesktop.org/series/161324/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8744_BAT -> XEIGTPW_14511_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14511_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-bmg-1:          [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8744/bat-bmg-1/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/bat-bmg-1/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [DMESG-WARN][3] ([Intel XE#7110]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8744/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * IGT: IGT_8744 -> IGTPW_14511
  * Linux: xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165 -> xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36

  IGTPW_14511: 14511
  IGT_8744: 8744
  xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165: e294156cfd0b6db73e96c58789049e8b504bb165
  xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36: 1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/index.html

--===============2652368105229421905==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/1] Skip kms_flip for mtk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161324/">https://patchwork.freedesktop.org/series/161324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8744_BAT -&gt; XEIGTPW_14511_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14511_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8744/bat-bmg-1/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/bat-bmg-1/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8744/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14511/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8744 -&gt; IGTPW_14511</li>
<li>Linux: xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165 -&gt; xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36</li>
</ul>
<p>IGTPW_14511: 14511<br />
  IGT_8744: 8744<br />
  xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165: e294156cfd0b6db73e96c58789049e8b504bb165<br />
  xe-4524-1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36: 1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36</p>

</body>
</html>

--===============2652368105229421905==--

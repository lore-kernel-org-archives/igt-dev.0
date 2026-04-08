Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB87EDB7D0
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 00:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033210E3BF;
	Wed,  8 Apr 2026 00:25:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEACB10E3BF;
 Wed,  8 Apr 2026 00:25:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1584292032941126651=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fbw=3A_Allow_cus?=
 =?utf-8?q?tom_modes_for_external_panels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Apr 2026 00:25:30 -0000
Message-ID: <177560793087.438154.6600162001619356897@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407095234.1728691-1-karthik.b.s@intel.com>
In-Reply-To: <20260407095234.1728691-1-karthik.b.s@intel.com>
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

--===============1584292032941126651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: Allow custom modes for external panels
URL   : https://patchwork.freedesktop.org/series/164432/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8850_BAT -> XEIGTPW_14938_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14938_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7110]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8850/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14938/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * IGT: IGT_8850 -> IGTPW_14938
  * Linux: xe-4855-5f8792621868737c8b62a87b66dbf7eca4d9f7e3 -> xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf

  IGTPW_14938: 14938
  IGT_8850: 8850
  xe-4855-5f8792621868737c8b62a87b66dbf7eca4d9f7e3: 5f8792621868737c8b62a87b66dbf7eca4d9f7e3
  xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf: 5ee75b2816df74bfe606d4dfc061547d5cda4ebf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14938/index.html

--===============1584292032941126651==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: Allow custom modes for external panels</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164432/">https://patchwork.freedesktop.org/series/164432/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14938/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14938/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8850_BAT -&gt; XEIGTPW_14938_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14938_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8850/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14938/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8850 -&gt; IGTPW_14938</li>
<li>Linux: xe-4855-5f8792621868737c8b62a87b66dbf7eca4d9f7e3 -&gt; xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf</li>
</ul>
<p>IGTPW_14938: 14938<br />
  IGT_8850: 8850<br />
  xe-4855-5f8792621868737c8b62a87b66dbf7eca4d9f7e3: 5f8792621868737c8b62a87b66dbf7eca4d9f7e3<br />
  xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf: 5ee75b2816df74bfe606d4dfc061547d5cda4ebf</p>

</body>
</html>

--===============1584292032941126651==--

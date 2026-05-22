Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6900ACD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 09:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B9810E191;
	Fri, 22 May 2026 09:56:56 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6F410E191;
 Fri, 22 May 2026 09:56:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1749403567680849436=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fs?=
 =?utf-8?q?ystem=5Fallocator=3A_Remove_copy-paste_in_eu-fault_doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 May 2026 09:56:36 -0000
Message-ID: <177944379689.100039.13332080410766030004@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260522082955.28662-1-francois.dugast@intel.com>
In-Reply-To: <20260522082955.28662-1-francois.dugast@intel.com>
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

--===============1749403567680849436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Remove copy-paste in eu-fault doc
URL   : https://patchwork.freedesktop.org/series/167065/
State : success

== Summary ==

CI Bug Log - changes from IGT_8935 -> IGTPW_15226
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15226 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#15673]) +48 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8935/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8935 -> IGTPW_15226

  CI-20190529: 20190529
  CI_DRM_18538: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15226: 9995b810e91f756dcc8ab2241a589f81a7c94be5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8935: 8935

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/index.html

--===============1749403567680849436==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Remove copy-paste in eu-fault doc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167065/">https://patchwork.freedesktop.org/series/167065/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8935 -&gt; IGTPW_15226</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15226 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8935/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15226/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +48 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8935 -&gt; IGTPW_15226</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18538: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15226: 9995b810e91f756dcc8ab2241a589f81a7c94be5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8935: 8935</p>

</body>
</html>

--===============1749403567680849436==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37460CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 09:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC12D10F51E;
	Fri, 22 May 2026 09:27:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB96B10F51E;
 Fri, 22 May 2026 09:27:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0685150135120891549=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Remove_copy-paste_in_eu-fault_doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 May 2026 09:27:12 -0000
Message-ID: <177944203282.100039.6684648882224304782@5ab824fced77>
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

--===============0685150135120891549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Remove copy-paste in eu-fault doc
URL   : https://patchwork.freedesktop.org/series/167065/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8935_BAT -> XEIGTPW_15226_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15226_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] ([Intel XE#8017])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8935/bat-bmg-1/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15226/bat-bmg-1/igt@xe_waitfence@reltime.html

  
  [Intel XE#8017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017


Build changes
-------------

  * IGT: IGT_8935 -> IGTPW_15226
  * Linux: xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49 -> xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f

  IGTPW_15226: 9995b810e91f756dcc8ab2241a589f81a7c94be5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8935: 8935
  xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49: f103db97c610a41177720b08aa4a2a05f9b42d49
  xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15226/index.html

--===============0685150135120891549==
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

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15226/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8935_BAT -&gt; XEIGTPW_15226_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15226_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8935/bat-bmg-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15226/bat-bmg-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017">Intel XE#8017</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8935 -&gt; IGTPW_15226</li>
<li>Linux: xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49 -&gt; xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f</li>
</ul>
<p>IGTPW_15226: 9995b810e91f756dcc8ab2241a589f81a7c94be5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8935: 8935<br />
  xe-5113-f103db97c610a41177720b08aa4a2a05f9b42d49: f103db97c610a41177720b08aa4a2a05f9b42d49<br />
  xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f</p>

</body>
</html>

--===============0685150135120891549==--

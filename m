Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8E7C47DD3
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 20:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984A710EBFD;
	Mon, 22 Jan 2024 20:25:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C832B10E995;
 Mon, 22 Jan 2024 20:25:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6672394336352454534=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/intel=5Fbatchbuffer=3A_Ext?=
 =?utf-8?q?end_requested_size_by_4K_for_Xe2+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 22 Jan 2024 20:25:23 -0000
Message-ID: <170595512381.665201.4670702621932141006@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122150131.328414-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240122150131.328414-1-zbigniew.kempczynski@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============6672394336352454534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: Extend requested size by 4K for Xe2+ (rev2)
URL   : https://patchwork.freedesktop.org/series/129029/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7685_BAT -> XEIGTPW_10570_BAT
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

  Here are the changes found in XEIGTPW_10570_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#1130]) -> [SKIP][2] ([Intel XE#288])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7685/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10570/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7685 -> IGTPW_10570
  * Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -> xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c

  IGTPW_10570: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10570/index.html
  IGT_7685: 7685
  xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f
  xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c: 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10570/index.html

--===============6672394336352454534==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: Extend requested size by 4K for Xe2+ (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129029/">https://patchwork.freedesktop.org/series/129029/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10570/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10570/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7685_BAT -&gt; XEIGTPW_10570_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10570_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7685/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10570/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7685 -&gt; IGTPW_10570</li>
<li>Linux: xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f -&gt; xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c</li>
</ul>
<p>IGTPW_10570: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10570/index.html<br />
  IGT_7685: 7685<br />
  xe-661-aa09aa0293f752644c8c5d040e4a7af4e463627f: aa09aa0293f752644c8c5d040e4a7af4e463627f<br />
  xe-665-7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c: 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c</p>

</body>
</html>

--===============6672394336352454534==--

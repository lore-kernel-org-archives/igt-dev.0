Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBB6C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 05:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216D10E6C3;
	Wed, 12 Mar 2025 05:25:47 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33FB10E6C3;
 Wed, 12 Mar 2025 05:25:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8651641549694065573=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Test_some_early_probe_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Mar 2025 05:25:45 -0000
Message-ID: <174175714585.22572.7602176402840883496@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311183833.1199190-1-lucas.demarchi@intel.com>
In-Reply-To: <20250311183833.1199190-1-lucas.demarchi@intel.com>
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

--===============8651641549694065573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Test some early probe functions
URL   : https://patchwork.freedesktop.org/series/146166/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8271_BAT -> XEIGTPW_12750_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in XEIGTPW_12750_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-front:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-front.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-front.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8271 -> IGTPW_12750
  * Linux: xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5 -> xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc

  IGTPW_12750: 12750
  IGT_8271: 8271
  xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5: eb17816e52395a403aa0b447aa0befa9d2f86dd5
  xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc: aba848f9b752cf51474c0c3b1abcf0f572f774dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/index.html

--===============8651641549694065573==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Test some early probe functions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146166/">https://patchwork.freedesktop.org/series/146166/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8271_BAT -&gt; XEIGTPW_12750_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12750_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-front:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-front.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8271 -&gt; IGTPW_12750</li>
<li>Linux: xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5 -&gt; xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc</li>
</ul>
<p>IGTPW_12750: 12750<br />
  IGT_8271: 8271<br />
  xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5: eb17816e52395a403aa0b447aa0befa9d2f86dd5<br />
  xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc: aba848f9b752cf51474c0c3b1abcf0f572f774dc</p>

</body>
</html>

--===============8651641549694065573==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE37AC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 23:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E021128FB;
	Fri, 22 Mar 2024 23:39:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5771128FB;
 Fri, 22 Mar 2024 23:39:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6993761254021298033=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tools/intel=5Fvbt=5Fdecode=3A_?=
 =?utf-8?q?Various_improvement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Mar 2024 23:39:55 -0000
Message-ID: <171115079538.962476.2725616877637958500@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

--===============6993761254021298033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_vbt_decode: Various improvement
URL   : https://patchwork.freedesktop.org/series/131519/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7778_BAT -> XEIGTPW_10889_BAT
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

  Here are the changes found in XEIGTPW_10889_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1259]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7778/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10889/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * IGT: IGT_7778 -> IGTPW_10889
  * Linux: xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88 -> xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1

  IGTPW_10889: 10889
  IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88: b89042d4d087c1e037c1f7904b4c223e48919b88
  xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10889/index.html

--===============6993761254021298033==
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
<tr><td><b>Series:</b></td><td>tools/intel_vbt_decode: Various improvement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131519/">https://patchwork.freedesktop.org/series/131519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10889/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10889/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7778_BAT -&gt; XEIGTPW_10889_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10889_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7778/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10889/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7778 -&gt; IGTPW_10889</li>
<li>Linux: xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88 -&gt; xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1</li>
</ul>
<p>IGTPW_10889: 10889<br />
  IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88: b89042d4d087c1e037c1f7904b4c223e48919b88<br />
  xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1</p>

</body>
</html>

--===============6993761254021298033==--

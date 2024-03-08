Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1FCC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 12:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FDE10F579;
	Fri,  8 Mar 2024 12:26:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7605510F45A;
 Fri,  8 Mar 2024 12:26:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0035576080882118958=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fix_scripts/xls=5Fto=5Fdoc=2Ep?=
 =?utf-8?q?y?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Mar 2024 12:26:48 -0000
Message-ID: <170990080848.612256.225574920911410515@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
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

--===============0035576080882118958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix scripts/xls_to_doc.py
URL   : https://patchwork.freedesktop.org/series/130909/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7749_BAT -> XEIGTPW_10796_BAT
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

  Here are the changes found in XEIGTPW_10796_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       [DMESG-WARN][1] ([Intel XE#1009]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7749/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_threads@threads-basic:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#1232]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7749/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#1192]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7749/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232


Build changes
-------------

  * IGT: IGT_7749 -> IGTPW_10796
  * Linux: xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4 -> xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38

  IGTPW_10796: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/index.html
  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4: 6e50187af603728329f9d3c3a53ad162d7eda9a4
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/index.html

--===============0035576080882118958==
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
<tr><td><b>Series:</b></td><td>Fix scripts/xls_to_doc.py</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130909/">https://patchwork.freedesktop.org/series/130909/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7749_BAT -&gt; XEIGTPW_10796_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10796_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7749/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7749/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232">Intel XE#1232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7749/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10796/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7749 -&gt; IGTPW_10796</li>
<li>Linux: xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4 -&gt; xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38</li>
</ul>
<p>IGTPW_10796: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/index.html<br />
  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4: 6e50187af603728329f9d3c3a53ad162d7eda9a4<br />
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38</p>

</body>
</html>

--===============0035576080882118958==--

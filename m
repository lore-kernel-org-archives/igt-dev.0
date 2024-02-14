Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C07C48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 09:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDF710E362;
	Wed, 14 Feb 2024 09:50:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4B910E1F2;
 Wed, 14 Feb 2024 09:50:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8182928407414270013=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fplane=3A_Reducing_?=
 =?utf-8?q?the_execution_time_in_simulation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Feb 2024 09:50:25 -0000
Message-ID: <170790422524.1238334.14719325828685040332@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240214085328.2024-1-pranay.samala@intel.com>
In-Reply-To: <20240214085328.2024-1-pranay.samala@intel.com>
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

--===============8182928407414270013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Reducing the execution time in simulation (rev2)
URL   : https://patchwork.freedesktop.org/series/129872/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7711_BAT -> XEIGTPW_10671_BAT
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

  Here are the changes found in XEIGTPW_10671_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][1] ([Intel XE#1238]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7711/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10671/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * IGT: IGT_7711 -> IGTPW_10671
  * Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -> xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11

  IGTPW_10671: 10671
  IGT_7711: 7711
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884
  xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11: e3e6421a490e14b441f0ace4fe3cf45f70aa5c11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10671/index.html

--===============8182928407414270013==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Reducing the execution time in simulation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129872/">https://patchwork.freedesktop.org/series/129872/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10671/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10671/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7711_BAT -&gt; XEIGTPW_10671_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10671_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7711/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10671/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7711 -&gt; IGTPW_10671</li>
<li>Linux: xe-769-7c8e9135509f2e438e11a4af17387a204ab59884 -&gt; xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11</li>
</ul>
<p>IGTPW_10671: 10671<br />
  IGT_7711: 7711<br />
  xe-769-7c8e9135509f2e438e11a4af17387a204ab59884: 7c8e9135509f2e438e11a4af17387a204ab59884<br />
  xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11: e3e6421a490e14b441f0ace4fe3cf45f70aa5c11</p>

</body>
</html>

--===============8182928407414270013==--

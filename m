Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F9C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 06:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4B210FFAC;
	Tue, 28 May 2024 06:16:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB110FFAC;
 Tue, 28 May 2024 06:16:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8711843778137424599=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Enable_fbdev_tests_on_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 May 2024 06:16:57 -0000
Message-ID: <171687701786.2215217.7728316427804963052@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
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

--===============8711843778137424599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable fbdev tests on XE
URL   : https://patchwork.freedesktop.org/series/134106/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7871_BAT -> XEIGTPW_11200_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_11200_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] ([Intel XE#1953])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-adlp-7/igt@runner@aborted.html
    - bat-pvc-2:          NOTRUN -> [FAIL][2] ([Intel XE#1953])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-pvc-2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - {bat-lnl-1}:        [DMESG-WARN][3] ([Intel XE#324]) -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [ABORT][5] ([Intel XE#1908]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1953
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7871 -> IGTPW_11200
  * Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -> xe-1353-abaeae202dfb4e361edd660a124e22178340725d

  IGTPW_11200: 11200
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90
  xe-1353-abaeae202dfb4e361edd660a124e22178340725d: abaeae202dfb4e361edd660a124e22178340725d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/index.html

--===============8711843778137424599==
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
<tr><td><b>Series:</b></td><td>Enable fbdev tests on XE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134106/">https://patchwork.freedesktop.org/series/134106/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7871_BAT -&gt; XEIGTPW_11200_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11200_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-adlp-7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1953">Intel XE#1953</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-pvc-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1953">Intel XE#1953</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11200/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7871 -&gt; IGTPW_11200</li>
<li>Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -&gt; xe-1353-abaeae202dfb4e361edd660a124e22178340725d</li>
</ul>
<p>IGTPW_11200: 11200<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90<br />
  xe-1353-abaeae202dfb4e361edd660a124e22178340725d: abaeae202dfb4e361edd660a124e22178340725d</p>

</body>
</html>

--===============8711843778137424599==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E394C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 21:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB0810E012;
	Fri,  7 Jun 2024 21:46:59 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1BC10E012;
 Fri,  7 Jun 2024 21:46:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3534256128597050162=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_tests/kms=5Fvrr=3A_New_subtest_for_CMRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 21:46:59 -0000
Message-ID: <171779681904.28455.1605370957793744209@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
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

--===============3534256128597050162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_vrr: New subtest for CMRR
URL   : https://patchwork.freedesktop.org/series/134606/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7880_BAT -> XEIGTPW_11235_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11235_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@cmrr} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/bat-dg2-oem2/igt@kms_vrr@cmrr.html

  
New tests
---------

  New tests have been introduced between XEIGT_7880_BAT and XEIGTPW_11235_BAT:

### New IGT tests (2) ###

  * igt@kms_vrr@cmrr:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.52] s

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.17] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11235_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_vrr@cmrr} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#1024]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/bat-atsm-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#455])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/bat-dg2-oem2/igt@kms_vrr@flipline.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7880 -> IGTPW_11235
  * Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -> xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037

  IGTPW_11235: bfdbe7440726149d3ac79c698f292b7338a9e5d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c
  xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/index.html

--===============3534256128597050162==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_vrr: New subtest for CMRR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134606/">https://patchwork.freedesktop.org/series/134606/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7880_BAT -&gt; XEIGTPW_11235_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11235_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_vrr@cmrr} (NEW):<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/bat-dg2-oem2/igt@kms_vrr@cmrr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7880_BAT and XEIGTPW_11235_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.17] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11235_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_vrr@cmrr} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/bat-atsm-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11235/bat-dg2-oem2/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7880 -&gt; IGTPW_11235</li>
<li>Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -&gt; xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037</li>
</ul>
<p>IGTPW_11235: bfdbe7440726149d3ac79c698f292b7338a9e5d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c<br />
  xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037</p>

</body>
</html>

--===============3534256128597050162==--

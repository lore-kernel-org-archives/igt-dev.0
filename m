Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D9C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 12:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDC510E675;
	Tue, 18 Jun 2024 12:49:30 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FB710E656;
 Tue, 18 Jun 2024 12:49:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4903761845793900019=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2CV2=2C1/2=5D_tests/kms=5Fvrr=3A_New_subtest_for_CMRR_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jun 2024 12:49:28 -0000
Message-ID: <171871496893.103670.3430054964995205733@a6498e030952>
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

--===============4903761845793900019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/2] tests/kms_vrr: New subtest for CMRR (rev2)
URL   : https://patchwork.freedesktop.org/series/134606/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7891_BAT -> XEIGTPW_11269_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11269_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_vrr@cmrr} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-adlp-7/igt@kms_vrr@cmrr.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-dg2-oem2/igt@kms_vrr@cmrr.html

  
New tests
---------

  New tests have been introduced between XEIGT_7891_BAT and XEIGTPW_11269_BAT:

### New IGT tests (2) ###

  * igt@kms_vrr@cmrr:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 10.53] s

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.19] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11269_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_vrr@cmrr} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1024]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-pvc-2/igt@kms_vrr@cmrr.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#1024]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-atsm-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#455])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-dg2-oem2/igt@kms_vrr@flipline.html
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#455])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-adlp-7/igt@kms_vrr@flipline.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7891 -> IGTPW_11269

  IGTPW_11269: 11269
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/index.html

--===============4903761845793900019==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/2] tests/kms_vrr: New subtest for CMRR (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134606/">https://patchwork.freedesktop.org/series/134606/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7891_BAT -&gt; XEIGTPW_11269_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11269_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_vrr@cmrr} (NEW):<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-adlp-7/igt@kms_vrr@cmrr.html">SKIP</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-dg2-oem2/igt@kms_vrr@cmrr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7891_BAT and XEIGTPW_11269_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 10.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.19] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11269_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_vrr@cmrr} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-pvc-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-atsm-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-dg2-oem2/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11269/bat-adlp-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7891 -&gt; IGTPW_11269</li>
</ul>
<p>IGTPW_11269: 11269<br />
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34</p>

</body>
</html>

--===============4903761845793900019==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9466BC3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 17:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F3A10E191;
	Mon,  8 Jul 2024 17:31:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A989D10E191;
 Mon,  8 Jul 2024 17:31:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7738682932874427185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Extend_mocs-rpm_test_to_suppor?=
 =?utf-8?q?t_d3_cold?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 08 Jul 2024 17:31:37 -0000
Message-ID: <172045989768.67326.10977348711654476148@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708145607.272869-1-badal.nilawar@intel.com>
In-Reply-To: <20240708145607.272869-1-badal.nilawar@intel.com>
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

--===============7738682932874427185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend mocs-rpm test to support d3 cold
URL   : https://patchwork.freedesktop.org/series/135849/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7919_BAT -> XEIGTPW_11383_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11383_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11383_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11383_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pm@d3cold-mocs} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-lnl-1/igt@xe_pm@d3cold-mocs.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-dg2-oem2/igt@xe_pm@d3cold-mocs.html
    - bat-adlp-7:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-adlp-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-mocs:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-atsm-2/igt@xe_pm@s3-mocs.html

  
New tests
---------

  New tests have been introduced between XEIGT_7919_BAT and XEIGTPW_11383_BAT:

### New IGT tests (2) ###

  * igt@xe_pm@d3cold-mocs:
    - Statuses : 4 skip(s)
    - Exec time: [0.10, 0.45] s

  * igt@xe_pm@d3hot-mocs:
    - Statuses : 4 pass(s)
    - Exec time: [1.46, 3.62] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11383_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pm@s4-mocs:
    - bat-adlp-7:         NOTRUN -> [ABORT][5] ([Intel XE#1794])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-adlp-7/igt@xe_pm@s4-mocs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584


Build changes
-------------

  * IGT: IGT_7919 -> IGTPW_11383
  * Linux: xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf -> xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d

  IGTPW_11383: 295a7a108eb7cfed44f88d5c6819c36d0738f484 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf: 414cc5961337b50dd261349b4ed7aa0013044ccf
  xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d: 1b010bec39a554cbbd0b51cbf49142e2f218013d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/index.html

--===============7738682932874427185==
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
<tr><td><b>Series:</b></td><td>Extend mocs-rpm test to support d3 cold</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135849/">https://patchwork.freedesktop.org/series/135849/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7919_BAT -&gt; XEIGTPW_11383_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11383_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11383_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11383_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pm@d3cold-mocs} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-lnl-1/igt@xe_pm@d3cold-mocs.html">SKIP</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-dg2-oem2/igt@xe_pm@d3cold-mocs.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-adlp-7/igt@xe_pm@d3cold-mocs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-atsm-2/igt@xe_pm@s3-mocs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7919_BAT and XEIGTPW_11383_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.10, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.46, 3.62] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11383_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pm@s4-mocs:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11383/bat-adlp-7/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7919 -&gt; IGTPW_11383</li>
<li>Linux: xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf -&gt; xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d</li>
</ul>
<p>IGTPW_11383: 295a7a108eb7cfed44f88d5c6819c36d0738f484 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf: 414cc5961337b50dd261349b4ed7aa0013044ccf<br />
  xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d: 1b010bec39a554cbbd0b51cbf49142e2f218013d</p>

</body>
</html>

--===============7738682932874427185==--

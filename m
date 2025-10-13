Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79121CCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 22:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB95110E13A;
	Mon, 13 Oct 2025 22:29:25 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337810E0D3;
 Mon, 13 Oct 2025 22:29:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7430500565853308670=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsurvivabil?=
 =?utf-8?q?ity=3A_Add_xe=5Fsurvivability_test_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Oct 2025 22:29:24 -0000
Message-ID: <176039456463.7102.15853473928665231421@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013194910.1065392-5-sk.anirban@intel.com>
In-Reply-To: <20251013194910.1065392-5-sk.anirban@intel.com>
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

--===============7430500565853308670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: Add xe_survivability test (rev4)
URL   : https://patchwork.freedesktop.org/series/154342/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8582_BAT -> XEIGTPW_13893_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13893_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_survivability@i2c-functionality} (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-lnl-2/igt@xe_survivability@i2c-functionality.html
    - {bat-ptl-2}:        NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-ptl-2/igt@xe_survivability@i2c-functionality.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html

  * {igt@xe_survivability@runtime-survivability} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-adlp-7/igt@xe_survivability@runtime-survivability.html
    - bat-atsm-2:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-atsm-2/igt@xe_survivability@runtime-survivability.html
    - {bat-ptl-1}:        NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-ptl-1/igt@xe_survivability@runtime-survivability.html
    - {bat-ptl-vm}:       NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html
    - bat-lnl-1:          NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-lnl-1/igt@xe_survivability@runtime-survivability.html

  
New tests
---------

  New tests have been introduced between XEIGT_8582_BAT and XEIGTPW_13893_BAT:

### New IGT tests (2) ###

  * igt@xe_survivability@i2c-functionality:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@xe_survivability@runtime-survivability:
    - Statuses : 2 pass(s) 9 skip(s)
    - Exec time: [0.0, 4.32] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8582 -> IGTPW_13893
  * Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 -> xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c

  IGTPW_13893: eb0a34c50f2a9e17bff36ae25662ca71cb496c31 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8582: 8582
  xe-3900-06342be0412e879eaede7e6932e651f8cb630203: 06342be0412e879eaede7e6932e651f8cb630203
  xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c: f33ccc63d84c30ee59454b6c4e9303ef36c41c0c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/index.html

--===============7430500565853308670==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: Add xe_survivability test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154342/">https://patchwork.freedesktop.org/series/154342/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8582_BAT -&gt; XEIGTPW_13893_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13893_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_survivability@i2c-functionality} (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-lnl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>{bat-ptl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-ptl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_survivability@runtime-survivability} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-adlp-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-atsm-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>{bat-ptl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-ptl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>{bat-ptl-vm}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13893/bat-lnl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8582_BAT and XEIGTPW_13893_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>Statuses : 2 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 4.32] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGTPW_13893</li>
<li>Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 -&gt; xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c</li>
</ul>
<p>IGTPW_13893: eb0a34c50f2a9e17bff36ae25662ca71cb496c31 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8582: 8582<br />
  xe-3900-06342be0412e879eaede7e6932e651f8cb630203: 06342be0412e879eaede7e6932e651f8cb630203<br />
  xe-3910-f33ccc63d84c30ee59454b6c4e9303ef36c41c0c: f33ccc63d84c30ee59454b6c4e9303ef36c41c0c</p>

</body>
</html>

--===============7430500565853308670==--

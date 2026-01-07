Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF77DCF6BE4
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 06:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4110E25E;
	Wed,  7 Jan 2026 06:48:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6110E1F6;
 Wed,  7 Jan 2026 06:48:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2411254006088248634=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Fpat=3A_add_compression?=
 =?utf-8?q?_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Jan 2026 06:48:37 -0000
Message-ID: <176776851767.131470.7950293462747244659@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260107052406.21678-1-x.wang@intel.com>
In-Reply-To: <20260107052406.21678-1-x.wang@intel.com>
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

--===============2411254006088248634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_pat: add compression subtests
URL   : https://patchwork.freedesktop.org/series/159722/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8688_BAT -> XEIGTPW_14305_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14305_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pat@bo-wb-comp-1way-bind} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-adlp-7/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-lnl-2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-lnl-2/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-ptl-2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-ptl-2/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-atsm-2/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-ptl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-ptl-1/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-ptl-vm/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-lnl-1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-lnl-1/igt@xe_pat@bo-wb-comp-1way-bind.html
    - bat-bmg-2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-bmg-2/igt@xe_pat@bo-wb-comp-1way-bind.html

  * {igt@xe_pat@prime-external-import-comp} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-dg2-oem2/igt@xe_pat@prime-external-import-comp.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-adlp-vm/igt@xe_pat@prime-external-import-comp.html

  
New tests
---------

  New tests have been introduced between XEIGT_8688_BAT and XEIGTPW_14305_BAT:

### New IGT tests (3) ###

  * igt@xe_pat@bo-wb-comp-1way-bind:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@xe_pat@prime-external-import-comp:
    - Statuses : 6 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_pat@userptr-comp:
    - Statuses : 6 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.06] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8688 -> IGTPW_14305
  * Linux: xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0 -> xe-4338-1124404e817b8b53ae369c2c41efb35a1cfaf48a

  IGTPW_14305: 14305
  IGT_8688: bf529184be041a0197778395aa71dbb1e5d47bff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0: 3d6700a02638d446a4e8ad92a8212c3efef84ae0
  xe-4338-1124404e817b8b53ae369c2c41efb35a1cfaf48a: 1124404e817b8b53ae369c2c41efb35a1cfaf48a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/index.html

--===============2411254006088248634==
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
<tr><td><b>Series:</b></td><td>xe_pat: add compression subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159722/">https://patchwork.freedesktop.org/series/159722/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8688_BAT -&gt; XEIGTPW_14305_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14305_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pat@bo-wb-comp-1way-bind} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-adlp-7/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a> +2 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-lnl-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-ptl-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-atsm-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a> +2 other tests skip</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-ptl-1/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-ptl-vm/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-lnl-1/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-bmg-2/igt@xe_pat@bo-wb-comp-1way-bind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pat@prime-external-import-comp} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-dg2-oem2/igt@xe_pat@prime-external-import-comp.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14305/bat-adlp-vm/igt@xe_pat@prime-external-import-comp.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8688_BAT and XEIGTPW_14305_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pat@bo-wb-comp-1way-bind:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-comp:</p>
<ul>
<li>Statuses : 6 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-comp:</p>
<ul>
<li>Statuses : 6 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8688 -&gt; IGTPW_14305</li>
<li>Linux: xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0 -&gt; xe-4338-1124404e817b8b53ae369c2c41efb35a1cfaf48a</li>
</ul>
<p>IGTPW_14305: 14305<br />
  IGT_8688: bf529184be041a0197778395aa71dbb1e5d47bff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0: 3d6700a02638d446a4e8ad92a8212c3efef84ae0<br />
  xe-4338-1124404e817b8b53ae369c2c41efb35a1cfaf48a: 1124404e817b8b53ae369c2c41efb35a1cfaf48a</p>

</body>
</html>

--===============2411254006088248634==--

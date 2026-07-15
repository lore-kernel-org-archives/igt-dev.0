Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33757C4450A
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 04:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679ED10E6F7;
	Wed, 15 Jul 2026 04:09:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4610E6F7;
 Wed, 15 Jul 2026 04:09:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2288752564963164046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_CPU_idle_state_control_?=
 =?utf-8?q?for_accurate_vblank_timing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jul 2026 04:09:29 -0000
Message-ID: <178408856904.190771.2876384062453376794@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
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

--===============2288752564963164046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CPU idle state control for accurate vblank timing
URL   : https://patchwork.freedesktop.org/series/170451/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9006_BAT -> XEIGTPW_15529_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15529_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15529_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-bmg-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15529_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-ptl-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-ptl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-wcl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          NOTRUN -> [ABORT][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-3/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-adlp-7/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][18] -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-lnl-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_9006 -> IGTPW_15529
  * Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -> xe-5405-cf54bcae91390d166aed4b7e3222bee13912c306

  IGTPW_15529: 828b60037302ce4ae914d9ab148a466f51fd0aa0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc
  xe-5405-cf54bcae91390d166aed4b7e3222bee13912c306: cf54bcae91390d166aed4b7e3222bee13912c306

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/index.html

--===============2288752564963164046==
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
<tr><td><b>Series:</b></td><td>Add CPU idle state control for accurate vblank timing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170451/">https://patchwork.freedesktop.org/series/170451/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9006_BAT -&gt; XEIGTPW_15529_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15529_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15529_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15529_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-wcl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15529/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9006 -&gt; IGTPW_15529</li>
<li>Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -&gt; xe-5405-cf54bcae91390d166aed4b7e3222bee13912c306</li>
</ul>
<p>IGTPW_15529: 828b60037302ce4ae914d9ab148a466f51fd0aa0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc<br />
  xe-5405-cf54bcae91390d166aed4b7e3222bee13912c306: cf54bcae91390d166aed4b7e3222bee13912c306</p>

</body>
</html>

--===============2288752564963164046==--

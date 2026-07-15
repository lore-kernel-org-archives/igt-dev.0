Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A85CC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 10:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5D10EF7E;
	Wed, 15 Jul 2026 10:19:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3284E10EF88;
 Wed, 15 Jul 2026 10:18:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1708866944941772580=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CI=3A_Update_NVL=2C_LNL_and?=
 =?utf-8?q?_BMG_Core_Blocklist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jul 2026 10:18:56 -0000
Message-ID: <178411073619.190770.3933251281861303543@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
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

--===============1708866944941772580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CI: Update NVL, LNL and BMG Core Blocklist
URL   : https://patchwork.freedesktop.org/series/170462/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9006_BAT -> XEIGTPW_15533_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  Additional (1): bat-bmg-2 
  Missing    (1): bat-wcl-2 

Known issues
------------

  Here are the changes found in XEIGTPW_15533_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8607])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-ptl-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][3] -> [ABORT][4] ([Intel XE#8607])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][5] -> [ABORT][6] ([Intel XE#8607])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-ptl-1/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][7] -> [ABORT][8] ([Intel XE#8607])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          NOTRUN -> [ABORT][9] ([Intel XE#8607])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][10] -> [ABORT][11] ([Intel XE#8607])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-3/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][12] -> [ABORT][13] ([Intel XE#8607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-1/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][14] -> [ABORT][15] ([Intel XE#8607])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-adlp-7/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][16] -> [ABORT][17] ([Intel XE#8607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-lnl-2/igt@xe_module_load@load.html

  
  [Intel XE#8607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607


Build changes
-------------

  * IGT: IGT_9006 -> IGTPW_15533
  * Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -> xe-5409-6dd678fdc2f39062bed466d7e3c851736e376531

  IGTPW_15533: 27ba2b269e79d47d88caa30d9492ced927173752 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc
  xe-5409-6dd678fdc2f39062bed466d7e3c851736e376531: 6dd678fdc2f39062bed466d7e3c851736e376531

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/index.html

--===============1708866944941772580==
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
<tr><td><b>Series:</b></td><td>CI: Update NVL, LNL and BMG Core Blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170462/">https://patchwork.freedesktop.org/series/170462/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9006_BAT -&gt; XEIGTPW_15533_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-2 <br />
  Missing    (1): bat-wcl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15533_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9006/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15533/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8607">Intel XE#8607</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9006 -&gt; IGTPW_15533</li>
<li>Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -&gt; xe-5409-6dd678fdc2f39062bed466d7e3c851736e376531</li>
</ul>
<p>IGTPW_15533: 27ba2b269e79d47d88caa30d9492ced927173752 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc<br />
  xe-5409-6dd678fdc2f39062bed466d7e3c851736e376531: 6dd678fdc2f39062bed466d7e3c851736e376531</p>

</body>
</html>

--===============1708866944941772580==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3CCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361EB10E967;
	Wed, 27 May 2026 19:33:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035D310E956;
 Wed, 27 May 2026 19:32:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8892632563028449577=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/genxml=3A_Introduce_Mes?=
 =?utf-8?q?a_genxml_infrastructure_to_IGT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 May 2026 19:32:58 -0000
Message-ID: <177991037800.17309.12938094177691464384@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527131524.1649421-1-jan.maslak@intel.com>
In-Reply-To: <20260527131524.1649421-1-jan.maslak@intel.com>
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

--===============8892632563028449577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/genxml: Introduce Mesa genxml infrastructure to IGT (rev4)
URL   : https://patchwork.freedesktop.org/series/164446/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15257_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15257_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15257_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15257_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@pat-index-xe2:
    - bat-bmg-1:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-bmg-1/igt@xe_pat@pat-index-xe2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-bmg-1/igt@xe_pat@pat-index-xe2.html
    - bat-lnl-2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-lnl-2/igt@xe_pat@pat-index-xe2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-lnl-2/igt@xe_pat@pat-index-xe2.html
    - bat-wcl-1:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-1/igt@xe_pat@pat-index-xe2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-wcl-1/igt@xe_pat@pat-index-xe2.html
    - bat-wcl-2:          [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-2/igt@xe_pat@pat-index-xe2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-wcl-2/igt@xe_pat@pat-index-xe2.html
    - bat-bmg-vm:         [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-bmg-vm/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-bmg-vm/igt@xe_pat@pat-index-xe2.html
    - bat-ptl-2:          [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-ptl-2/igt@xe_pat@pat-index-xe2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-ptl-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-1:          [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html
    - bat-ptl-vm:         [PASS][15] -> [INCOMPLETE][16] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
    - bat-lnl-1:          [PASS][17] -> [INCOMPLETE][18] +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html
    - bat-bmg-2:          [PASS][19] -> [INCOMPLETE][20] +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  


Build changes
-------------

  * IGT: IGT_8939 -> IGTPW_15257

  IGTPW_15257: 145439d385ab80ed835e87579702146ab155c123 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8939: 8939
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/index.html

--===============8892632563028449577==
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
<tr><td><b>Series:</b></td><td>lib/genxml: Introduce Mesa genxml infrastructure to IGT (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164446/">https://patchwork.freedesktop.org/series/164446/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8939_BAT -&gt; XEIGTPW_15257_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15257_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15257_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15257_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-bmg-1/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-bmg-1/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-lnl-2/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-lnl-2/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-1/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-wcl-1/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-wcl-2/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-wcl-2/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-bmg-vm/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-bmg-vm/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-ptl-2/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-ptl-2/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8939/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15257/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8939 -&gt; IGTPW_15257</li>
</ul>
<p>IGTPW_15257: 145439d385ab80ed835e87579702146ab155c123 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8939: 8939<br />
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb</p>

</body>
</html>

--===============8892632563028449577==--

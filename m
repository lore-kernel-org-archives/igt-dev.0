Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA1C71136
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 16:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E397C10E048;
	Fri, 13 Jun 2025 16:47:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034EF10E048;
 Fri, 13 Jun 2025 16:47:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7287512597876498189=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gitlab-ci=3A_build_docs_bef?=
 =?utf-8?q?ore_installation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jun 2025 16:47:39 -0000
Message-ID: <174983325900.78228.17152496757969492226@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613-docs_before_install-v1-1-0d87d916babb@intel.com>
In-Reply-To: <20250613-docs_before_install-v1-1-0d87d916babb@intel.com>
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

--===============7287512597876498189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gitlab-ci: build docs before installation
URL   : https://patchwork.freedesktop.org/series/150235/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8411_BAT -> XEIGTPW_13293_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-dg2-oem2 

Known issues
------------

  Here are the changes found in XEIGTPW_13293_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-small-cm:
    - bat-lnl-2:          NOTRUN -> [SKIP][1] ([Intel XE#688]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-lnl-1:          NOTRUN -> [SKIP][2] ([Intel XE#688]) +9 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-2:          NOTRUN -> [SKIP][3] ([Intel XE#2229]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][4] ([Intel XE#2229])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][5] ([Intel XE#2229])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#2229]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][7] ([Intel XE#2229]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#977]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          NOTRUN -> [SKIP][9] ([Intel XE#1420] / [Intel XE#2838])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          NOTRUN -> [SKIP][10] ([Intel XE#1420])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          NOTRUN -> [SKIP][11] ([Intel XE#1420])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          NOTRUN -> [SKIP][12] ([Intel XE#1420] / [Intel XE#2838])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#4578])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][14] ([Intel XE#2245])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          NOTRUN -> [SKIP][15] ([Intel XE#2245])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          NOTRUN -> [SKIP][16] ([Intel XE#977])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          NOTRUN -> [SKIP][17] ([Intel XE#977])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          NOTRUN -> [SKIP][18] ([Intel XE#979])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-pvc-2:          NOTRUN -> [SKIP][19] ([Intel XE#979])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          NOTRUN -> [SKIP][20] ([Intel XE#2236])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          NOTRUN -> [SKIP][21] ([Intel XE#2236])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          NOTRUN -> [SKIP][22] ([Intel XE#2236] / [Intel XE#979])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-1:          NOTRUN -> [SKIP][23] ([Intel XE#3342])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-lnl-2:          NOTRUN -> [SKIP][24] ([Intel XE#3342])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-lnl-1:          NOTRUN -> [SKIP][25] ([Intel XE#3342])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-pvc-2:          NOTRUN -> [SKIP][26] ([Intel XE#3342])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-bmg-2:          NOTRUN -> [SKIP][27] ([Intel XE#3342])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-bmg-2:          [ABORT][28] ([Intel XE#5247]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-bmg-1:          [ABORT][30] ([Intel XE#5247]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-lnl-2:          [ABORT][32] ([Intel XE#5247]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-lnl-1:          [ABORT][34] ([Intel XE#5247]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-pvc-2:          [ABORT][36] ([Intel XE#5247]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578
  [Intel XE#5247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5247
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8411 -> IGTPW_13293
  * Linux: xe-3247-e9c2e2a765de7f0c86d97589871410594ef8e0a7 -> xe-3251-3cd32052aee17b5e94d85ffd8ca83fb1b37189d4

  IGTPW_13293: d3c7189ad05b6e0a367bb2f442d68a41f52de76a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3247-e9c2e2a765de7f0c86d97589871410594ef8e0a7: e9c2e2a765de7f0c86d97589871410594ef8e0a7
  xe-3251-3cd32052aee17b5e94d85ffd8ca83fb1b37189d4: 3cd32052aee17b5e94d85ffd8ca83fb1b37189d4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/index.html

--===============7287512597876498189==
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
<tr><td><b>Series:</b></td><td>gitlab-ci: build docs before installation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150235/">https://patchwork.freedesktop.org/series/150235/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8411_BAT -&gt; XEIGTPW_13293_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13293_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578">Intel XE#4578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_one_bo:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5247">Intel XE#5247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5247">Intel XE#5247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5247">Intel XE#5247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5247">Intel XE#5247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5247">Intel XE#5247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13293/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8411 -&gt; IGTPW_13293</li>
<li>Linux: xe-3247-e9c2e2a765de7f0c86d97589871410594ef8e0a7 -&gt; xe-3251-3cd32052aee17b5e94d85ffd8ca83fb1b37189d4</li>
</ul>
<p>IGTPW_13293: d3c7189ad05b6e0a367bb2f442d68a41f52de76a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3247-e9c2e2a765de7f0c86d97589871410594ef8e0a7: e9c2e2a765de7f0c86d97589871410594ef8e0a7<br />
  xe-3251-3cd32052aee17b5e94d85ffd8ca83fb1b37189d4: 3cd32052aee17b5e94d85ffd8ca83fb1b37189d4</p>

</body>
</html>

--===============7287512597876498189==--

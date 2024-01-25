Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1338C47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 17:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7306610F95E;
	Thu, 25 Jan 2024 17:36:01 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3A10F95E;
 Thu, 25 Jan 2024 17:36:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8862235984539529896=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/kunit=3A_Support_writable_?=
 =?utf-8?q?filter*_parameters_of_kunit_module?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Thu, 25 Jan 2024 17:36:00 -0000
Message-ID: <170620416018.727567.6805998957745464974@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============8862235984539529896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kunit: Support writable filter* parameters of kunit module
URL   : https://patchwork.freedesktop.org/series/129174/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7692_BAT -> XEIGTPW_10590_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10590_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10590_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10590_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html

  * igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
    - bat-atsm-2:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
    - bat-adlp-7:         [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-adlp-7/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10590_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([Intel XE#455]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@xe_live_ktest@bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-adlp-7/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([Intel XE#455]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html
    - bat-atsm-2:         [PASS][13] -> [SKIP][14] ([Intel XE#455]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][16] ([Intel XE#455])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][17] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][18] ([Intel XE#455])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7692 -> IGTPW_10590
  * Linux: xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a -> xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a

  IGTPW_10590: 10590
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a: cad255f28ccca6529104b9497a8d7302ae7eb88a
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/index.html

--===============8862235984539529896==
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
<tr><td><b>Series:</b></td><td>lib/kunit: Support writable filter* parameters of kunit module</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129174/">https://patchwork.freedesktop.org/series/129174/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7692_BAT -&gt; XEIGTPW_10590_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10590_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10590_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10590_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-adlp-7/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10590_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-adlp-7/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7692/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10590/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7692 -&gt; IGTPW_10590</li>
<li>Linux: xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a -&gt; xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a</li>
</ul>
<p>IGTPW_10590: 10590<br />
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a: cad255f28ccca6529104b9497a8d7302ae7eb88a<br />
  xe-685-38a58d4231067e1b548c12ee521b73ffc0ebb73a: 38a58d4231067e1b548c12ee521b73ffc0ebb73a</p>

</body>
</html>

--===============8862235984539529896==--

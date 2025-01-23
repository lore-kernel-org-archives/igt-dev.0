Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBFFC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 16:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0FC10E881;
	Thu, 23 Jan 2025 16:39:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0CA10E881;
 Thu, 23 Jan 2025 16:39:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3607342540101793148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcompute=3A?=
 =?utf-8?q?_Add_test_documentation_to_reflect_proper_category_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Jan 2025 16:39:21 -0000
Message-ID: <173765036137.3595954.10454928993235379418@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123132438.37754-1-aditya.chauhan@intel.com>
In-Reply-To: <20250123132438.37754-1-aditya.chauhan@intel.com>
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

--===============3607342540101793148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute: Add test documentation to reflect proper category (rev2)
URL   : https://patchwork.freedesktop.org/series/143873/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8207_BAT -> XEIGTPW_12488_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12488_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2229])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][3] ([i915#5274]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#1192]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][7] ([Intel XE#3970] / [Intel XE#4078]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#1192]) -> [SKIP][10] ([Intel XE#2229] / [Intel XE#455])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8207 -> IGTPW_12488
  * Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 -> xe-2540-7ea93d7bd75efd69dfb3c3400705990d5b42dec5

  IGTPW_12488: 4a1c48fff556366dcd8876bee2948e9e3b8c622e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2: db7cf8d52a41001ea2780cf834fed3dc490343d2
  xe-2540-7ea93d7bd75efd69dfb3c3400705990d5b42dec5: 7ea93d7bd75efd69dfb3c3400705990d5b42dec5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/index.html

--===============3607342540101793148==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute: Add test documentation to reflect proper category (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143873/">https://patchwork.freedesktop.org/series/143873/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8207_BAT -&gt; XEIGTPW_12488_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12488_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8207/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12488/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8207 -&gt; IGTPW_12488</li>
<li>Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 -&gt; xe-2540-7ea93d7bd75efd69dfb3c3400705990d5b42dec5</li>
</ul>
<p>IGTPW_12488: 4a1c48fff556366dcd8876bee2948e9e3b8c622e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2: db7cf8d52a41001ea2780cf834fed3dc490343d2<br />
  xe-2540-7ea93d7bd75efd69dfb3c3400705990d5b42dec5: 7ea93d7bd75efd69dfb3c3400705990d5b42dec5</p>

</body>
</html>

--===============3607342540101793148==--

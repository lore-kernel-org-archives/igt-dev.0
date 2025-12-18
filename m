Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D88D6D226
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 14:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960D110EA05;
	Thu, 18 Dec 2025 14:26:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F097C10E9FE;
 Thu, 18 Dec 2025 14:26:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0241012836072044238=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lig/igt=5Ffb=3A_fix_x-tiled?=
 =?utf-8?q?_framebuffers_on_intel_xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Dec 2025 14:26:20 -0000
Message-ID: <176606798098.101157.3888597494913762653@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
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

--===============0241012836072044238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lig/igt_fb: fix x-tiled framebuffers on intel xe driver
URL   : https://patchwork.freedesktop.org/series/159198/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8673_BAT -> XEIGTPW_14234_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14234_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-1:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][2] ([Intel XE#2244])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          NOTRUN -> [SKIP][3] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][4] ([Intel XE#2229])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-1:          NOTRUN -> [SKIP][5] ([Intel XE#1420])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-1:          NOTRUN -> [SKIP][6] ([Intel XE#2245])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-1:          NOTRUN -> [SKIP][7] ([Intel XE#2236])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][8] -> [FAIL][9] ([Intel XE#6519])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8673/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [ABORT][10] ([Intel XE#6818]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8673/bat-bmg-1/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_module_load@load.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][12] ([Intel XE#6506]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8673/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818


Build changes
-------------

  * IGT: IGT_8673 -> IGTPW_14234

  IGTPW_14234: 14234
  IGT_8673: 8673
  xe-4265-31985bb0a701138a06a5eb0b175b2a5c850cc4ee: 31985bb0a701138a06a5eb0b175b2a5c850cc4ee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/index.html

--===============0241012836072044238==
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
<tr><td><b>Series:</b></td><td>lig/igt_fb: fix x-tiled framebuffers on intel xe driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159198/">https://patchwork.freedesktop.org/series/159198/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8673_BAT -&gt; XEIGTPW_14234_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14234_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8673/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8673/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818">Intel XE#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-bmg-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8673/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14234/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8673 -&gt; IGTPW_14234</li>
</ul>
<p>IGTPW_14234: 14234<br />
  IGT_8673: 8673<br />
  xe-4265-31985bb0a701138a06a5eb0b175b2a5c850cc4ee: 31985bb0a701138a06a5eb0b175b2a5c850cc4ee</p>

</body>
</html>

--===============0241012836072044238==--

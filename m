Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6A2E67806
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 17:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DAF10E1B8;
	Mon, 22 Dec 2025 17:19:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3AD10E1B8;
 Mon, 22 Dec 2025 17:19:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2326889571154815682=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fpat=3A_add?=
 =?utf-8?q?_helper_funtion_to_read_PAT_table_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Dec 2025 17:19:11 -0000
Message-ID: <176642395189.111846.5740452653889989195@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219234615.90213-1-x.wang@intel.com>
In-Reply-To: <20251219234615.90213-1-x.wang@intel.com>
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

--===============2326889571154815682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: add helper funtion to read PAT table (rev2)
URL   : https://patchwork.freedesktop.org/series/159328/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8674_BAT -> XEIGTPW_14255_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14255_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14255_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14255_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/bat-bmg-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-bmg-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14255_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-ptl-1:          NOTRUN -> [SKIP][3] ([Intel XE#5773]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          NOTRUN -> [SKIP][4] ([Intel XE#5765])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-ptl-2:          NOTRUN -> [SKIP][5] ([Intel XE#5765])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          NOTRUN -> [SKIP][6] ([Intel XE#5766]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-ptl-2:          NOTRUN -> [SKIP][7] ([Intel XE#5774] / [Intel XE#5907] / [Intel XE#6203])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-ptl-1:          NOTRUN -> [SKIP][8] ([Intel XE#5769]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          NOTRUN -> [SKIP][9] ([Intel XE#5781])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          NOTRUN -> [SKIP][10] ([Intel XE#1406] / [Intel XE#5778]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-beng-small:
    - bat-ptl-2:          NOTRUN -> [SKIP][11] ([Intel XE#5764]) +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          NOTRUN -> [SKIP][12] ([Intel XE#5764]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          NOTRUN -> [SKIP][13] ([Intel XE#5775]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-ptl-2:          NOTRUN -> [SKIP][14] ([Intel XE#5775]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          NOTRUN -> [SKIP][15] ([Intel XE#5776])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-ptl-2:          NOTRUN -> [SKIP][16] ([Intel XE#5776])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-2:          NOTRUN -> [SKIP][17] ([Intel XE#5777])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          NOTRUN -> [SKIP][18] ([Intel XE#5777])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-2:          NOTRUN -> [SKIP][19] ([Intel XE#5771])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          NOTRUN -> [SKIP][20] ([Intel XE#5771])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          NOTRUN -> [SKIP][21] ([Intel XE#5780])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          NOTRUN -> [SKIP][22] ([Intel XE#5780])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#6520]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773
  [Intel XE#5774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8674 -> IGTPW_14255
  * Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 -> xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72

  IGTPW_14255: 14255
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7
  xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72: 0b9ab258bd57ffe1b88e942940534f4bf5139b72

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/index.html

--===============2326889571154815682==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: add helper funtion to read PAT table (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159328/">https://patchwork.freedesktop.org/series/159328/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8674_BAT -&gt; XEIGTPW_14255_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14255_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14255_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14255_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14255_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773">Intel XE#5773</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774">Intel XE#5774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203">Intel XE#6203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14255/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8674 -&gt; IGTPW_14255</li>
<li>Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 -&gt; xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72</li>
</ul>
<p>IGTPW_14255: 14255<br />
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7<br />
  xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72: 0b9ab258bd57ffe1b88e942940534f4bf5139b72</p>

</body>
</html>

--===============2326889571154815682==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE5AC0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 07:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA4A10E499;
	Mon, 27 Jan 2025 07:29:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E0E10E499;
 Mon, 27 Jan 2025 07:29:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6639409179194483587=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_add_dsc-fallback_test_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jan 2025 07:29:41 -0000
Message-ID: <173796298194.1269582.9013461215844690106@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
In-Reply-To: <20250127062904.3420225-1-kunal1.joshi@intel.com>
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

--===============6639409179194483587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add dsc-fallback test (rev2)
URL   : https://patchwork.freedesktop.org/series/143877/
State : success

== Summary ==

CI Bug Log - changes from IGT_8209 -> IGTPW_12495
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-dg2-14 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12495:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dp_linktrain_fallback@dp-fallbck} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - {bat-mtlp-9}:       NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - {bat-arls-6}:       NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arls-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg2-9:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg2-8:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallbck.html

  * {igt@kms_dp_linktrain_fallback@dsc-fallback} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adls-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-adlp-6:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arlh-3:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg1-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-adlp-9:         NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-11/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-rpls-4:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-rpls-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arls-5:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arls-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-rplp-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-dg2-9:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  
New tests
---------

  New tests have been introduced between IGT_8209 and IGTPW_12495:

### New IGT tests (2) ###

  * igt@kms_dp_linktrain_fallback@dp-fallbck:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - Statuses : 1 fail(s) 1 pass(s) 32 skip(s)
    - Exec time: [0.0, 21.27] s

  

Known issues
------------

  Here are the changes found in IGTPW_12495 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][18] -> [INCOMPLETE][19] ([i915#12904]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-apl-1/igt@dmabuf@all-tests.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][20] -> [DMESG-FAIL][21] ([i915#12061]) +1 other test dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * {igt@kms_dp_linktrain_fallback@dp-fallbck} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][22] ([i915#6078]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-atsm-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][23] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][24] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-adlp-11:        NOTRUN -> [SKIP][25] ([i915#10470]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][26] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-hsw-4770/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][27] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-ivb-3770/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - bat-dg1-6:          NOTRUN -> [SKIP][28] ([i915#12311]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][29] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-guc/igt@kms_dp_linktrain_fallback@dp-fallbck.html

  * {igt@kms_dp_linktrain_fallback@dsc-fallback} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][30] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-ilk-650/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][31] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-kbl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][32] ([i915#11346]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][33] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-glk-j4005/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-7567u/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-cfl-8700k/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][36] +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-apl-1:          NOTRUN -> [SKIP][37] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-apl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][38] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-elk-e7500/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-bsw-nick/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][40] ([i915#9792])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][41] ([i915#12061]) -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - {bat-mtlp-9}:       [DMESG-FAIL][43] ([i915#12061]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8209 -> IGTPW_12495
  * Linux: CI_DRM_16017 -> CI_DRM_16023

  CI-20190529: 20190529
  CI_DRM_16017: 897537fb818365733977947214c799d61675895f @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16023: 006a892140827b356eb4ad5a5e9b947477791ba8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12495: 12495
  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html

--===============6639409179194483587==
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
<tr><td><b>Series:</b></td><td>add dsc-fallback test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143877/">https://patchwork.freedesktop.org/series/143877/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8209 -&gt; IGTPW_12495</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-dg2-14 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12495:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dp_linktrain_fallback@dp-fallbck} (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a></li>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>{bat-arls-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arls-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dp_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adls-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg1-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-11/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-rpls-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arls-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-rplp-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-tgl-1115g4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg2-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8209 and IGTPW_12495:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallbck:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 32 skip(s)</li>
<li>Exec time: [0.0, 21.27] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12495 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_linktrain_fallback@dp-fallbck} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-atsm-1/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +1 other test skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-cfl-guc/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-x1275/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-adlp-11/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +1 other test skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-hsw-4770/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-ivb-3770/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-dg1-6/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +1 other test skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-guc/igt@kms_dp_linktrain_fallback@dp-fallbck.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-ilk-650/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-kbl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +1 other test skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-glk-j4005/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-7567u/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-cfl-8700k/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-kbl-8809g/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-apl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-elk-e7500/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/fi-bsw-nick/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8209/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8209 -&gt; IGTPW_12495</li>
<li>Linux: CI_DRM_16017 -&gt; CI_DRM_16023</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16017: 897537fb818365733977947214c799d61675895f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16023: 006a892140827b356eb4ad5a5e9b947477791ba8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12495: 12495<br />
  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6639409179194483587==--

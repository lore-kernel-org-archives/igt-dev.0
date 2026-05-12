Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F25CD4F24
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E56610EA82;
	Tue, 12 May 2026 12:59:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5146910EA94;
 Tue, 12 May 2026 12:59:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1522659617026747028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_RFC=3A_Add_preferred_FB_m?=
 =?utf-8?q?odifier_helper_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 12:59:15 -0000
Message-ID: <177859075532.61708.11963001481234182901@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512062020.546220-1-jeevan.b@intel.com>
In-Reply-To: <20260512062020.546220-1-jeevan.b@intel.com>
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

--===============1522659617026747028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: Add preferred FB modifier helper (rev2)
URL   : https://patchwork.freedesktop.org/series/164817/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8904 -> IGTPW_15160
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15160 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15160, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15160:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-mtlp-9:         [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-mtlp-8:         [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adls-6:         [PASS][5] -> [FAIL][6] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-arlh-3:         [PASS][7] -> [FAIL][8] +5 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-dg1-7:          [PASS][9] -> [FAIL][10] +5 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - fi-glk-j4005:       [PASS][11] -> [FAIL][12] +5 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adlp-9:         [PASS][13] -> [FAIL][14] +5 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rpls-4:         [PASS][15] -> [FAIL][16] +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-twl-1:          [PASS][17] -> [FAIL][18] +5 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-jsl-5:          [PASS][19] -> [FAIL][20] +5 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-apl-1:          [PASS][21] -> [FAIL][22] +5 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-rplp-1:         [PASS][23] -> [FAIL][24] +5 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-dg2-9:          [PASS][25] -> [FAIL][26] +5 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-6:         [PASS][27] -> [FAIL][28] +5 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - fi-skl-6600u:       [PASS][29] -> [FAIL][30] +5 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-arls-6:         [PASS][31] -> [FAIL][32] +5 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-kbl-7567u:       [PASS][33] -> [FAIL][34] +5 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-cfl-guc:         [PASS][35] -> [FAIL][36] +5 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-cfl-8700k:       [PASS][37] -> [FAIL][38] +5 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-twl-2:          [PASS][39] -> [FAIL][40] +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-14:         [PASS][41] -> [FAIL][42] +5 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-dg2-8:          [PASS][43] -> [FAIL][44] +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - fi-bsw-n3050:       [PASS][45] -> [FAIL][46] +7 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
    - bat-arls-5:         [PASS][47] -> [FAIL][48] +5 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-tgl-1115g4:      [PASS][49] -> [FAIL][50] +5 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-cfl-8109u:       [DMESG-WARN][51] ([i915#15673]) -> [FAIL][52] +5 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
Known issues
------------

  Here are the changes found in IGTPW_15160 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][53] -> [DMESG-FAIL][54] ([i915#12061]) +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][55] ([i915#12061]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-8/igt@i915_selftest@live.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-8/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8904 -> IGTPW_15160

  CI-20190529: 20190529
  CI_DRM_18473: b83102e9c06357b09f2cfbe944269786cb6985c4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15160: 4f8d846588a3793f6023b534778ff6d300a90c85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8904: 07cadbb0bf25b18ac37467c4505f87eb50d4e435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/index.html

--===============1522659617026747028==
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
<tr><td><b>Series:</b></td><td>RFC: Add preferred FB modifier helper (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164817/">https://patchwork.freedesktop.org/series/164817/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8904 -&gt; IGTPW_15160</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15160 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15160, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15160:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-adls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-arlh-3/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-glk-j4005/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-twl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-jsl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-apl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-rplp-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-adlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-arls-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-cfl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-cfl-8700k/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-twl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-14/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +7 other tests fail</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-arls-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/fi-cfl-8109u/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15160 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8904/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15160/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8904 -&gt; IGTPW_15160</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18473: b83102e9c06357b09f2cfbe944269786cb6985c4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15160: 4f8d846588a3793f6023b534778ff6d300a90c85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8904: 07cadbb0bf25b18ac37467c4505f87eb50d4e435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1522659617026747028==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F347DCCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 07:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CFE10EACF;
	Thu, 26 Sep 2024 07:56:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2225410EABF;
 Thu, 26 Sep 2024 07:56:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6870019558427683533=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_test_to_validate_fallba?=
 =?utf-8?q?ck_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 07:56:56 -0000
Message-ID: <172733741613.1105041.4000815571175417709@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
In-Reply-To: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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

--===============6870019558427683533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev7)
URL   : https://patchwork.freedesktop.org/series/134660/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15445 -> IGTPW_11803
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11803 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11803, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11803:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-rkl-11600/igt@kms_fallback@dp-fallback.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-tgl-1115g4/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-mtlp-6/igt@kms_fallback@dp-fallback.html
    - bat-dg2-9:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-dg2-9/igt@kms_fallback@dp-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlp-11/igt@kms_fallback@dp-fallback.html
    - bat-arls-2:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-2/igt@kms_fallback@dp-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-mtlp-8/igt@kms_fallback@dp-fallback.html
    - bat-adls-6:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adls-6/igt@kms_fallback@dp-fallback.html
    - bat-jsl-1:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-jsl-1/igt@kms_fallback@dp-fallback.html
    - bat-arls-1:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-1/igt@kms_fallback@dp-fallback.html
    - bat-adlp-6:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlp-6/igt@kms_fallback@dp-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arlh-2/igt@kms_fallback@dp-fallback.html
    - {bat-arlh-3}:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arlh-3/igt@kms_fallback@dp-fallback.html
    - bat-adlp-9:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlp-9/igt@kms_fallback@dp-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-twl-2/igt@kms_fallback@dp-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-dg2-11/igt@kms_fallback@dp-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-twl-1/igt@kms_fallback@dp-fallback.html
    - bat-arls-5:         NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@kms_fallback@dp-fallback.html
    - bat-adlm-1:         NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlm-1/igt@kms_fallback@dp-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-rplp-1/igt@kms_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15445 and IGTPW_11803:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11803 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][21] -> [ABORT][22] ([i915#12216]) +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-mtlp-8/igt@i915_selftest@live.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arls-5:         NOTRUN -> [DMESG-WARN][23] ([i915#11637] / [i915#12133]) +4 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@objects:
    - bat-arls-5:         NOTRUN -> [DMESG-WARN][24] ([i915#10341] / [i915#11637]) +2 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@objects.html

  * igt@i915_selftest@live@requests:
    - bat-arls-5:         NOTRUN -> [DMESG-WARN][25] ([i915#11637]) +25 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][26] -> [DMESG-FAIL][27] ([i915#9500]) +1 other test dmesg-fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_fallback@dp-fallback (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-cfl-guc/igt@kms_fallback@dp-fallback.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-hsw-4770/igt@kms_fallback@dp-fallback.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-cfl-8109u/igt@kms_fallback@dp-fallback.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-ivb-3770/igt@kms_fallback@dp-fallback.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-kbl-guc/igt@kms_fallback@dp-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-ilk-650/igt@kms_fallback@dp-fallback.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-blb-e6850/igt@kms_fallback@dp-fallback.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-glk-j4005/igt@kms_fallback@dp-fallback.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-kbl-8809g/igt@kms_fallback@dp-fallback.html
    - bat-apl-1:          NOTRUN -> [SKIP][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-apl-1/igt@kms_fallback@dp-fallback.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-elk-e7500/igt@kms_fallback@dp-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-kbl-2/igt@kms_fallback@dp-fallback.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - bat-arls-5:         [DMESG-WARN][42] ([i915#11637]) -> [DMESG-WARN][43] ([i915#11637] / [i915#1982])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-arls-5/igt@i915_module_load@reload.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-arls-5:         [ABORT][44] ([i915#12061] / [i915#12133]) -> [DMESG-WARN][45] ([i915#10341] / [i915#12133])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-arls-5/igt@i915_selftest@live.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [ABORT][46] ([i915#12061]) -> [DMESG-WARN][47] ([i915#10341] / [i915#11637])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8032 -> IGTPW_11803

  CI-20190529: 20190529
  CI_DRM_15445: 0c981c182e22df4e1a25cd80f756b5824586e51e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11803: 057161721ad58a48403cbf5ea5c9ec5e894aba5f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html

--===============6870019558427683533==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15445 -&gt; IGTPW_11803</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11803 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11803, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11803:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-rkl-11600/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-tgl-1115g4/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-mtlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-dg2-9/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlp-11/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-mtlp-8/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adls-6/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-jsl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlp-6/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arlh-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arlh-3/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlp-9/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-twl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-dg2-11/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-twl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-adlm-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-rplp-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15445 and IGTPW_11803:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11803 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@objects.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) +25 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_fallback@dp-fallback (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-cfl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-kbl-x1275/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-hsw-4770/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-cfl-8109u/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-ivb-3770/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-kbl-guc/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-ilk-650/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-blb-e6850/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-glk-j4005/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-cfl-8700k/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-kbl-8809g/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-apl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/fi-elk-e7500/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-kbl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-arls-5/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15445/bat-arls-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8032 -&gt; IGTPW_11803</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15445: 0c981c182e22df4e1a25cd80f756b5824586e51e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11803: 057161721ad58a48403cbf5ea5c9ec5e894aba5f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032</p>

</body>
</html>

--===============6870019558427683533==--

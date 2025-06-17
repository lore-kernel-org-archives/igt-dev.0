Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0020AC71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 15:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733DD10E75D;
	Tue, 17 Jun 2025 15:31:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42310E3F0;
 Tue, 17 Jun 2025 15:31:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7544330506075371665=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/i915/pm=5Frc6=5Fres?=
 =?utf-8?q?idency=3A_Use_sysfs_to_achieve_peak_frequency_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jun 2025 15:31:48 -0000
Message-ID: <175017430862.88187.15639297916688494899@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617064456.3041238-5-sk.anirban@intel.com>
In-Reply-To: <20250617064456.3041238-5-sk.anirban@intel.com>
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

--===============7544330506075371665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev12)
URL   : https://patchwork.freedesktop.org/series/148054/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8412 -> IGTPW_13310
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13310 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13310, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-jsl-4 fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13310:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-adls-6:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-adls-6/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-jsl-1/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-rkl-11600/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-rpls-4:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-rpls-4/igt@i915_pm_rc6_residency@rc6-idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_13310 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-cfl-guc:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-cfl-guc/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-x1275/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-kbl-2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-kbl-2/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-cfl-8700k/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-ivb-3770/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-hsw-4770/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-idle.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-8809g/igt@i915_pm_rc6_residency@rc6-idle.html
    - bat-apl-1:          NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-apl-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@client:
    - fi-kbl-7567u:       [PASS][20] -> [DMESG-WARN][21] ([i915#13735]) +13 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/fi-kbl-7567u/igt@i915_selftest@live@client.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-7567u/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [PASS][22] -> [DMESG-FAIL][23] ([i915#12061]) +1 other test dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][24] -> [DMESG-FAIL][25] ([i915#12061]) +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][26] ([i915#12904]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-apl-1/igt@dmabuf@all-tests.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@hugepages:
    - bat-arlh-2:         [DMESG-FAIL][28] ([i915#14243]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-arlh-2/igt@i915_selftest@live@hugepages.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-arlh-2/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][30] ([i915#12061]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8412 -> IGTPW_13310
  * Linux: CI_DRM_16706 -> CI_DRM_16712

  CI-20190529: 20190529
  CI_DRM_16706: dea7240e83c9e58ec755a3d68e7db10068df6b76 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16712: 95f0ac069cc2eee10b5d5e0ba67502ccea089de8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13310: 13310
  IGT_8412: 8412

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/index.html

--===============7544330506075371665==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8412 -&gt; IGTPW_13310</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13310 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13310, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-jsl-4 fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13310:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-idle:<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-adls-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-jsl-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-rkl-11600/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-rpls-4/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13310 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-cfl-guc/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-x1275/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-kbl-2/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-cfl-8700k/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-ivb-3770/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-hsw-4770/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-8809g/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-apl-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/fi-kbl-7567u/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/fi-kbl-7567u/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-arlh-2/igt@i915_selftest@live@hugepages.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-arlh-2/igt@i915_selftest@live@hugepages.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8412/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13310/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8412 -&gt; IGTPW_13310</li>
<li>Linux: CI_DRM_16706 -&gt; CI_DRM_16712</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16706: dea7240e83c9e58ec755a3d68e7db10068df6b76 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16712: 95f0ac069cc2eee10b5d5e0ba67502ccea089de8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13310: 13310<br />
  IGT_8412: 8412</p>

</body>
</html>

--===============7544330506075371665==--

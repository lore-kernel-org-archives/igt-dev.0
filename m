Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D84C28B23
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 06:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0DC10E8F0;
	Thu,  6 Mar 2025 06:43:29 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B292F10E8F0;
 Thu,  6 Mar 2025 06:43:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1405867524351149679=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/i915/pm=5Frc6=5Fres?=
 =?utf-8?q?idency=3A_Replace_waitboost_with_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Mar 2025 06:43:27 -0000
Message-ID: <174124340772.66000.2885989965591294467@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250305174444.2516705-1-sk.anirban@intel.com>
In-Reply-To: <20250305174444.2516705-1-sk.anirban@intel.com>
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

--===============1405867524351149679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Replace waitboost with (rev3)
URL   : https://patchwork.freedesktop.org/series/141759/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8262 -> IGTPW_12711
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12711 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12711, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/index.html

Participating hosts (46 -> 43)
------------------------------

  Missing    (3): bat-arlh-2 fi-snb-2520m fi-skl-6600u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12711:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-bsw-n3050:       NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - fi-bsw-nick:        NOTRUN -> [ABORT][2] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_selftest@live@late_gt_pm:
    - bat-twl-1:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-twl-1/igt@i915_selftest@live@late_gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-twl-1/igt@i915_selftest@live@late_gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_12711 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-tgl-1115g4:      NOTRUN -> [WARN][5] ([i915#13790] / [i915#2681]) +4 other tests warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - bat-rpls-4:         NOTRUN -> [DMESG-WARN][6] ([i915#13400]) +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-rpls-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - fi-ilk-650:         NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - fi-elk-e7500:       NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_selftest@live:
    - bat-twl-1:          [PASS][11] -> [INCOMPLETE][12] ([i915#13776])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-twl-1/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-twl-1/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - bat-arlh-3:         [INCOMPLETE][13] ([i915#12445]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-adlp-9:         [ABORT][17] ([i915#13696]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-adlp-9/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [DMESG-FAIL][19] ([i915#12061]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#13776]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13776
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8262 -> IGTPW_12711

  CI-20190529: 20190529
  CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12711: 12711
  IGT_8262: 8262

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/index.html

--===============1405867524351149679==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Replace waitboost with (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141759/">https://patchwork.freedesktop.org/series/141759/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8262 -&gt; IGTPW_12711</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12711 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12711, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/index.html</p>
<h2>Participating hosts (46 -&gt; 43)</h2>
<p>Missing    (3): bat-arlh-2 fi-snb-2520m fi-skl-6600u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12711:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-twl-1/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-twl-1/igt@i915_selftest@live@late_gt_pm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12711 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +4 other tests warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-rpls-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> +2 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> +1 other test skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-twl-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13776">i915#13776</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-arlh-3/igt@i915_selftest@live@gem_contexts.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-adlp-9/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-adlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12711/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8262 -&gt; IGTPW_12711</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12711: 12711<br />
  IGT_8262: 8262</p>

</body>
</html>

--===============1405867524351149679==--

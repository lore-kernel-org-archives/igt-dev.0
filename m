Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3784ED743FA
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 00:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EF610E03D;
	Thu, 21 Nov 2024 00:49:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB6710E03D;
 Thu, 21 Nov 2024 00:49:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4260957937427037539=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_lib/intel=5Fdevice=5Finfo?=
 =?utf-8?q?=3A_Use_per-thread_device_info_cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 00:49:34 -0000
Message-ID: <173215017452.913951.9236271103626224838@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120223546.145304-1-matthew.d.roper@intel.com>
In-Reply-To: <20241120223546.145304-1-matthew.d.roper@intel.com>
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

--===============4260957937427037539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_device_info: Use per-thread device info cache
URL   : https://patchwork.freedesktop.org/series/141627/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8118 -> IGTPW_12153
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12153 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12153, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12153:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
Known issues
------------

  Here are the changes found in IGTPW_12153 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-kbl-8809g:       [PASS][3] -> [SKIP][4] ([i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@fbdev@info.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-plain-flip:
    - fi-kbl-8809g:       [PASS][7] -> [SKIP][8] +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-2:          [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-twl-2/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][11] ([i915#12903]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - bat-adls-6:         [FAIL][13] ([i915#12903]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-adls-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][15] ([i915#12829]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-8:         [ABORT][17] ([i915#12061]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-8809g:       [FAIL][19] ([i915#12900]) -> [PASS][20] +37 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-8809g:       [SKIP][21] -> [PASS][22] +4 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-apl-1:          [DMESG-WARN][23] ([i915#12918]) -> [PASS][24] +2 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-kbl-8809g:       [FAIL][25] ([i915#12902]) -> [SKIP][26] +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
  [i915#12900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12900
  [i915#12902]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12902
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8118 -> IGTPW_12153
  * Linux: CI_DRM_15720 -> CI_DRM_15725

  CI-20190529: 20190529
  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12153: f93e94ca39aabc9a0f6e3112f2f212e9ebfcb22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html

--===============4260957937427037539==
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
<tr><td><b>Series:</b></td><td>lib/intel_device_info: Use per-thread device info cache</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141627/">https://patchwork.freedesktop.org/series/141627/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8118 -&gt; IGTPW_12153</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12153 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12153, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12153:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12153 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903">i915#12903</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-twl-2/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903">i915#12903</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-dg2-11/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903">i915#12903</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-adls-6/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829">i915#12829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12900">i915#12900</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918">i915#12918</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12902">i915#12902</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8118 -&gt; IGTPW_12153</li>
<li>Linux: CI_DRM_15720 -&gt; CI_DRM_15725</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12153: f93e94ca39aabc9a0f6e3112f2f212e9ebfcb22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4260957937427037539==--

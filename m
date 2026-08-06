Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E61C55174
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 03:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651CA10E167;
	Thu,  6 Aug 2026 03:16:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259310E167;
 Thu,  6 Aug 2026 03:15:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8084692197456232474=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/intel=5Fhwmon?=
 =?utf-8?q?=3A_Warn_on_zero-valued_numeric_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Aug 2026 03:15:23 -0000
Message-ID: <178598612365.23279.6741757669561469413@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805135842.34736-1-karthik.poosa@intel.com>
In-Reply-To: <20260805135842.34736-1-karthik.poosa@intel.com>
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

--===============8084692197456232474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/intel_hwmon: Warn on zero-valued numeric attributes
URL   : https://patchwork.freedesktop.org/series/171660/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9038 -> IGTPW_15636
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15636 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15636, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15636:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_hwmon@hwmon-read:
    - bat-atsm-1:         [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-atsm-1/igt@intel_hwmon@hwmon-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-atsm-1/igt@intel_hwmon@hwmon-read.html
    - bat-dg2-8:          [PASS][3] -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg2-8/igt@intel_hwmon@hwmon-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg2-8/igt@intel_hwmon@hwmon-read.html
    - bat-dg1-7:          [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg1-7/igt@intel_hwmon@hwmon-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg1-7/igt@intel_hwmon@hwmon-read.html
    - bat-dg2-9:          [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg2-9/igt@intel_hwmon@hwmon-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg2-9/igt@intel_hwmon@hwmon-read.html
    - bat-dg1-6:          [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg1-6/igt@intel_hwmon@hwmon-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg1-6/igt@intel_hwmon@hwmon-read.html
    - bat-dg2-14:         [PASS][11] -> [WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg2-14/igt@intel_hwmon@hwmon-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg2-14/igt@intel_hwmon@hwmon-read.html

  
Known issues
------------

  Here are the changes found in IGTPW_15636 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][13] ([i915#15673]) -> [PASS][14] +78 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-adlp-9:         [DMESG-WARN][15] ([i915#16404]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-9/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-adlp-9/igt@i915_selftest@live.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [SKIP][17] ([i915#13030]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16404]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16404


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9038 -> IGTPW_15636
  * Linux: CI_DRM_18945 -> CI_DRM_18949

  CI-20190529: 20190529
  CI_DRM_18945: 814bd7de7f09446c4b9401eecb8b30c3285af78b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18949: b50d67c8afa30f742e87999b53f80d22f8be4ffc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15636: 15636
  IGT_9038: 9038

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/index.html

--===============8084692197456232474==
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
<tr><td><b>Series:</b></td><td>tests/intel/intel_hwmon: Warn on zero-valued numeric attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171660/">https://patchwork.freedesktop.org/series/171660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9038 -&gt; IGTPW_15636</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15636 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15636, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15636:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_hwmon@hwmon-read:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-atsm-1/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-atsm-1/igt@intel_hwmon@hwmon-read.html">WARN</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg2-8/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg2-8/igt@intel_hwmon@hwmon-read.html">WARN</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg1-7/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg1-7/igt@intel_hwmon@hwmon-read.html">WARN</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg2-9/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg2-9/igt@intel_hwmon@hwmon-read.html">WARN</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg1-6/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg1-6/igt@intel_hwmon@hwmon-read.html">WARN</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-dg2-14/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-dg2-14/igt@intel_hwmon@hwmon-read.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15636 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-9/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16404">i915#16404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15636/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9038 -&gt; IGTPW_15636</li>
<li>Linux: CI_DRM_18945 -&gt; CI_DRM_18949</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18945: 814bd7de7f09446c4b9401eecb8b30c3285af78b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18949: b50d67c8afa30f742e87999b53f80d22f8be4ffc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15636: 15636<br />
  IGT_9038: 9038</p>

</body>
</html>

--===============8084692197456232474==--

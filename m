Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCFCCA1012
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 22:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44610E958;
	Wed,  3 Sep 2025 22:51:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1210E958;
 Wed,  3 Sep 2025 22:51:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6804734269056843965=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Ffrontbu?=
 =?utf-8?q?ffer=5Ftracking=3A_Remove_FBC_modulo_4_restriction_for_ADL-P+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Sep 2025 22:51:15 -0000
Message-ID: <175693987506.300637.7698696898484072810@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903075924.282801-1-uma.shankar@intel.com>
In-Reply-To: <20250903075924.282801-1-uma.shankar@intel.com>
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

--===============6804734269056843965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4 restriction for ADL-P+
URL   : https://patchwork.freedesktop.org/series/153924/
State : success

== Summary ==

CI Bug Log - changes from IGT_8521 -> IGTPW_13683
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13683 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-jsl-1:          [DMESG-FAIL][1] ([i915#13774]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8521/bat-jsl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8521/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13774]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13774


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8521 -> IGTPW_13683
  * Linux: CI_DRM_17123 -> CI_DRM_17124

  CI-20190529: 20190529
  CI_DRM_17123: 09933716bb37eda75f5b3562a76e58a17c447647 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17124: 2b95afd5f659a01a6fc8195358e62077846b97e7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13683: 7810a440dcf37f7ffa255652505defe3db80ce58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8521: 8521

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html

--===============6804734269056843965==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4 restriction for ADL-P+</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153924/">https://patchwork.freedesktop.org/series/153924/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8521 -&gt; IGTPW_13683</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13683 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8521/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13774">i915#13774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8521/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8521 -&gt; IGTPW_13683</li>
<li>Linux: CI_DRM_17123 -&gt; CI_DRM_17124</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17123: 09933716bb37eda75f5b3562a76e58a17c447647 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17124: 2b95afd5f659a01a6fc8195358e62077846b97e7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13683: 7810a440dcf37f7ffa255652505defe3db80ce58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8521: 8521</p>

</body>
</html>

--===============6804734269056843965==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562E4C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 17:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B5110E168;
	Tue, 22 Apr 2025 17:56:50 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0807A10E168;
 Tue, 22 Apr 2025 17:56:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2773167970357810879=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/i915/pm=5Frc6=5Fres?=
 =?utf-8?q?idency=3A_Use_sysfs_to_achieve_peak_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 22 Apr 2025 17:56:49 -0000
Message-ID: <174534460902.26819.16627439889980108411@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422063135.2502377-1-sk.anirban@intel.com>
In-Reply-To: <20250422063135.2502377-1-sk.anirban@intel.com>
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

--===============2773167970357810879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
URL   : https://patchwork.freedesktop.org/series/148054/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8330 -> IGTPW_13017
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13017 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13017, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13017:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - fi-bsw-n3050:       NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - fi-bsw-nick:        NOTRUN -> [ABORT][2] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - bat-apl-1:          NOTRUN -> [ABORT][3] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-apl-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_selftest@live@slpc:
    - bat-twl-1:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8330/bat-twl-1/igt@i915_selftest@live@slpc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-twl-1/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_13017 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - bat-rpls-4:         NOTRUN -> [DMESG-WARN][6] ([i915#13400]) +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-rpls-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - fi-ilk-650:         NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - fi-elk-e7500:       NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_selftest@live:
    - bat-twl-1:          [PASS][11] -> [ABORT][12] ([i915#14077])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8330/bat-twl-1/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-twl-1/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8330/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#14077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14077


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8330 -> IGTPW_13017
  * Linux: CI_DRM_16446 -> CI_DRM_16447

  CI-20190529: 20190529
  CI_DRM_16446: ea9f9455f18d0eb18b81cf146b527d577cb6192d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16447: 97cf1c266145ae8b2bb3f78168d795930a3f5191 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13017: 9cdc93196255097fd9e4f4b01488fa1ee8cba58e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8330: 3ce68222e02fcfb1e12827e49e774bc58f69c9ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/index.html

--===============2773167970357810879==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8330 -&gt; IGTPW_13017</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13017 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13017, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13017:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-bsw-n3050/igt@i915_pm_rc6_residency@rc6-idle.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">ABORT</a> +1 other test abort</li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-apl-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8330/bat-twl-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-twl-1/igt@i915_selftest@live@slpc.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13017 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-rpls-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> +2 other tests skip</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> +1 other test skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8330/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-twl-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14077">i915#14077</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8330/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13017/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8330 -&gt; IGTPW_13017</li>
<li>Linux: CI_DRM_16446 -&gt; CI_DRM_16447</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16446: ea9f9455f18d0eb18b81cf146b527d577cb6192d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16447: 97cf1c266145ae8b2bb3f78168d795930a3f5191 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13017: 9cdc93196255097fd9e4f4b01488fa1ee8cba58e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8330: 3ce68222e02fcfb1e12827e49e774bc58f69c9ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2773167970357810879==--

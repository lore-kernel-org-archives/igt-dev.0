Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4A2D6B6AE
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 16:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32F10E3E4;
	Wed, 30 Oct 2024 16:38:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C1610E3E4;
 Wed, 30 Oct 2024 16:38:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0142889314182698243=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/syncobj=5Fwait=3A_Upd?=
 =?utf-8?q?ate_invalid-wait-zero-handles_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Oct 2024 16:38:51 -0000
Message-ID: <173030633135.1363982.5356222144096095050@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030144821.35043-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20241030144821.35043-2-krzysztof.niemiec@intel.com>
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

--===============0142889314182698243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/syncobj_wait: Update invalid-wait-zero-handles test
URL   : https://patchwork.freedesktop.org/series/140727/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8088 -> IGTPW_12003
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12003 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12003, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/index.html

Participating hosts (47 -> 44)
------------------------------

  Missing    (3): bat-arls-2 bat-arls-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12003:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-atsm-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-atsm-1/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_12003 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][3] -> [ABORT][4] ([i915#12133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-2/igt@i915_selftest@live.html
    - bat-dg2-9:          [PASS][5] -> [ABORT][6] ([i915#12133])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-9/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-dg2-9/igt@i915_selftest@live.html

  * igt@i915_selftest@live@active:
    - bat-dg2-9:          [PASS][7] -> [ABORT][8] ([i915#12133] / [i915#12305])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-9/igt@i915_selftest@live@active.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-dg2-9/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][9] -> [ABORT][10] ([i915#12061])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [ABORT][11] ([i915#12133]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-3/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-3/igt@i915_selftest@live.html
    - bat-mtlp-6:         [ABORT][13] ([i915#12133] / [i915#12216]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-mtlp-6/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-mtlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][15] ([i915#12061]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [ABORT][17] ([i915#12216]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [DMESG-WARN][19] ([i915#12253]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12305]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12305


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8088 -> IGTPW_12003
  * Linux: CI_DRM_15607 -> CI_DRM_15612

  CI-20190529: 20190529
  CI_DRM_15607: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15612: fb992a15d9b3dc0ed1395b1a30a27f50fb8dba63 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12003: bb57eadc84bbeca0117c13ad08b2d511207b2eb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/index.html

--===============0142889314182698243==
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
<tr><td><b>Series:</b></td><td>tests/syncobj_wait: Update invalid-wait-zero-handles test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140727/">https://patchwork.freedesktop.org/series/140727/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8088 -&gt; IGTPW_12003</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12003 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12003, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/index.html</p>
<h2>Participating hosts (47 -&gt; 44)</h2>
<p>Missing    (3): bat-arls-2 bat-arls-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12003:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-atsm-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-atsm-1/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12003 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-dg2-9/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-9/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-dg2-9/igt@i915_selftest@live@active.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12305">i915#12305</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-mtlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-3/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12003/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8088 -&gt; IGTPW_12003</li>
<li>Linux: CI_DRM_15607 -&gt; CI_DRM_15612</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15607: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15612: fb992a15d9b3dc0ed1395b1a30a27f50fb8dba63 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12003: bb57eadc84bbeca0117c13ad08b2d511207b2eb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0142889314182698243==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F4FE68960
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 09:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5133810E426;
	Thu, 31 Oct 2024 09:26:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C510E426;
 Thu, 31 Oct 2024 09:26:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6651192806974230546=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/xe=5Fexec=5Fcomput=5F?=
 =?utf-8?q?mode=3A_Use_valid_exec_queue_for_bind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 31 Oct 2024 09:26:57 -0000
Message-ID: <173036681772.1365305.11372994320704010202@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
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

--===============6651192806974230546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_comput_mode: Use valid exec queue for bind
URL   : https://patchwork.freedesktop.org/series/140752/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8090 -> IGTPW_12012
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12012 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12012, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html

Participating hosts (46 -> 46)
------------------------------

  Additional (1): bat-dg2-13 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12012:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - fi-cfl-8109u:       [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12012 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-6:         [PASS][5] -> [ABORT][6] ([i915#12133] / [i915#12216])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/bat-mtlp-6/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-mtlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][7] -> [ABORT][8] ([i915#12216])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         NOTRUN -> [DMESG-WARN][9] ([i915#12253])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - bat-dg2-13:         NOTRUN -> [SKIP][10] ([Intel XE#484] / [i915#4550]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [ABORT][11] ([i915#12061] / [i915#12133]) -> [ABORT][12] ([i915#12133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/bat-arlh-3/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-arlh-3/igt@i915_selftest@live.html

  
  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8090 -> IGTPW_12012
  * Linux: CI_DRM_15615 -> CI_DRM_15616

  CI-20190529: 20190529
  CI_DRM_15615: c245557007af0a1c23da00c47732ae1dadda7dd3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15616: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12012: 12012
  IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html

--===============6651192806974230546==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_comput_mode: Use valid exec queue for bind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140752/">https://patchwork.freedesktop.org/series/140752/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8090 -&gt; IGTPW_12012</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12012 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12012, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html</p>
<h2>Participating hosts (46 -&gt; 46)</h2>
<p>Additional (1): bat-dg2-13 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12012:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12012 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-mtlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550">i915#4550</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8090/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8090 -&gt; IGTPW_12012</li>
<li>Linux: CI_DRM_15615 -&gt; CI_DRM_15616</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15615: c245557007af0a1c23da00c47732ae1dadda7dd3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15616: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12012: 12012<br />
  IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6651192806974230546==--

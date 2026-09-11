Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6F4C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 12:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FABB10F584;
	Fri, 11 Sep 2026 12:06:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABD410F584;
 Fri, 11 Sep 2026 12:05:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3707624555798933354=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Feld=3A_Fix_88?=
 =?utf-8?q?=2E2kHz/176=2E4kHz_sample_rate_parsing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2026 12:05:20 -0000
Message-ID: <178912832049.151128.16378540443973911945@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
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

--===============3707624555798933354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing (rev2)
URL   : https://patchwork.freedesktop.org/series/173146/
State : success

== Summary ==

CI Bug Log - changes from IGT_9092 -> IGTPW_15832
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-dg2-13 bat-dg2-9 bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_15832 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@ring_submission:
    - fi-cfl-8109u:       [PASS][2] -> [DMESG-WARN][3] ([i915#13735]) +80 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9092/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][5] -> [DMESG-WARN][6] ([i915#13735] / [i915#15673]) +49 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9092/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7] ([i915#12343] / [i915#9812])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][8] ([i915#9732]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] ([i915#3555])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:
    - fi-tgl-1115g4:      [ABORT][10] ([i915#16837] / [i915#16866] / [i915#16876]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9092/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html

  
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
  [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9092 -> IGTPW_15832
  * Linux: CI_DRM_19126 -> CI_DRM_19127

  CI-20190529: 20190529
  CI_DRM_19126: 774012d1006e6642542095389ca1a0cabd21ac40 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19127: 4feddc7851e5864772806fe62781a1937b78494c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15832: 15832
  IGT_9092: 9092

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/index.html

--===============3707624555798933354==
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
<tr><td><b>Series:</b></td><td>lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173146/">https://patchwork.freedesktop.org/series/173146/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9092 -&gt; IGTPW_15832</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-dg2-13 bat-dg2-9 bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15832 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9092/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +80 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9092/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9092/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15832/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9092 -&gt; IGTPW_15832</li>
<li>Linux: CI_DRM_19126 -&gt; CI_DRM_19127</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19126: 774012d1006e6642542095389ca1a0cabd21ac40 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19127: 4feddc7851e5864772806fe62781a1937b78494c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15832: 15832<br />
  IGT_9092: 9092</p>

</body>
</html>

--===============3707624555798933354==--

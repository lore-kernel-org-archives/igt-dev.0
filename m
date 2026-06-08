Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFD0CD8CA4
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D500A10ECEC;
	Mon,  8 Jun 2026 05:16:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CC410ECEC;
 Mon,  8 Jun 2026 05:16:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6267742987411932362=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Rela?=
 =?utf-8?q?x_CRC_frame_sequence_validation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 08 Jun 2026 05:16:09 -0000
Message-ID: <178089576919.52316.325817518951892553@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
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

--===============6267742987411932362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Relax CRC frame sequence validation
URL   : https://patchwork.freedesktop.org/series/168037/
State : success

== Summary ==

CI Bug Log - changes from IGT_8952 -> IGTPW_15316
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-rplp-1 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15316 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-rplp-1:         NOTRUN -> [SKIP][1] ([i915#15931])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-rplp-1:         NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-rplp-1:         NOTRUN -> [SKIP][3] ([i915#15656])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-rplp-1:         NOTRUN -> [SKIP][4] ([i915#6621])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@i915_pm_rps@basic-api.html

  * igt@intel_hwmon@hwmon-read:
    - bat-rplp-1:         NOTRUN -> [SKIP][5] ([i915#7707]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-rplp-1:         NOTRUN -> [SKIP][6] ([i915#4103]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-rplp-1:         NOTRUN -> [SKIP][7] ([i915#16361])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-rplp-1:         NOTRUN -> [SKIP][8] ([i915#4093]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-rplp-1:         NOTRUN -> [SKIP][9] ([i915#4369])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-rplp-1:         NOTRUN -> [SKIP][10] ([i915#1072] / [i915#9732]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         NOTRUN -> [SKIP][11] ([i915#3555])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - bat-rplp-1:         NOTRUN -> [SKIP][12] ([i915#3708]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@prime_vgem@basic-read.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4369]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8952 -> IGTPW_15316

  CI-20190529: 20190529
  CI_DRM_18641: 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15316: 15316
  IGT_8952: 475b1c61f2f23f573e17e4f8d10c46d635ad4346 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/index.html

--===============6267742987411932362==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Relax CRC frame sequence validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168037/">https://patchwork.freedesktop.org/series/168037/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8952 -&gt; IGTPW_15316</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-rplp-1 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15316 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4093">i915#4093</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369">i915#4369</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15316/bat-rplp-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8952 -&gt; IGTPW_15316</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18641: 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15316: 15316<br />
  IGT_8952: 475b1c61f2f23f573e17e4f8d10c46d635ad4346 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6267742987411932362==--

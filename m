Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E08EEE273
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501DC10E08B;
	Fri, 13 Sep 2024 00:44:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1568610E08B;
 Fri, 13 Sep 2024 00:44:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2547905703767878703=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amd=5Fqueue=5Freset?=
 =?utf-8?q?=3A_add_expected_error_codes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Sep 2024 00:44:42 -0000
Message-ID: <172618828206.994367.3547558984075939283@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912234908.450480-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240912234908.450480-1-vitaly.prosyak@amd.com>
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

--===============2547905703767878703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_queue_reset: add expected error codes
URL   : https://patchwork.freedesktop.org/series/138615/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15408 -> IGTPW_11737
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/index.html

Participating hosts (39 -> 36)
------------------------------

  Additional (3): fi-cfl-8109u fi-elk-e7500 fi-bsw-n3050 
  Missing    (6): bat-kbl-2 fi-snb-2520m fi-glk-j4005 bat-dg2-11 bat-jsl-1 bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11737 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2] ([i915#12102])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@fbdev@eof.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][4] +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live:
    - bat-arls-2:         [PASS][6] -> [DMESG-WARN][7] ([i915#10341] / [i915#12133])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-2/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][8] -> [DMESG-WARN][9] ([i915#11349])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [PASS][10] -> [INCOMPLETE][11] ([i915#11320])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][12] +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-elk-e7500:       NOTRUN -> [SKIP][13] +25 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - bat-arls-1:         [DMESG-WARN][14] ([i915#12102]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@fbdev@read.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@fbdev@read.html

  * igt@i915_selftest@live:
    - bat-arls-1:         [DMESG-WARN][16] ([i915#10341] / [i915#12133]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@i915_selftest@live.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [DMESG-WARN][18] ([i915#11349]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [DMESG-WARN][20] ([i915#180]) -> [DMESG-WARN][21] ([i915#180] / [i915#1982])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - bat-arls-5:         [DMESG-WARN][22] ([i915#11637]) -> [DMESG-WARN][23] ([i915#11637] / [i915#1982])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-5/igt@i915_module_load@reload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-5/igt@i915_module_load@reload.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8015 -> IGTPW_11737

  CI-20190529: 20190529
  CI_DRM_15408: e55e4cc47de4150012eec3e54b6d710967d66510 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11737: 11737
  IGT_8015: 8015

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/index.html

--===============2547905703767878703==
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
<tr><td><b>Series:</b></td><td>tests/amd_queue_reset: add expected error codes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138615/">https://patchwork.freedesktop.org/series/138615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15408 -&gt; IGTPW_11737</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Additional (3): fi-cfl-8109u fi-elk-e7500 fi-bsw-n3050 <br />
  Missing    (6): bat-kbl-2 fi-snb-2520m fi-glk-j4005 bat-dg2-11 bat-jsl-1 bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11737 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@fbdev@eof.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-2/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11737/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8015 -&gt; IGTPW_11737</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15408: e55e4cc47de4150012eec3e54b6d710967d66510 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11737: 11737<br />
  IGT_8015: 8015</p>

</body>
</html>

--===============2547905703767878703==--

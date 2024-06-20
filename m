Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDBC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 16:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28EF10EB30;
	Thu, 20 Jun 2024 16:30:04 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2CF10EB30;
 Thu, 20 Jun 2024 16:30:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5044919996254620674=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_runner/settings=3A_set_PRUN?=
 =?utf-8?q?E=5FKEEP=5FALL_as_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 16:30:03 -0000
Message-ID: <171890100301.127624.15484940682200029574@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
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

--===============5044919996254620674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/settings: set PRUNE_KEEP_ALL as default
URL   : https://patchwork.freedesktop.org/series/135116/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14979 -> IGTPW_11288
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-snb-2520m fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_11288 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - bat-dg2-9:          NOTRUN -> [FAIL][1] ([i915#10378])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-dg2-9/igt@gem_lmem_swapping@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-blb-e6850:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-blb-e6850/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-ilk-650:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-arlh-1:         NOTRUN -> [SKIP][8] ([i915#11346])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-arlh-1/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][9] ([i915#4077] / [i915#9688])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
    - bat-arls-2:         NOTRUN -> [SKIP][10] ([i915#11346] / [i915#4077] / [i915#9688])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [DMESG-WARN][11] ([i915#11009]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][13] ([i915#9500]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-plain-flip@c-dp6:
    - {bat-mtlp-9}:       [FAIL][15] ([i915#6121]) -> [PASS][16] +3 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [DMESG-WARN][17] ([i915#7507]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6:
    - {bat-mtlp-9}:       [FAIL][19] ([i915#10979]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - {bat-mtlp-9}:       [SKIP][21] ([i915#10580]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6:
    - {bat-mtlp-9}:       [DMESG-FAIL][23] ([i915#11009]) -> [PASS][24] +2 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7894 -> IGTPW_11288

  CI-20190529: 20190529
  CI_DRM_14979: 29f1cbee5f8da5427bb17ce634426571def7d128 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11288: 7d67646204ed81927eade8a1ac9663b8a402ded9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7894: 7894

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/index.html

--===============5044919996254620674==
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
<tr><td><b>Series:</b></td><td>runner/settings: set PRUNE_KEEP_ALL as default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135116/">https://patchwork.freedesktop.org/series/135116/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14979 -&gt; IGTPW_11288</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-snb-2520m fi-kbl-8809g </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11288 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-dg2-9/igt@gem_lmem_swapping@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-blb-e6850/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-arlh-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-arlh-1/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979">i915#10979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580">i915#10580</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14979/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11288/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7894 -&gt; IGTPW_11288</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14979: 29f1cbee5f8da5427bb17ce634426571def7d128 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11288: 7d67646204ed81927eade8a1ac9663b8a402ded9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7894: 7894</p>

</body>
</html>

--===============5044919996254620674==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DEFC54E58
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 01:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B8B10E438;
	Tue, 19 Mar 2024 01:56:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3406810E20D;
 Tue, 19 Mar 2024 01:56:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5176080596854166428=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Filr=3A_F?=
 =?utf-8?q?ix_eDP_PSR_not_be_re-enabled_after_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Mar 2024 01:56:40 -0000
Message-ID: <171081340020.900715.4214996143586283532@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319011743.816756-1-hersenxs.wu@amd.com>
In-Reply-To: <20240319011743.816756-1-hersenxs.wu@amd.com>
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

--===============5176080596854166428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled after test
URL   : https://patchwork.freedesktop.org/series/131298/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14444 -> IGTPW_10859
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html

Participating hosts (34 -> 32)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (3): bat-dg1-7 bat-kbl-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10859 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][1] ([i915#10462])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@info:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [PASS][6] -> [ABORT][7] ([i915#10366])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14444/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@bad-pitch-65536:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][8] ([i915#10457]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_addfb_basic@bad-pitch-65536.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][9] ([i915#10455])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-FAIL][10] ([i915#10454])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][11] ([i915#10454]) +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][12] +17 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][13] ([IGT#3])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][14] +58 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - bat-atsm-1:         [ABORT][15] ([i915#10366]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14444/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10454]: https://gitlab.freedesktop.org/drm/intel/issues/10454
  [i915#10455]: https://gitlab.freedesktop.org/drm/intel/issues/10455
  [i915#10457]: https://gitlab.freedesktop.org/drm/intel/issues/10457
  [i915#10462]: https://gitlab.freedesktop.org/drm/intel/issues/10462
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7769 -> IGTPW_10859

  CI-20190529: 20190529
  CI_DRM_14444: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10859: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html
  IGT_7769: 7769

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html

--===============5176080596854166428==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled after test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131298/">https://patchwork.freedesktop.org/series/131298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14444 -&gt; IGTPW_10859</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html</p>
<h2>Participating hosts (34 -&gt; 32)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (3): bat-dg1-7 bat-kbl-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10859 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10462">i915#10462</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14444/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-65536:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_addfb_basic@bad-pitch-65536.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10457">i915#10457</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10455">i915#10455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10454">i915#10454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10454">i915#10454</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +17 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">SKIP</a> +58 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gem_contexts:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14444/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7769 -&gt; IGTPW_10859</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14444: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10859: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10859/index.html<br />
  IGT_7769: 7769</p>

</body>
</html>

--===============5176080596854166428==--

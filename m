Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A6AC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 10:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189A110E8B5;
	Thu, 20 Jun 2024 10:48:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D15510E8B5;
 Thu, 20 Jun 2024 10:48:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4663214997140396352=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/kms=5Fvrr=3A_Skip_low_RR_mode_check_for_seamles?=
 =?utf-8?q?s-virtual_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 10:48:49 -0000
Message-ID: <171888052963.127624.10672385228579604615@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620082834.4169435-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240620082834.4169435-1-bhanuprakash.modem@intel.com>
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

--===============4663214997140396352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest
URL   : https://patchwork.freedesktop.org/series/135102/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14977 -> IGTPW_11285
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11285 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11285, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11285:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@requests:
    - bat-arls-5:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-arls-5/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-arls-5/igt@i915_selftest@live@requests.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-dpms@a-dp6:
    - {bat-mtlp-9}:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html

  
Known issues
------------

  Here are the changes found in IGTPW_11285 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][7] +30 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-mtlp-9}:       [DMESG-WARN][8] ([i915#11009]) -> [PASS][9] +2 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rpm@module-reload:
    - bat-arlh-2:         [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-arlh-2/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-arlh-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [INCOMPLETE][12] ([i915#10886] / [i915#9413]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - {bat-mtlp-9}:       [SKIP][14] ([i915#10580]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp7:
    - {bat-mtlp-9}:       [FAIL][16] ([i915#6121]) -> [PASS][17] +4 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [DMESG-WARN][18] ([i915#7507]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-6:
    - {bat-mtlp-9}:       [DMESG-FAIL][20] ([i915#11009]) -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-6.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-6.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6:
    - {bat-mtlp-9}:       [FAIL][22] ([i915#10979]) -> [PASS][23] +1 other test pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#10886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11060
  [i915#11375]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11375
  [i915#11394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11394
  [i915#11395]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11395
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7893 -> IGTPW_11285

  CI-20190529: 20190529
  CI_DRM_14977: 65ef303b3a8a20609f394e0a823ade01cb4f1357 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11285: c3c6fe0bab128193a7ec2225d6e8e4aee51a4d04 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/index.html

--===============4663214997140396352==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135102/">https://patchwork.freedesktop.org/series/135102/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14977 -&gt; IGTPW_11285</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11285 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11285, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11285:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-arls-5/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-arls-5/igt@i915_selftest@live@requests.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-dp6:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11285 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@core_hotunplug@unbind-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-arlh-2/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-arlh-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886">i915#10886</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580">i915#10580</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14977/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979">i915#10979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11285/bat-mtlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7893 -&gt; IGTPW_11285</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14977: 65ef303b3a8a20609f394e0a823ade01cb4f1357 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11285: c3c6fe0bab128193a7ec2225d6e8e4aee51a4d04 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4663214997140396352==--

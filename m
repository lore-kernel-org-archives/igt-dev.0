Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3841332316887201032=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Fri, 16 Jun 2023 00:49:32 -0000
Message-ID: <168687657284.9827.138759444124023553@emeril.freedesktop.org>
References: <20230615223936.86834-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230615223936.86834-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_tests/amdgpu=3A_add_bo_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3841332316887201032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/amdgpu: add bo tests
URL   : https://patchwork.freedesktop.org/series/119417/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13276 -> IGTPW_9191
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9191 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9191, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html

Participating hosts (38 -> 41)
------------------------------

  Additional (4): fi-blb-e6850 bat-dg1-8 fi-bsw-nick fi-bsw-n3050 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9191:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-8:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-dg2-8/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg2-8/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - {bat-dg1-8}:        NOTRUN -> [SKIP][3] +73 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg1-8/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - {bat-dg1-8}:        NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg1-8/igt@xe_guc_pc@freq_fixed_idle.html

  * {igt@xe_live_ktest@bo}:
    - {bat-dg1-8}:        NOTRUN -> [DMESG-WARN][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg1-8/igt@xe_live_ktest@bo.html

  
Known issues
------------

  Here are the changes found in IGTPW_9191 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][6] ([fdo#109271]) +51 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][7] ([i915#7077])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       NOTRUN -> [SKIP][8] ([fdo#109271]) +37 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][9] -> [DMESG-FAIL][10] ([i915#5334])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][11] -> [DMESG-FAIL][12] ([i915#7059])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [PASS][13] -> [DMESG-FAIL][14] ([i915#8497])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         [PASS][15] -> [DMESG-WARN][16] ([i915#6367])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][17] ([fdo#109271]) +25 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4579]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-blb-e6850:       NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4579])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [DMESG-FAIL][21] ([i915#4258] / [i915#7913]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-8:         [DMESG-WARN][23] ([i915#6367]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-mtlp-8/igt@i915_selftest@live@slpc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [ABORT][25] ([i915#4579] / [i915#8260]) -> [SKIP][26] ([i915#3555] / [i915#4579])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7332 -> IGTPW_9191

  CI-20190529: 20190529
  CI_DRM_13276: afe49e3c604f9690c9d499185149f83bd259601c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9191: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html
  IGT_7332: 2a25a6109e8af4b0a69a717cc8710dcafed4bb4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html

--===============3841332316887201032==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/amdgpu: add bo tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119417/">https://patchwork.freedesktop.org/series/119417/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13276 -&gt; IGTPW_9191</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9191 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9191, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html</p>
<h2>Participating hosts (38 -&gt; 41)</h2>
<p>Additional (4): fi-blb-e6850 bat-dg1-8 fi-bsw-nick fi-bsw-n3050 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9191:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-dg2-8/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg2-8/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg1-8/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg1-8/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@bo}:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-dg1-8/igt@xe_live_ktest@bo.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9191 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-mtlp-8/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13276/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7332 -&gt; IGTPW_9191</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13276: afe49e3c604f9690c9d499185149f83bd259601c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9191: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9191/index.html<br />
  IGT_7332: 2a25a6109e8af4b0a69a717cc8710dcafed4bb4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3841332316887201032==--

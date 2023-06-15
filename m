Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7546628191489387454=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Thu, 15 Jun 2023 13:11:06 -0000
Message-ID: <168683466644.10725.2884988817916544651@emeril.freedesktop.org>
References: <20230615105954.3751-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230615105954.3751-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50ZWdy?=
 =?utf-8?q?ate_igt=5Fspin=5Fnew_with_Xe_=28rev6=29?=
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

--===============7546628191489387454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Integrate igt_spin_new with Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/118837/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7331 -> IGTPW_9179
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9179 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9179, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (1): bat-dg1-8 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9179:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-rte:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html

  * {igt@xe_live_ktest@.*} (NEW):
    - {bat-dg1-8}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg1-8/igt@xe_live_ktest@.*.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - {bat-dg1-8}:        NOTRUN -> [SKIP][4] +73 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg1-8/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - {bat-dg1-8}:        NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg1-8/igt@xe_guc_pc@freq_fixed_idle.html

  
New tests
---------

  New tests have been introduced between IGT_7331 and IGTPW_9179:

### New IGT tests (1) ###

  * igt@xe_live_ktest@.*:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9179 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_backlight@basic-brightness@edp-1:
    - bat-rplp-1:         NOTRUN -> [ABORT][6] ([i915#7077])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [PASS][7] -> [DMESG-FAIL][8] ([i915#4258] / [i915#7913])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         NOTRUN -> [ABORT][9] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][10] ([i915#6367])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][11] ([i915#6687] / [i915#7978])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][12] -> [FAIL][13] ([i915#7932])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - fi-bsw-nick:        NOTRUN -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@userptr:
    - bat-mtlp-6:         [FAIL][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [INCOMPLETE][17] ([i915#7156] / [i915#7913]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
    - fi-bsw-nick:        [ABORT][19] ([i915#7911] / [i915#7913]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [DMESG-WARN][21] ([i915#7699]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [ABORT][23] ([i915#4983] / [i915#7913]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rpls-2/igt@i915_selftest@live@requests.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-2/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][25] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rpls-1/igt@i915_selftest@live@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-1/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [DMESG-WARN][27] ([i915#4423]) -> [ABORT][28] ([i915#4423])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-adlp-11/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-adlp-11/igt@i915_module_load@load.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [ABORT][29] ([i915#4579] / [i915#8260]) -> [SKIP][30] ([i915#3555] / [i915#4579])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7156]: https://gitlab.freedesktop.org/drm/intel/issues/7156
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7331 -> IGTPW_9179

  CI-20190529: 20190529
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9179: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html
  IGT_7331: 4604cc18a2e7af126996d3b56ad0168e7258e8e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_spin_batch@spin-all
+igt@xe_spin_batch@spin-basic
+igt@xe_spin_batch@spin-basic-all
+igt@xe_spin_batch@spin-batch

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html

--===============7546628191489387454==
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
<tr><td><b>Series:</b></td><td>Integrate igt_spin_new with Xe (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118837/">https://patchwork.freedesktop.org/series/118837/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7331 -&gt; IGTPW_9179</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9179 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9179, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): bat-dg1-8 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9179:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@.*} (NEW):</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg1-8/igt@xe_live_ktest@.*.html">SKIP</a></li>
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
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg1-8/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>{bat-dg1-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg1-8/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7331 and IGTPW_9179:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@.*:<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9179 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7156">i915#7156</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7331/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7331 -&gt; IGTPW_9179</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9179: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9179/index.html<br />
  IGT_7331: 4604cc18a2e7af126996d3b56ad0168e7258e8e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_spin_batch@spin-all<br />
+igt@xe_spin_batch@spin-basic<br />
+igt@xe_spin_batch@spin-basic-all<br />
+igt@xe_spin_batch@spin-batch</p>

</body>
</html>

--===============7546628191489387454==--

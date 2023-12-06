Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4308303605195873746=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 06 Dec 2023 00:04:25 -0000
Message-ID: <170182106510.26424.11093725381265176581@emeril.freedesktop.org>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
In-Reply-To: <20231205224926.2188996-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgeGVfbGl2?=
 =?utf-8?q?e=5Fktest=3A_Use_xe=5Flive=5Ftest_kernel_module?=
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

--===============4308303605195873746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_live_ktest: Use xe_live_test kernel module
URL   : https://patchwork.freedesktop.org/series/127396/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13983 -> IGTPW_10347
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10347 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10347, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html

Participating hosts (35 -> 21)
------------------------------

  Missing    (14): fi-rkl-11600 bat-dg2-14 bat-adls-5 fi-bsw-n3050 bat-dg2-9 fi-cfl-8700k fi-snb-2520m fi-cfl-guc fi-kbl-guc bat-atsm-1 bat-jsl-3 bat-rplp-1 fi-bsw-nick bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10347:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
Known issues
------------

  Here are the changes found in IGTPW_10347 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@b-dp5:
    - bat-adlp-11:        [PASS][2] -> [DMESG-FAIL][3] ([i915#6868])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13983/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@b-dp5.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@b-dp5.html

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - bat-adlp-11:        [PASS][4] -> [FAIL][5] ([i915#6121]) +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13983/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp5:
    - bat-adlp-11:        [PASS][6] -> [DMESG-WARN][7] ([i915#6868])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13983/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html

  
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7622 -> IGTPW_10347

  CI-20190529: 20190529
  CI_DRM_13983: a9d99261a978835b02e248fe18af3026416af3e8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10347: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_guc_pc@freq_basic_api
+igt@xe_guc_pc@freq_fixed_idle
+igt@xe_guc_pc@freq_low_max
+igt@xe_guc_pc@freq_range_idle
+igt@xe_guc_pc@freq_reset
+igt@xe_guc_pc@freq_reset_multiple
+igt@xe_guc_pc@freq_suspend
-igt@xe_gt_freq@freq_basic_api
-igt@xe_gt_freq@freq_fixed_idle
-igt@xe_gt_freq@freq_low_max
-igt@xe_gt_freq@freq_range_idle
-igt@xe_gt_freq@freq_reset
-igt@xe_gt_freq@freq_reset_multiple
-igt@xe_gt_freq@freq_suspend
-igt@xe_gt_freq@throttle_basic_api

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html

--===============4308303605195873746==
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
<tr><td><b>Series:</b></td><td>xe_live_ktest: Use xe_live_test kernel module</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127396/">https://patchwork.freedesktop.org/series/127396/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13983 -&gt; IGTPW_10347</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10347 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10347, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html</p>
<h2>Participating hosts (35 -&gt; 21)</h2>
<p>Missing    (14): fi-rkl-11600 bat-dg2-14 bat-adls-5 fi-bsw-n3050 bat-dg2-9 fi-cfl-8700k fi-snb-2520m fi-cfl-guc fi-kbl-guc bat-atsm-1 bat-jsl-3 bat-rplp-1 fi-bsw-nick bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10347:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10347 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13983/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@b-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@b-dp5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13983/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13983/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7622 -&gt; IGTPW_10347</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13983: a9d99261a978835b02e248fe18af3026416af3e8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10347: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10347/index.html<br />
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_guc_pc@freq_basic_api<br />
+igt@xe_guc_pc@freq_fixed_idle<br />
+igt@xe_guc_pc@freq_low_max<br />
+igt@xe_guc_pc@freq_range_idle<br />
+igt@xe_guc_pc@freq_reset<br />
+igt@xe_guc_pc@freq_reset_multiple<br />
+igt@xe_guc_pc@freq_suspend<br />
-igt@xe_gt_freq@freq_basic_api<br />
-igt@xe_gt_freq@freq_fixed_idle<br />
-igt@xe_gt_freq@freq_low_max<br />
-igt@xe_gt_freq@freq_range_idle<br />
-igt@xe_gt_freq@freq_reset<br />
-igt@xe_gt_freq@freq_reset_multiple<br />
-igt@xe_gt_freq@freq_suspend<br />
-igt@xe_gt_freq@throttle_basic_api</p>

</body>
</html>

--===============4308303605195873746==--

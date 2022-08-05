Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0106566208219207228=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 05 Aug 2022 23:08:46 -0000
Message-ID: <165974092651.21186.6074472508078511121@emeril.freedesktop.org>
References: <20220805222155.371840-1-rodrigo.vivi@intel.com>
In-Reply-To: <20220805222155.371840-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Faux=3A_Fix_igt=5Fmem=5Fsleep_doc?=
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

--===============0106566208219207228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_aux: Fix igt_mem_sleep doc
URL   : https://patchwork.freedesktop.org/series/107046/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6615 -> IGTPW_7617
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7617 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7617, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (1): fi-bsw-kefka 
  Missing    (1): bat-dg2-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7617:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-apl-guc/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-apl-guc/igt@i915_selftest@live@gt_pm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-dg2-10}:       NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg2-10/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_7617 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-6:          [PASS][5] -> [FAIL][6] ([i915#4032])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-dg1-6/igt@i915_pm_rps@basic-api.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg1-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][7] -> [INCOMPLETE][8] ([i915#4785])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-glk-j4005/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-bsw-kefka/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][13] ([i915#6298])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][14] ([fdo#109271]) +16 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][15] ([fdo#109271] / [i915#4312] / [i915#5594] / [i915#6246])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][16] ([i915#2867]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_module_load@reload:
    - {bat-dg2-10}:       [DMESG-WARN][18] -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-dg2-10/igt@i915_module_load@reload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg2-10/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][20] ([i915#3303] / [i915#4785]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-5:          [DMESG-FAIL][22] ([i915#4494] / [i915#4957]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][24] ([i915#4528]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-pnv-d510/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5087]: https://gitlab.freedesktop.org/drm/intel/issues/5087
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#5950]: https://gitlab.freedesktop.org/drm/intel/issues/5950
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6615 -> IGTPW_7617

  CI-20190529: 20190529
  CI_DRM_11971: 2bdae66c9988dd0f07633629c0a85383cfc05940 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7617: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html
  IGT_6615: a98a66399db9939b16e1cb3b47055f400834affb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html

--===============0106566208219207228==
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
<tr><td><b>Series:</b></td><td>lib/igt_aux: Fix igt_mem_sleep doc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107046/">https://patchwork.freedesktop.org/series/107046/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6615 -&gt; IGTPW_7617</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7617 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7617, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (1): fi-bsw-kefka <br />
  Missing    (1): bat-dg2-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7617:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-apl-guc/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-apl-guc/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{bat-dg2-10}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg2-10/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7617 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-dg1-6/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg1-6/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4032">i915#4032</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-glk-j4005/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-bsw-kefka/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-dg2-10}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-dg2-10/igt@i915_module_load@reload.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg2-10/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6615/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6615 -&gt; IGTPW_7617</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11971: 2bdae66c9988dd0f07633629c0a85383cfc05940 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7617: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7617/index.html<br />
  IGT_6615: a98a66399db9939b16e1cb3b47055f400834affb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0106566208219207228==--

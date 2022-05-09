Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3863903470772069041=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Mon, 09 May 2022 23:10:11 -0000
Message-ID: <165213781165.22806.5598215028040521880@emeril.freedesktop.org>
References: <20220509222020.27447-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20220509222020.27447-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fcapture_=3A_Add_support_for_local_memory_=28r?=
 =?utf-8?q?ev5=29?=
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

--===============3863903470772069041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_capture : Add support for local memory (rev5)
URL   : https://patchwork.freedesktop.org/series/95707/
State : success

== Summary ==

CI Bug Log - changes from IGT_6469 -> IGTPW_7072
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html

Participating hosts (43 -> 40)
------------------------------

  Additional (1): bat-dg2-9 
  Missing    (4): bat-adlm-1 fi-bsw-cyan bat-dg1-6 bat-adlp-4 

Known issues
------------

  Here are the changes found in IGTPW_7072 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-kbl-soraka/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][3] -> [DMESG-FAIL][4] ([i915#4528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-blb-e6850/igt@i915_selftest@live@requests.html
    - fi-pnv-d510:        [PASS][5] -> [DMESG-FAIL][6] ([i915#4528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][8] ([i915#4391]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ringfill@basic-all:
    - {bat-dg2-8}:        [TIMEOUT][10] ([i915#5647]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/bat-dg2-8/igt@gem_ringfill@basic-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/bat-dg2-8/igt@gem_ringfill@basic-all.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [DMESG-FAIL][12] ([i915#3987]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][14] ([i915#4785]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][16] ([i915#3576]) -> [PASS][17] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5171]: https://gitlab.freedesktop.org/drm/intel/issues/5171
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5181]: https://gitlab.freedesktop.org/drm/intel/issues/5181
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5606]: https://gitlab.freedesktop.org/drm/intel/issues/5606
  [i915#5647]: https://gitlab.freedesktop.org/drm/intel/issues/5647
  [i915#5703]: https://gitlab.freedesktop.org/drm/intel/issues/5703
  [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6469 -> IGTPW_7072

  CI-20190529: 20190529
  CI_DRM_11626: 1672d1c43e4377628b445ab011343fe2496a41ce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7072: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html
  IGT_6469: fe3c194ba90615e2402461348357c88a23864275 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html

--===============3863903470772069041==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_capture : Add support for local memory (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95707/">https://patchwork.freedesktop.org/series/95707/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6469 -&gt; IGTPW_7072</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Additional (1): bat-dg2-9 <br />
  Missing    (4): bat-adlm-1 fi-bsw-cyan bat-dg1-6 bat-adlp-4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7072 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/bat-dg2-8/igt@gem_ringfill@basic-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5647">i915#5647</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/bat-dg2-8/igt@gem_ringfill@basic-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6469/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6469 -&gt; IGTPW_7072</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11626: 1672d1c43e4377628b445ab011343fe2496a41ce @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7072: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7072/index.html<br />
  IGT_6469: fe3c194ba90615e2402461348357c88a23864275 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3863903470772069041==--

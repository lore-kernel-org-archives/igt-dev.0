Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8687557114544066272=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Fri, 10 Jun 2022 00:44:59 -0000
Message-ID: <165482189948.16746.1423832391099372361@emeril.freedesktop.org>
References: <20220609170514.138-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220609170514.138-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdebugfs=3A_Add_IGT=5FCRC=5FSOURCE_environmental_variable_?=
 =?utf-8?b?KHJldjIp?=
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

--===============8687557114544066272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_debugfs: Add IGT_CRC_SOURCE environmental variable (rev2)
URL   : https://patchwork.freedesktop.org/series/104937/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11749 -> IGTPW_7268
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html

Participating hosts (45 -> 43)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (3): fi-icl-u2 fi-bdw-samus bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7268:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@fbdev@read:
    - {bat-atsm-1}:       NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-atsm-1/igt@fbdev@read.html

  
Known issues
------------

  Here are the changes found in IGTPW_7268 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][4] -> [INCOMPLETE][5] ([i915#5847])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][6] ([i915#4528])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][7] -> [INCOMPLETE][8] ([i915#4418])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#533])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-userptr:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][12] ([fdo#109271]) +11 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][13] ([fdo#109271] / [i915#3428] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - {bat-adlm-1}:       [INCOMPLETE][14] ([i915#6132]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/bat-adlm-1/igt@i915_selftest@live@gt_timelines.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-adlm-1/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][16] ([i915#4785]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@hugepages:
    - {bat-dg2-9}:        [DMESG-WARN][18] ([i915#5763]) -> [PASS][19] +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/bat-dg2-9/igt@i915_selftest@live@hugepages.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-dg2-9/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][20] ([i915#4528]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-pnv-d510/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5847]: https://gitlab.freedesktop.org/drm/intel/issues/5847
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6092]: https://gitlab.freedesktop.org/drm/intel/issues/6092
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6099]: https://gitlab.freedesktop.org/drm/intel/issues/6099
  [i915#6132]: https://gitlab.freedesktop.org/drm/intel/issues/6132
  [i915#6138]: https://gitlab.freedesktop.org/drm/intel/issues/6138
  [i915#6163]: https://gitlab.freedesktop.org/drm/intel/issues/6163
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6195]: https://gitlab.freedesktop.org/drm/intel/issues/6195


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6518 -> IGTPW_7268

  CI-20190529: 20190529
  CI_DRM_11749: cff8864e196ada5f7a1d0653f778fe352ded6885 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7268: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html
  IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html

--===============8687557114544066272==
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
<tr><td><b>Series:</b></td><td>lib/igt_debugfs: Add IGT_CRC_SOURCE environmental variable (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104937/">https://patchwork.freedesktop.org/series/104937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11749 -&gt; IGTPW_7268</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html</p>
<h2>Participating hosts (45 -&gt; 43)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (3): fi-icl-u2 fi-bdw-samus bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7268:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@fbdev@read:<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-atsm-1/igt@fbdev@read.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7268 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5847">i915#5847</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-skl-6700k2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/bat-adlm-1/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6132">i915#6132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-adlm-1/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/bat-dg2-9/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/bat-dg2-9/igt@i915_selftest@live@hugepages.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11749/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6518 -&gt; IGTPW_7268</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11749: cff8864e196ada5f7a1d0653f778fe352ded6885 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7268: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7268/index.html<br />
  IGT_6518: 0189ca288f7188e60f5eda356b190040bf8ec704 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8687557114544066272==--

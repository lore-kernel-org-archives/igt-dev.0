Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3465781074971297255=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 05 Jan 2023 01:44:46 -0000
Message-ID: <167288308614.9640.4903537142647775948@emeril.freedesktop.org>
References: <20230105005320.157831-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230105005320.157831-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/4=5D_lib/amdgpu=3A_rename_function_paramete?=
 =?utf-8?q?r?=
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

--===============3465781074971297255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/4] lib/amdgpu: rename function parameter
URL   : https://patchwork.freedesktop.org/series/112416/
State : success

== Summary ==

CI Bug Log - changes from IGT_7108 -> IGTPW_8302
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (2): fi-bsw-kefka fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8302:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rpls-1}:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-rpls-1/igt@gem_exec_suspend@basic-s0@smem.html

  
Known issues
------------

  Here are the changes found in IGTPW_8302 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        NOTRUN -> [FAIL][2] ([i915#7229])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adlp-4:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rps@basic-api:
    - bat-adlp-4:         NOTRUN -> [SKIP][4] ([i915#6621])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@i915_pm_rps@basic-api.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - bat-adlp-4:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-bsw-kefka/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +44 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][8] ([fdo#109271]) +17 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][9] ([fdo#109295] / [i915#3301] / [i915#3708])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - bat-adlp-4:         NOTRUN -> [SKIP][10] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - fi-blb-e6850:       [SKIP][11] ([fdo#109271]) -> [PASS][12] +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/fi-blb-e6850/igt@fbdev@write.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-blb-e6850/igt@fbdev@write.html

  * igt@i915_pm_rpm@basic-rte:
    - bat-adlp-4:         [DMESG-WARN][13] ([i915#7077]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-skl-6600u:       [DMESG-FAIL][15] ([i915#5334]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/fi-skl-6600u/igt@i915_selftest@live@gt_heartbeat.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-skl-6600u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][17] ([i915#4983]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/bat-rpls-1/igt@i915_selftest@live@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [FAIL][19] ([i915#7336]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7108 -> IGTPW_8302

  CI-20190529: 20190529
  CI_DRM_12546: 07a684fbd4d0f5e284e8a782e0298f772fc4164e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8302: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html
  IGT_7108: a6e4162aa99b9f7ad42c3cbcffe7e8d4663febeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html

--===============3465781074971297255==
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
<tr><td><b>Series:</b></td><td>series starting with [1/4] lib/amdgpu: rename function parameter</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112416/">https://patchwork.freedesktop.org/series/112416/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7108 -&gt; IGTPW_8302</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html</p>
<h2>Participating hosts (41 -&gt; 42)</h2>
<p>Additional (2): fi-bsw-kefka fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8302:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_suspend@basic-s0@smem:<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-rpls-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8302 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-bsw-kefka/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/fi-blb-e6850/igt@fbdev@write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-blb-e6850/igt@fbdev@write.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-adlp-4/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/fi-skl-6600u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/fi-skl-6600u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7108/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7336">i915#7336</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7108 -&gt; IGTPW_8302</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12546: 07a684fbd4d0f5e284e8a782e0298f772fc4164e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8302: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8302/index.html<br />
  IGT_7108: a6e4162aa99b9f7ad42c3cbcffe7e8d4663febeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3465781074971297255==--

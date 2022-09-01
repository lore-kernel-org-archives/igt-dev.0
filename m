Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2497473548946691605=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Adrian Larumbe" <adrian.larumbe@collabora.com>
Date: Thu, 01 Sep 2022 17:42:18 -0000
Message-ID: <166205413882.11921.13458163629995204939@emeril.freedesktop.org>
References: <20220901165921.896110-1-adrian.larumbe@collabora.com>
In-Reply-To: <20220901165921.896110-1-adrian.larumbe@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/2=5D_i915=5Fdrm=2Eh_sync_uapi_?=
 =?utf-8?q?engine_class_enum_with_drm-next?=
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

--===============2497473548946691605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/2] i915_drm.h sync uapi engine class enum with drm-next
URL   : https://patchwork.freedesktop.org/series/108042/
State : success

== Summary ==

CI Bug Log - changes from IGT_6641 -> IGTPW_7722
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html

Participating hosts (36 -> 34)
------------------------------

  Missing    (2): fi-rkl-11600 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7722 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#5904] / [i915#62]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_timelines:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#5904]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@i915_selftest@live@gt_timelines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [PASS][5] -> [DMESG-FAIL][6] ([i915#4494] / [i915#4957])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][7] -> [DMESG-FAIL][8] ([i915#4528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-skl-6700k2:      [PASS][9] -> [INCOMPLETE][10] ([i915#6598])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-skl-6700k2/igt@kms_chamelium@common-hpd-after-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-skl-6700k2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_flip@basic-plain-flip@c-dp2:
    - fi-cfl-8109u:       [PASS][11] -> [DMESG-WARN][12] ([i915#165])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-cfl-8109u:       [PASS][13] -> [DMESG-WARN][14] ([i915#165] / [i915#62]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@kms_force_connector_basic@prune-stale-modes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@kms_force_connector_basic@prune-stale-modes.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - {bat-dg2-8}:        [INCOMPLETE][15] ([i915#6523]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_engines:
    - {bat-rpls-1}:       [INCOMPLETE][17] ([i915#6503]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/bat-rpls-1/igt@i915_selftest@live@gt_engines.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/bat-rpls-1/igt@i915_selftest@live@gt_engines.html

  * igt@vgem_basic@unload:
    - fi-cfl-8109u:       [DMESG-WARN][19] ([i915#62]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@vgem_basic@unload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [DMESG-FAIL][21] ([i915#62]) -> [DMESG-WARN][22] ([i915#5904] / [i915#62])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [DMESG-FAIL][23] ([i915#62]) -> [DMESG-WARN][24] ([i915#165] / [i915#62])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-cfl-8109u:       [DMESG-WARN][25] ([i915#62]) -> [DMESG-WARN][26] ([i915#165] / [i915#62]) +9 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@prime_vgem@basic-fence-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6503]: https://gitlab.freedesktop.org/drm/intel/issues/6503
  [i915#6523]: https://gitlab.freedesktop.org/drm/intel/issues/6523
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6641 -> IGTPW_7722

  CI-20190529: 20190529
  CI_DRM_12061: d25f068998ce803ef0a05883616344c0afcbc55a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7722: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html
  IGT_6641: 391ac3a06323aa8b681f9faffd74459caa14498f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html

--===============2497473548946691605==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/2] i915_drm.h sync uapi engine class enum with drm-next</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108042/">https://patchwork.freedesktop.org/series/108042/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6641 -&gt; IGTPW_7722</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html</p>
<h2>Participating hosts (36 -&gt; 34)</h2>
<p>Missing    (2): fi-rkl-11600 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7722 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@i915_selftest@live@gt_timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-skl-6700k2/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-skl-6700k2/igt@kms_chamelium@common-hpd-after-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6523">i915#6523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/bat-rpls-1/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6503">i915#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/bat-rpls-1/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6641/fi-cfl-8109u/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/fi-cfl-8109u/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +9 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6641 -&gt; IGTPW_7722</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12061: d25f068998ce803ef0a05883616344c0afcbc55a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7722: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7722/index.html<br />
  IGT_6641: 391ac3a06323aa8b681f9faffd74459caa14498f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2497473548946691605==--

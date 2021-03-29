Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 29 Mar 2021 19:34:38 -0000
Message-ID: <161704647886.26038.11945811836182622811@emeril.freedesktop.org>
References: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fplane=3A_Don=27t_t?=
 =?utf-8?q?est_all_format+modifier_combinations?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1940013725=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1940013725==
Content-Type: multipart/alternative;
 boundary="===============8952593906916496729=="

--===============8952593906916496729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_plane: Don't test all format+modifier combinations
URL   : https://patchwork.freedesktop.org/series/88554/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9913 -> IGTPW_5674
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html

Known issues
------------

  Here are the changes found in IGTPW_5674 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_basic@create-close:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-tgl-y/igt@gem_basic@create-close.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-tgl-y/igt@gem_basic@create-close.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][3] ([i915#1602] / [i915#2029])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@basic:
    - fi-tgl-y:           [DMESG-WARN][4] ([i915#402]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-tgl-y/igt@gem_flink_basic@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-tgl-y/igt@gem_flink_basic@basic.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][6] ([i915#3303]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-glk-dsi:         [DMESG-WARN][8] ([i915#1982] / [i915#3143]) -> [DMESG-WARN][9] ([i915#3143])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-glk-dsi/igt@i915_module_load@reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-glk-dsi/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#3143]: https://gitlab.freedesktop.org/drm/intel/issues/3143
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6047 -> IGTPW_5674

  CI-20190529: 20190529
  CI_DRM_9913: ab92249bc0afed969efb75b896574b47ae2c9b00 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5674: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html
  IGT_6047: 3887134e739f480cefe1dc7f13eb54f7bf3ca27f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html

--===============8952593906916496729==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_plane: Don&#39;t test all format+modifier combinations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88554/">https://patchwork.freedesktop.org/series/88554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9913 -&gt; IGTPW_5674</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5674 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_basic@create-close:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-tgl-y/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-tgl-y/igt@gem_basic@create-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_flink_basic@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-tgl-y/igt@gem_flink_basic@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-tgl-y/igt@gem_flink_basic@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/fi-glk-dsi/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/fi-glk-dsi/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3143">i915#3143</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6047 -&gt; IGTPW_5674</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9913: ab92249bc0afed969efb75b896574b47ae2c9b00 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5674: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html<br />
  IGT_6047: 3887134e739f480cefe1dc7f13eb54f7bf3ca27f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8952593906916496729==--

--===============1940013725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1940013725==--

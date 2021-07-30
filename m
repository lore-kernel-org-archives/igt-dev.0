Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2761805026936256568=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 30 Jul 2021 12:26:38 -0000
Message-ID: <162764799870.587.13745651278302099360@emeril.freedesktop.org>
References: <20210729190636.17973-1-vidya.srinivas@intel.com>
In-Reply-To: <20210729190636.17973-1-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Use_max_stride_128K_generic_in_set=5Fmax=5Fhw?=
 =?utf-8?q?=5Fstride_=28rev2=29?=
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2761805026936256568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_fb: Use max stride 128K generic in set_max_hw_stride (rev2)
URL   : https://patchwork.freedesktop.org/series/93202/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10426 -> IGTPW_6081
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html

Known issues
------------

  Here are the changes found in IGTPW_6081 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +26 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [PASS][2] -> [FAIL][3] ([i915#1888])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10426/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][5] ([i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][6] ([i915#1886] / [i915#2291])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#533])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (38 -> 32)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-hsw-4770 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6159 -> IGTPW_6081

  CI-20190529: 20190529
  CI_DRM_10426: 58e0d826a80edc36a35a3d394448ccfb3428f237 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6081: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html
  IGT_6159: 6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

-igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0
-igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180
-igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0
-igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html

--===============2761805026936256568==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_fb: Use max stride 128K generic in set_max_hw_stride (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93202/">https://patchwork.freedesktop.org/series/93202/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10426 -&gt; IGTPW_6081</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6081 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10426/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (38 -&gt; 32)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-hsw-4770 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6159 -&gt; IGTPW_6081</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10426: 58e0d826a80edc36a35a3d394448ccfb3428f237 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6081: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6081/index.html<br />
  IGT_6159: 6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>-igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0<br />
-igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180<br />
-igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0<br />
-igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
-igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
-igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
-igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip</p>

</body>
</html>

--===============2761805026936256568==--

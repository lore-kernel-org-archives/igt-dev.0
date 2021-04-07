Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 07 Apr 2021 10:29:44 -0000
Message-ID: <161779138433.12995.14341858801226982186@emeril.freedesktop.org>
References: <20210407093857.45333-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210407093857.45333-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2dl?=
 =?utf-8?q?m=5Fexecbuf=5Fwr=3A_Add_gem=5Fhas=5Frelocations_check?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1288323559=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1288323559==
Content-Type: multipart/alternative;
 boundary="===============1609547127012690883=="

--===============1609547127012690883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gem_execbuf_wr: Add gem_has_relocations check
URL   : https://patchwork.freedesktop.org/series/88800/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9931 -> IGTPW_5707
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5707:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {fi-rkl-11500t}:    [PASS][1] -> [{ABORT}][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_busy@busy@all:
    - {fi-rkl-11500t}:    [FAIL][3] ([i915#3276]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@gem_busy@busy@all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@gem_busy@busy@all.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - {fi-rkl-11500t}:    [FAIL][5] ([i915#3276]) -> [SKIP][6] +21 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@gem_exec_fence@nb-await@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_tiled_blits@basic:
    - {fi-rkl-11500t}:    [FAIL][7] ([i915#3278]) -> [SKIP][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@gem_tiled_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@gem_tiled_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5707 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - fi-tgl-y:           [PASS][9] -> [DMESG-WARN][10] ([i915#402]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-tgl-y/igt@fbdev@write.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-tgl-y/igt@fbdev@write.html

  
#### Possible fixes ####

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#3276]: https://gitlab.freedesktop.org/drm/intel/issues/3276
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3278]: https://gitlab.freedesktop.org/drm/intel/issues/3278
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6059 -> IGTPW_5707

  CI-20190529: 20190529
  CI_DRM_9931: 88d3a98ecbb1264e9046972e1103ac11b573bf83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5707: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html
  IGT_6059: fae783adafb5face387d2df7a983de5c1d752b45 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html

--===============1609547127012690883==
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
<tr><td><b>Series:</b></td><td>lib/gem_execbuf_wr: Add gem_has_relocations check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88800/">https://patchwork.freedesktop.org/series/88800/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9931 -&gt; IGTPW_5707</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5707:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@core_hotunplug@unbind-rebind.html">{ABORT}</a></li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy@all:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@gem_busy@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3276">i915#3276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@gem_busy@busy@all.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3276">i915#3276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@gem_exec_fence@nb-await@vcs0.html">SKIP</a> +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-rkl-11500t/igt@gem_tiled_blits@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3278">i915#3278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-rkl-11500t/igt@gem_tiled_blits@basic.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5707 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@fbdev@write:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-tgl-y/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-tgl-y/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_vgem@basic-gtt:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9931/fi-tgl-y/igt@prime_vgem@basic-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/fi-tgl-y/igt@prime_vgem@basic-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6059 -&gt; IGTPW_5707</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9931: 88d3a98ecbb1264e9046972e1103ac11b573bf83 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5707: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5707/index.html<br />
  IGT_6059: fae783adafb5face387d2df7a983de5c1d752b45 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1609547127012690883==--

--===============1288323559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1288323559==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Dec 2020 12:55:55 -0000
Message-ID: <160743215550.9599.5629619837516505003@emeril.freedesktop.org>
References: <20201208050325.27791-1-arjun.melkaveri@intel.com>
In-Reply-To: <20201208050325.27791-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZ2VtX3No?=
 =?utf-8?q?rink=3ARemoved_gem=5Fmappable=5Faperture=5Fsize_and_initialize_?=
 =?utf-8?q?alloc_size_to_128_MiB_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0499292644=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0499292644==
Content-Type: multipart/alternative;
 boundary="===============7855156829671975224=="

--===============7855156829671975224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_shrink:Removed gem_mappable_aperture_size and initialize alloc size to 128 MiB (rev3)
URL   : https://patchwork.freedesktop.org/series/84659/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9458 -> IGTPW_5259
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html

Known issues
------------

  Here are the changes found in IGTPW_5259 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_basic@create-close:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9458/fi-tgl-y/igt@gem_basic@create-close.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/fi-tgl-y/igt@gem_basic@create-close.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7500u:       [PASS][3] -> [DMESG-WARN][4] ([i915#2605]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9458/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9458/fi-tgl-y/igt@fbdev@read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/fi-tgl-y/igt@fbdev@read.html

  
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5884 -> IGTPW_5259

  CI-20190529: 20190529
  CI_DRM_9458: 7eeed064e42528645b01910bfd6249096ac0cf73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5259: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html
  IGT_5884: b1015a3267bbccb985b2fa7e3accb778c7bff0ed @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html

--===============7855156829671975224==
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
<tr><td><b>Series:</b></td><td>gem_shrink:Removed gem_mappable_aperture_size and initialize alloc size to 128 MiB (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84659/">https://patchwork.freedesktop.org/series/84659/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9458 -&gt; IGTPW_5259</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5259 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_basic@create-close:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9458/fi-tgl-y/igt@gem_basic@create-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/fi-tgl-y/igt@gem_basic@create-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9458/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@fbdev@read:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9458/fi-tgl-y/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/fi-tgl-y/igt@fbdev@read.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5884 -&gt; IGTPW_5259</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9458: 7eeed064e42528645b01910bfd6249096ac0cf73 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5259: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5259/index.html<br />
  IGT_5884: b1015a3267bbccb985b2fa7e3accb778c7bff0ed @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7855156829671975224==--

--===============0499292644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0499292644==--

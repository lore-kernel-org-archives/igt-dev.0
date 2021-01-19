Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 Jan 2021 12:29:24 -0000
Message-ID: <161105936439.4865.1283462821852209777@emeril.freedesktop.org>
References: <20210119094223.899965-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210119094223.899965-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3AAdded_subtest_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1973384688=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1973384688==
Content-Type: multipart/alternative;
 boundary="===============9052569808796957783=="

--===============9052569808796957783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc:Added subtest description
URL   : https://patchwork.freedesktop.org/series/86035/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9640 -> IGTPW_5403
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5403 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5403, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5403:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-byt-j1900:       NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@i915_selftest@live@gem_contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_5403 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][2] ([fdo#109271]) +22 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][3] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@read:
    - fi-tgl-y:           [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/fi-tgl-y/igt@fbdev@read.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-tgl-y/igt@fbdev@read.html

  * igt@gem_huc_copy@huc-copy:
    - fi-byt-j1900:       NOTRUN -> [SKIP][6] ([fdo#109271]) +27 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-byt-j1900:       NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-byt-j1900:       NOTRUN -> [FAIL][8] ([i915#49])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49


Participating hosts (42 -> 37)
------------------------------

  Additional (1): fi-byt-j1900 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5960 -> IGTPW_5403

  CI-20190529: 20190529
  CI_DRM_9640: e4a7b069614eee3e01353d8529d5cf8b924feeec @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html
  IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html

--===============9052569808796957783==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc:Added subtest description</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86035/">https://patchwork.freedesktop.org/series/86035/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9640 -&gt; IGTPW_5403</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5403 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5403, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5403:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gem_contexts:<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5403 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/fi-tgl-y/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-tgl-y/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-byt-j1900/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_vgem@basic-fence-flip:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9640/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Additional (1): fi-byt-j1900 <br />
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5960 -&gt; IGTPW_5403</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9640: e4a7b069614eee3e01353d8529d5cf8b924feeec @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5403/index.html<br />
  IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============9052569808796957783==--

--===============1973384688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1973384688==--

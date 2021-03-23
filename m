Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Mar 2021 20:54:39 -0000
Message-ID: <161653287992.20052.6139042633744282104@emeril.freedesktop.org>
References: <20210322184539.123128-1-arek@hiler.eu>
In-Reply-To: <20210322184539.123128-1-arek@hiler.eu>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?drm=5Fread=3A_Don=27t_use_deprecated_siginterrupt?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0468681242=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0468681242==
Content-Type: multipart/alternative;
 boundary="===============6999716450689062408=="

--===============6999716450689062408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/drm_read: Don't use deprecated siginterrupt
URL   : https://patchwork.freedesktop.org/series/88298/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9882 -> IGTPW_5638
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html

Known issues
------------

  Here are the changes found in IGTPW_5638 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-byt-j1900:       NOTRUN -> [SKIP][1] ([fdo#109271]) +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-kbl-8809g:       [PASS][2] -> [TIMEOUT][3] ([i915#3145])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-u2:          [PASS][4] -> [FAIL][5] ([i915#579])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - fi-tgl-u2:          [PASS][6] -> [DMESG-WARN][7] ([i915#2867]) +17 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-u2/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-u2/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-tgl-y:           [PASS][8] -> [DMESG-WARN][9] ([i915#402]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-byt-j1900:       NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [FAIL][13] ([i915#3177]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-bsw-nick/igt@gem_wait@busy@all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-bsw-nick/igt@gem_wait@busy@all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (47 -> 41)
------------------------------

  Additional (1): fi-byt-j1900 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6040 -> IGTPW_5638

  CI-20190529: 20190529
  CI_DRM_9882: 34f82d5853a3c6467ccf71e055e3432d2b12ecb9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5638: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html
  IGT_6040: 69b578b6ab0a36750f0d23c223a3487fc88fb6a7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html

--===============6999716450689062408==
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
<tr><td><b>Series:</b></td><td>tests/drm_read: Don&#39;t use deprecated siginterrupt</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88298/">https://patchwork.freedesktop.org/series/88298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9882 -&gt; IGTPW_5638</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5638 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-u2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-u2/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-tgl-y/igt@gem_mmap_gtt@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-tgl-y/igt@gem_mmap_gtt@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9882/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 41)</h2>
<p>Additional (1): fi-byt-j1900 <br />
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6040 -&gt; IGTPW_5638</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9882: 34f82d5853a3c6467ccf71e055e3432d2b12ecb9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5638: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5638/index.html<br />
  IGT_6040: 69b578b6ab0a36750f0d23c223a3487fc88fb6a7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6999716450689062408==--

--===============0468681242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0468681242==--

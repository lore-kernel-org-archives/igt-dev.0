Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 09 Jan 2021 20:08:26 -0000
Message-ID: <161022290684.8887.11968585879190810564@emeril.freedesktop.org>
References: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?fix_crc_buffer_overflow_for_slow_platforms?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1021950631=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1021950631==
Content-Type: multipart/alternative;
 boundary="===============8036872160026831846=="

--===============8036872160026831846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: fix crc buffer overflow for slow platforms
URL   : https://patchwork.freedesktop.org/series/85659/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9573 -> IGTPW_5373
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5373 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5373, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5373:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-soraka/igt@i915_selftest@live@gem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-soraka/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@hugepages:
    - fi-bsw-n3050:       [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-bsw-n3050/igt@i915_selftest@live@hugepages.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-bsw-n3050/igt@i915_selftest@live@hugepages.html

  
Known issues
------------

  Here are the changes found in IGTPW_5373 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-tgl-y:           NOTRUN -> [SKIP][5] ([fdo#109315] / [i915#2575])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-tgl-y/igt@amdgpu/amd_basic@query-info.html

  * igt@i915_module_load@reload:
    - fi-kbl-7500u:       [PASS][6] -> [DMESG-WARN][7] ([i915#2605])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-7500u/igt@i915_module_load@reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-7500u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@reset:
    - fi-kbl-soraka:      [PASS][8] -> [SKIP][9] ([fdo#109271]) +12 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-soraka/igt@i915_selftest@live@reset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-soraka/igt@i915_selftest@live@reset.html
    - fi-bsw-n3050:       [PASS][10] -> [SKIP][11] ([fdo#109271]) +10 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-bsw-n3050/igt@i915_selftest@live@reset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-bsw-n3050/igt@i915_selftest@live@reset.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-snb-2600:        NOTRUN -> [SKIP][12] ([fdo#109271]) +30 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-snb-2600:        NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [PASS][14] -> [DMESG-WARN][15] ([i915#402]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  * igt@runner@aborted:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][16] ([i915#1436] / [i915#2295])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-soraka/igt@runner@aborted.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][17] ([i915#1436])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-bsw-n3050/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-snb-2600:        [DMESG-WARN][18] ([i915#2772]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_ringfill@basic-all:
    - fi-tgl-y:           [DMESG-WARN][20] ([i915#402]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-tgl-y/igt@gem_ringfill@basic-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-tgl-y/igt@gem_ringfill@basic-all.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][22] ([i915#1161] / [i915#262]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2772]: https://gitlab.freedesktop.org/drm/intel/issues/2772
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 36)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5953 -> IGTPW_5373

  CI-20190529: 20190529
  CI_DRM_9573: cd0df21e28c36de80356344ff8683be2813c6ff2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5373: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html
  IGT_5953: 65c5eea699141e6f942ce0a8fc85db76ce53cd19 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html

--===============8036872160026831846==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: fix crc buffer overflow for slow platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85659/">https://patchwork.freedesktop.org/series/85659/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9573 -&gt; IGTPW_5373</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5373 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5373, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5373:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-soraka/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-soraka/igt@i915_selftest@live@gem.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-bsw-n3050/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-bsw-n3050/igt@i915_selftest@live@hugepages.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5373 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-tgl-y/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-7500u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-7500u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-soraka/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-soraka/igt@i915_selftest@live@reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-bsw-n3050/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-bsw-n3050/igt@i915_selftest@live@reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2772">i915#2772</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-tgl-y/igt@gem_ringfill@basic-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-tgl-y/igt@gem_ringfill@basic-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 36)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5953 -&gt; IGTPW_5373</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9573: cd0df21e28c36de80356344ff8683be2813c6ff2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5373: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5373/index.html<br />
  IGT_5953: 65c5eea699141e6f942ce0a8fc85db76ce53cd19 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8036872160026831846==--

--===============1021950631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1021950631==--

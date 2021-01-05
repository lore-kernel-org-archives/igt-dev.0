Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 10:54:55 -0000
Message-ID: <160984409576.13807.7257578091331027824@emeril.freedesktop.org>
References: <20210105081352.82045-1-kunal1.joshi@intel.com>
In-Reply-To: <20210105081352.82045-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdCB0?=
 =?utf-8?q?iled_display_with_aid_of_chamelium=2E_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0105100401=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0105100401==
Content-Type: multipart/alternative;
 boundary="===============7713074602972507763=="

--===============7713074602972507763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test tiled display with aid of chamelium. (rev6)
URL   : https://patchwork.freedesktop.org/series/71393/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9545 -> IGTPW_5351
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5351 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5351, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5351:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-cml-u2:          [PASS][3] -> [SKIP][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-cml-u2:          [SKIP][5] ([i915#1004]) -> [SKIP][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-icl-u2:          [SKIP][7] ([fdo#109309]) -> [SKIP][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html
    - fi-cml-u2:          [SKIP][9] ([fdo#109309]) -> [SKIP][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html

  
Known issues
------------

  Here are the changes found in IGTPW_5351 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][13] -> [INCOMPLETE][14] ([i915#142] / [i915#2405])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][15] ([i915#2029])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-bdw-5557u/igt@runner@aborted.html
    - fi-byt-j1900:       NOTRUN -> [FAIL][16] ([i915#1814] / [i915#2505])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-byt-j1900/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [DMESG-WARN][17] ([i915#402]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [i915#1004]: https://gitlab.freedesktop.org/drm/intel/issues/1004
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 36)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5942 -> IGTPW_5351

  CI-20190529: 20190529
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5351: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html

--===============7713074602972507763==
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
<tr><td><b>Series:</b></td><td>Test tiled display with aid of chamelium. (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/71393/">https://patchwork.freedesktop.org/series/71393/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9545 -&gt; IGTPW_5351</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5351 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5351, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5351:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1004">i915#1004</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5351 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</p>
</li>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-byt-j1900/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_vgem@basic-fence-flip:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 36)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5942 -&gt; IGTPW_5351</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5351: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5351/index.html<br />
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium</p>

</body>
</html>

--===============7713074602972507763==--

--===============0105100401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0105100401==--

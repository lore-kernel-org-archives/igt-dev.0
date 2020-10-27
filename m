Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 27 Oct 2020 17:48:37 -0000
Message-ID: <160382091755.26911.3730086115144725984@emeril.freedesktop.org>
References: <20201027075555.254057-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201027075555.254057-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_ensure_conversion_script_preserves_order_of_attribut?=
 =?utf-8?q?es?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0055001145=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0055001145==
Content-Type: multipart/alternative;
 boundary="===============4340358876584162191=="

--===============4340358876584162191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/perf: ensure conversion script preserves order of attributes
URL   : https://patchwork.freedesktop.org/series/83079/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9202 -> IGTPW_5100
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5100 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5100, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5100:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@primary_mmap_gtt:
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-icl-u2/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@primary_page_flip:
    - fi-tgl-y:           [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@kms_psr@primary_page_flip.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@kms_psr@primary_page_flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_5100 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-byt-j1900:       [PASS][4] -> [DMESG-WARN][5] ([i915#1982]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-byt-j1900/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-byt-j1900/igt@i915_module_load@reload.html
    - fi-tgl-u2:          [PASS][6] -> [DMESG-WARN][7] ([i915#1982] / [k.org#205379])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-u2/igt@i915_module_load@reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-y:           [PASS][8] -> [DMESG-WARN][9] ([i915#1982])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@kms_busy@basic@flip.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][10] -> [DMESG-WARN][11] ([i915#2203])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-icl-u2:          [PASS][12] -> [DMESG-WARN][13] ([i915#1982])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][14] ([i915#1982]) -> [PASS][15] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@gem_close_race@basic-process:
    - fi-tgl-y:           [DMESG-WARN][16] ([i915#402]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@gem_close_race@basic-process.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@gem_close_race@basic-process.html

  * igt@kms_psr@cursor_plane_move:
    - fi-icl-u2:          [INCOMPLETE][18] -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-icl-u2/igt@kms_psr@cursor_plane_move.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-icl-u2/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-cml-s:           [INCOMPLETE][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-cml-s/igt@kms_psr@primary_mmap_gtt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-cml-s/igt@kms_psr@primary_mmap_gtt.html

  
#### Warnings ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [DMESG-WARN][22] ([i915#1982]) -> [INCOMPLETE][23] ([i915#2203])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (44 -> 40)
------------------------------

  Missing    (4): fi-kbl-soraka fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5827 -> IGTPW_5100

  CI-20190529: 20190529
  CI_DRM_9202: 073691f2baf2db32197f744612f5249dcf942c79 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5100: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html
  IGT_5827: 7fd7e3fb8b42eb4e62a4575f6edc5a048e5bec3d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html

--===============4340358876584162191==
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
<tr><td><b>Series:</b></td><td>lib/i915/perf: ensure conversion script preserves order of attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83079/">https://patchwork.freedesktop.org/series/83079/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9202 -&gt; IGTPW_5100</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5100 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5100, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5100:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-icl-u2/igt@kms_psr@primary_mmap_gtt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5100 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-byt-j1900/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-byt-j1900/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-u2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-tgl-y/igt@gem_close_race@basic-process.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-tgl-y/igt@gem_close_race@basic-process.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-icl-u2/igt@kms_psr@cursor_plane_move.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-icl-u2/igt@kms_psr@cursor_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-cml-s/igt@kms_psr@primary_mmap_gtt.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-cml-s/igt@kms_psr@primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium@dp-crc-fast:<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9202/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Missing    (4): fi-kbl-soraka fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5827 -&gt; IGTPW_5100</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9202: 073691f2baf2db32197f744612f5249dcf942c79 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5100: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5100/index.html<br />
  IGT_5827: 7fd7e3fb8b42eb4e62a4575f6edc5a048e5bec3d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4340358876584162191==--

--===============0055001145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0055001145==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4786524889602269025=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Date: Sun, 01 Oct 2023 17:16:58 -0000
Message-ID: <169618061851.10313.17023139362559485746@emeril.freedesktop.org>
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
In-Reply-To: <20231001162828.74566-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_tests/kms=5Fcursor=5Fcrc=3A_Fi?=
 =?utf-8?q?x_tests_be_skipped_on_AMD_gpu?=
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

--===============4786524889602269025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix tests be skipped on AMD gpu
URL   : https://patchwork.freedesktop.org/series/124496/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7507 -> IGTPW_9898
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9898 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9898, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-kbl-soraka bat-dg2-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9898:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_9898 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][3] -> [ABORT][4] ([i915#9414])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][6] ([i915#1845]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        NOTRUN -> [ABORT][7] ([i915#8668])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][8] -> [ABORT][9] ([i915#8668])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][10] ([i915#8841]) +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-mtlp-6:         [FAIL][12] ([fdo#103375]) -> [PASS][13] +2 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-apl-guc:         [INCOMPLETE][14] ([i915#1982] / [i915#4528]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [DMESG-WARN][16] ([i915#6868]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:
    - bat-adlp-11:        [ABORT][18] ([i915#8668]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7507 -> IGTPW_9898

  CI-20190529: 20190529
  CI_DRM_13696: 155fcccc8b81a0350f8fa710b9428a2d3da65e82 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9898: 9898
  IGT_7507: 8abfd4fd5c71c882e90410aac2afba7331904b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/index.html

--===============4786524889602269025==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix tests be skipped on AMD gpu</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124496/">https://patchwork.freedesktop.org/series/124496/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7507 -&gt; IGTPW_9898</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9898 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9898, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-kbl-soraka bat-dg2-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9898:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9898 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> +2 other tests pass</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7507/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9898/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7507 -&gt; IGTPW_9898</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13696: 155fcccc8b81a0350f8fa710b9428a2d3da65e82 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9898: 9898<br />
  IGT_7507: 8abfd4fd5c71c882e90410aac2afba7331904b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4786524889602269025==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2717863367157514398=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Date: Mon, 02 Oct 2023 14:57:16 -0000
Message-ID: <169625863627.3206.12318635170246243484@emeril.freedesktop.org>
References: <20231002134144.697342-1-hersenxs.wu@amd.com>
In-Reply-To: <20231002134144.697342-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Fix_test_intermittent_failures_on_AMD_gpu?=
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

--===============2717863367157514398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Fix test intermittent failures on AMD gpu
URL   : https://patchwork.freedesktop.org/series/124524/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13699 -> IGTPW_9902
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html

Participating hosts (38 -> 39)
------------------------------

  Additional (2): fi-hsw-4770 fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9902 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - bat-adlp-11:        [PASS][1] -> [DMESG-WARN][2] ([i915#6868]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-adlp-11/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-adlp-11/igt@debugfs_test@read_all_entries.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [PASS][3] -> [TIMEOUT][4] ([i915#6794] / [i915#7392])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-rpls-1/igt@i915_selftest@live@mman.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-1:         [PASS][5] -> [WARN][6] ([i915#8747])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271]) +13 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:
    - bat-adlp-11:        [PASS][8] -> [ABORT][9] ([i915#8668])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][10] ([i915#8841]) +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][11] ([fdo#109271]) +31 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-mtlp-8:         [ABORT][13] ([i915#9262]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [ABORT][15] ([i915#8668]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][17] ([i915#8668]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7508 -> IGTPW_9902

  CI-20190529: 20190529
  CI_DRM_13699: 093927fd95010c340bdb9fc3f3c608587607b689 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html

--===============2717863367157514398==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Fix test intermittent failures on AMD gpu</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124524/">https://patchwork.freedesktop.org/series/124524/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13699 -&gt; IGTPW_9902</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html</p>
<h2>Participating hosts (38 -&gt; 39)</h2>
<p>Additional (2): fi-hsw-4770 fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9902 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-adlp-11/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-adlp-11/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8747">i915#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13699/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7508 -&gt; IGTPW_9902</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13699: 093927fd95010c340bdb9fc3f3c608587607b689 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9902/index.html<br />
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2717863367157514398==--

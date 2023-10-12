Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6170221935569440764=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Thu, 12 Oct 2023 02:13:32 -0000
Message-ID: <169707681295.25008.7741319360513935554@emeril.freedesktop.org>
References: <20231011210352.671199-1-robdclark@gmail.com>
In-Reply-To: <20231011210352.671199-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Fix_skips/fails_vs_CRC_cleanup?=
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

--===============6170221935569440764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Fix skips/fails vs CRC cleanup
URL   : https://patchwork.freedesktop.org/series/125001/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13741 -> IGTPW_9987
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html

Participating hosts (39 -> 37)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (3): fi-kbl-soraka fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_9987 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp6:
    - bat-adlp-11:        [PASS][3] -> [FAIL][4] ([i915#6121]) +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp5:
    - bat-adlp-11:        [PASS][5] -> [DMESG-WARN][6] ([i915#6868]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-11:        NOTRUN -> [SKIP][7] ([i915#3637])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][8] -> [ABORT][9] ([i915#8668])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][10] ([fdo#109271]) +29 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7532 -> IGTPW_9987

  CI-20190529: 20190529
  CI_DRM_13741: 46d442e3684a03ccb1bc9e9822acdd33f264d521 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_mmap@cpu-caching-coh
-igt@xe_pat@pat-index-all
-igt@xe_pat@pat-index-common-blt
-igt@xe_pat@pat-index-common-render
-igt@xe_pat@pat-index-xe2-blt
-igt@xe_pat@pat-index-xe2-render
-igt@xe_pat@userptr-coh-none

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html

--===============6170221935569440764==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Fix skips/fails vs CRC cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125001/">https://patchwork.freedesktop.org/series/125001/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13741 -&gt; IGTPW_9987</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (3): fi-kbl-soraka fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9987 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7532 -&gt; IGTPW_9987</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13741: 46d442e3684a03ccb1bc9e9822acdd33f264d521 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9987/index.html<br />
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_mmap@cpu-caching-coh<br />
-igt@xe_pat@pat-index-all<br />
-igt@xe_pat@pat-index-common-blt<br />
-igt@xe_pat@pat-index-common-render<br />
-igt@xe_pat@pat-index-xe2-blt<br />
-igt@xe_pat@pat-index-xe2-render<br />
-igt@xe_pat@userptr-coh-none</p>

</body>
</html>

--===============6170221935569440764==--

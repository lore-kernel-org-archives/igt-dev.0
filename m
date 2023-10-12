Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9037610699656053217=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 12 Oct 2023 01:38:33 -0000
Message-ID: <169707471389.25006.16060038520736432751@emeril.freedesktop.org>
References: <20231011150953.284936-1-matthew.auld@intel.com>
In-Reply-To: <20231011150953.284936-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUEFUIGFu?=
 =?utf-8?q?d_cache_coherency_support_=28rev2=29?=
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

--===============9037610699656053217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev2)
URL   : https://patchwork.freedesktop.org/series/124667/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13741 -> IGTPW_9986
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html

Participating hosts (39 -> 36)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (4): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_9986 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [PASS][1] -> [ABORT][2] ([i915#8668] / [i915#9451])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +29 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [ABORT][4] ([i915#8668]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7532 -> IGTPW_9986

  CI-20190529: 20190529
  CI_DRM_13741: 46d442e3684a03ccb1bc9e9822acdd33f264d521 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9986: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_selftest@drm_cmdline
+igt@kms_selftest@drm_damage
+igt@kms_selftest@drm_dp_mst
+igt@kms_selftest@drm_plane
+igt@kms_selftest@framebuffer
+igt@xe_mmap@cpu-caching-coh
+igt@xe_pat@pat-index-all
+igt@xe_pat@pat-index-common-blt
+igt@xe_pat@pat-index-common-render
+igt@xe_pat@pat-index-xe2-blt
+igt@xe_pat@pat-index-xe2-render
+igt@xe_pat@userptr-coh-none
-igt@kms_selftest@drm_cmdline_parser
-igt@kms_selftest@drm_damage_helper
-igt@kms_selftest@drm_dp_mst_helper
-igt@kms_selftest@drm_framebuffer
-igt@kms_selftest@drm_plane_helper

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html

--===============9037610699656053217==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13741 -&gt; IGTPW_9986</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (4): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9986 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9451">i915#9451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13741/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7532 -&gt; IGTPW_9986</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13741: 46d442e3684a03ccb1bc9e9822acdd33f264d521 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9986: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9986/index.html<br />
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_selftest@drm_cmdline<br />
+igt@kms_selftest@drm_damage<br />
+igt@kms_selftest@drm_dp_mst<br />
+igt@kms_selftest@drm_plane<br />
+igt@kms_selftest@framebuffer<br />
+igt@xe_mmap@cpu-caching-coh<br />
+igt@xe_pat@pat-index-all<br />
+igt@xe_pat@pat-index-common-blt<br />
+igt@xe_pat@pat-index-common-render<br />
+igt@xe_pat@pat-index-xe2-blt<br />
+igt@xe_pat@pat-index-xe2-render<br />
+igt@xe_pat@userptr-coh-none<br />
-igt@kms_selftest@drm_cmdline_parser<br />
-igt@kms_selftest@drm_damage_helper<br />
-igt@kms_selftest@drm_dp_mst_helper<br />
-igt@kms_selftest@drm_framebuffer<br />
-igt@kms_selftest@drm_plane_helper</p>

</body>
</html>

--===============9037610699656053217==--

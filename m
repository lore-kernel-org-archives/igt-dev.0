Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Aug 2020 19:47:14 -0000
Message-ID: <159778003467.18758.13931602398007150125@emeril.freedesktop.org>
References: <20200818192054.975370-1-lyude@redhat.com>
In-Reply-To: <20200818192054.975370-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Generate_reference_CRCs_for_partial_coverage_too?=
 =?utf-8?q?_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0806394628=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0806394628==
Content-Type: multipart/alternative;
 boundary="===============7440287354002586551=="

--===============7440287354002586551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Generate reference CRCs for partial coverage too (rev2)
URL   : https://patchwork.freedesktop.org/series/74806/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8900 -> IGTPW_4886
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html

Known issues
------------

  Here are the changes found in IGTPW_4886 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-tgl-u2:          [PASS][3] -> [DMESG-FAIL][4] ([i915#1233])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][5] ([i915#1888]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@execlists:
    - fi-apl-guc:         [INCOMPLETE][7] ([i915#1635]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-apl-guc/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-apl-guc/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-WARN][9] ([i915#2203]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [DMESG-FAIL][11] ([i915#62] / [i915#95]) -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][14] ([i915#62] / [i915#92]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4886

  CI-20190529: 20190529
  CI_DRM_8900: 3dc196787bc40e012dece11fc052a4dd467bc421 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4886: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html

--===============7440287354002586551==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Generate reference CRCs for partial coverage too (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/74806/">https://patchwork.freedesktop.org/series/74806/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8900 -&gt; IGTPW_4886</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4886 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1233">i915#1233</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-apl-guc/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-apl-guc/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5769 -&gt; IGTPW_4886</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8900: 3dc196787bc40e012dece11fc052a4dd467bc421 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4886: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4886/index.html<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7440287354002586551==--

--===============0806394628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0806394628==--

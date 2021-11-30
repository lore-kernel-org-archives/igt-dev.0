Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6373633461496303792=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Nov 2021 10:50:47 -0000
Message-ID: <163826944773.20410.10294689123352092656@emeril.freedesktop.org>
References: <20211130073803.46388-1-jouni.hogander@intel.com>
In-Reply-To: <20211130073803.46388-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQmlwbGFu?=
 =?utf-8?q?ar_testcases_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6373633461496303792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Biplanar testcases (rev5)
URL   : https://patchwork.freedesktop.org/series/97232/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10941 -> IGTPW_6451
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html

Participating hosts (38 -> 34)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (5): bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-4 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_6451 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       [PASS][1] -> [FAIL][2] ([i915#4547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10941/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@i915_selftest@live@gt_engines:
    - fi-rkl-guc:         [PASS][3] -> [INCOMPLETE][4] ([i915#4432])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10941/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#4269])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10941/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +57 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][8] ([i915#3363] / [i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-skl-6600u/igt@runner@aborted.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][9] ([i915#3928] / [i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-rkl-guc/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3928]: https://gitlab.freedesktop.org/drm/intel/issues/3928
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4432]: https://gitlab.freedesktop.org/drm/intel/issues/4432
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6295 -> IGTPW_6451

  CI-20190529: 20190529
  CI_DRM_10941: 6f01a31b8380dff51cba54610b6fddacc25e8c68 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6451: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html
  IGT_6295: 2d7f671b872ed856a97957051098974be2380019 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_psr2_sf@overlay-plane-update-continuous-sf
+igt@kms_psr2_su@frontbuffer-xrgb8888
+igt@kms_psr2_su@page_flip-nv12
+igt@kms_psr2_su@page_flip-p010
+igt@kms_psr2_su@page_flip-xrgb8888
-igt@kms_psr2_su@frontbuffer
-igt@kms_psr2_su@page_flip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html

--===============6373633461496303792==
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
<tr><td><b>Series:</b></td><td>Biplanar testcases (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97232/">https://patchwork.freedesktop.org/series/97232/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10941 -&gt; IGTPW_6451</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html</p>
<h2>Participating hosts (38 -&gt; 34)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (5): bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-4 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6451 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10941/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10941/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4432">i915#4432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10941/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3928">i915#3928</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6295 -&gt; IGTPW_6451</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10941: 6f01a31b8380dff51cba54610b6fddacc25e8c68 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6451: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6451/index.html<br />
  IGT_6295: 2d7f671b872ed856a97957051098974be2380019 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_psr2_sf@overlay-plane-update-continuous-sf<br />
+igt@kms_psr2_su@frontbuffer-xrgb8888<br />
+igt@kms_psr2_su@page_flip-nv12<br />
+igt@kms_psr2_su@page_flip-p010<br />
+igt@kms_psr2_su@page_flip-xrgb8888<br />
-igt@kms_psr2_su@frontbuffer<br />
-igt@kms_psr2_su@page_flip</p>

</body>
</html>

--===============6373633461496303792==--

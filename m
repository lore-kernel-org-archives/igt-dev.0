Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 12 Apr 2021 09:57:56 -0000
Message-ID: <161822147648.8700.3536188636167975404@emeril.freedesktop.org>
References: <20210412165751.25441-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210412165751.25441-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbusy=3A_Limit_the_execution_to_two_pipes_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1661928989=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1661928989==
Content-Type: multipart/alternative;
 boundary="===============2849439530745807639=="

--===============2849439530745807639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_busy: Limit the execution to two pipes (rev5)
URL   : https://patchwork.freedesktop.org/series/87829/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9956 -> IGTPW_5731
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html

Known issues
------------

  Here are the changes found in IGTPW_5731 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][1] -> [FAIL][2] ([i915#1372])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1:
    - fi-bwr-2160:        [PASS][3] -> [FAIL][4] ([i915#2122])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@reset:
    - {fi-tgl-dsi}:       [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-tgl-dsi/igt@i915_selftest@live@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-tgl-dsi/igt@i915_selftest@live@reset.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-tgl-y/igt@prime_vgem@basic-write.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-tgl-y/igt@prime_vgem@basic-write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#3004]: https://gitlab.freedesktop.org/drm/intel/issues/3004
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6063 -> IGTPW_5731

  CI-20190529: 20190529
  CI_DRM_9956: 188f3fea945b4edbc74418492cd1004a9e7931dd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5731: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_busy@basic-hang
+igt@kms_busy@extended-modeset-hang-newfb
+igt@kms_busy@extended-modeset-hang-newfb-with-reset
+igt@kms_busy@extended-modeset-hang-oldfb
+igt@kms_busy@extended-modeset-hang-oldfb-with-reset
+igt@kms_busy@extended-pageflip-hang-newfb
+igt@kms_busy@extended-pageflip-hang-oldfb
+igt@kms_busy@extended-pageflip-modeset-hang-oldfb
-igt@kms_busy@basic-flip-pipe-a
-igt@kms_busy@basic-flip-pipe-b
-igt@kms_busy@basic-flip-pipe-c
-igt@kms_busy@basic-flip-pipe-d
-igt@kms_busy@basic-flip-pipe-e
-igt@kms_busy@basic-flip-pipe-f
-igt@kms_busy@basic-modeset-pipe-a
-igt@kms_busy@basic-modeset-pipe-b
-igt@kms_busy@basic-modeset-pipe-c
-igt@kms_busy@basic-modeset-pipe-d
-igt@kms_busy@basic-modeset-pipe-e
-igt@kms_busy@basic-modeset-pipe-f
-igt@kms_busy@extended-modeset-hang-newfb-pipe-a
-igt@kms_busy@extended-modeset-hang-newfb-pipe-b
-igt@kms_busy@extended-modeset-hang-newfb-pipe-c
-igt@kms_busy@extended-modeset-hang-newfb-pipe-d
-igt@kms_busy@extended-modeset-hang-newfb-pipe-e
-igt@kms_busy@extended-modeset-hang-newfb-pipe-f
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-a
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-b
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-c
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-d
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-e
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-f
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-a
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-b
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-c
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-d
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-e
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-f
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-a
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-b
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-c
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-d
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-e
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-f
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-a
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-b
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-c
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-d
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-e
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-f
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-a
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-b
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-c
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-d
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-e
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-f
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-a
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-b
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-c
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-d
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-e
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html

--===============2849439530745807639==
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
<tr><td><b>Series:</b></td><td>tests/kms_busy: Limit the execution to two pipes (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87829/">https://patchwork.freedesktop.org/series/87829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9956 -&gt; IGTPW_5731</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5731 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-tgl-dsi/igt@i915_selftest@live@reset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-tgl-dsi/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9956/fi-tgl-y/igt@prime_vgem@basic-write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/fi-tgl-y/igt@prime_vgem@basic-write.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6063 -&gt; IGTPW_5731</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9956: 188f3fea945b4edbc74418492cd1004a9e7931dd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5731: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5731/index.html<br />
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_busy@basic-hang<br />
+igt@kms_busy@extended-modeset-hang-newfb<br />
+igt@kms_busy@extended-modeset-hang-newfb-with-reset<br />
+igt@kms_busy@extended-modeset-hang-oldfb<br />
+igt@kms_busy@extended-modeset-hang-oldfb-with-reset<br />
+igt@kms_busy@extended-pageflip-hang-newfb<br />
+igt@kms_busy@extended-pageflip-hang-oldfb<br />
+igt@kms_busy@extended-pageflip-modeset-hang-oldfb<br />
-igt@kms_busy@basic-flip-pipe-a<br />
-igt@kms_busy@basic-flip-pipe-b<br />
-igt@kms_busy@basic-flip-pipe-c<br />
-igt@kms_busy@basic-flip-pipe-d<br />
-igt@kms_busy@basic-flip-pipe-e<br />
-igt@kms_busy@basic-flip-pipe-f<br />
-igt@kms_busy@basic-modeset-pipe-a<br />
-igt@kms_busy@basic-modeset-pipe-b<br />
-igt@kms_busy@basic-modeset-pipe-c<br />
-igt@kms_busy@basic-modeset-pipe-d<br />
-igt@kms_busy@basic-modeset-pipe-e<br />
-igt@kms_busy@basic-modeset-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-f<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-f<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-f<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-f</p>

</body>
</html>

--===============2849439530745807639==--

--===============1661928989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1661928989==--

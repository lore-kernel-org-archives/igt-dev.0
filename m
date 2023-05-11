Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7189390513373110687=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Date: Thu, 11 May 2023 00:30:57 -0000
Message-ID: <168376505738.29007.5338937508209765637@emeril.freedesktop.org>
References: <20230510224218.16482-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230510224218.16482-1-quic_abhinavk@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fwriteback=3A_fix_teardown_path_for_kms=5Fwriteback_=28rev?=
 =?utf-8?q?2=29?=
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

--===============7189390513373110687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: fix teardown path for kms_writeback (rev2)
URL   : https://patchwork.freedesktop.org/series/117408/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13131 -> IGTPW_8940
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-rpls-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8940 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-atsm-1:         [PASS][1] -> [SKIP][2] ([i915#5174])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13131/bat-atsm-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/bat-atsm-1/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][3] -> [DMESG-FAIL][4] ([i915#5334] / [i915#7872])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13131/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][5] ([i915#1845] / [i915#5354]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-kbl-7567u:       [DMESG-FAIL][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13131/fi-kbl-7567u/igt@dmabuf@all-tests@dma_fence.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi-kbl-7567u/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-kbl-7567u:       [ABORT][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13131/fi-kbl-7567u/igt@dmabuf@all-tests@sanitycheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi-kbl-7567u/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_hangman@error-state-basic:
    - fi-kbl-soraka:      [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13131/fi-kbl-soraka/igt@i915_hangman@error-state-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi-kbl-soraka/igt@i915_hangman@error-state-basic.html

  
#### Warnings ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][12] ([i915#4983] / [i915#7461] / [i915#7953] / [i915#7981] / [i915#8347] / [i915#8384]) -> [ABORT][13] ([i915#4983] / [i915#7461] / [i915#7953] / [i915#8347] / [i915#8384])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13131/bat-rpls-1/igt@i915_selftest@live@reset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7285 -> IGTPW_8940

  CI-20190529: 20190529
  CI_DRM_13131: 92b7f1c42fc99ff1bad5e18d6b1aaa585f134d47 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8940: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/index.html
  IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/index.html

--===============7189390513373110687==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_writeback: fix teardown path for k=
ms_writeback (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/117408/">https://patchwork.freedesktop.org/series/117408/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8940/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8940/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13131 -&gt; IGTPW_8940</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/index.=
html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-rpls-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8940 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-atsm-1:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_13131/bat-atsm-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/bat-atsm-1/=
igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5174">i915#5174</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_13131/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi=
-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8940/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-=
frame-sequence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-kbl-7567u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_13131/fi-kbl-7567u/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi=
-kbl-7567u/igt@dmabuf@all-tests@dma_fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_13131/fi-kbl-7567u/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/fi-kb=
l-7567u/igt@dmabuf@all-tests@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>fi-kbl-soraka:      <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_13131/fi-kbl-soraka/igt@i915_hangman@error-state-basic.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_89=
40/fi-kbl-soraka/igt@i915_hangman@error-state-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>bat-rpls-1:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_13131/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#746=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7953">i9=
15#7953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79=
81">i915#7981</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/8347">i915#8347</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/8384">i915#8384</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8940/bat-rpls-1/igt@i915_selftest@live@reset.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4983">i91=
5#4983</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/746=
1">i915#7461</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/7953">i915#7953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/8347">i915#8347</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7285 -&gt; IGTPW_8940</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13131: 92b7f1c42fc99ff1bad5e18d6b1aaa585f134d47 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8940: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8940/index.htm=
l<br />
  IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7189390513373110687==--

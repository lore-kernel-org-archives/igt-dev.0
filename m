Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Mar 2021 15:03:06 -0000
Message-ID: <161677098669.10685.13512535367808189925@emeril.freedesktop.org>
References: <20210326221524.10233-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210326221524.10233-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbusy=3A_Limit_the_execution_to_two_pipes_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1145264565=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1145264565==
Content-Type: multipart/alternative;
 boundary="===============0174439034691051509=="

--===============0174439034691051509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_busy: Limit the execution to two pipes (rev4)
URL   : https://patchwork.freedesktop.org/series/87829/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9905 -> IGTPW_5670
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9905 and IGTPW_5670:

### New IGT tests (4) ###

  * igt@kms_busy@basic@flip-pipe-a:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic@flip-pipe-b:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic@modeset-pipe-a:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic@modeset-pipe-b:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5670 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-open:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-tgl-y/igt@gem_flink_basic@bad-open.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-tgl-y/igt@gem_flink_basic@bad-open.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][7] ([i915#3303]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3004]: https://gitlab.freedesktop.org/drm/intel/issues/3004
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (47 -> 42)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6046 -> IGTPW_5670

  CI-20190529: 20190529
  CI_DRM_9905: fac8bc351b6b76f5a7dffb51431aa4baa2d686c8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5670: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html
  IGT_6046: e76039273b1524147c43dba061756f06003d56ae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_busy@basic
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html

--===============0174439034691051509==
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
<tr><td><b>Series:</b></td><td>tests/kms_busy: Limit the execution to two pipes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87829/">https://patchwork.freedesktop.org/series/87829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9905 -&gt; IGTPW_5670</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9905 and IGTPW_5670:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_busy@basic@flip-pipe-a:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip-pipe-b:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset-pipe-a:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset-pipe-b:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5670 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-open:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-tgl-y/igt@gem_flink_basic@bad-open.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-tgl-y/igt@gem_flink_basic@bad-open.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9905/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 42)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6046 -&gt; IGTPW_5670</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9905: fac8bc351b6b76f5a7dffb51431aa4baa2d686c8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5670: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5670/index.html<br />
  IGT_6046: e76039273b1524147c43dba061756f06003d56ae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_busy@basic<br />
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

--===============0174439034691051509==--

--===============1145264565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1145264565==--

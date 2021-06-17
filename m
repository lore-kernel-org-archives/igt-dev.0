Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Jun 2021 16:20:53 -0000
Message-ID: <162394685327.3753.5676095639625647486@emeril.freedesktop.org>
References: <20210617152032.431594-1-markyacoub@chromium.org>
In-Reply-To: <20210617152032.431594-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2Myk=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0585827066=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0585827066==
Content-Type: multipart/alternative;
 boundary="===============3564668759029049846=="

--===============3564668759029049846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev3)
URL   : https://patchwork.freedesktop.org/series/90382/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10237 -> IGTPW_5935
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html

Known issues
------------

  Here are the changes found in IGTPW_5935 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][2] ([fdo#109271]) +27 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][3] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [INCOMPLETE][5] ([i915#2782] / [i915#2940]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940


Participating hosts (43 -> 35)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus fi-skl-6700k2 fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6112 -> IGTPW_5935

  CI-20190529: 20190529
  CI_DRM_10237: 7a1a8ad7aecfd36adc8ec4e74ddea71920cf7f10 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5935: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html
  IGT_6112: a17cc0c5d096fabfd516848c114bc411e11130f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html

--===============3564668759029049846==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90382/">https://patchwork.freedesktop.org/series/90382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10237 -&gt; IGTPW_5935</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5935 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 35)</h2>
<p>Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus fi-skl-6700k2 fi-snb-2600 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6112 -&gt; IGTPW_5935</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10237: 7a1a8ad7aecfd36adc8ec4e74ddea71920cf7f10 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5935: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html<br />
  IGT_6112: a17cc0c5d096fabfd516848c114bc411e11130f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3564668759029049846==--

--===============0585827066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0585827066==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Dec 2020 08:25:19 -0000
Message-ID: <160923031905.17549.11786798474113857730@emeril.freedesktop.org>
References: <20201228095207.376732-1-apoorva1.singh@intel.com>
In-Reply-To: <20201228095207.376732-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Freset=5Fstats=3A_Call_noop=28=29_with_relevant_params?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1191945874=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1191945874==
Content-Type: multipart/alternative;
 boundary="===============1182549528898485717=="

--===============1182549528898485717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_reset_stats: Call noop() with relevant params
URL   : https://patchwork.freedesktop.org/series/85258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9528 -> IGTPW_5336
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html

Known issues
------------

  Here are the changes found in IGTPW_5336 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           NOTRUN -> [DMESG-WARN][1] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-tgl-y:           NOTRUN -> [INCOMPLETE][2] ([i915#2268])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-tgl-y:           NOTRUN -> [DMESG-FAIL][3] ([i915#2373])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-y:           NOTRUN -> [DMESG-FAIL][4] ([i915#1759])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-skl-guc:         NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-tgl-y:           NOTRUN -> [SKIP][6] ([fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-y:           NOTRUN -> [SKIP][7] ([fdo#109285])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#533])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-skl-guc:         NOTRUN -> [SKIP][9] ([fdo#109271]) +25 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-skl-guc/igt@kms_psr@primary_mmap_gtt.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][10] ([i915#2029])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-bdw-5557u/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (38 -> 31)
------------------------------

  Additional (2): fi-skl-guc fi-tgl-y 
  Missing    (9): fi-byt-j1900 fi-bsw-cyan fi-cfl-8700k fi-apl-guc fi-kbl-7500u fi-dg1-1 fi-cfl-8109u fi-bsw-kefka fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5925 -> IGTPW_5336

  CI-20190529: 20190529
  CI_DRM_9528: 2d13ca3bfcff24ed05e602511a3720d374e1413c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5336: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html
  IGT_5925: c8d6184a6185e02fc9f83e3cf3ef50b0a67d981d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html

--===============1182549528898485717==
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
<tr><td><b>Series:</b></td><td>i915/gem_reset_stats: Call noop() with relevant params</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85258/">https://patchwork.freedesktop.org/series/85258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9528 -&gt; IGTPW_5336</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5336 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@gem_mmap_gtt@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2268">i915#2268</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-tgl-y/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-skl-guc/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (38 -&gt; 31)</h2>
<p>Additional (2): fi-skl-guc fi-tgl-y <br />
  Missing    (9): fi-byt-j1900 fi-bsw-cyan fi-cfl-8700k fi-apl-guc fi-kbl-7500u fi-dg1-1 fi-cfl-8109u fi-bsw-kefka fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5925 -&gt; IGTPW_5336</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9528: 2d13ca3bfcff24ed05e602511a3720d374e1413c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5336: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5336/index.html<br />
  IGT_5925: c8d6184a6185e02fc9f83e3cf3ef50b0a67d981d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1182549528898485717==--

--===============1191945874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1191945874==--

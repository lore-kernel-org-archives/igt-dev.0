Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Sep 2020 07:30:43 -0000
Message-ID: <159955024394.21758.8885052579868629604@emeril.freedesktop.org>
References: <20200908061001.20302-1-karthik.b.s@intel.com>
In-Reply-To: <20200908061001.20302-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Add_test_to_validate_asynchronous_flips_?=
 =?utf-8?b?KHJldjQp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1086046125=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1086046125==
Content-Type: multipart/alternative;
 boundary="===============5962986863332965533=="

--===============5962986863332965533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Add test to validate asynchronous flips (rev4)
URL   : https://patchwork.freedesktop.org/series/79701/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8977 -> IGTPW_4966
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4966 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4966, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4966:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-r:           [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-r/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-r/igt@gem_exec_gttfill@basic.html
    - fi-bdw-5557u:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html
    - fi-skl-6600u:       [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-6600u/igt@gem_exec_gttfill@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-6600u/igt@gem_exec_gttfill@basic.html
    - fi-skl-lmem:        [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-lmem/igt@gem_exec_gttfill@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-lmem/igt@gem_exec_gttfill@basic.html
    - fi-ilk-650:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@gem_exec_parallel@engines@basic.html
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-blb-e6850:       [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live@gem_execbuf:
    - fi-bsw-n3050:       [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html

  * igt@runner@aborted:
    - fi-snb-2600:        NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-snb-2600/igt@runner@aborted.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-blb-e6850/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_gttfill@basic:
    - {fi-kbl-7560u}:     [PASS][19] -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-7560u/igt@gem_exec_gttfill@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-7560u/igt@gem_exec_gttfill@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4966 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@flink-lifetime:
    - fi-tgl-y:           [PASS][21] -> [DMESG-WARN][22] ([i915#402]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-snb-2600:        [PASS][23] -> [INCOMPLETE][24] ([i915#82])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-snb-2600/igt@gem_tiled_fence_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-snb-2600/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live@coherency:
    - fi-gdg-551:         [PASS][25] -> [DMESG-FAIL][26] ([i915#1748])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-gdg-551/igt@i915_selftest@live@coherency.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-gdg-551/igt@i915_selftest@live@coherency.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-y:           [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@kms_busy@basic@flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@kms_busy@basic@flip.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-cfl-8109u:       [INCOMPLETE][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html
    - fi-cfl-guc:         [INCOMPLETE][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-guc/igt@gem_exec_gttfill@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@engines@contexts:
    - fi-bsw-kefka:       [INCOMPLETE][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html

  * igt@i915_selftest@live@gem_execbuf:
    - fi-bsw-nick:        [INCOMPLETE][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [DMESG-WARN][37] ([i915#1982]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-y:           [DMESG-WARN][39] ([i915#402]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@prime_vgem@basic-write.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][41] ([i915#1186] / [i915#1784]) -> [FAIL][42] ([i915#1186])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-x1275/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-x1275/igt@runner@aborted.html
    - fi-skl-6600u:       [FAIL][43] ([i915#2398]) -> [FAIL][44] ([i915#1186])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-6600u/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-6600u/igt@runner@aborted.html
    - fi-cfl-8109u:       [FAIL][45] ([i915#1186]) -> [FAIL][46] ([i915#2398])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-8109u/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@runner@aborted.html
    - fi-skl-lmem:        [FAIL][47] ([i915#2398]) -> [FAIL][48] ([i915#1186])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-lmem/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-lmem/igt@runner@aborted.html
    - fi-kbl-r:           [FAIL][49] ([i915#1784] / [i915#2398]) -> [FAIL][50] ([i915#1186] / [i915#1784])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-r/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-r/igt@runner@aborted.html
    - fi-kbl-guc:         [FAIL][51] ([i915#1186] / [i915#1784]) -> [FAIL][52] ([i915#1186])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-guc/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-guc/igt@runner@aborted.html
    - fi-cml-s:           [FAIL][53] ([i915#1186]) -> [FAIL][54] ([i915#1186] / [i915#2082])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cml-s/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cml-s/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][55] ([i915#1186]) -> [FAIL][56] ([i915#2398])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-guc/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1748]: https://gitlab.freedesktop.org/drm/intel/issues/1748
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4966

  CI-20190529: 20190529
  CI_DRM_8977: 831856ad1b43884fd9463c03f46b8e0bf78ece85 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4966: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_async_flips@alternate-sync-async-flip
+igt@kms_async_flips@async-flip-with-page-flip-events
+igt@kms_async_flips@invalid-async-flip
+igt@kms_async_flips@test-time-stamp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html

--===============5962986863332965533==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Add test to validate asynchronous flips (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79701/">https://patchwork.freedesktop.org/series/79701/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8977 -&gt; IGTPW_4966</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4966 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4966, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4966:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-r/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-r/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-6600u/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-6600u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-lmem/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-lmem/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-ilk-650/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-ilk-650/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_execbuf:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-snb-2600/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-blb-e6850/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-7560u/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-7560u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4966 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@flink-lifetime:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-snb-2600/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-snb-2600/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-gdg-551/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-gdg-551/igt@i915_selftest@live@coherency.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1748">i915#1748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-guc/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@gem_exec_gttfill@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_execbuf:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@prime_vgem@basic-write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@prime_vgem@basic-write.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-lmem/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-lmem/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>)</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5779 -&gt; IGTPW_4966</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8977: 831856ad1b43884fd9463c03f46b8e0bf78ece85 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4966: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_async_flips@alternate-sync-async-flip<br />
+igt@kms_async_flips@async-flip-with-page-flip-events<br />
+igt@kms_async_flips@invalid-async-flip<br />
+igt@kms_async_flips@test-time-stamp</p>

</body>
</html>

--===============5962986863332965533==--

--===============1086046125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1086046125==--

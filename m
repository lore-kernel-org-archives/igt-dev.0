Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9048556063039283766=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Nov 2021 10:08:27 -0000
Message-ID: <163766210774.2115.8294605738612662288@emeril.freedesktop.org>
References: <20211123091203.6076-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211123091203.6076-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?api=5Fintel=5Fbb=3A_Use_alignment_only_when_kernel_support_it?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============9048556063039283766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/api_intel_bb: Use alignment only when kernel support it
URL   : https://patchwork.freedesktop.org/series/97197/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10917 -> IGTPW_6424
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html

Participating hosts (40 -> 36)
------------------------------

  Additional (2): fi-kbl-soraka fi-icl-u2 
  Missing    (6): bat-dg1-6 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-jsl-2 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_6424 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +31 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-icl-u2:          NOTRUN -> [SKIP][2] ([fdo#109315]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271]) +12 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - fi-icl-u2:          NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][7] ([i915#4555]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-u2:          NOTRUN -> [FAIL][8] ([i915#3049])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - fi-skl-6600u:       NOTRUN -> [FAIL][9] ([i915#4547])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@i915_selftest@live.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][10] ([i915#794])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][11] ([i915#1886] / [i915#2291])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][12] -> [INCOMPLETE][13] ([i915#3921])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@objects:
    - fi-icl-u2:          NOTRUN -> [DMESG-WARN][14] ([i915#2867]) +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@i915_selftest@live@objects.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][15] -> [DMESG-FAIL][16] ([i915#4528])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][19] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][20] ([fdo#111827]) +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          NOTRUN -> [SKIP][21] ([fdo#109278]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][22] ([fdo#109285])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#533])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#533])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@cursor_plane_move:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][25] ([fdo#109271]) +41 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@kms_psr@cursor_plane_move.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][26] ([i915#3301])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@prime_vgem@basic-userptr.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-blb-e6850:       NOTRUN -> [FAIL][28] ([fdo#109271] / [i915#2403] / [i915#4312])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-blb-e6850/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - fi-kbl-8809g:       [FAIL][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-kbl-8809g/igt@core_auth@basic-auth.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@core_auth@basic-auth.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [INCOMPLETE][31] ([i915#4006]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][33] ([i915#4269]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [INCOMPLETE][35] ([i915#4547]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][37] ([i915#2722] / [i915#3363] / [i915#4312]) -> [FAIL][38] ([i915#1436] / [i915#3363] / [i915#4312])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-skl-6600u/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3049]: https://gitlab.freedesktop.org/drm/intel/issues/3049
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4006]: https://gitlab.freedesktop.org/drm/intel/issues/4006
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4555]: https://gitlab.freedesktop.org/drm/intel/issues/4555
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6286 -> IGTPW_6424

  CI-20190529: 20190529
  CI_DRM_10917: de9a03c2007f3c69c5fa86ef007841a4a9194aac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6424: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html
  IGT_6286: cdcbf81f734fdb1d102e84490e49e9fec23760cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html

--===============9048556063039283766==
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
<tr><td><b>Series:</b></td><td>tests/api_intel_bb: Use alignment only when kernel support it</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97197/">https://patchwork.freedesktop.org/series/97197/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10917 -&gt; IGTPW_6424</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Additional (2): fi-kbl-soraka fi-icl-u2 <br />
  Missing    (6): bat-dg1-6 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-jsl-2 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6424 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4555">i915#4555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3049">i915#3049</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@i915_selftest@live.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@i915_selftest@live@objects.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-blb-e6850/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-kbl-8809g/igt@core_auth@basic-auth.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-kbl-8809g/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4006">i915#4006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10917/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6286 -&gt; IGTPW_6424</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10917: de9a03c2007f3c69c5fa86ef007841a4a9194aac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6424: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html<br />
  IGT_6286: cdcbf81f734fdb1d102e84490e49e9fec23760cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9048556063039283766==--

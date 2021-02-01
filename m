Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Feb 2021 14:06:28 -0000
Message-ID: <161218838809.18682.13187596321837747940@emeril.freedesktop.org>
References: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?prime=5Fvgem=3A_Skip_userptr_test_on_!llc=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1434565341=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1434565341==
Content-Type: multipart/alternative;
 boundary="===============0706639981199959687=="

--===============0706639981199959687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/prime_vgem: Skip userptr test on !llc.
URL   : https://patchwork.freedesktop.org/series/86532/
State : success

== Summary ==

CI Bug Log - changes from IGT_5983 -> IGTPW_5462
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html

Known issues
------------

  Here are the changes found in IGTPW_5462 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +26 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_basic@userptr:
    - fi-byt-j1900:       NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][3] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_create@basic:
    - fi-tgl-y:           [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-tgl-y/igt@gem_ctx_create@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-tgl-y/igt@gem_ctx_create@basic.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271]) +23 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@i915_hangman@error-state-basic:
    - fi-apl-guc:         NOTRUN -> [DMESG-WARN][8] ([i915#1610])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-apl-guc/igt@i915_hangman@error-state-basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#1886] / [i915#2291])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#533])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-pnv-d510/igt@prime_vgem@basic-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-pnv-d510/igt@prime_vgem@basic-userptr.html
    - fi-bsw-n3050:       [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bsw-n3050/igt@prime_vgem@basic-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bsw-n3050/igt@prime_vgem@basic-userptr.html
    - fi-bsw-kefka:       [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bsw-kefka/igt@prime_vgem@basic-userptr.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bsw-kefka/igt@prime_vgem@basic-userptr.html
    - fi-ilk-650:         [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-ilk-650/igt@prime_vgem@basic-userptr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-ilk-650/igt@prime_vgem@basic-userptr.html
    - fi-elk-e7500:       [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-elk-e7500/igt@prime_vgem@basic-userptr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-elk-e7500/igt@prime_vgem@basic-userptr.html
    - fi-bxt-dsi:         [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bxt-dsi/igt@prime_vgem@basic-userptr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bxt-dsi/igt@prime_vgem@basic-userptr.html
    - fi-byt-j1900:       [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-byt-j1900/igt@prime_vgem@basic-userptr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-byt-j1900/igt@prime_vgem@basic-userptr.html
    - fi-bsw-nick:        [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bsw-nick/igt@prime_vgem@basic-userptr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bsw-nick/igt@prime_vgem@basic-userptr.html
    - fi-glk-dsi:         [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-glk-dsi/igt@prime_vgem@basic-userptr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-glk-dsi/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - fi-tgl-y:           [DMESG-WARN][31] ([i915#402]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-tgl-y/igt@fbdev@write.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-tgl-y/igt@fbdev@write.html

  * igt@gem_sync@basic-each:
    - fi-apl-guc:         [INCOMPLETE][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-apl-guc/igt@gem_sync@basic-each.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-apl-guc/igt@gem_sync@basic-each.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [INCOMPLETE][35] ([i915#142] / [i915#2405]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-apl-guc:         [FAIL][37] ([i915#2722]) -> [FAIL][38] ([i915#2426])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-apl-guc/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-apl-guc/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (45 -> 38)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (8): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-cml-drallion fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5983 -> IGTPW_5462

  CI-20190529: 20190529
  CI_DRM_9712: 5276d4e84db68c095d7bacc0f3943936b49ef829 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5462: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html
  IGT_5983: 536e0c2e9a63721596cdf93e996e7469cadfaaae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html

--===============0706639981199959687==
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
<tr><td><b>Series:</b></td><td>tests/prime_vgem: Skip userptr test on !llc.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86532/">https://patchwork.freedesktop.org/series/86532/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5983 -&gt; IGTPW_5462</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5462 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@userptr:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-tgl-y/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-tgl-y/igt@gem_ctx_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-apl-guc/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bsw-n3050/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bsw-n3050/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bsw-kefka/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bsw-kefka/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-ilk-650/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-ilk-650/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-elk-e7500/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-elk-e7500/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bxt-dsi/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bxt-dsi/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-byt-j1900/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-byt-j1900/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-bsw-nick/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-bsw-nick/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-glk-dsi/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-glk-dsi/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-tgl-y/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-tgl-y/igt@fbdev@write.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-apl-guc/igt@gem_sync@basic-each.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-apl-guc/igt@gem_sync@basic-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (8): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-cml-drallion fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5983 -&gt; IGTPW_5462</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9712: 5276d4e84db68c095d7bacc0f3943936b49ef829 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5462: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html<br />
  IGT_5983: 536e0c2e9a63721596cdf93e996e7469cadfaaae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============0706639981199959687==--

--===============1434565341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1434565341==--

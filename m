Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 May 2021 13:00:18 -0000
Message-ID: <162134281860.23337.15691921730200703302@emeril.freedesktop.org>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Flease=3A_Add_subtest_description_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1980641681=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1980641681==
Content-Type: multipart/alternative;
 boundary="===============0667713442356075361=="

--===============0667713442356075361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_lease: Add subtest description (rev6)
URL   : https://patchwork.freedesktop.org/series/89869/
State : success

== Summary ==

CI Bug Log - changes from IGT_6087 -> IGTPW_5819
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html

Known issues
------------

  Here are the changes found in IGTPW_5819 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271]) +30 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_fence@basic-await@rcs0:
    - fi-elk-e7500:       [PASS][3] -> [FAIL][4] ([i915#3457])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@nb-await@bcs0:
    - fi-bsw-nick:        [PASS][5] -> [FAIL][6] ([i915#3457]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html
    - fi-bsw-kefka:       [PASS][7] -> [FAIL][8] ([i915#3457]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@nb-await@bcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-kefka/igt@gem_exec_fence@nb-await@bcs0.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-n3050:       [PASS][9] -> [FAIL][10] ([i915#3457])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-glk-dsi:         [PASS][11] -> [FAIL][12] ([i915#3457]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@i915_module_load@reload:
    - fi-ilk-650:         NOTRUN -> [DMESG-FAIL][13] ([i915#3457]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@i915_module_load@reload.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-ilk-650:         NOTRUN -> [FAIL][15] ([i915#3457]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-elk-e7500:       [PASS][16] -> [FAIL][17] ([i915#53]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - fi-bsw-n3050:       [FAIL][18] ([i915#3457]) -> [PASS][19] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_exec_fence@basic-await@vecs0:
    - fi-bsw-kefka:       [FAIL][20] ([i915#3457]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-nick:        [FAIL][22] ([i915#3457]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_wait@wait@all:
    - fi-bwr-2160:        [FAIL][24] ([i915#3457]) -> [PASS][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@gem_wait@wait@all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bwr-2160/igt@gem_wait@wait@all.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][26] ([i915#2782]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-elk-e7500:       [FAIL][28] ([i915#53]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
    - fi-bwr-2160:        [FAIL][30] ([i915#53]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-ilk-650:         [FAIL][32] ([i915#3457] / [i915#3472]) -> [FAIL][33] ([i915#3472])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@runner@aborted:
    - fi-glk-dsi:         [FAIL][34] ([i915#3363] / [k.org#202321]) -> [FAIL][35] ([i915#2426] / [i915#3363] / [k.org#202321])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-glk-dsi/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][36] ([i915#2426] / [i915#3363]) -> [FAIL][37] ([i915#3363])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-cfl-guc/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-cfl-guc/igt@runner@aborted.html
    - fi-skl-6700k2:      [FAIL][38] ([i915#1436] / [i915#3363]) -> [FAIL][39] ([i915#1436] / [i915#2426] / [i915#3363])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-skl-6700k2/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-skl-6700k2/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3472]: https://gitlab.freedesktop.org/drm/intel/issues/3472
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (39 -> 35)
------------------------------

  Missing    (4): fi-kbl-soraka fi-dg1-1 fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6087 -> IGTPW_5819

  CI-20190529: 20190529
  CI_DRM_10095: a0301381199253bca72b57df9b8162bf483dbea4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5819: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html
  IGT_6087: a1772be7dede83a4f65e5986fd7083a9c8f89083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html

--===============0667713442356075361==
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
<tr><td><b>Series:</b></td><td>tests/kms_lease: Add subtest description (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89869/">https://patchwork.freedesktop.org/series/89869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6087 -&gt; IGTPW_5819</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5819 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-elk-e7500/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@nb-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-kefka/igt@gem_exec_fence@nb-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-kefka/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bwr-2160/igt@gem_wait@wait@all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-bwr-2160/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): fi-kbl-soraka fi-dg1-1 fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6087 -&gt; IGTPW_5819</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10095: a0301381199253bca72b57df9b8162bf483dbea4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5819: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5819/index.html<br />
  IGT_6087: a1772be7dede83a4f65e5986fd7083a9c8f89083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============0667713442356075361==--

--===============1980641681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1980641681==--

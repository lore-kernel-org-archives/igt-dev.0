Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Jun 2021 11:32:18 -0000
Message-ID: <162323833862.27475.16951107699191956908@emeril.freedesktop.org>
References: <20210609104214.3290-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210609104214.3290-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgS2VlcCB0?=
 =?utf-8?q?ests_working_without_relocations_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0986754289=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0986754289==
Content-Type: multipart/alternative;
 boundary="===============5182261041124457812=="

--===============5182261041124457812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Keep tests working without relocations (rev3)
URL   : https://patchwork.freedesktop.org/series/90049/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10196 -> IGTPW_5903
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5903 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5903, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5903:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@basic:
    - fi-icl-y:           [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-y/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-icl-y/igt@gem_exec_gttfill@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@execlists:
    - {fi-ehl-2}:         [DMESG-FAIL][3] ([i915#1222]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-ehl-2/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-ehl-2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gtt:
    - {fi-tgl-dsi}:       [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-dsi/igt@i915_selftest@live@gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-tgl-dsi/igt@i915_selftest@live@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10196 and IGTPW_5903:

### New IGT tests (8) ###

  * igt@i915_selftest@atomic-pipe-a-tiling-x:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@client:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@execlists:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@gem_execbuf:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@hangcheck:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@memory_region:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@atomic-pipe-a-tiling-x@reset:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5903 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][7] ([fdo#109271]) +17 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][8] -> [FAIL][9] ([i915#2203] / [i915#579])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@evict:
    - fi-tgl-u2:          [PASS][10] -> [DMESG-WARN][11] ([i915#2867]) +7 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-u2/igt@i915_selftest@live@evict.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-tgl-u2/igt@i915_selftest@live@evict.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][12] ([i915#1888]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@gem_execbuf:
    - {fi-ehl-2}:         [DMESG-WARN][14] ([i915#1222]) -> [PASS][15] +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-ehl-2/igt@i915_selftest@live@gem_execbuf.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-ehl-2/igt@i915_selftest@live@gem_execbuf.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][16] ([i915#2782]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [DMESG-WARN][18] ([i915#2868]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [INCOMPLETE][20] ([i915#3462]) -> [DMESG-FAIL][21] ([i915#3462])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-cfl-8109u/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][22] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][23] ([i915#1436] / [i915#3363])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-x1275/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-kbl-x1275/igt@runner@aborted.html
    - fi-cfl-8109u:       [FAIL][24] ([i915#3363]) -> [FAIL][25] ([i915#2426] / [i915#3363])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-cfl-8109u/igt@runner@aborted.html
    - fi-glk-dsi:         [FAIL][26] ([i915#3363] / [k.org#202321]) -> [FAIL][27] ([i915#2426] / [i915#3363] / [k.org#202321])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-glk-dsi/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-glk-dsi/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][28] ([i915#2426] / [i915#3462]) -> [FAIL][29] ([i915#3462])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bdw-5557u/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-bdw-5557u/igt@runner@aborted.html
    - fi-bxt-dsi:         [FAIL][30] ([i915#3363]) -> [FAIL][31] ([i915#2426] / [i915#3363])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bxt-dsi/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-bxt-dsi/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][32] ([i915#3363]) -> [FAIL][33] ([i915#2426] / [i915#3363])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-guc/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-cfl-guc/igt@runner@aborted.html
    - fi-skl-6700k2:      [FAIL][34] ([i915#1436] / [i915#3363]) -> [FAIL][35] ([i915#1436] / [i915#2426] / [i915#3363])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-skl-6700k2/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-skl-6700k2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3276]: https://gitlab.freedesktop.org/drm/intel/issues/3276
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3542]: https://gitlab.freedesktop.org/drm/intel/issues/3542
  [i915#3544]: https://gitlab.freedesktop.org/drm/intel/issues/3544
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (44 -> 40)
------------------------------

  Additional (1): fi-rkl-11500t 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-apl-guc fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6103 -> IGTPW_5903

  CI-20190529: 20190529
  CI_DRM_10196: 1588f8e61fe15d12826ca07d41c0a108a26006cc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5903: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html
  IGT_6103: 3aa79e55e73d4a49a5222e5dfde486b800a29fe7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html

--===============5182261041124457812==
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
<tr><td><b>Series:</b></td><td>Keep tests working without relocations (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90049/">https://patchwork.freedesktop.org/series/90049/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10196 -&gt; IGTPW_5903</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5903 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5903, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5903:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-y/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-icl-y/igt@gem_exec_gttfill@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-ehl-2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1222">i915#1222</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-ehl-2/igt@i915_selftest@live@execlists.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-dsi/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-tgl-dsi/igt@i915_selftest@live@gtt.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10196 and IGTPW_5903:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@client:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@execlists:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@gem_execbuf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@hangcheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@memory_region:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@atomic-pipe-a-tiling-x@reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5903 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@evict:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-u2/igt@i915_selftest@live@evict.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-tgl-u2/igt@i915_selftest@live@evict.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +7 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_execbuf:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-ehl-2/igt@i915_selftest@live@gem_execbuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1222">i915#1222</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-ehl-2/igt@i915_selftest@live@gem_execbuf.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10196/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Additional (1): fi-rkl-11500t <br />
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-apl-guc fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6103 -&gt; IGTPW_5903</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10196: 1588f8e61fe15d12826ca07d41c0a108a26006cc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5903: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5903/index.html<br />
  IGT_6103: 3aa79e55e73d4a49a5222e5dfde486b800a29fe7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5182261041124457812==--

--===============0986754289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0986754289==--

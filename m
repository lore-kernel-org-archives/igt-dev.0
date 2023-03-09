Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5858230550339465651=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 09 Mar 2023 16:34:25 -0000
Message-ID: <167837966501.12422.7689312427102936677@emeril.freedesktop.org>
References: <20230309155931.5089-1-swati2.sharma@intel.com>
In-Reply-To: <20230309155931.5089-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_Reorg_max-source-size_subtest?=
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

--===============5858230550339465651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Reorg max-source-size subtest
URL   : https://patchwork.freedesktop.org/series/114921/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12831 -> IGTPW_8584
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8584 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][3] ([i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][4] ([i915#1886])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@guc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][5] ([i915#7852])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][6] ([i915#6367] / [i915#7913])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@i915_selftest@live@slpc.html
    - bat-rpls-1:         [PASS][7] -> [DMESG-FAIL][8] ([i915#6367])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - bat-rpls-1:         [PASS][9] -> [DMESG-FAIL][10] ([i915#6763])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-1/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-1/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271]) +16 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-2:         NOTRUN -> [SKIP][12] ([i915#7828])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-bsw-nick/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][15] ([i915#5354]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-2:         NOTRUN -> [SKIP][16] ([i915#1845])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][17] ([i915#7911] / [i915#7913]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-glk-j4005:       [ABORT][19] ([i915#6217]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [ABORT][21] ([i915#7694] / [i915#7913]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-2/igt@i915_selftest@live@requests.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@i915_selftest@live@requests.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6217]: https://gitlab.freedesktop.org/drm/intel/issues/6217
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#7694]: https://gitlab.freedesktop.org/drm/intel/issues/7694
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7188 -> IGTPW_8584

  CI-20190529: 20190529
  CI_DRM_12831: 4910ebea52abc05f63bfc43bc91baebd8af93d45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8584: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_userptr_blits@access-control
+igt@gem_userptr_blits@coherency-sync
+igt@gem_userptr_blits@coherency-unsync
+igt@gem_userptr_blits@create-destroy-sync
+igt@gem_userptr_blits@create-destroy-unsync
+igt@gem_userptr_blits@dmabuf-sync
+igt@gem_userptr_blits@dmabuf-unsync
+igt@gem_userptr_blits@forbidden-operations
+igt@gem_userptr_blits@forked-access
+igt@gem_userptr_blits@forked-sync-interruptible
+igt@gem_userptr_blits@forked-sync-mempressure-interruptible
+igt@gem_userptr_blits@forked-sync-mempressure-normal
+igt@gem_userptr_blits@forked-sync-multifd-interruptible
+igt@gem_userptr_blits@forked-sync-multifd-mempressure-interruptible
+igt@gem_userptr_blits@forked-sync-multifd-mempressure-normal
+igt@gem_userptr_blits@forked-sync-multifd-normal
+igt@gem_userptr_blits@forked-sync-normal
+igt@gem_userptr_blits@forked-sync-swapping-interruptible
+igt@gem_userptr_blits@forked-sync-swapping-mempressure-interruptible
+igt@gem_userptr_blits@forked-sync-swapping-mempressure-normal
+igt@gem_userptr_blits@forked-sync-swapping-multifd-interruptible
+igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-interruptible
+igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-normal
+igt@gem_userptr_blits@forked-sync-swapping-multifd-normal
+igt@gem_userptr_blits@forked-sync-swapping-normal
+igt@gem_userptr_blits@forked-unsync-interruptible
+igt@gem_userptr_blits@forked-unsync-mempressure-interruptible
+igt@gem_userptr_blits@forked-unsync-mempressure-normal
+igt@gem_userptr_blits@forked-unsync-multifd-interruptible
+igt@gem_userptr_blits@forked-unsync-multifd-mempressure-interruptible
+igt@gem_userptr_blits@forked-unsync-multifd-mempressure-normal
+igt@gem_userptr_blits@forked-unsync-multifd-normal
+igt@gem_userptr_blits@forked-unsync-normal
+igt@gem_userptr_blits@forked-unsync-swapping-interruptible
+igt@gem_userptr_blits@forked-unsync-swapping-mempressure-interruptible
+igt@gem_userptr_blits@forked-unsync-swapping-mempressure-normal
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-interruptible
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-interruptible
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-normal
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-normal
+igt@gem_userptr_blits@forked-unsync-swapping-normal
+igt@gem_userptr_blits@huge-split
+igt@gem_userptr_blits@input-checking
+igt@gem_userptr_blits@invalid-mmap-offset-unsync
+igt@gem_userptr_blits@invalid-null-pointer
+igt@gem_userptr_blits@major-normal-sync
+igt@gem_userptr_blits@major-sync-interruptible
+igt@gem_userptr_blits@major-unsync-interruptible
+igt@gem_userptr_blits@major-unsync-normal
+igt@gem_userptr_blits@map-fixed-invalidate
+igt@gem_userptr_blits@map-fixed-invalidate-busy
+igt@gem_userptr_blits@map-fixed-invalidate-overlap
+igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy
+igt@gem_userptr_blits@minor-normal-sync
+igt@gem_userptr_blits@minor-sync-interruptible
+igt@gem_userptr_blits@minor-unsync-interruptible
+igt@gem_userptr_blits@minor-unsync-normal
+igt@gem_userptr_blits@mlocked-normal-sync
+igt@gem_userptr_blits@mlocked-sync-interruptible
+igt@gem_userptr_blits@mlocked-unsync-interruptible
+igt@gem_userptr_blits@mlocked-unsync-normal
+igt@gem_userptr_blits@mmap-offset-banned
+igt@gem_userptr_blits@nohangcheck
+igt@gem_userptr_blits@probe
+igt@gem_userptr_blits@process-exit
+igt@gem_userptr_blits@process-exit-busy
+igt@gem_userptr_blits@readonly-pwrite-unsync
+igt@gem_userptr_blits@readonly-unsync
+igt@gem_userptr_blits@relocations
+igt@gem_userptr_blits@sd-probe
+igt@gem_userptr_blits@set-cache-level
+igt@gem_userptr_blits@stress-mm
+igt@gem_userptr_blits@stress-mm-invalidate-close
+igt@gem_userptr_blits@stress-mm-invalidate-close-overlap
+igt@gem_userptr_blits@stress-purge
+igt@gem_userptr_blits@swapping-normal-sync
+igt@gem_userptr_blits@swapping-sync-interruptible
+igt@gem_userptr_blits@swapping-unsync-interruptible
+igt@gem_userptr_blits@swapping-unsync-normal
+igt@gem_userptr_blits@sync-overlap
+igt@gem_userptr_blits@sync-unmap
+igt@gem_userptr_blits@sync-unmap-after-close
+igt@gem_userptr_blits@sync-unmap-cycles
+igt@gem_userptr_blits@unsync-overlap
+igt@gem_userptr_blits@unsync-unmap
+igt@gem_userptr_blits@unsync-unmap-after-close
+igt@gem_userptr_blits@unsync-unmap-cycles
+igt@gem_userptr_blits@usage-restrictions
+igt@gem_userptr_blits@userfault
+igt@gem_userptr_blits@vma-merge
+igt@kms_plane_scaling@i915-max-src-size
-igt@kms_plane_scaling@i915-max-source-size

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html

--===============5858230550339465651==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Reorg max-source-size subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114921/">https://patchwork.freedesktop.org/series/114921/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12831 -&gt; IGTPW_8584</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8584 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-1/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-bsw-nick/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6217">i915#6217</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/fi-glk-j4005/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12831/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7694">i915#7694</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7188 -&gt; IGTPW_8584</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12831: 4910ebea52abc05f63bfc43bc91baebd8af93d45 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8584: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8584/index.html<br />
  IGT_7188: b35bfa32fe672d67ced8555557e3e707ace211ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_userptr_blits@access-control<br />
+igt@gem_userptr_blits@coherency-sync<br />
+igt@gem_userptr_blits@coherency-unsync<br />
+igt@gem_userptr_blits@create-destroy-sync<br />
+igt@gem_userptr_blits@create-destroy-unsync<br />
+igt@gem_userptr_blits@dmabuf-sync<br />
+igt@gem_userptr_blits@dmabuf-unsync<br />
+igt@gem_userptr_blits@forbidden-operations<br />
+igt@gem_userptr_blits@forked-access<br />
+igt@gem_userptr_blits@forked-sync-interruptible<br />
+igt@gem_userptr_blits@forked-sync-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-sync-mempressure-normal<br />
+igt@gem_userptr_blits@forked-sync-multifd-interruptible<br />
+igt@gem_userptr_blits@forked-sync-multifd-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-sync-multifd-mempressure-normal<br />
+igt@gem_userptr_blits@forked-sync-multifd-normal<br />
+igt@gem_userptr_blits@forked-sync-normal<br />
+igt@gem_userptr_blits@forked-sync-swapping-interruptible<br />
+igt@gem_userptr_blits@forked-sync-swapping-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-sync-swapping-mempressure-normal<br />
+igt@gem_userptr_blits@forked-sync-swapping-multifd-interruptible<br />
+igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-sync-swapping-multifd-mempressure-normal<br />
+igt@gem_userptr_blits@forked-sync-swapping-multifd-normal<br />
+igt@gem_userptr_blits@forked-sync-swapping-normal<br />
+igt@gem_userptr_blits@forked-unsync-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-mempressure-normal<br />
+igt@gem_userptr_blits@forked-unsync-multifd-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-multifd-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-multifd-mempressure-normal<br />
+igt@gem_userptr_blits@forked-unsync-multifd-normal<br />
+igt@gem_userptr_blits@forked-unsync-normal<br />
+igt@gem_userptr_blits@forked-unsync-swapping-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-swapping-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-swapping-mempressure-normal<br />
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-interruptible<br />
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-mempressure-normal<br />
+igt@gem_userptr_blits@forked-unsync-swapping-multifd-normal<br />
+igt@gem_userptr_blits@forked-unsync-swapping-normal<br />
+igt@gem_userptr_blits@huge-split<br />
+igt@gem_userptr_blits@input-checking<br />
+igt@gem_userptr_blits@invalid-mmap-offset-unsync<br />
+igt@gem_userptr_blits@invalid-null-pointer<br />
+igt@gem_userptr_blits@major-normal-sync<br />
+igt@gem_userptr_blits@major-sync-interruptible<br />
+igt@gem_userptr_blits@major-unsync-interruptible<br />
+igt@gem_userptr_blits@major-unsync-normal<br />
+igt@gem_userptr_blits@map-fixed-invalidate<br />
+igt@gem_userptr_blits@map-fixed-invalidate-busy<br />
+igt@gem_userptr_blits@map-fixed-invalidate-overlap<br />
+igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy<br />
+igt@gem_userptr_blits@minor-normal-sync<br />
+igt@gem_userptr_blits@minor-sync-interruptible<br />
+igt@gem_userptr_blits@minor-unsync-interruptible<br />
+igt@gem_userptr_blits@minor-unsync-normal<br />
+igt@gem_userptr_blits@mlocked-normal-sync<br />
+igt@gem_userptr_blits@mlocked-sync-interruptible<br />
+igt@gem_userptr_blits@mlocked-unsync-interruptible<br />
+igt@gem_userptr_blits@mlocked-unsync-normal<br />
+igt@gem_userptr_blits@mmap-offset-banned<br />
+igt@gem_userptr_blits@nohangcheck<br />
+igt@gem_userptr_blits@probe<br />
+igt@gem_userptr_blits@process-exit<br />
+igt@gem_userptr_blits@process-exit-busy<br />
+igt@gem_userptr_blits@readonly-pwrite-unsync<br />
+igt@gem_userptr_blits@readonly-unsync<br />
+igt@gem_userptr_blits@relocations<br />
+igt@gem_userptr_blits@sd-probe<br />
+igt@gem_userptr_blits@set-cache-level<br />
+igt@gem_userptr_blits@stress-mm<br />
+igt@gem_userptr_blits@stress-mm-invalidate-close<br />
+igt@gem_userptr_blits@stress-mm-invalidate-close-overlap<br />
+igt@gem_userptr_blits@stress-purge<br />
+igt@gem_userptr_blits@swapping-normal-sync<br />
+igt@gem_userptr_blits@swapping-sync-interruptible<br />
+igt@gem_userptr_blits@swapping-unsync-interruptible<br />
+igt@gem_userptr_blits@swapping-unsync-normal<br />
+igt@gem_userptr_blits@sync-overlap<br />
+igt@gem_userptr_blits@sync-unmap<br />
+igt@gem_userptr_blits@sync-unmap-after-close<br />
+igt@gem_userptr_blits@sync-unmap-cycles<br />
+igt@gem_userptr_blits@unsync-overlap<br />
+igt@gem_userptr_blits@unsync-unmap<br />
+igt@gem_userptr_blits@unsync-unmap-after-close<br />
+igt@gem_userptr_blits@unsync-unmap-cycles<br />
+igt@gem_userptr_blits@usage-restrictions<br />
+igt@gem_userptr_blits@userfault<br />
+igt@gem_userptr_blits@vma-merge<br />
+igt@kms_plane_scaling@i915-max-src-size<br />
-igt@kms_plane_scaling@i915-max-source-size</p>

</body>
</html>

--===============5858230550339465651==--

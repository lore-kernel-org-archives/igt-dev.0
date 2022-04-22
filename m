Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4220139017946122166=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 22 Apr 2022 17:46:17 -0000
Message-ID: <165064957765.14005.15745100379889348982@emeril.freedesktop.org>
References: <20220422152050.20386-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220422152050.20386-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Iga21zL3Rl?=
 =?utf-8?q?sts_=3A_IGT_cleanup_=28rev4=29?=
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

--===============4220139017946122166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms/tests : IGT cleanup (rev4)
URL   : https://patchwork.freedesktop.org/series/102806/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11543 -> IGTPW_6985
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6985 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6985, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html

Participating hosts (45 -> 44)
------------------------------

  Additional (2): fi-hsw-4770 bat-adlm-1 
  Missing    (3): bat-dg2-8 fi-bsw-cyan bat-adlp-4 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6985:

### IGT changes ###

#### Possible regressions ####

  * igt@prime_vgem@basic-fence-read:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-kbl-soraka/igt@prime_vgem@basic-fence-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-kbl-soraka/igt@prime_vgem@basic-fence-read.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-adlm-1}:       NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-adlm-1/igt@i915_pm_rpm@module-reload.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - {bat-adlm-1}:       NOTRUN -> [DMESG-WARN][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
Known issues
------------

  Here are the changes found in IGTPW_6985 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [PASS][5] -> [INCOMPLETE][6] ([i915#146])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271]) +9 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-4770:        NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#3012])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][9] -> [INCOMPLETE][10] ([i915#4785])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][11] -> [DMESG-FAIL][12] ([i915#4528])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-hsw-4770:        NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#533])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-hsw-4770:        NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1072]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@kms_psr@primary_mmap_gtt.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][16] ([fdo#109271] / [i915#2403] / [i915#4312])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-pnv-d510/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][17] ([fdo#109271] / [i915#4312])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][18] ([i915#4391]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all@dma_fence_chain:
    - bat-dg1-5:          [INCOMPLETE][20] ([i915#4154]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/bat-dg1-5/igt@dmabuf@all@dma_fence_chain.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-dg1-5/igt@dmabuf@all@dma_fence_chain.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][22] -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/bat-rpls-1/igt@i915_selftest@live@reset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4154]: https://gitlab.freedesktop.org/drm/intel/issues/4154
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5329]: https://gitlab.freedesktop.org/drm/intel/issues/5329
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5509]: https://gitlab.freedesktop.org/drm/intel/issues/5509
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6449 -> IGTPW_6985

  CI-20190529: 20190529
  CI_DRM_11543: df51a64607842dbdc675b82f3390deefef9e562f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6985: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html
  IGT_6449: 704da775abb83faa9324a665fe2992ab90f4ab03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html

--===============4220139017946122166==
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
<tr><td><b>Series:</b></td><td>kms/tests : IGT cleanup (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102806/">https://patchwork.freedesktop.org/series/102806/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11543 -&gt; IGTPW_6985</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6985 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6985, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Additional (2): fi-hsw-4770 bat-adlm-1 <br />
  Missing    (3): bat-dg2-8 fi-bsw-cyan bat-adlp-4 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6985:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@prime_vgem@basic-fence-read:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-kbl-soraka/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-kbl-soraka/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-adlm-1/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6985 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-4770/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@dmabuf@all@dma_fence_chain:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/bat-dg1-5/igt@dmabuf@all@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4154">i915#4154</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-dg1-5/igt@dmabuf@all@dma_fence_chain.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11543/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6449 -&gt; IGTPW_6985</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11543: df51a64607842dbdc675b82f3390deefef9e562f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6985: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6985/index.html<br />
  IGT_6449: 704da775abb83faa9324a665fe2992ab90f4ab03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4220139017946122166==--

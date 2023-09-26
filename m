Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3463334135300564977=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 26 Sep 2023 13:11:31 -0000
Message-ID: <169573389181.20978.13218482062689878665@emeril.freedesktop.org>
References: <20230926114751.2757259-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230926114751.2757259-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX3Bt?=
 =?utf-8?q?=5Flpsp=3A_Test_optimization?=
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

--===============3463334135300564977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_pm_lpsp: Test optimization
URL   : https://patchwork.freedesktop.org/series/124265/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13681 -> IGTPW_9878
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): bat-dg2-14 
  Missing    (2): bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9878 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-mtlp-8:         NOTRUN -> [ABORT][1] ([i915#9262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_module_load@load:
    - bat-adlp-6:         [PASS][2] -> [DMESG-WARN][3] ([i915#1982] / [i915#8449])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-6/igt@i915_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-adlp-6/igt@i915_module_load@load.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][4] ([i915#6645])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] ([fdo#109271]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp5:
    - bat-adlp-11:        [PASS][6] -> [DMESG-WARN][7] ([i915#4309])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp5.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp5.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [PASS][8] -> [FAIL][9] ([i915#9276])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][10] ([i915#1845]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [PASS][11] -> [DMESG-WARN][12] ([i915#6868])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][13] ([i915#8841]) +6 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][15] ([i915#9262]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4309]: https://gitlab.freedesktop.org/drm/intel/issues/4309
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7503 -> IGTPW_9878

  CI-20190529: 20190529
  CI_DRM_13681: b57407d0de043fc22b000a941a404ab103849e06 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9878: 9878
  IGT_7503: 7503


Testlist changes
----------------

+igt@i915_pm_rpm@basic-pci-d3-state
+igt@i915_pm_rpm@basic-rte
+igt@i915_pm_rpm@cursor
+igt@i915_pm_rpm@cursor-dpms
+igt@i915_pm_rpm@dpms-lpsp
+igt@i915_pm_rpm@dpms-mode-unset-lpsp
+igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
+igt@i915_pm_rpm@dpms-non-lpsp
+igt@i915_pm_rpm@drm-resources-equal
+igt@i915_pm_rpm@fences
+igt@i915_pm_rpm@fences-dpms
+igt@i915_pm_rpm@i2c
+igt@i915_pm_rpm@legacy-planes
+igt@i915_pm_rpm@legacy-planes-dpms
+igt@i915_pm_rpm@modeset-lpsp
+igt@i915_pm_rpm@modeset-lpsp-stress
+igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
+igt@i915_pm_rpm@modeset-non-lpsp
+igt@i915_pm_rpm@modeset-non-lpsp-stress
+igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@i915_pm_rpm@modeset-pc8-residency-stress
+igt@i915_pm_rpm@modeset-stress-extra-wait
+igt@i915_pm_rpm@pc8-residency
+igt@i915_pm_rpm@pm-caching
+igt@i915_pm_rpm@pm-tiling
+igt@i915_pm_rpm@system-suspend-modeset
+igt@i915_pm_rpm@universal-planes
+igt@i915_pm_rpm@universal-planes-dpms
-igt@kms_pm_rpm@basic-pci-d3-state
-igt@kms_pm_rpm@basic-rte
-igt@kms_pm_rpm@cursor
-igt@kms_pm_rpm@cursor-dpms
-igt@kms_pm_rpm@dpms-lpsp
-igt@kms_pm_rpm@dpms-mode-unset-lpsp
-igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
-igt@kms_pm_rpm@dpms-non-lpsp
-igt@kms_pm_rpm@drm-resources-equal
-igt@kms_pm_rpm@fences
-igt@kms_pm_rpm@fences-dpms
-igt@kms_pm_rpm@i2c
-igt@kms_pm_rpm@legacy-planes
-igt@kms_pm_rpm@legacy-planes-dpms
-igt@kms_pm_rpm@modeset-lpsp
-igt@kms_pm_rpm@modeset-lpsp-stress
-igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
-igt@kms_pm_rpm@modeset-non-lpsp
-igt@kms_pm_rpm@modeset-non-lpsp-stress
-igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@kms_pm_rpm@modeset-pc8-residency-stress
-igt@kms_pm_rpm@modeset-stress-extra-wait
-igt@kms_pm_rpm@module-reload
-igt@kms_pm_rpm@pc8-residency
-igt@kms_pm_rpm@pm-caching
-igt@kms_pm_rpm@pm-tiling
-igt@kms_pm_rpm@system-suspend-modeset
-igt@kms_pm_rpm@universal-planes
-igt@kms_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/index.html

--===============3463334135300564977==
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
<tr><td><b>Series:</b></td><td>kms_pm_lpsp: Test optimization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124265/">https://patchwork.freedesktop.org/series/124265/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13681 -&gt; IGTPW_9878</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): bat-dg2-14 <br />
  Missing    (2): bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9878 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-adlp-6/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8449">i915#8449</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4309">i915#4309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9878/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7503 -&gt; IGTPW_9878</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13681: b57407d0de043fc22b000a941a404ab103849e06 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9878: 9878<br />
  IGT_7503: 7503</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_rpm@basic-pci-d3-state<br />
+igt@i915_pm_rpm@basic-rte<br />
+igt@i915_pm_rpm@cursor<br />
+igt@i915_pm_rpm@cursor-dpms<br />
+igt@i915_pm_rpm@dpms-lpsp<br />
+igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@i915_pm_rpm@dpms-non-lpsp<br />
+igt@i915_pm_rpm@drm-resources-equal<br />
+igt@i915_pm_rpm@fences<br />
+igt@i915_pm_rpm@fences-dpms<br />
+igt@i915_pm_rpm@i2c<br />
+igt@i915_pm_rpm@legacy-planes<br />
+igt@i915_pm_rpm@legacy-planes-dpms<br />
+igt@i915_pm_rpm@modeset-lpsp<br />
+igt@i915_pm_rpm@modeset-lpsp-stress<br />
+igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@i915_pm_rpm@modeset-non-lpsp<br />
+igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
+igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
+igt@i915_pm_rpm@modeset-stress-extra-wait<br />
+igt@i915_pm_rpm@pc8-residency<br />
+igt@i915_pm_rpm@pm-caching<br />
+igt@i915_pm_rpm@pm-tiling<br />
+igt@i915_pm_rpm@system-suspend-modeset<br />
+igt@i915_pm_rpm@universal-planes<br />
+igt@i915_pm_rpm@universal-planes-dpms<br />
-igt@kms_pm_rpm@basic-pci-d3-state<br />
-igt@kms_pm_rpm@basic-rte<br />
-igt@kms_pm_rpm@cursor<br />
-igt@kms_pm_rpm@cursor-dpms<br />
-igt@kms_pm_rpm@dpms-lpsp<br />
-igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@kms_pm_rpm@dpms-non-lpsp<br />
-igt@kms_pm_rpm@drm-resources-equal<br />
-igt@kms_pm_rpm@fences<br />
-igt@kms_pm_rpm@fences-dpms<br />
-igt@kms_pm_rpm@i2c<br />
-igt@kms_pm_rpm@legacy-planes<br />
-igt@kms_pm_rpm@legacy-planes-dpms<br />
-igt@kms_pm_rpm@modeset-lpsp<br />
-igt@kms_pm_rpm@modeset-lpsp-stress<br />
-igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@kms_pm_rpm@modeset-non-lpsp<br />
-igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
-igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
-igt@kms_pm_rpm@modeset-stress-extra-wait<br />
-igt@kms_pm_rpm@module-reload<br />
-igt@kms_pm_rpm@pc8-residency<br />
-igt@kms_pm_rpm@pm-caching<br />
-igt@kms_pm_rpm@pm-tiling<br />
-igt@kms_pm_rpm@system-suspend-modeset<br />
-igt@kms_pm_rpm@universal-planes<br />
-igt@kms_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============3463334135300564977==--

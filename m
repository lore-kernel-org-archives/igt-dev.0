Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0175423573214459076=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Wed, 26 Apr 2023 11:35:07 -0000
Message-ID: <168250890704.17155.9940268474301308294@emeril.freedesktop.org>
References: <20230426105249.3897491-1-jouni.hogander@intel.com>
In-Reply-To: <20230426105249.3897491-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdGNh?=
 =?utf-8?q?ses_for_dirtyfb_ioctl_=28rev5=29?=
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

--===============0175423573214459076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testcases for dirtyfb ioctl (rev5)
URL   : https://patchwork.freedesktop.org/series/116130/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7271 -> IGTPW_8866
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8866 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8866, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html

Participating hosts (39 -> 37)
------------------------------

  Additional (1): bat-rpls-2 
  Missing    (3): bat-adlp-9 fi-snb-2520m bat-mtlp-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8866:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
Known issues
------------

  Here are the changes found in IGTPW_8866 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-rpls-2:         NOTRUN -> [SKIP][3] ([i915#7456])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@read:
    - bat-rpls-2:         NOTRUN -> [SKIP][4] ([i915#2582]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-rpls-2:         NOTRUN -> [SKIP][5] ([i915#4613]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][6] ([i915#3282])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-rpls-2:         NOTRUN -> [SKIP][7] ([i915#7561])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         NOTRUN -> [FAIL][8] ([i915#7913])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [FAIL][9] ([i915#6997] / [i915#7913])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@i915_selftest@live@slpc.html

  * igt@kms_busy@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][10] ([i915#1845]) +15 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_busy@basic.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-2:         NOTRUN -> [SKIP][11] ([i915#7828]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-rpls-2:         NOTRUN -> [SKIP][12] ([i915#3637]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-rpls-2:         NOTRUN -> [SKIP][13] ([fdo#109285])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#1849])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rpls-2:         NOTRUN -> [SKIP][15] ([i915#1072]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rpls-2:         NOTRUN -> [SKIP][16] ([i915#3555] / [i915#4579])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-rpls-2:         NOTRUN -> [SKIP][17] ([fdo#109295] / [i915#1845] / [i915#3708])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-rpls-2:         NOTRUN -> [SKIP][18] ([fdo#109295] / [i915#3708]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@prime_vgem@basic-fence-read.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      [FAIL][19] ([i915#8383]) -> [FAIL][20] ([i915#7913] / [i915#8383])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][21] ([i915#5354]) -> [SKIP][22] ([i915#1845] / [i915#5354])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8383]: https://gitlab.freedesktop.org/drm/intel/issues/8383


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7271 -> IGTPW_8866

  CI-20190529: 20190529
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html
  IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dirtyfb@dirtyfb-ioctl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html

--===============0175423573214459076==
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
<tr><td><b>Series:</b></td><td>Testcases for dirtyfb ioctl (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116130/">https://patchwork.freedesktop.org/series/116130/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7271 -&gt; IGTPW_8866</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8866 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8866, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Additional (1): bat-rpls-2 <br />
  Missing    (3): bat-adlp-9 fi-snb-2520m bat-mtlp-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8866:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8866 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@i915_selftest@live@slpc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-rpls-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8383">i915#8383</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8383">i915#8383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7271 -&gt; IGTPW_8866</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8866/index.html<br />
  IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dirtyfb@dirtyfb-ioctl</p>

</body>
</html>

--===============0175423573214459076==--

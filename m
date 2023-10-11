Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2509656191679982291=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Wed, 11 Oct 2023 17:16:02 -0000
Message-ID: <169704456278.26514.7214561978205323656@emeril.freedesktop.org>
References: <20231011090937.65903-1-swati2.sharma@intel.com>
In-Reply-To: <20231011090937.65903-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Finvalid=5Fmode=3A_use_pipe=5Fname_followed_by_output=5Fna?=
 =?utf-8?q?me?=
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

--===============2509656191679982291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode: use pipe_name followed by output_name
URL   : https://patchwork.freedesktop.org/series/124950/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7531 -> IGTPW_9974
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9974 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9974, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9974:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - bat-rpls-1:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-rpls-1/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-rpls-1/igt@i915_selftest@live@workarounds.html

  
Known issues
------------

  Here are the changes found in IGTPW_9974 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#7911])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#6645])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#6645])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#5190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - fi-hsw-4770:        NOTRUN -> [SKIP][8] ([fdo#109271]) +11 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#1845] / [i915#4078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][10] ([i915#8841]) +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - fi-hsw-4770:        [INCOMPLETE][12] ([i915#2295]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-hsw-4770/igt@fbdev@read.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@fbdev@read.html

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [DMESG-WARN][14] ([i915#180] / [i915#1982] / [i915#7634] / [i915#8585]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@i915_module_load@reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@i915_module_load@reload.html
    - fi-kbl-soraka:      [DMESG-WARN][16] ([i915#1982]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-kbl-soraka/igt@i915_module_load@reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-apl-guc:         [DMESG-WARN][18] ([i915#180] / [i915#7634] / [i915#8585]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][20] ([i915#9414]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-8/igt@i915_selftest@live@requests.html
    - bat-mtlp-6:         [ABORT][22] ([i915#9414]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [DMESG-WARN][24] ([i915#7634]) -> [PASS][25] +36 other tests pass
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@i915_selftest@live@reset.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-apl-guc:         [DMESG-WARN][26] ([i915#8585] / [i915#8703]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-apl-guc:         [DMESG-WARN][28] ([i915#8585]) -> [PASS][29] +55 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp6:
    - bat-adlp-11:        [DMESG-WARN][30] ([i915#6868]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [DMESG-WARN][32] ([i915#1982] / [i915#8585]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - fi-apl-guc:         [DMESG-WARN][34] ([i915#180] / [i915#8585] / [i915#8703]) -> [PASS][35] +19 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][36] ([i915#8668]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * {igt@kms_pm_rpm@basic-pci-d3-state}:
    - fi-apl-guc:         [DMESG-WARN][38] ([i915#180] / [i915#8585]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7634]: https://gitlab.freedesktop.org/drm/intel/issues/7634
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8703]: https://gitlab.freedesktop.org/drm/intel/issues/8703
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7531 -> IGTPW_9974

  CI-20190529: 20190529
  CI_DRM_13740: 669b963637b5db68eb8ceebb26434706b4689245 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9974: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html
  IGT_7531: 0068652a10bd99c315f777ac61c88382980489e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html

--===============2509656191679982291==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode: use pipe_name followed by output_name</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124950/">https://patchwork.freedesktop.org/series/124950/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7531 -&gt; IGTPW_9974</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9974 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9974, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9974:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-rpls-1/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-rpls-1/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9974 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-hsw-4770/igt@fbdev@read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-hsw-4770/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-mtlp-6/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> +55 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state}:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7531/fi-apl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/fi-apl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7531 -&gt; IGTPW_9974</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13740: 669b963637b5db68eb8ceebb26434706b4689245 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9974: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9974/index.html<br />
  IGT_7531: 0068652a10bd99c315f777ac61c88382980489e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2509656191679982291==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8908649260187112928=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Helen Koike" <helen.koike@collabora.com>
Date: Sun, 08 Oct 2023 23:18:12 -0000
Message-ID: <169680709225.31952.9280246750880146348@emeril.freedesktop.org>
References: <20231008222306.145122-1-helen.koike@collabora.com>
In-Reply-To: <20231008222306.145122-1-helen.koike@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_lib/drmtest=3A_add_igt=5Fdebug_when_fo?=
 =?utf-8?q?rced_and_dev=5Fname_doesn=27t_match?=
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

--===============8908649260187112928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib/drmtest: add igt_debug when forced and dev_name doesn't match
URL   : https://patchwork.freedesktop.org/series/124788/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13725 -> IGTPW_9947
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9947 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9947, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html

Participating hosts (39 -> 18)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_9947 prevented too many machines from booting.

  Additional (1): fi-hsw-4770 
  Missing    (22): bat-adls-5 fi-apl-guc fi-snb-2520m fi-pnv-d510 fi-blb-e6850 fi-skl-6600u bat-dg2-8 fi-ilk-650 bat-adln-1 fi-ivb-3770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-adlp-9 fi-cfl-8700k bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-kbl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_9947 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271]) +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][2] ([i915#1845]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][3] ([i915#8841]) +6 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-adlp-6:         [DMESG-WARN][5] ([i915#1982] / [i915#8449]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13725/bat-adlp-6/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/bat-adlp-6/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7519 -> IGTPW_9947

  CI-20190529: 20190529
  CI_DRM_13725: fe09b9f4c1435d9ce59b4729994b86a856db852f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9947: 9947
  IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html

--===============8908649260187112928==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib/drmtest: add igt_debug when forced and dev_name doesn&#39;t match</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124788/">https://patchwork.freedesktop.org/series/124788/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13725 -&gt; IGTPW_9947</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9947 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9947, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html</p>
<h2>Participating hosts (39 -&gt; 18)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_9947 prevented too many machines from booting.</p>
<p>Additional (1): fi-hsw-4770 <br />
  Missing    (22): bat-adls-5 fi-apl-guc fi-snb-2520m fi-pnv-d510 fi-blb-e6850 fi-skl-6600u bat-dg2-8 fi-ilk-650 bat-adln-1 fi-ivb-3770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-adlp-9 fi-cfl-8700k bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-kbl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9947 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13725/bat-adlp-6/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8449">i915#8449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/bat-adlp-6/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7519 -&gt; IGTPW_9947</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13725: fe09b9f4c1435d9ce59b4729994b86a856db852f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9947: 9947<br />
  IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8908649260187112928==--

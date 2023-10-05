Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0369429126984517164=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 05 Oct 2023 16:24:43 -0000
Message-ID: <169652308385.7514.8772629140547412728@emeril.freedesktop.org>
References: <20231005125948.2986826-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231005125948.2986826-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVXBkYXRl?=
 =?utf-8?q?_XE_blocklist_=28rev2=29?=
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

--===============0369429126984517164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update XE blocklist (rev2)
URL   : https://patchwork.freedesktop.org/series/123650/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13718 -> IGTPW_9926
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9926 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271]) +12 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:
    - bat-adlp-11:        [PASS][2] -> [ABORT][3] ([i915#6868] / [i915#8668])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [PASS][4] -> [FAIL][5] ([i915#9047]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][6] ([i915#8841]) +6 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][8] ([i915#7911]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][10] ([i915#7952]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [ABORT][12] ([i915#8668] / [i915#9451]) -> [FAIL][13] ([i915#9047])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9047]: https://gitlab.freedesktop.org/drm/intel/issues/9047
  [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7516 -> IGTPW_9926

  CI-20190529: 20190529
  CI_DRM_13718: ff156e29dbcb3a7b1833ce98e10a43b70eaead1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9926: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html

--===============0369429126984517164==
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
<tr><td><b>Series:</b></td><td>Update XE blocklist (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123650/">https://patchwork.freedesktop.org/series/123650/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13718 -&gt; IGTPW_9926</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9926 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13718/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9451">i915#9451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7516 -&gt; IGTPW_9926</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13718: ff156e29dbcb3a7b1833ce98e10a43b70eaead1d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9926: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9926/index.html<br />
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============0369429126984517164==--

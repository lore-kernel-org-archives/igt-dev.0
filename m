Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7451579793322377703=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 07 Sep 2023 23:20:04 -0000
Message-ID: <169412880429.17903.5651966969745409414@emeril.freedesktop.org>
References: <20230830214719.113454-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230830214719.113454-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtLXVh?=
 =?utf-8?q?pi/xe=5Fdrm=3A_Remove_max=5Fpage=5Fsize_and_align_with_latest_u?=
 =?utf-8?b?YXBpLiAocmV2Mik=?=
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

--===============7451579793322377703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe_drm: Remove max_page_size and align with latest uapi. (rev2)
URL   : https://patchwork.freedesktop.org/series/123083/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13611 -> IGTPW_9747
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): fi-bsw-nick 
  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9747 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-atsm-1:         NOTRUN -> [DMESG-WARN][1] ([i915#8841]) +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - bat-atsm-1:         NOTRUN -> [DMESG-WARN][2] ([i915#8504] / [i915#8841])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][3] ([fdo#109271]) +18 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        NOTRUN -> [ABORT][4] ([i915#7911] / [i915#7913])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-atsm-1:         NOTRUN -> [SKIP][5] ([i915#6645])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        NOTRUN -> [FAIL][6] ([i915#9276])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-bsw-nick:        NOTRUN -> [FAIL][7] ([IGT#3])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#1836])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13611/fi-kbl-soraka/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@migrate:
    - bat-mtlp-8:         [DMESG-FAIL][11] ([i915#7699]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13611/bat-mtlp-8/igt@i915_selftest@live@migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-mtlp-8/igt@i915_selftest@live@migrate.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8504]: https://gitlab.freedesktop.org/drm/intel/issues/8504
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7474 -> IGTPW_9747

  CI-20190529: 20190529
  CI_DRM_13611: ab5d6b20de6b1a3e23dd5b7cb46c56d538e7e3ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9747: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_backlight@bad-brightness
+igt@i915_pm_backlight@basic-brightness
+igt@i915_pm_backlight@fade
+igt@i915_pm_backlight@fade-with-dpms
+igt@i915_pm_backlight@fade-with-suspend
+igt@i915_pm_dc@dc3co-vpb-simulation
+igt@i915_pm_dc@dc5-dpms
+igt@i915_pm_dc@dc5-dpms-negative
+igt@i915_pm_dc@dc5-psr
+igt@i915_pm_dc@dc6-dpms
+igt@i915_pm_dc@dc6-psr
+igt@i915_pm_dc@dc9-dpms
+igt@i915_pm_lpsp@kms-lpsp
+igt@i915_pm_lpsp@screens-disabled
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
-igt@kms_pm_backlight@bad-brightness
-igt@kms_pm_backlight@basic-brightness
-igt@kms_pm_backlight@fade
-igt@kms_pm_backlight@fade-with-dpms
-igt@kms_pm_backlight@fade-with-suspend
-igt@kms_pm_dc@dc3co-vpb-simulation
-igt@kms_pm_dc@dc5-dpms
-igt@kms_pm_dc@dc5-dpms-negative
-igt@kms_pm_dc@dc5-psr
-igt@kms_pm_dc@dc6-dpms
-igt@kms_pm_dc@dc6-psr
-igt@kms_pm_dc@dc9-dpms
-igt@kms_pm_lpsp@kms-lpsp
-igt@kms_pm_lpsp@screens-disabled
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
-igt@kms_pm_rpm@pc8-residency
-igt@kms_pm_rpm@pm-caching
-igt@kms_pm_rpm@pm-tiling
-igt@kms_pm_rpm@system-suspend-modeset
-igt@kms_pm_rpm@universal-planes
-igt@kms_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html

--===============7451579793322377703==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe_drm: Remove max_page_size and align with latest uapi. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123083/">https://patchwork.freedesktop.org/series/123083/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13611 -&gt; IGTPW_9747</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): fi-bsw-nick <br />
  Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9747 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8504">i915#8504</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-bsw-nick/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13611/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13611/bat-mtlp-8/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/bat-mtlp-8/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7474 -&gt; IGTPW_9747</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13611: ab5d6b20de6b1a3e23dd5b7cb46c56d538e7e3ea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9747: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9747/index.html<br />
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_backlight@bad-brightness<br />
+igt@i915_pm_backlight@basic-brightness<br />
+igt@i915_pm_backlight@fade<br />
+igt@i915_pm_backlight@fade-with-dpms<br />
+igt@i915_pm_backlight@fade-with-suspend<br />
+igt@i915_pm_dc@dc3co-vpb-simulation<br />
+igt@i915_pm_dc@dc5-dpms<br />
+igt@i915_pm_dc@dc5-dpms-negative<br />
+igt@i915_pm_dc@dc5-psr<br />
+igt@i915_pm_dc@dc6-dpms<br />
+igt@i915_pm_dc@dc6-psr<br />
+igt@i915_pm_dc@dc9-dpms<br />
+igt@i915_pm_lpsp@kms-lpsp<br />
+igt@i915_pm_lpsp@screens-disabled<br />
+igt@i915_pm_rpm@basic-pci-d3-state<br />
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
-igt@kms_pm_backlight@bad-brightness<br />
-igt@kms_pm_backlight@basic-brightness<br />
-igt@kms_pm_backlight@fade<br />
-igt@kms_pm_backlight@fade-with-dpms<br />
-igt@kms_pm_backlight@fade-with-suspend<br />
-igt@kms_pm_dc@dc3co-vpb-simulation<br />
-igt@kms_pm_dc@dc5-dpms<br />
-igt@kms_pm_dc@dc5-dpms-negative<br />
-igt@kms_pm_dc@dc5-psr<br />
-igt@kms_pm_dc@dc6-dpms<br />
-igt@kms_pm_dc@dc6-psr<br />
-igt@kms_pm_dc@dc9-dpms<br />
-igt@kms_pm_lpsp@kms-lpsp<br />
-igt@kms_pm_lpsp@screens-disabled<br />
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
-igt@kms_pm_rpm@pc8-residency<br />
-igt@kms_pm_rpm@pm-caching<br />
-igt@kms_pm_rpm@pm-tiling<br />
-igt@kms_pm_rpm@system-suspend-modeset<br />
-igt@kms_pm_rpm@universal-planes<br />
-igt@kms_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============7451579793322377703==--

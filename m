Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7311084426727147621=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 05 Oct 2023 15:15:09 -0000
Message-ID: <169651890952.7512.3159366061319282137@emeril.freedesktop.org>
References: <20231005115415.2951265-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231005115415.2951265-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/pm=3A_Separate_display_specific_tests_from_i915=5Fpm=5Frp?=
 =?utf-8?q?m_=28rev3=29?=
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

--===============7311084426727147621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/pm: Separate display specific tests from i915_pm_rpm (rev3)
URL   : https://patchwork.freedesktop.org/series/123750/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13717 -> IGTPW_9925
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9925:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - {bat-dg2-14}:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-14/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-adls-5:         NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adls-5/igt@kms_pm_rpm@module-reload.html
    - fi-apl-guc:         NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-apl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-dg1-5:          NOTRUN -> [WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg1-5/igt@kms_pm_rpm@module-reload.html
    - bat-jsl-3:          NOTRUN -> [WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-jsl-3/igt@kms_pm_rpm@module-reload.html
    - fi-glk-j4005:       NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html
    - bat-adlp-9:         NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-9/igt@kms_pm_rpm@module-reload.html
    - fi-skl-guc:         NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-skl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-11:         NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-11/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8109u:       NOTRUN -> [WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-nick:        NOTRUN -> [WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-bsw-nick/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-guc:         NOTRUN -> [WARN][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-kbl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-adlm-1:         NOTRUN -> [WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlm-1/igt@kms_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      NOTRUN -> [WARN][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-n3050:       NOTRUN -> [WARN][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-guc:         NOTRUN -> [WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-cfl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-6:         NOTRUN -> [WARN][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-9:          NOTRUN -> [WARN][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-9/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-x1275:       NOTRUN -> [WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-kbl-x1275/igt@kms_pm_rpm@module-reload.html
    - fi-hsw-4770:        NOTRUN -> [WARN][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-hsw-4770/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-8:         NOTRUN -> [WARN][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html
    - bat-jsl-1:          NOTRUN -> [WARN][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-jsl-1/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8700k:       NOTRUN -> [WARN][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-cfl-8700k/igt@kms_pm_rpm@module-reload.html
    - bat-rpls-1:         NOTRUN -> [WARN][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-rpls-1/igt@kms_pm_rpm@module-reload.html
    - bat-kbl-2:          NOTRUN -> [WARN][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-kbl-2/igt@kms_pm_rpm@module-reload.html
    - fi-rkl-11600:       NOTRUN -> [WARN][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-rkl-11600/igt@kms_pm_rpm@module-reload.html
    - fi-skl-6600u:       NOTRUN -> [WARN][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-skl-6600u/igt@kms_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13717 and IGTPW_9925:

### New IGT tests (3) ###

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 abort(s) 1 incomplete(s) 26 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-rte:
    - Statuses : 26 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@module-reload:
    - Statuses : 6 skip(s) 26 warn(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9925 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset@b-dp6:
    - bat-adlp-11:        [PASS][28] -> [DMESG-FAIL][29] ([i915#6868])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp6:
    - bat-adlp-11:        [PASS][30] -> [FAIL][31] ([i915#6121]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp6.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-11:        NOTRUN -> [SKIP][32] ([i915#3637])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        NOTRUN -> [ABORT][33] ([i915#8668] / [i915#9451])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - bat-adln-1:         NOTRUN -> [ABORT][34] ([i915#8668])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][35] ([fdo#109271]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][36] ([fdo#109271]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         NOTRUN -> [SKIP][37] ([fdo#109271]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][38] ([fdo#109271]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-blb-e6850/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@basic-rte} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][39] ([i915#6078]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-atsm-1/igt@kms_pm_rpm@basic-rte.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][40] ([fdo#109271]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-dg2-11:         [INCOMPLETE][41] ([i915#9253]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [DMESG-FAIL][43] ([i915#7913]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][45] ([IGT#3]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:
    - bat-adlp-11:        [DMESG-FAIL][47] ([i915#6868]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:
    - bat-adlp-11:        [ABORT][49] ([i915#8668]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9253]: https://gitlab.freedesktop.org/drm/intel/issues/9253
  [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7516 -> IGTPW_9925

  CI-20190529: 20190529
  CI_DRM_13717: ba043ea3baa7d6cd98262e865f903bf9016a8a5e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9925: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pm_rpm@basic-pci-d3-state
+igt@kms_pm_rpm@basic-rte
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
+igt@kms_pm_rpm@dpms-non-lpsp
+igt@kms_pm_rpm@drm-resources-equal
+igt@kms_pm_rpm@fences
+igt@kms_pm_rpm@fences-dpms
+igt@kms_pm_rpm@i2c
+igt@kms_pm_rpm@legacy-planes
+igt@kms_pm_rpm@legacy-planes-dpms
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-non-lpsp
+igt@kms_pm_rpm@modeset-non-lpsp-stress
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-pc8-residency-stress
+igt@kms_pm_rpm@modeset-stress-extra-wait
+igt@kms_pm_rpm@module-reload
+igt@kms_pm_rpm@pc8-residency
+igt@kms_pm_rpm@pm-caching
+igt@kms_pm_rpm@pm-tiling
+igt@kms_pm_rpm@system-suspend-modeset
+igt@kms_pm_rpm@universal-planes
+igt@kms_pm_rpm@universal-planes-dpms
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
-igt@i915_pm_rpm@cursor
-igt@i915_pm_rpm@cursor-dpms
-igt@i915_pm_rpm@dpms-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
-igt@i915_pm_rpm@dpms-non-lpsp
-igt@i915_pm_rpm@drm-resources-equal
-igt@i915_pm_rpm@fences
-igt@i915_pm_rpm@fences-dpms
-igt@i915_pm_rpm@i2c
-igt@i915_pm_rpm@legacy-planes
-igt@i915_pm_rpm@legacy-planes-dpms
-igt@i915_pm_rpm@modeset-lpsp
-igt@i915_pm_rpm@modeset-lpsp-stress
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-non-lpsp
-igt@i915_pm_rpm@modeset-non-lpsp-stress
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-pc8-residency-stress
-igt@i915_pm_rpm@modeset-stress-extra-wait
-igt@i915_pm_rpm@pc8-residency
-igt@i915_pm_rpm@pm-caching
-igt@i915_pm_rpm@pm-tiling
-igt@i915_pm_rpm@system-suspend-modeset
-igt@i915_pm_rpm@universal-planes
-igt@i915_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html

--===============7311084426727147621==
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
<tr><td><b>Series:</b></td><td>tests/intel/pm: Separate display specific tests from i915_pm_rpm (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123750/">https://patchwork.freedesktop.org/series/123750/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13717 -&gt; IGTPW_9925</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9925:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-14/igt@kms_pm_rpm@basic-pci-d3-state.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adls-5/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-apl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg1-5/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-jsl-3/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-9/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-skl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-11/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-bsw-nick/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-kbl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlm-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-cfl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-9/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-kbl-x1275/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-hsw-4770/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-jsl-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-cfl-8700k/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-rpls-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-kbl-2/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-rkl-11600/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-skl-6600u/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13717 and IGTPW_9925:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 1 abort(s) 1 incomplete(s) 26 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 26 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 6 skip(s) 26 warn(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9925 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9451">i915#9451</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-blb-e6850/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-rte} (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-atsm-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9253">i915#9253</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7516 -&gt; IGTPW_9925</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13717: ba043ea3baa7d6cd98262e865f903bf9016a8a5e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9925: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9925/index.html<br />
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pm_rpm@basic-pci-d3-state<br />
+igt@kms_pm_rpm@basic-rte<br />
+igt@kms_pm_rpm@cursor<br />
+igt@kms_pm_rpm@cursor-dpms<br />
+igt@kms_pm_rpm@dpms-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@kms_pm_rpm@dpms-non-lpsp<br />
+igt@kms_pm_rpm@drm-resources-equal<br />
+igt@kms_pm_rpm@fences<br />
+igt@kms_pm_rpm@fences-dpms<br />
+igt@kms_pm_rpm@i2c<br />
+igt@kms_pm_rpm@legacy-planes<br />
+igt@kms_pm_rpm@legacy-planes-dpms<br />
+igt@kms_pm_rpm@modeset-lpsp<br />
+igt@kms_pm_rpm@modeset-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-non-lpsp<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
+igt@kms_pm_rpm@modeset-stress-extra-wait<br />
+igt@kms_pm_rpm@module-reload<br />
+igt@kms_pm_rpm@pc8-residency<br />
+igt@kms_pm_rpm@pm-caching<br />
+igt@kms_pm_rpm@pm-tiling<br />
+igt@kms_pm_rpm@system-suspend-modeset<br />
+igt@kms_pm_rpm@universal-planes<br />
+igt@kms_pm_rpm@universal-planes-dpms<br />
-igt@i915_pm_rpm@basic-pci-d3-state<br />
-igt@i915_pm_rpm@basic-rte<br />
-igt@i915_pm_rpm@cursor<br />
-igt@i915_pm_rpm@cursor-dpms<br />
-igt@i915_pm_rpm@dpms-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@i915_pm_rpm@dpms-non-lpsp<br />
-igt@i915_pm_rpm@drm-resources-equal<br />
-igt@i915_pm_rpm@fences<br />
-igt@i915_pm_rpm@fences-dpms<br />
-igt@i915_pm_rpm@i2c<br />
-igt@i915_pm_rpm@legacy-planes<br />
-igt@i915_pm_rpm@legacy-planes-dpms<br />
-igt@i915_pm_rpm@modeset-lpsp<br />
-igt@i915_pm_rpm@modeset-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-non-lpsp<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
-igt@i915_pm_rpm@modeset-stress-extra-wait<br />
-igt@i915_pm_rpm@pc8-residency<br />
-igt@i915_pm_rpm@pm-caching<br />
-igt@i915_pm_rpm@pm-tiling<br />
-igt@i915_pm_rpm@system-suspend-modeset<br />
-igt@i915_pm_rpm@universal-planes<br />
-igt@i915_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============7311084426727147621==--

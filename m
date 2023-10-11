Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5706727711409806186=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 11 Oct 2023 20:16:17 -0000
Message-ID: <169705537753.26513.17955136376572677811@emeril.freedesktop.org>
References: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/pm=3A_Separate_display_specific_tests_from_i915=5Fpm=5Frp?=
 =?utf-8?q?m_=28rev4=29?=
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

--===============5706727711409806186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/pm: Separate display specific tests from i915_pm_rpm (rev4)
URL   : https://patchwork.freedesktop.org/series/123750/
State : success

== Summary ==

CI Bug Log - changes from IGT_7532 -> IGTPW_9978
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9978:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-adls-5:         NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adls-5/igt@kms_pm_rpm@module-reload.html
    - bat-dg1-5:          NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-dg1-5/igt@kms_pm_rpm@module-reload.html
    - bat-jsl-3:          NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-jsl-3/igt@kms_pm_rpm@module-reload.html
    - fi-glk-j4005:       NOTRUN -> [WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html
    - bat-adlp-9:         NOTRUN -> [WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-9/igt@kms_pm_rpm@module-reload.html
    - fi-skl-guc:         NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-skl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-11:         NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-dg2-11/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8109u:       NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-nick:        NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-nick/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-guc:         NOTRUN -> [WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-kbl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-adlm-1:         NOTRUN -> [WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlm-1/igt@kms_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      NOTRUN -> [WARN][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html
    - fi-bsw-n3050:       NOTRUN -> [WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-guc:         NOTRUN -> [WARN][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-cfl-guc/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-6:         NOTRUN -> [WARN][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html
    - bat-dg2-9:          NOTRUN -> [WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-dg2-9/igt@kms_pm_rpm@module-reload.html
    - fi-kbl-x1275:       NOTRUN -> [WARN][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-kbl-x1275/igt@kms_pm_rpm@module-reload.html
    - bat-mtlp-8:         NOTRUN -> [WARN][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html
    - bat-jsl-1:          NOTRUN -> [WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-jsl-1/igt@kms_pm_rpm@module-reload.html
    - fi-cfl-8700k:       NOTRUN -> [WARN][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-cfl-8700k/igt@kms_pm_rpm@module-reload.html
    - bat-rpls-1:         NOTRUN -> [WARN][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-rpls-1/igt@kms_pm_rpm@module-reload.html
    - bat-kbl-2:          NOTRUN -> [WARN][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-kbl-2/igt@kms_pm_rpm@module-reload.html
    - fi-rkl-11600:       NOTRUN -> [WARN][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-rkl-11600/igt@kms_pm_rpm@module-reload.html
    - fi-skl-6600u:       NOTRUN -> [WARN][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-skl-6600u/igt@kms_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between IGT_7532 and IGTPW_9978:

### New IGT tests (1) ###

  * igt@kms_pm_rpm@module-reload:
    - Statuses : 1 dmesg-warn(s) 5 skip(s) 24 warn(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9978 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][25] ([fdo#109271]) +18 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [PASS][26] -> [DMESG-WARN][27] ([i915#180] / [i915#1982] / [i915#7634] / [i915#8585])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_module_load@reload.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-apl-guc:         [PASS][28] -> [DMESG-WARN][29] ([i915#180] / [i915#7634] / [i915#8585]) +2 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [PASS][30] -> [INCOMPLETE][31] ([i915#9413])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][32] -> [ABORT][33] ([i915#9414])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [PASS][34] -> [DMESG-WARN][35] ([i915#7634]) +35 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_selftest@live@reset.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [PASS][36] -> [DMESG-WARN][37] ([i915#8585]) +39 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-apl-guc:         [PASS][38] -> [DMESG-WARN][39] ([i915#180] / [i915#8585] / [i915#8703]) +37 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [PASS][40] -> [DMESG-WARN][41] ([i915#180] / [i915#1982] / [i915#8585] / [i915#8703])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][42] ([IGT#3])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [PASS][43] -> [ABORT][44] ([i915#8668])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - fi-apl-guc:         NOTRUN -> [DMESG-WARN][45] ([i915#180] / [i915#1982] / [i915#7634] / [i915#8585])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_pm_rpm@module-reload.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][46] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][47] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-ivb-3770/igt@kms_pm_rpm@module-reload.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][48] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-elk-e7500/igt@kms_pm_rpm@module-reload.html
    - fi-ilk-650:         NOTRUN -> [SKIP][49] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-ilk-650/igt@kms_pm_rpm@module-reload.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][50] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-blb-e6850/igt@kms_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@a-dp6:
    - bat-adlp-11:        [DMESG-WARN][51] ([i915#6868]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [ABORT][53] ([i915#8668] / [i915#9451]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][55] ([i915#5334]) -> [DMESG-WARN][56] ([i915#7634])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7634]: https://gitlab.freedesktop.org/drm/intel/issues/7634
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8703]: https://gitlab.freedesktop.org/drm/intel/issues/8703
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
  [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7532 -> IGTPW_9978

  CI-20190529: 20190529
  CI_DRM_13740: 669b963637b5db68eb8ceebb26434706b4689245 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pm_rpm@module-reload

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html

--===============5706727711409806186==
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
<tr><td><b>Series:</b></td><td>tests/intel/pm: Separate display specific tests from i915_pm_rpm (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123750/">https://patchwork.freedesktop.org/series/123750/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7532 -&gt; IGTPW_9978</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9978:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adls-5/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-dg1-5/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-jsl-3/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-9/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-skl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-dg2-11/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-cfl-8109u/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-nick/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-kbl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlm-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-tgl-1115g4/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-n3050/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-cfl-guc/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-mtlp-6/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-dg2-9/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-kbl-x1275/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-mtlp-8/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-jsl-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-cfl-8700k/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-rpls-1/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-kbl-2/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-rkl-11600/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-skl-6600u/igt@kms_pm_rpm@module-reload.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7532 and IGTPW_9978:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pm_rpm@module-reload:<ul>
<li>Statuses : 1 dmesg-warn(s) 5 skip(s) 24 warn(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9978 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a>) +35 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +39 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@kms_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-pnv-d510/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-ivb-3770/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-elk-e7500/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-ilk-650/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-blb-e6850/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@a-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9451">i915#9451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7532/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7532 -&gt; IGTPW_9978</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13740: 669b963637b5db68eb8ceebb26434706b4689245 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9978/index.html<br />
  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pm_rpm@module-reload</p>

</body>
</html>

--===============5706727711409806186==--

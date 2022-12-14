Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4509953786939106727=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Wed, 14 Dec 2022 04:30:48 -0000
Message-ID: <167099224807.8286.8253126010672485093@emeril.freedesktop.org>
References: <20221214030951.2424386-1-ashutosh.dixit@intel.com>
In-Reply-To: <20221214030951.2424386-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhwmon=3A_General_verification_of_hwmon_attributes_=28rev4?=
 =?utf-8?q?=29?=
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

--===============4509953786939106727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_hwmon: General verification of hwmon attributes (rev4)
URL   : https://patchwork.freedesktop.org/series/111833/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12502 -> IGTPW_8227
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html

Participating hosts (39 -> 18)
------------------------------

  Missing    (21): fi-kbl-soraka fi-rkl-11600 bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-rpls-1 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adln-1 bat-jsl-3 bat-rplp-1 bat-dg2-11 fi-bsw-nick bat-dg1-7 bat-kbl-2 bat-adlp-9 bat-jsl-1 bat-adlp-4 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8227:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_hwmon@hwmon-read} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-adl-ddr5/igt@i915_hwmon@hwmon-read.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-ehl-2/igt@i915_hwmon@hwmon-read.html

  * {igt@i915_hwmon@hwmon-write} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-jsl-1/igt@i915_hwmon@hwmon-write.html
    - fi-icl-u2:          NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-icl-u2/igt@i915_hwmon@hwmon-write.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-rkl-guc/igt@i915_hwmon@hwmon-write.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12502 and IGTPW_8227:

### New IGT tests (2) ###

  * igt@i915_hwmon@hwmon-read:
    - Statuses : 18 skip(s)
    - Exec time: [0.0] s

  * igt@i915_hwmon@hwmon-write:
    - Statuses : 18 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8227 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-icl-u2:          [PASS][6] -> [DMESG-WARN][7] ([i915#1982])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html

  * {igt@i915_hwmon@hwmon-read} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-elk-e7500/igt@i915_hwmon@hwmon-read.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][9] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-bsw-kefka/igt@i915_hwmon@hwmon-read.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-cfl-guc/igt@i915_hwmon@hwmon-read.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-hsw-4770/igt@i915_hwmon@hwmon-read.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-ivb-3770/igt@i915_hwmon@hwmon-read.html

  * {igt@i915_hwmon@hwmon-write} (NEW):
    - fi-snb-2600:        NOTRUN -> [SKIP][13] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-snb-2600/igt@i915_hwmon@hwmon-write.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-bdw-gvtdvm/igt@i915_hwmon@hwmon-write.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-pnv-d510/igt@i915_hwmon@hwmon-write.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-glk-j4005/igt@i915_hwmon@hwmon-write.html
    - fi-skl-guc:         NOTRUN -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-skl-guc/igt@i915_hwmon@hwmon-write.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-skl-6700k2/igt@i915_hwmon@hwmon-write.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-kbl-7567u/igt@i915_hwmon@hwmon-write.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-kbl-8809g/igt@i915_hwmon@hwmon-write.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][21] ([fdo#109271] / [fdo#111827])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][22] ([fdo#111827])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [INCOMPLETE][23] ([i915#4983]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][25] ([i915#4785]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [FAIL][27] ([i915#6298]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7092 -> IGTPW_8227

  CI-20190529: 20190529
  CI_DRM_12502: cc44a1e87ea6b788868878295119398966f98a81 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8227: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html
  IGT_7092: 59e3bf83f6bae0918276f880f969a10d279c657a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_hwmon@hwmon-read
+igt@i915_hwmon@hwmon-write
+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+igt@kms_bw@linear-tiling-1-displays-2560x1440p
+igt@kms_bw@linear-tiling-1-displays-3840x2160p
+igt@kms_bw@linear-tiling-2-displays-1920x1080p
+igt@kms_bw@linear-tiling-2-displays-2560x1440p
+igt@kms_bw@linear-tiling-2-displays-3840x2160p
+igt@kms_bw@linear-tiling-3-displays-1920x1080p
+igt@kms_bw@linear-tiling-3-displays-2560x1440p
+igt@kms_bw@linear-tiling-3-displays-3840x2160p
+igt@kms_bw@linear-tiling-4-displays-1920x1080p
+igt@kms_bw@linear-tiling-4-displays-2560x1440p
+igt@kms_bw@linear-tiling-4-displays-3840x2160p
+igt@kms_bw@linear-tiling-5-displays-1920x1080p
+igt@kms_bw@linear-tiling-5-displays-2560x1440p
+igt@kms_bw@linear-tiling-5-displays-3840x2160p
+igt@kms_bw@linear-tiling-6-displays-1920x1080p
+igt@kms_bw@linear-tiling-6-displays-2560x1440p
+igt@kms_bw@linear-tiling-6-displays-3840x2160p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html

--===============4509953786939106727==
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
<tr><td><b>Series:</b></td><td>i915/i915_hwmon: General verification of hwmon attributes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111833/">https://patchwork.freedesktop.org/series/111833/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12502 -&gt; IGTPW_8227</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html</p>
<h2>Participating hosts (39 -&gt; 18)</h2>
<p>Missing    (21): fi-kbl-soraka fi-rkl-11600 bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-rpls-1 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adln-1 bat-jsl-3 bat-rplp-1 bat-dg2-11 fi-bsw-nick bat-dg1-7 bat-kbl-2 bat-adlp-9 bat-jsl-1 bat-adlp-4 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8227:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_hwmon@hwmon-read} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-adl-ddr5/igt@i915_hwmon@hwmon-read.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-ehl-2/igt@i915_hwmon@hwmon-read.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_hwmon@hwmon-write} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-jsl-1/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-icl-u2/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-rkl-guc/igt@i915_hwmon@hwmon-write.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12502 and IGTPW_8227:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>Statuses : 18 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-write:</p>
<ul>
<li>Statuses : 18 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8227 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>{igt@i915_hwmon@hwmon-read} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-elk-e7500/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-bsw-kefka/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-cfl-guc/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-hsw-4770/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-ivb-3770/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_hwmon@hwmon-write} (NEW):</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-snb-2600/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-bdw-gvtdvm/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-pnv-d510/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-glk-j4005/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-skl-guc/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-skl-6700k2/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-kbl-7567u/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-kbl-8809g/igt@i915_hwmon@hwmon-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12502/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7092 -&gt; IGTPW_8227</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12502: cc44a1e87ea6b788868878295119398966f98a81 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8227: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8227/index.html<br />
  IGT_7092: 59e3bf83f6bae0918276f880f969a10d279c657a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_hwmon@hwmon-read<br />
+igt@i915_hwmon@hwmon-write<br />
+igt@kms_bw@linear-tiling-1-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-1-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-1-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-2-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-2-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-2-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-3-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-3-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-3-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-4-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-4-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-4-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-5-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-5-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-5-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-6-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-6-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-6-displays-3840x2160p</p>

</body>
</html>

--===============4509953786939106727==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2248043748911607164=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 07 Sep 2023 17:25:38 -0000
Message-ID: <169410753874.17900.1523039141163099815@emeril.freedesktop.org>
References: <20230907153826.1281037-1-swati2.sharma@intel.com>
In-Reply-To: <20230907153826.1281037-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/intel-ci=3A_drop_drrs_te?=
 =?utf-8?q?sts_from_blocklist?=
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

--===============2248043748911607164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/intel-ci: drop drrs tests from blocklist
URL   : https://patchwork.freedesktop.org/series/123400/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13609 -> IGTPW_9743
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9743 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9743, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html

Participating hosts (22 -> 40)
------------------------------

  Additional (20): fi-apl-guc fi-pnv-d510 fi-blb-e6850 fi-skl-6600u fi-ilk-650 fi-hsw-4770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-kbl-2 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-mtlp-6 bat-adlp-11 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-kbl-8809g 
  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9743:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - bat-adlp-9:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-adln-1:         NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adln-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-mtlp-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-dg2-8:          NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-adlm-1:         NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlm-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-jsl-1:          NOTRUN -> [SKIP][6] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-jsl-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-adlp-6:         NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-rplp-1:         NOTRUN -> [SKIP][9] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-rplp-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-rkl-11600/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-rpls-1:         NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-rpls-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-adls-5:         NOTRUN -> [SKIP][12] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adls-5/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-dg1-5:          NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg1-5/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-mtlp-6/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-jsl-3:          NOTRUN -> [SKIP][15] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-jsl-3/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:
    - bat-dg2-9:          NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html
    - bat-dg2-11:         NOTRUN -> [SKIP][17] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html
    - bat-adlp-11:        NOTRUN -> [SKIP][18] +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlp-11/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_9743 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-cfl-8109u/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-kbl-7567u:       NOTRUN -> [ABORT][20] ([i915#8913])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-7567u/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][21] ([fdo#109271]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-8809g/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-skl-guc:         NOTRUN -> [SKIP][22] ([fdo#109271]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-skl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][23] ([fdo#109271]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-ivb-3770/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][24] ([fdo#109271]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-elk-e7500/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][25] ([fdo#109271]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][26] ([fdo#109271]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-cfl-8700k/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-ilk-650:         NOTRUN -> [SKIP][27] ([fdo#109271]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-ilk-650/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][28] ([fdo#109271]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-blb-e6850/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][29] ([fdo#109271]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-bsw-nick/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-kbl-2:          NOTRUN -> [SKIP][30] ([fdo#109271]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-kbl-2/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][31] ([fdo#109271]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-bsw-n3050/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-apl-guc:         NOTRUN -> [SKIP][32] ([fdo#109271]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-apl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][33] ([fdo#109271]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-cfl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-skl-6600u/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - bat-atsm-1:         NOTRUN -> [SKIP][35] ([i915#6078]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-atsm-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][36] ([fdo#109271]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-pnv-d510/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][37] ([fdo#109271]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][38] ([fdo#109271]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-glk-j4005/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@psrdrrs-1p-rte:
    - fi-hsw-4770:        NOTRUN -> [SKIP][39] ([fdo#109271]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-hsw-4770/igt@kms_frontbuffer_tracking@psrdrrs-1p-rte.html

  
#### Possible fixes ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][40] ([i915#7952]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8913]: https://gitlab.freedesktop.org/drm/intel/issues/8913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7474 -> IGTPW_9743

  CI-20190529: 20190529
  CI_DRM_13609: 1b25a43002e4409156a9b3aa1cb8c08eb4dd343d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9743: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@feature_discovery@chamelium
+igt@feature_discovery@display
+igt@feature_discovery@display-2x
+igt@feature_discovery@display-3x
+igt@feature_discovery@display-4x
+igt@feature_discovery@psr1
+igt@feature_discovery@psr2
-igt@kms_feature_discovery@chamelium
-igt@kms_feature_discovery@display
-igt@kms_feature_discovery@display-2x
-igt@kms_feature_discovery@display-3x
-igt@kms_feature_discovery@display-4x
-igt@kms_feature_discovery@dp-mst
-igt@kms_feature_discovery@psr1
-igt@kms_feature_discovery@psr2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html

--===============2248043748911607164==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/intel-ci: drop drrs tests from blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123400/">https://patchwork.freedesktop.org/series/123400/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13609 -&gt; IGTPW_9743</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9743 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9743, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html</p>
<h2>Participating hosts (22 -&gt; 40)</h2>
<p>Additional (20): fi-apl-guc fi-pnv-d510 fi-blb-e6850 fi-skl-6600u fi-ilk-650 fi-hsw-4770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-kbl-2 bat-adlp-9 fi-skl-guc fi-cfl-8700k fi-glk-j4005 bat-mtlp-6 bat-adlp-11 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-kbl-8809g <br />
  Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9743:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adln-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-mtlp-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlm-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-jsl-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-rplp-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-rkl-11600/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-rpls-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adls-5/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg1-5/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-mtlp-6/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-jsl-3/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-9/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-11/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-adlp-11/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9743 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-cfl-8109u/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-7567u/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-8809g/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-skl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-ivb-3770/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-elk-e7500/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-cfl-8700k/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-ilk-650/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-blb-e6850/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-bsw-nick/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-kbl-2/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-bsw-n3050/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-apl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-cfl-guc/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-skl-6600u/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-atsm-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-pnv-d510/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-glk-j4005/igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-1p-rte:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/fi-hsw-4770/igt@kms_frontbuffer_tracking@psrdrrs-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-read:<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13609/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7474 -&gt; IGTPW_9743</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13609: 1b25a43002e4409156a9b3aa1cb8c08eb4dd343d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9743: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9743/index.html<br />
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@feature_discovery@chamelium<br />
+igt@feature_discovery@display<br />
+igt@feature_discovery@display-2x<br />
+igt@feature_discovery@display-3x<br />
+igt@feature_discovery@display-4x<br />
+igt@feature_discovery@psr1<br />
+igt@feature_discovery@psr2<br />
-igt@kms_feature_discovery@chamelium<br />
-igt@kms_feature_discovery@display<br />
-igt@kms_feature_discovery@display-2x<br />
-igt@kms_feature_discovery@display-3x<br />
-igt@kms_feature_discovery@display-4x<br />
-igt@kms_feature_discovery@dp-mst<br />
-igt@kms_feature_discovery@psr1<br />
-igt@kms_feature_discovery@psr2</p>

</body>
</html>

--===============2248043748911607164==--

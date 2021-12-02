Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7389511271861911833=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Dec 2021 18:02:24 -0000
Message-ID: <163846814484.9458.12518553319798130907@emeril.freedesktop.org>
References: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdsc=3A_Add_a_new_subtest_to_validate_10bpc_format_?=
 =?utf-8?b?KHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7389511271861911833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_dsc: Add a new subtest to validate 10bpc format (rev2)
URL   : https://patchwork.freedesktop.org/series/97074/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10924 -> IGTPW_6430
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html

Participating hosts (48 -> 37)
------------------------------

  Missing    (11): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6430:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dsc@basic-dsc-enable-xrgb2101010} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cml-u2/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-guc/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-dsi/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-icl-u2:          NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-icl-u2/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html

  * {igt@kms_dsc@basic-dsc-enable-xrgb8888} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-1115g4/igt@kms_dsc@basic-dsc-enable-xrgb8888.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-11600/igt@kms_dsc@basic-dsc-enable-xrgb8888.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10924 and IGTPW_6430:

### New IGT tests (10) ###

  * igt@kms_dsc@basic-dsc-enable-xrgb2101010:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [1.23, 1.29] s

  * igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.15, 1.16] s

  * igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [1.15, 1.22] s

  * igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_dsc@basic-dsc-enable-xrgb8888:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [1.18, 1.25] s

  * igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.15, 1.22] s

  * igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [1.15, 1.22] s

  * igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  

Known issues
------------

  Here are the changes found in IGTPW_6430 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-sdma:
    - fi-kbl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271]) +20 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-guc/igt@amdgpu/amd_basic@cs-sdma.html

  * igt@amdgpu/amd_basic@query-info:
    - fi-tgl-u2:          NOTRUN -> [SKIP][8] ([fdo#109315])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-tgl-u2:          NOTRUN -> [SKIP][9] ([fdo#109315] / [i915#2575]) +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-u2/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-apl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271]) +27 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-skl-6600u:       NOTRUN -> [SKIP][11] ([fdo#109271]) +23 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * {igt@kms_dsc@basic-dsc-enable-xrgb2101010} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][12] ([fdo#109271]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-ilk-650/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][13] ([fdo#109271]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-ivb-3770/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][14] ([fdo#109271]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bsw-kefka/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][15] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-x1275/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-glk-dsi/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][17] ([fdo#109271]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-blb-e6850/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][18] ([fdo#109271]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-7500u/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html

  * {igt@kms_dsc@basic-dsc-enable-xrgb8888} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cfl-8109u/igt@kms_dsc@basic-dsc-enable-xrgb8888.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][20] ([fdo#109271]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bwr-2160/igt@kms_dsc@basic-dsc-enable-xrgb8888.html
    - fi-snb-2600:        NOTRUN -> [SKIP][21] ([fdo#109271]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-snb-2600/igt@kms_dsc@basic-dsc-enable-xrgb8888.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][22] ([fdo#109271]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bdw-5557u/igt@kms_dsc@basic-dsc-enable-xrgb8888.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][23] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-elk-e7500/igt@kms_dsc@basic-dsc-enable-xrgb8888.html

  * igt@kms_dsc@xrgb8888-dsc-compression:
    - fi-cfl-guc:         NOTRUN -> [SKIP][24] ([fdo#109271]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cfl-guc/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][25] ([fdo#109271]) +20 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-soraka/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][26] ([fdo#109271]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-hsw-4770/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][27] ([fdo#109271]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-6700k2/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][28] ([fdo#109271]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bsw-n3050/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][29] ([i915#3828])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-u2/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-cml-u2:          NOTRUN -> [SKIP][30] ([i915#4692])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cml-u2/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][31] ([fdo#109271]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cfl-8700k/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][32] ([fdo#109271]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bxt-dsi/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-icl-u2:          NOTRUN -> [SKIP][33] ([i915#4692])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-icl-u2/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][34] ([i915#4692])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-1115g4/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][35] ([fdo#109271]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bsw-nick/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][36] ([fdo#109271]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-8809g/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][37] ([fdo#109271]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-snb-2520m/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][38] ([fdo#109271]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-7567u/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-skl-guc:         NOTRUN -> [SKIP][39] ([fdo#109271]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-guc/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][40] ([i915#4692])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-11600/igt@kms_dsc@xrgb8888-dsc-compression.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][41] ([i915#4692])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-guc/igt@kms_dsc@xrgb8888-dsc-compression.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6600u:       NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#533])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-apl-guc:         NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#533])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-apl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][44] ([fdo#109271]) +50 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#4692]: https://gitlab.freedesktop.org/drm/intel/issues/4692
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6288 -> IGTPW_6430

  CI-20190529: 20190529
  CI_DRM_10924: ba551d92d19db25d085cde572852bf6c08c7e750 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html
  IGT_6288: a5ac2c3e67bc9a9c8d3f440a0324ee2c5d49eb49 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_dsc@basic-dsc-enable-xrgb8888
+igt@kms_dsc@basic-dsc-enable-xrgb2101010
-igt@kms_dsc@basic-dsc-enable

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html

--===============7389511271861911833==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_dsc: Add a new subtest to validate 10bpc format (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97074/">https://patchwork.freedesktop.org/series/97074/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10924 -&gt; IGTPW_6430</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html</p>
<h2>Participating hosts (48 -&gt; 37)</h2>
<p>Missing    (11): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6430:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dsc@basic-dsc-enable-xrgb2101010} (NEW):</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cml-u2/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-guc/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-dsi/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-icl-u2/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@basic-dsc-enable-xrgb8888} (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-1115g4/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-11600/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10924 and IGTPW_6430:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb2101010:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.23, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.15, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.15, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb2101010@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb8888:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.18, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.15, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.15, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable-xrgb8888@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6430 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-sdma:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-guc/igt@amdgpu/amd_basic@cs-sdma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-u2/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@basic-dsc-enable-xrgb2101010} (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-ilk-650/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-ivb-3770/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bsw-kefka/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-x1275/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-glk-dsi/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-blb-e6850/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-7500u/igt@kms_dsc@basic-dsc-enable-xrgb2101010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@basic-dsc-enable-xrgb8888} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cfl-8109u/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bwr-2160/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-snb-2600/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bdw-5557u/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-elk-e7500/igt@kms_dsc@basic-dsc-enable-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@xrgb8888-dsc-compression:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cfl-guc/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-soraka/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +20 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-hsw-4770/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-6700k2/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bsw-n3050/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-u2/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3828">i915#3828</a>)</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cml-u2/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4692">i915#4692</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-cfl-8700k/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bxt-dsi/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-icl-u2/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4692">i915#4692</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-tgl-1115g4/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4692">i915#4692</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bsw-nick/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-8809g/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-snb-2520m/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-kbl-7567u/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-guc/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-11600/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4692">i915#4692</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-rkl-guc/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4692">i915#4692</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-apl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-c:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +50 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6288 -&gt; IGTPW_6430</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10924: ba551d92d19db25d085cde572852bf6c08c7e750 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6430/index.html<br />
  IGT_6288: a5ac2c3e67bc9a9c8d3f440a0324ee2c5d49eb49 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dsc@basic-dsc-enable-xrgb8888<br />
+igt@kms_dsc@basic-dsc-enable-xrgb2101010<br />
-igt@kms_dsc@basic-dsc-enable</p>

</body>
</html>

--===============7389511271861911833==--

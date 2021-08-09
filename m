Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3248181929692558606=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Aug 2021 14:15:09 -0000
Message-ID: <162851850920.2458.16729027160908345217@emeril.freedesktop.org>
References: <20210809132026.8692-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210809132026.8692-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgS2VlcCB0?=
 =?utf-8?q?ests_working_without_relocations_=28rev8=29?=
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3248181929692558606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Keep tests working without relocations (rev8)
URL   : https://patchwork.freedesktop.org/series/90049/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10460 -> IGTPW_6101
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6101 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6101, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6101:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_streaming_writes@batch-cpu} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [TIMEOUT][1] +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-jsl-1/igt@gem_streaming_writes@batch-cpu.html
    - fi-rkl-guc:         NOTRUN -> [TIMEOUT][2] +10 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-rkl-guc/igt@gem_streaming_writes@batch-cpu.html
    - fi-cml-u2:          NOTRUN -> [TIMEOUT][3] +10 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cml-u2/igt@gem_streaming_writes@batch-cpu.html

  * {igt@gem_streaming_writes@batch-gtt} (NEW):
    - {fi-ehl-2}:         NOTRUN -> [TIMEOUT][4] +10 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ehl-2/igt@gem_streaming_writes@batch-gtt.html
    - fi-rkl-11600:       NOTRUN -> [TIMEOUT][5] +10 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-rkl-11600/igt@gem_streaming_writes@batch-gtt.html
    - {fi-hsw-gt1}:       NOTRUN -> [TIMEOUT][6] +10 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-hsw-gt1/igt@gem_streaming_writes@batch-gtt.html

  * {igt@gem_streaming_writes@batch-reverse-cpu} (NEW):
    - fi-kbl-soraka:      NOTRUN -> [TIMEOUT][7] +10 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-soraka/igt@gem_streaming_writes@batch-reverse-cpu.html

  * {igt@gem_streaming_writes@batch-reverse-gtt} (NEW):
    - fi-kbl-guc:         NOTRUN -> [TIMEOUT][8] +10 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-guc/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-icl-y:           NOTRUN -> [TIMEOUT][9] +10 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-icl-y/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-bdw-gvtdvm:      NOTRUN -> [TIMEOUT][10] +9 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bdw-gvtdvm/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-kbl-7500u:       NOTRUN -> [TIMEOUT][11] +10 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-7500u/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-icl-u2:          NOTRUN -> [TIMEOUT][12] +10 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-icl-u2/igt@gem_streaming_writes@batch-reverse-gtt.html
    - {fi-tgl-dsi}:       NOTRUN -> [TIMEOUT][13] +10 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-tgl-dsi/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-cfl-8700k:       NOTRUN -> [TIMEOUT][14] +10 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cfl-8700k/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-apl-guc:         NOTRUN -> [TIMEOUT][15] +9 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-apl-guc/igt@gem_streaming_writes@batch-reverse-gtt.html
    - fi-snb-2520m:       NOTRUN -> [TIMEOUT][16] +10 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-snb-2520m/igt@gem_streaming_writes@batch-reverse-gtt.html

  * {igt@gem_streaming_writes@batch-reverse-wc} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [TIMEOUT][17] +10 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-tgl-1115g4/igt@gem_streaming_writes@batch-reverse-wc.html
    - fi-bxt-dsi:         NOTRUN -> [TIMEOUT][18] +9 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bxt-dsi/igt@gem_streaming_writes@batch-reverse-wc.html
    - fi-hsw-4770:        NOTRUN -> [TIMEOUT][19] +10 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-hsw-4770/igt@gem_streaming_writes@batch-reverse-wc.html

  * {igt@gem_streaming_writes@batch-wc} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [TIMEOUT][20] +10 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-skl-6700k2/igt@gem_streaming_writes@batch-wc.html
    - fi-ivb-3770:        NOTRUN -> [TIMEOUT][21] +10 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ivb-3770/igt@gem_streaming_writes@batch-wc.html

  * {igt@gem_streaming_writes@cpu} (NEW):
    - fi-bsw-kefka:       NOTRUN -> [TIMEOUT][22] +9 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-kefka/igt@gem_streaming_writes@cpu.html
    - fi-cfl-guc:         NOTRUN -> [TIMEOUT][23] +10 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cfl-guc/igt@gem_streaming_writes@cpu.html

  * {igt@gem_streaming_writes@cpu-sync} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [TIMEOUT][24] +10 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cfl-8109u/igt@gem_streaming_writes@cpu-sync.html

  * {igt@gem_streaming_writes@gtt} (NEW):
    - fi-glk-dsi:         NOTRUN -> [TIMEOUT][25] +9 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-glk-dsi/igt@gem_streaming_writes@gtt.html
    - fi-bsw-nick:        NOTRUN -> [TIMEOUT][26] +7 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-nick/igt@gem_streaming_writes@gtt.html
    - fi-kbl-8809g:       NOTRUN -> [TIMEOUT][27] +10 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-8809g/igt@gem_streaming_writes@gtt.html
    - fi-bwr-2160:        NOTRUN -> [TIMEOUT][28] +7 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bwr-2160/igt@gem_streaming_writes@gtt.html
    - fi-kbl-7567u:       NOTRUN -> [TIMEOUT][29] +10 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-7567u/igt@gem_streaming_writes@gtt.html
    - fi-skl-guc:         NOTRUN -> [TIMEOUT][30] +10 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-skl-guc/igt@gem_streaming_writes@gtt.html

  * {igt@gem_streaming_writes@gtt-sync} (NEW):
    - fi-elk-e7500:       NOTRUN -> [TIMEOUT][31] +9 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-elk-e7500/igt@gem_streaming_writes@gtt-sync.html

  * {igt@gem_streaming_writes@wc-sync} (NEW):
    - fi-ilk-650:         NOTRUN -> [TIMEOUT][32] +9 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ilk-650/igt@gem_streaming_writes@wc-sync.html
    - fi-pnv-d510:        NOTRUN -> [TIMEOUT][33] +9 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-pnv-d510/igt@gem_streaming_writes@wc-sync.html

  * igt@meta_test@fail-result (NEW):
    - fi-apl-guc:         NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-apl-guc/igt@meta_test@fail-result.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bxt-dsi/igt@meta_test@fail-result.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-glk-dsi/igt@meta_test@fail-result.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bwr-2160/igt@meta_test@fail-result.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10460 and IGTPW_6101:

### New IGT tests (13) ###

  * igt@gem_streaming_writes@batch-cpu:
    - Statuses : 1 fail(s) 9 skip(s) 24 timeout(s)
    - Exec time: [0.00, 121.29] s

  * igt@gem_streaming_writes@batch-gtt:
    - Statuses : 1 fail(s) 33 timeout(s)
    - Exec time: [0.01, 121.51] s

  * igt@gem_streaming_writes@batch-reverse-cpu:
    - Statuses : 1 fail(s) 9 skip(s) 24 timeout(s)
    - Exec time: [0.00, 121.47] s

  * igt@gem_streaming_writes@batch-reverse-gtt:
    - Statuses : 1 fail(s) 33 timeout(s)
    - Exec time: [0.01, 121.48] s

  * igt@gem_streaming_writes@batch-reverse-wc:
    - Statuses : 1 fail(s) 33 timeout(s)
    - Exec time: [0.01, 121.51] s

  * igt@gem_streaming_writes@batch-wc:
    - Statuses : 1 fail(s) 33 timeout(s)
    - Exec time: [0.01, 122.13] s

  * igt@gem_streaming_writes@cpu:
    - Statuses : 2 skip(s) 32 timeout(s)
    - Exec time: [0.0, 121.57] s

  * igt@gem_streaming_writes@cpu-sync:
    - Statuses : 2 skip(s) 32 timeout(s)
    - Exec time: [0.0, 121.91] s

  * igt@gem_streaming_writes@gtt:
    - Statuses : 1 fail(s) 33 timeout(s)
    - Exec time: [0.01, 121.72] s

  * igt@gem_streaming_writes@gtt-sync:
    - Statuses : 1 fail(s) 33 timeout(s)
    - Exec time: [0.01, 121.78] s

  * igt@gem_streaming_writes@wc:
    - Statuses : 1 fail(s) 31 timeout(s)
    - Exec time: [0.01, 120.94] s

  * igt@gem_streaming_writes@wc-sync:
    - Statuses : 1 fail(s) 8 timeout(s)
    - Exec time: [0.01, 121.39] s

  * igt@meta_test@fail-result:
    - Statuses : 5 fail(s)
    - Exec time: [0.00, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_6101 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-apl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +19 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * {igt@gem_streaming_writes@batch-cpu} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][39] ([fdo#109271]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bwr-2160/igt@gem_streaming_writes@batch-cpu.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-glk-dsi/igt@gem_streaming_writes@batch-cpu.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][41] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-kefka/igt@gem_streaming_writes@batch-cpu.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-pnv-d510/igt@gem_streaming_writes@batch-cpu.html

  * {igt@gem_streaming_writes@batch-reverse-cpu} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][43] ([fdo#109271]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-nick/igt@gem_streaming_writes@batch-reverse-cpu.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][44] ([fdo#109271]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bxt-dsi/igt@gem_streaming_writes@batch-reverse-cpu.html
    - fi-ilk-650:         NOTRUN -> [SKIP][45] ([fdo#109271]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ilk-650/igt@gem_streaming_writes@batch-reverse-cpu.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][46] ([fdo#109271]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-elk-e7500/igt@gem_streaming_writes@batch-reverse-cpu.html

  * {igt@gem_streaming_writes@cpu-sync} (NEW):
    - {fi-dg1-1}:         NOTRUN -> [SKIP][47] ([i915#3717]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-dg1-1/igt@gem_streaming_writes@cpu-sync.html

  * {igt@gem_streaming_writes@gtt-sync} (NEW):
    - {fi-dg1-1}:         NOTRUN -> [FAIL][48] ([i915#3717]) +10 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-dg1-1/igt@gem_streaming_writes@gtt-sync.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-bdw-samus fi-bsw-cyan bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6163 -> IGTPW_6101

  CI-20190529: 20190529
  CI_DRM_10460: 933d74e4ff60d39ff929b26780dca84412551174 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6101: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html
  IGT_6163: 9f9d82df8c8e68c304e84aba717a9937b65e10e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html

--===============3248181929692558606==
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
<tr><td><b>Series:</b></td><td>Keep tests working without relocations (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90049/">https://patchwork.freedesktop.org/series/90049/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10460 -&gt; IGTPW_6101</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6101 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6101, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6101:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_streaming_writes@batch-cpu} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-jsl-1/igt@gem_streaming_writes@batch-cpu.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-rkl-guc/igt@gem_streaming_writes@batch-cpu.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cml-u2/igt@gem_streaming_writes@batch-cpu.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-gtt} (NEW):</p>
<ul>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ehl-2/igt@gem_streaming_writes@batch-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-rkl-11600/igt@gem_streaming_writes@batch-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-hsw-gt1/igt@gem_streaming_writes@batch-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-reverse-cpu} (NEW):</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-soraka/igt@gem_streaming_writes@batch-reverse-cpu.html">TIMEOUT</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-reverse-gtt} (NEW):</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-guc/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-icl-y/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bdw-gvtdvm/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +9 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-7500u/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-icl-u2/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-tgl-dsi/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cfl-8700k/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-apl-guc/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +9 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-snb-2520m/igt@gem_streaming_writes@batch-reverse-gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-reverse-wc} (NEW):</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-tgl-1115g4/igt@gem_streaming_writes@batch-reverse-wc.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bxt-dsi/igt@gem_streaming_writes@batch-reverse-wc.html">TIMEOUT</a> +9 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-hsw-4770/igt@gem_streaming_writes@batch-reverse-wc.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-wc} (NEW):</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-skl-6700k2/igt@gem_streaming_writes@batch-wc.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ivb-3770/igt@gem_streaming_writes@batch-wc.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@cpu} (NEW):</p>
<ul>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-kefka/igt@gem_streaming_writes@cpu.html">TIMEOUT</a> +9 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cfl-guc/igt@gem_streaming_writes@cpu.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@cpu-sync} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-cfl-8109u/igt@gem_streaming_writes@cpu-sync.html">TIMEOUT</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@gtt} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-glk-dsi/igt@gem_streaming_writes@gtt.html">TIMEOUT</a> +9 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-nick/igt@gem_streaming_writes@gtt.html">TIMEOUT</a> +7 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-8809g/igt@gem_streaming_writes@gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bwr-2160/igt@gem_streaming_writes@gtt.html">TIMEOUT</a> +7 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-kbl-7567u/igt@gem_streaming_writes@gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-skl-guc/igt@gem_streaming_writes@gtt.html">TIMEOUT</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@gtt-sync} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-elk-e7500/igt@gem_streaming_writes@gtt-sync.html">TIMEOUT</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@wc-sync} (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ilk-650/igt@gem_streaming_writes@wc-sync.html">TIMEOUT</a> +9 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-pnv-d510/igt@gem_streaming_writes@wc-sync.html">TIMEOUT</a> +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-apl-guc/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bxt-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-glk-dsi/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bwr-2160/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10460 and IGTPW_6101:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@gem_streaming_writes@batch-cpu:</p>
<ul>
<li>Statuses : 1 fail(s) 9 skip(s) 24 timeout(s)</li>
<li>Exec time: [0.00, 121.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@batch-gtt:</p>
<ul>
<li>Statuses : 1 fail(s) 33 timeout(s)</li>
<li>Exec time: [0.01, 121.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@batch-reverse-cpu:</p>
<ul>
<li>Statuses : 1 fail(s) 9 skip(s) 24 timeout(s)</li>
<li>Exec time: [0.00, 121.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@batch-reverse-gtt:</p>
<ul>
<li>Statuses : 1 fail(s) 33 timeout(s)</li>
<li>Exec time: [0.01, 121.48] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@batch-reverse-wc:</p>
<ul>
<li>Statuses : 1 fail(s) 33 timeout(s)</li>
<li>Exec time: [0.01, 121.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@batch-wc:</p>
<ul>
<li>Statuses : 1 fail(s) 33 timeout(s)</li>
<li>Exec time: [0.01, 122.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@cpu:</p>
<ul>
<li>Statuses : 2 skip(s) 32 timeout(s)</li>
<li>Exec time: [0.0, 121.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@cpu-sync:</p>
<ul>
<li>Statuses : 2 skip(s) 32 timeout(s)</li>
<li>Exec time: [0.0, 121.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@gtt:</p>
<ul>
<li>Statuses : 1 fail(s) 33 timeout(s)</li>
<li>Exec time: [0.01, 121.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@gtt-sync:</p>
<ul>
<li>Statuses : 1 fail(s) 33 timeout(s)</li>
<li>Exec time: [0.01, 121.78] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@wc:</p>
<ul>
<li>Statuses : 1 fail(s) 31 timeout(s)</li>
<li>Exec time: [0.01, 120.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_streaming_writes@wc-sync:</p>
<ul>
<li>Statuses : 1 fail(s) 8 timeout(s)</li>
<li>Exec time: [0.01, 121.39] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6101 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-apl-guc/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-cpu} (NEW):</p>
<ul>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bwr-2160/igt@gem_streaming_writes@batch-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-glk-dsi/igt@gem_streaming_writes@batch-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-kefka/igt@gem_streaming_writes@batch-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-pnv-d510/igt@gem_streaming_writes@batch-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@batch-reverse-cpu} (NEW):</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bsw-nick/igt@gem_streaming_writes@batch-reverse-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-bxt-dsi/igt@gem_streaming_writes@batch-reverse-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-ilk-650/igt@gem_streaming_writes@batch-reverse-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-elk-e7500/igt@gem_streaming_writes@batch-reverse-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@cpu-sync} (NEW):</p>
<ul>
<li>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-dg1-1/igt@gem_streaming_writes@cpu-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_streaming_writes@gtt-sync} (NEW):</p>
<ul>
<li>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/fi-dg1-1/igt@gem_streaming_writes@gtt-sync.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) +10 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-bdw-samus fi-bsw-cyan bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6163 -&gt; IGTPW_6101</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10460: 933d74e4ff60d39ff929b26780dca84412551174 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6101: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6101/index.html<br />
  IGT_6163: 9f9d82df8c8e68c304e84aba717a9937b65e10e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3248181929692558606==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2244901237116019776=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 10 Nov 2021 13:59:17 -0000
Message-ID: <163655275742.15662.13121106438359196829@emeril.freedesktop.org>
References: <20211110131729.54135-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211110131729.54135-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVXBzdHJl?=
 =?utf-8?q?am_gem=5Flmem=5Fswapping_=28rev3=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2244901237116019776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Upstream gem_lmem_swapping (rev3)
URL   : https://patchwork.freedesktop.org/series/96707/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10863 -> IGTPW_6389
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html

Participating hosts (39 -> 35)
------------------------------

  Missing    (4): fi-icl-y fi-bsw-cyan bat-adlp-4 bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6389:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_lmem_swapping@basic} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-rkl-11600/igt@gem_lmem_swapping@basic.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-ehl-2/igt@gem_lmem_swapping@basic.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-tgl-dsi/igt@gem_lmem_swapping@basic.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-tgl-1115g4/igt@gem_lmem_swapping@basic.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-rkl-guc/igt@gem_lmem_swapping@basic.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-jsl-1/igt@gem_lmem_swapping@basic.html
    - fi-cml-u2:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cml-u2/igt@gem_lmem_swapping@basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10863 and IGTPW_6389:

### New IGT tests (1) ###

  * igt@gem_lmem_swapping@basic:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6389 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-multi-fence:
    - fi-bdw-samus:       NOTRUN -> [SKIP][8] ([fdo#109271]) +23 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bdw-samus/igt@amdgpu/amd_basic@cs-multi-fence.html

  * {igt@gem_lmem_swapping@basic} (NEW):
    - fi-skl-guc:         NOTRUN -> [SKIP][9] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-skl-guc/igt@gem_lmem_swapping@basic.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][10] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-elk-e7500/igt@gem_lmem_swapping@basic.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][12] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-snb-2520m/igt@gem_lmem_swapping@basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][13] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-glk-dsi/igt@gem_lmem_swapping@basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-ivb-3770/igt@gem_lmem_swapping@basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-skl-6600u/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html
    - {fi-hsw-gt1}:       NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-hsw-gt1/igt@gem_lmem_swapping@basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][19] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-pnv-d510/igt@gem_lmem_swapping@basic.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-guc/igt@gem_lmem_swapping@basic.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bsw-kefka/igt@gem_lmem_swapping@basic.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-7500u/igt@gem_lmem_swapping@basic.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bwr-2160/igt@gem_lmem_swapping@basic.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bdw-5557u/igt@gem_lmem_swapping@basic.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bsw-nick/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cfl-8109u/igt@gem_lmem_swapping@basic.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bxt-dsi/igt@gem_lmem_swapping@basic.html
    - fi-snb-2600:        NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-snb-2600/igt@gem_lmem_swapping@basic.html
    - fi-ilk-650:         NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-ilk-650/igt@gem_lmem_swapping@basic.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-skl-6700k2/igt@gem_lmem_swapping@basic.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-hsw-4770/igt@gem_lmem_swapping@basic.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cfl-guc/igt@gem_lmem_swapping@basic.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-hsw-gt1}:       [DMESG-WARN][35] ([i915#4290]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10863/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bdw-samus:       [INCOMPLETE][37] ([i915#4444]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10863/fi-bdw-samus/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bdw-samus/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4290]: https://gitlab.freedesktop.org/drm/intel/issues/4290
  [i915#4444]: https://gitlab.freedesktop.org/drm/intel/issues/4444


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6276 -> IGTPW_6389

  CI-20190529: 20190529
  CI_DRM_10863: de2d87964c398bd4de93d264192e7f69928cf9c8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6389: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html
  IGT_6276: 955e0652ed6b1c8697e7ea5c35f86b232b4d5c32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_lmem_swapping@basic
+igt@gem_lmem_swapping@heavy-multi
+igt@gem_lmem_swapping@heavy-random
+igt@gem_lmem_swapping@heavy-verify-multi
+igt@gem_lmem_swapping@heavy-verify-random
+igt@gem_lmem_swapping@parallel-multi
+igt@gem_lmem_swapping@parallel-random
+igt@gem_lmem_swapping@parallel-random-engines
+igt@gem_lmem_swapping@parallel-random-verify
+igt@gem_lmem_swapping@random
+igt@gem_lmem_swapping@random-engines
+igt@gem_lmem_swapping@smem-oom
+igt@gem_lmem_swapping@verify
+igt@gem_lmem_swapping@verify-random

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html

--===============2244901237116019776==
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
<tr><td><b>Series:</b></td><td>Upstream gem_lmem_swapping (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96707/">https://patchwork.freedesktop.org/series/96707/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10863 -&gt; IGTPW_6389</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html</p>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): fi-icl-y fi-bsw-cyan bat-adlp-4 bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6389:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_lmem_swapping@basic} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-ehl-2/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-tgl-dsi/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-tgl-1115g4/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-rkl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-jsl-1/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cml-u2/igt@gem_lmem_swapping@basic.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10863 and IGTPW_6389:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_lmem_swapping@basic:<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6389 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-multi-fence:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bdw-samus/igt@amdgpu/amd_basic@cs-multi-fence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_lmem_swapping@basic} (NEW):</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-skl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-elk-e7500/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-snb-2520m/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-glk-dsi/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-ivb-3770/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-skl-6600u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cfl-8700k/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{fi-hsw-gt1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-hsw-gt1/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bsw-kefka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-7500u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bwr-2160/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bdw-5557u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bsw-nick/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cfl-8109u/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bxt-dsi/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-snb-2600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-ilk-650/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-skl-6700k2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-hsw-4770/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-cfl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10863/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4290">i915#4290</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bdw-samus:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10863/fi-bdw-samus/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4444">i915#4444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/fi-bdw-samus/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6276 -&gt; IGTPW_6389</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10863: de2d87964c398bd4de93d264192e7f69928cf9c8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6389: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6389/index.html<br />
  IGT_6276: 955e0652ed6b1c8697e7ea5c35f86b232b4d5c32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_lmem_swapping@basic<br />
+igt@gem_lmem_swapping@heavy-multi<br />
+igt@gem_lmem_swapping@heavy-random<br />
+igt@gem_lmem_swapping@heavy-verify-multi<br />
+igt@gem_lmem_swapping@heavy-verify-random<br />
+igt@gem_lmem_swapping@parallel-multi<br />
+igt@gem_lmem_swapping@parallel-random<br />
+igt@gem_lmem_swapping@parallel-random-engines<br />
+igt@gem_lmem_swapping@parallel-random-verify<br />
+igt@gem_lmem_swapping@random<br />
+igt@gem_lmem_swapping@random-engines<br />
+igt@gem_lmem_swapping@smem-oom<br />
+igt@gem_lmem_swapping@verify<br />
+igt@gem_lmem_swapping@verify-random</p>

</body>
</html>

--===============2244901237116019776==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4884833378851989256=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 03 Mar 2023 10:49:20 -0000
Message-ID: <167784056092.9998.12864616519074653778@emeril.freedesktop.org>
References: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_check_disk_limit_at_dumping_kmsg_=28rev2=29?=
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

--===============4884833378851989256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: check disk limit at dumping kmsg (rev2)
URL   : https://patchwork.freedesktop.org/series/114353/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12786 -> IGTPW_8532
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8532 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8532, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8532:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - bat-dg2-11:         [ABORT][1] ([i915#8233]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg2-11/igt@gem_exec_fence@basic-busy@ccs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg2-11/igt@gem_exec_fence@basic-busy@ccs0.html

  * igt@gem_exec_fence@basic-busy@ccs3:
    - bat-dg2-9:          [ABORT][3] ([i915#8233]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg2-9/igt@gem_exec_fence@basic-busy@ccs3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg2-9/igt@gem_exec_fence@basic-busy@ccs3.html
    - bat-atsm-1:         [ABORT][5] ([i915#8233]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-atsm-1/igt@gem_exec_fence@basic-busy@ccs3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-atsm-1/igt@gem_exec_fence@basic-busy@ccs3.html
    - bat-dg2-8:          [ABORT][7] ([i915#8233]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg2-8/igt@gem_exec_fence@basic-busy@ccs3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg2-8/igt@gem_exec_fence@basic-busy@ccs3.html

  * igt@gem_exec_fence@basic-busy@rcs0:
    - fi-blb-e6850:       [ABORT][9] ([i915#8233]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html
    - fi-pnv-d510:        [ABORT][11] ([i915#8233]) -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-pnv-d510/igt@gem_exec_fence@basic-busy@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-pnv-d510/igt@gem_exec_fence@basic-busy@rcs0.html

  * igt@gem_exec_fence@basic-busy@vcs0:
    - fi-ivb-3770:        [ABORT][13] ([i915#8233]) -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-ivb-3770/igt@gem_exec_fence@basic-busy@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-ivb-3770/igt@gem_exec_fence@basic-busy@vcs0.html
    - fi-elk-e7500:       [ABORT][15] ([i915#8233]) -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-elk-e7500/igt@gem_exec_fence@basic-busy@vcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-elk-e7500/igt@gem_exec_fence@basic-busy@vcs0.html
    - fi-ilk-650:         [ABORT][17] ([i915#8233]) -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-ilk-650/igt@gem_exec_fence@basic-busy@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-ilk-650/igt@gem_exec_fence@basic-busy@vcs0.html

  * igt@gem_exec_fence@basic-busy@vecs0:
    - bat-adlp-9:         [ABORT][19] ([i915#8233]) -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adlp-9/igt@gem_exec_fence@basic-busy@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adlp-9/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-skl-guc:         [ABORT][21] ([i915#8233]) -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-skl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-skl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-dg1-6:          [ABORT][23] ([i915#8233]) -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg1-6/igt@gem_exec_fence@basic-busy@vecs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg1-6/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-cfl-8109u:       [ABORT][25] ([i915#8233]) -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-7567u:       [ABORT][27] ([i915#8233]) -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@vecs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adln-1:         [ABORT][29] ([i915#8233]) -> [ABORT][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adln-1/igt@gem_exec_fence@basic-busy@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adln-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-bsw-nick:        [ABORT][31] ([i915#8233]) -> [ABORT][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-bsw-nick/igt@gem_exec_fence@basic-busy@vecs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-bsw-nick/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-guc:         [ABORT][33] ([i915#8233]) -> [ABORT][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-kbl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-kbl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adlm-1:         [ABORT][35] ([i915#8233]) -> [ABORT][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adlm-1/igt@gem_exec_fence@basic-busy@vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adlm-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-rplp-1:         [ABORT][37] ([i915#8233]) -> [ABORT][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-rplp-1/igt@gem_exec_fence@basic-busy@vecs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-rplp-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-tgl-1115g4:      [ABORT][39] ([i915#8233]) -> [ABORT][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-bsw-n3050:       [ABORT][41] ([i915#8233]) -> [ABORT][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-bsw-n3050/igt@gem_exec_fence@basic-busy@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-bsw-n3050/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-cfl-guc:         [ABORT][43] ([i915#8233]) -> [ABORT][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-cfl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-cfl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-kbl-x1275:       [ABORT][45] ([i915#8233]) -> [ABORT][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-hsw-4770:        [ABORT][47] ([i915#8233]) -> [ABORT][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-hsw-4770/igt@gem_exec_fence@basic-busy@vecs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-hsw-4770/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-rpls-2:         [ABORT][49] ([i915#8233]) -> [ABORT][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-rpls-2/igt@gem_exec_fence@basic-busy@vecs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-rpls-2/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-jsl-1:          [ABORT][51] ([i915#8233]) -> [ABORT][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-jsl-1/igt@gem_exec_fence@basic-busy@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-jsl-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-cfl-8700k:       [ABORT][53] ([i915#8233]) -> [ABORT][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-cfl-8700k/igt@gem_exec_fence@basic-busy@vecs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-cfl-8700k/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-rpls-1:         [ABORT][55] ([i915#8233]) -> [ABORT][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-rpls-1/igt@gem_exec_fence@basic-busy@vecs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-rpls-1/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adlp-6:         [ABORT][57] ([i915#8233]) -> [ABORT][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adlp-6/igt@gem_exec_fence@basic-busy@vecs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adlp-6/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-rkl-11600:       [ABORT][59] ([i915#8233]) -> [ABORT][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-rkl-11600/igt@gem_exec_fence@basic-busy@vecs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-rkl-11600/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-skl-6600u:       [ABORT][61] ([i915#8233]) -> [ABORT][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-skl-6600u/igt@gem_exec_fence@basic-busy@vecs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-skl-6600u/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-adls-5:         [ABORT][63] ([i915#8233]) -> [ABORT][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adls-5/igt@gem_exec_fence@basic-busy@vecs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adls-5/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-apl-guc:         [ABORT][65] ([i915#8233]) -> [ABORT][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-apl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-apl-guc/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-dg1-5:          [ABORT][67] ([i915#8233]) -> [ABORT][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg1-5/igt@gem_exec_fence@basic-busy@vecs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg1-5/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-dg1-7:          [ABORT][69] ([i915#8233]) -> [ABORT][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg1-7/igt@gem_exec_fence@basic-busy@vecs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg1-7/igt@gem_exec_fence@basic-busy@vecs0.html
    - bat-jsl-3:          [ABORT][71] ([i915#8233]) -> [ABORT][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-jsl-3/igt@gem_exec_fence@basic-busy@vecs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-jsl-3/igt@gem_exec_fence@basic-busy@vecs0.html
    - fi-glk-j4005:       [ABORT][73] ([i915#8233]) -> [ABORT][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-glk-j4005/igt@gem_exec_fence@basic-busy@vecs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-glk-j4005/igt@gem_exec_fence@basic-busy@vecs0.html

  
  [i915#8233]: https://gitlab.freedesktop.org/drm/intel/issues/8233


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7173 -> IGTPW_8532

  CI-20190529: 20190529
  CI_DRM_12786: f182ba6684a2393069248bc946f20ceabd9e395d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8532: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html
  IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_plane_scaling@i915-max-source-size

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html

--===============4884833378851989256==
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
<tr><td><b>Series:</b></td><td>runner: check disk limit at dumping kmsg (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114353/">https://patchwork.freedesktop.org/series/114353/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12786 -&gt; IGTPW_8532</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8532 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8532, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8532:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg2-11/igt@gem_exec_fence@basic-busy@ccs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg2-11/igt@gem_exec_fence@basic-busy@ccs0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs3:</p>
<ul>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg2-9/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg2-9/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a></p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-atsm-1/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-atsm-1/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg2-8/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg2-8/igt@gem_exec_fence@basic-busy@ccs3.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-blb-e6850/igt@gem_exec_fence@basic-busy@rcs0.html">ABORT</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-pnv-d510/igt@gem_exec_fence@basic-busy@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-pnv-d510/igt@gem_exec_fence@basic-busy@rcs0.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-ivb-3770/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-ivb-3770/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-elk-e7500/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-elk-e7500/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-ilk-650/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-ilk-650/igt@gem_exec_fence@basic-busy@vcs0.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adlp-9/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adlp-9/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-skl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-skl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg1-6/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg1-6/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-cfl-8109u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-kbl-7567u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adln-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adln-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-bsw-nick/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-bsw-nick/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-kbl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-kbl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adlm-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adlm-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-rplp-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-rplp-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-bsw-n3050/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-bsw-n3050/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-cfl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-cfl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-kbl-x1275/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-hsw-4770/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-hsw-4770/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-rpls-2/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-rpls-2/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-jsl-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-jsl-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-cfl-8700k/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-cfl-8700k/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-rpls-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-rpls-1/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adlp-6/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adlp-6/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-rkl-11600/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-rkl-11600/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-skl-6600u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-skl-6600u/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-adls-5/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-adls-5/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-apl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-apl-guc/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg1-5/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg1-5/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-dg1-7/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-dg1-7/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/bat-jsl-3/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/bat-jsl-3/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12786/fi-glk-j4005/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/fi-glk-j4005/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a></p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7173 -&gt; IGTPW_8532</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12786: f182ba6684a2393069248bc946f20ceabd9e395d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8532: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8532/index.html<br />
  IGT_7173: deab4e0bdf5a9366b67d0a44f478f3da3c9a943b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_plane_scaling@i915-max-source-size</p>

</body>
</html>

--===============4884833378851989256==--

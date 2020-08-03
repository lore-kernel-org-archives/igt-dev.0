Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 03 Aug 2020 13:08:33 -0000
Message-ID: <159646011334.19294.1363987338680968859@emeril.freedesktop.org>
References: <20200803124313.31162-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200803124313.31162-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev24=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1221918390=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1221918390==
Content-Type: multipart/alternative;
 boundary="===============0208405420247479055=="

--===============0208405420247479055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev24)
URL   : https://patchwork.freedesktop.org/series/79823/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8834 -> IGTPW_4845
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4845:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@fail} (NEW):
    - fi-cml-s:           NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cml-s/igt@api_intel_bb@fail.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-hsw-4770/igt@api_intel_bb@fail.html
    - fi-byt-j1900:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-byt-j1900/igt@api_intel_bb@fail.html
    - fi-cml-u2:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cml-u2/igt@api_intel_bb@fail.html
    - fi-kbl-r:           NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-r/igt@api_intel_bb@fail.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-lmem/igt@api_intel_bb@fail.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-8809g/igt@api_intel_bb@fail.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-guc/igt@api_intel_bb@fail.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bsw-nick/igt@api_intel_bb@fail.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-ehl-1/igt@api_intel_bb@fail.html
    - fi-gdg-551:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-gdg-551/igt@api_intel_bb@fail.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-7500u/igt@api_intel_bb@fail.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cfl-8109u/igt@api_intel_bb@fail.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-6600u/igt@api_intel_bb@fail.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bwr-2160/igt@api_intel_bb@fail.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bdw-5557u/igt@api_intel_bb@fail.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bsw-kefka/igt@api_intel_bb@fail.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-x1275/igt@api_intel_bb@fail.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-pnv-d510/igt@api_intel_bb@fail.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-snb-2520m/igt@api_intel_bb@fail.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-tgl-dsi/igt@api_intel_bb@fail.html
    - fi-icl-u2:          NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-icl-u2/igt@api_intel_bb@fail.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-blb-e6850/igt@api_intel_bb@fail.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-6700k2/igt@api_intel_bb@fail.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cfl-8700k/igt@api_intel_bb@fail.html
    - fi-icl-y:           NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-icl-y/igt@api_intel_bb@fail.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bdw-gvtdvm/igt@api_intel_bb@fail.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-elk-e7500/igt@api_intel_bb@fail.html
    - fi-ilk-650:         NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-ilk-650/igt@api_intel_bb@fail.html
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-7560u/igt@api_intel_bb@fail.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-tgl-u2/igt@api_intel_bb@fail.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-ivb-3770/igt@api_intel_bb@fail.html
    - fi-skl-guc:         NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-guc/igt@api_intel_bb@fail.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bsw-n3050/igt@api_intel_bb@fail.html
    - fi-snb-2600:        NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-snb-2600/igt@api_intel_bb@fail.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8834 and IGTPW_4845:

### New IGT tests (13) ###

  * igt@api_intel_bb@fail:
    - Statuses : 37 fail(s)
    - Exec time: [0.02, 0.68] s

  * igt@api_intel_bb@render@render-none-1024:
    - Statuses : 37 pass(s)
    - Exec time: [0.18, 1.62] s

  * igt@api_intel_bb@render@render-none-512:
    - Statuses : 37 pass(s)
    - Exec time: [0.05, 0.44] s

  * igt@api_intel_bb@render@render-none-reloc-1024:
    - Statuses : 35 pass(s)
    - Exec time: [0.18, 1.03] s

  * igt@api_intel_bb@render@render-none-reloc-512:
    - Statuses : 35 pass(s)
    - Exec time: [0.04, 0.25] s

  * igt@api_intel_bb@render@render-x-1024:
    - Statuses : 37 pass(s)
    - Exec time: [0.16, 1.50] s

  * igt@api_intel_bb@render@render-x-512:
    - Statuses : 37 pass(s)
    - Exec time: [0.05, 0.38] s

  * igt@api_intel_bb@render@render-x-reloc-1024:
    - Statuses : 35 pass(s)
    - Exec time: [0.17, 0.88] s

  * igt@api_intel_bb@render@render-x-reloc-512:
    - Statuses : 35 pass(s)
    - Exec time: [0.04, 0.21] s

  * igt@api_intel_bb@render@render-y-1024:
    - Statuses : 37 pass(s)
    - Exec time: [0.16, 1.50] s

  * igt@api_intel_bb@render@render-y-512:
    - Statuses : 37 pass(s)
    - Exec time: [0.05, 0.39] s

  * igt@api_intel_bb@render@render-y-reloc-1024:
    - Statuses : 35 pass(s)
    - Exec time: [0.17, 0.89] s

  * igt@api_intel_bb@render@render-y-reloc-512:
    - Statuses : 35 pass(s)
    - Exec time: [0.04, 0.21] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (42 -> 37)
------------------------------

  Additional (2): fi-ilk-650 fi-kbl-8809g 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5757 -> IGTPW_4845

  CI-20190529: 20190529
  CI_DRM_8834: ac25ad7789fe4cc689a854d823a226ce24bb0a62 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4845: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@api_intel_bb@check-canonical
+igt@api_intel_bb@fail
+igt@api_intel_bb@render
+igt@api_intel_bb@render-ccs
+igt@api_intel_bb@reset-flags
-igt@gem_read_read_speed@read-read-1x1
-igt@gem_read_read_speed@read-write-1x1
-igt@gem_read_read_speed@write-read-1x1
-igt@gem_read_read_speed@write-write-1x1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html

--===============0208405420247479055==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev24)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8834 -&gt; IGTPW_4845</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4845:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@api_intel_bb@fail} (NEW):</p>
<ul>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cml-s/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-hsw-4770/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-byt-j1900/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cml-u2/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-r/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-lmem/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-8809g/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-guc/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bsw-nick/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-ehl-1/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-gdg-551:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-gdg-551/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-7500u/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cfl-8109u/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-6600u/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bwr-2160/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bdw-5557u/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bsw-kefka/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-x1275/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-pnv-d510/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-snb-2520m/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-tgl-dsi/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-icl-u2/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-blb-e6850/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-6700k2/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-cfl-8700k/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-icl-y/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bdw-gvtdvm/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-elk-e7500/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-ilk-650/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-kbl-7560u/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-tgl-u2/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-ivb-3770/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-skl-guc/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-bsw-n3050/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/fi-snb-2600/igt@api_intel_bb@fail.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8834 and IGTPW_4845:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@api_intel_bb@fail:</p>
<ul>
<li>Statuses : 37 fail(s)</li>
<li>Exec time: [0.02, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-1024:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.18, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-512:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.05, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-reloc-1024:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.18, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-none-reloc-512:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.04, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-1024:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.16, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-512:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.05, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-reloc-1024:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.17, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-x-reloc-512:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.04, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-1024:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.16, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-512:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.05, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-reloc-1024:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.17, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render@render-y-reloc-512:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.04, 0.21] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Additional (2): fi-ilk-650 fi-kbl-8809g <br />
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5757 -&gt; IGTPW_4845</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8834: ac25ad7789fe4cc689a854d823a226ce24bb0a62 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4845: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4845/index.html<br />
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@api_intel_bb@check-canonical<br />
+igt@api_intel_bb@fail<br />
+igt@api_intel_bb@render<br />
+igt@api_intel_bb@render-ccs<br />
+igt@api_intel_bb@reset-flags<br />
-igt@gem_read_read_speed@read-read-1x1<br />
-igt@gem_read_read_speed@read-write-1x1<br />
-igt@gem_read_read_speed@write-read-1x1<br />
-igt@gem_read_read_speed@write-write-1x1</p>

</body>
</html>

--===============0208405420247479055==--

--===============1221918390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1221918390==--

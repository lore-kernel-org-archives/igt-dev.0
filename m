Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Feb 2021 07:36:00 -0000
Message-ID: <161354736096.25000.2213514473031104535@emeril.freedesktop.org>
References: <20210217062631.9314-1-karthik.b.s@intel.com>
In-Reply-To: <20210217062631.9314-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?btests_for_HDCP_over_MST_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0324308751=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0324308751==
Content-Type: multipart/alternative;
 boundary="===============6813114870628679545=="

--===============6813114870628679545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add subtests for HDCP over MST (rev7)
URL   : https://patchwork.freedesktop.org/series/82987/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9779 -> IGTPW_5523
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5523:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@dp-mst-lic-type-0} (NEW):
    - fi-tgl-u2:          NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-tgl-u2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - {fi-ehl-1}:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-ehl-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-jsl-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - fi-cml-u2:          NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cml-u2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - fi-icl-y:           NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-icl-y/igt@kms_content_protection@dp-mst-lic-type-1.html
    - fi-cml-s:           NOTRUN -> [SKIP][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cml-s/igt@kms_content_protection@dp-mst-lic-type-1.html

  * {igt@kms_content_protection@dp-mst-type-0} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-tgl-dsi/igt@kms_content_protection@dp-mst-type-0.html
    - {fi-rkl-11500t}:    NOTRUN -> [SKIP][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-rkl-11500t/igt@kms_content_protection@dp-mst-type-0.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][9] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-guc/igt@kms_content_protection@dp-mst-type-0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][10] +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bsw-nick/igt@kms_content_protection@dp-mst-type-0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9779 and IGTPW_5523:

### New IGT tests (4) ###

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 2 fail(s) 30 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 2 fail(s) 30 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 2 fail(s) 30 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 2 fail(s) 30 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5523 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-7500u:       [PASS][11] -> [DMESG-WARN][12] ([i915#2605])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html

  * {igt@kms_content_protection@dp-mst-lic-type-0} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][13] ([fdo#109271]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-snb-2520m/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][14] ([fdo#109271]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-hsw-4770/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][15] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bxt-dsi/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][16] ([fdo#109271]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cfl-8700k/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][17] ([fdo#109271]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-skl-6700k2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-elk-e7500/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-ilk-650:         NOTRUN -> [SKIP][19] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-ilk-650/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bsw-n3050/igt@kms_content_protection@dp-mst-lic-type-0.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][21] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-x1275/igt@kms_content_protection@dp-mst-lic-type-0.html

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - fi-snb-2600:        NOTRUN -> [SKIP][22] ([fdo#109271]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-snb-2600/igt@kms_content_protection@dp-mst-lic-type-1.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][23] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-ivb-3770/igt@kms_content_protection@dp-mst-lic-type-1.html

  * {igt@kms_content_protection@dp-mst-type-0} (NEW):
    - fi-glk-dsi:         NOTRUN -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-glk-dsi/igt@kms_content_protection@dp-mst-type-0.html
    - fi-kbl-r:           NOTRUN -> [SKIP][25] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-r/igt@kms_content_protection@dp-mst-type-0.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-7500u/igt@kms_content_protection@dp-mst-type-0.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][27] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cfl-8109u/igt@kms_content_protection@dp-mst-type-0.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][28] ([fdo#109271]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bdw-5557u/igt@kms_content_protection@dp-mst-type-0.html

  * {igt@kms_content_protection@dp-mst-type-1} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-skl-6600u/igt@kms_content_protection@dp-mst-type-1.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-pnv-d510/igt@kms_content_protection@dp-mst-type-1.html
    - fi-byt-j1900:       NOTRUN -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-byt-j1900/igt@kms_content_protection@dp-mst-type-1.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][32] ([fdo#109271]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cfl-guc/igt@kms_content_protection@dp-mst-type-1.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][33] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-soraka/igt@kms_content_protection@dp-mst-type-1.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bsw-kefka/igt@kms_content_protection@dp-mst-type-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605


Participating hosts (45 -> 36)
------------------------------

  Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ehl-2 fi-ctg-p8600 fi-dg1-1 fi-tgl-y fi-bdw-samus fi-hsw-gt1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6004 -> IGTPW_5523

  CI-20190529: 20190529
  CI_DRM_9779: 775dbe8d5e041442fcadf63894468a63582a87a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5523: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html
  IGT_6004: fe9ac2aeffc1828c6d61763a611a44fbd450aa96 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@dp-mst-lic-type-0
+igt@kms_content_protection@dp-mst-lic-type-1
+igt@kms_content_protection@dp-mst-type-0
+igt@kms_content_protection@dp-mst-type-1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html

--===============6813114870628679545==
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
<tr><td><b>Series:</b></td><td>Add subtests for HDCP over MST (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82987/">https://patchwork.freedesktop.org/series/82987/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9779 -&gt; IGTPW_5523</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5523:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-0} (NEW):</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-tgl-u2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-ehl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-jsl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cml-u2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-icl-y/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cml-s/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-0} (NEW):</p>
<ul>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-tgl-dsi/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{fi-rkl-11500t}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-rkl-11500t/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-guc/igt@kms_content_protection@dp-mst-type-0.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bsw-nick/igt@kms_content_protection@dp-mst-type-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9779 and IGTPW_5523:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>Statuses : 2 fail(s) 30 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>Statuses : 2 fail(s) 30 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>Statuses : 2 fail(s) 30 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>Statuses : 2 fail(s) 30 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5523 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-0} (NEW):</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-snb-2520m/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-hsw-4770/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bxt-dsi/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cfl-8700k/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-skl-6700k2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-elk-e7500/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-ilk-650/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bsw-n3050/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-x1275/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-snb-2600/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-ivb-3770/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-0} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-glk-dsi/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-r/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-7500u/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cfl-8109u/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bdw-5557u/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-1} (NEW):</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-skl-6600u/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-pnv-d510/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-byt-j1900/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-cfl-guc/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-kbl-soraka/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/fi-bsw-kefka/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 36)</h2>
<p>Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ehl-2 fi-ctg-p8600 fi-dg1-1 fi-tgl-y fi-bdw-samus fi-hsw-gt1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6004 -&gt; IGTPW_5523</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9779: 775dbe8d5e041442fcadf63894468a63582a87a2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5523: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5523/index.html<br />
  IGT_6004: fe9ac2aeffc1828c6d61763a611a44fbd450aa96 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_content_protection@dp-mst-lic-type-0<br />
+igt@kms_content_protection@dp-mst-lic-type-1<br />
+igt@kms_content_protection@dp-mst-type-0<br />
+igt@kms_content_protection@dp-mst-type-1</p>

</body>
</html>

--===============6813114870628679545==--

--===============0324308751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0324308751==--

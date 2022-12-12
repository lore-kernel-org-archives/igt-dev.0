Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3464495149041792205=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Date: Mon, 12 Dec 2022 20:28:36 -0000
Message-ID: <167087691631.12118.15831676499404803704@emeril.freedesktop.org>
References: <20221212192425.387971-1-harry.wentland@amd.com>
In-Reply-To: <20221212192425.387971-1-harry.wentland@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIENv?=
 =?utf-8?q?lorspace_tests_to_kms=5Fhdr?=
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

--===============3464495149041792205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add Colorspace tests to kms_hdr
URL   : https://patchwork.freedesktop.org/series/111867/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12497 -> IGTPW_8222
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html

Participating hosts (18 -> 18)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (1): fi-rkl-11600 

Known issues
------------

  Here are the changes found in IGTPW_8222 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - fi-ivb-3770:        NOTRUN -> [SKIP][1] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][2] ([fdo#109271]) +44 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7091 -> IGTPW_8222

  CI-20190529: 20190529
  CI_DRM_12497: 6636ff92fd32bda3fed63832bc12bf2a9d7c1c33 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8222: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html
  IGT_7091: b8015f920c9f469d3733854263cb878373c1df51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_hdr@colorspace-switch
+igt@kms_hdr@colorspace-switch-dpms
+igt@kms_hdr@colorspace-switch-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html

--===============3464495149041792205==
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
<tr><td><b>Series:</b></td><td>Add Colorspace tests to kms_hdr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111867/">https://patchwork.freedesktop.org/series/111867/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12497 -&gt; IGTPW_8222</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html</p>
<h2>Participating hosts (18 -&gt; 18)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (1): fi-rkl-11600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8222 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7091 -&gt; IGTPW_8222</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12497: 6636ff92fd32bda3fed63832bc12bf2a9d7c1c33 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8222: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8222/index.html<br />
  IGT_7091: b8015f920c9f469d3733854263cb878373c1df51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_hdr@colorspace-switch<br />
+igt@kms_hdr@colorspace-switch-dpms<br />
+igt@kms_hdr@colorspace-switch-suspend</p>

</body>
</html>

--===============3464495149041792205==--

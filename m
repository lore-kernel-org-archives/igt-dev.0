Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1072150272753196100=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Dec 2021 11:53:15 -0000
Message-ID: <163835959581.14897.4925371998622808084@emeril.freedesktop.org>
References: <20211201091506.1020905-1-jouni.hogander@intel.com>
In-Reply-To: <20211201091506.1020905-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQmlwbGFu?=
 =?utf-8?q?ar_testcases_=28rev6=29?=
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
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1072150272753196100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Biplanar testcases (rev6)
URL   : https://patchwork.freedesktop.org/series/97232/
State : success

== Summary ==

CI Bug Log - changes from IGT_6296 -> IGTPW_6460
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html

Participating hosts (34 -> 33)
------------------------------

  Missing    (1): fi-bsw-cyan 

Known issues
------------

  Here are the changes found in IGTPW_6460 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#198])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6296/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
  [i915#198]: https://gitlab.freedesktop.org/drm/intel/issues/198


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6296 -> IGTPW_6460

  CI-20190529: 20190529
  CI_DRM_10949: c43a205a07b34ebbf7fe9205454a422147791ef3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6460: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html
  IGT_6296: 1869d560c550ac273f495076ead46f8a337fc20b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_psr2_sf@overlay-plane-update-continuous-sf
+igt@kms_psr2_su@frontbuffer-xrgb8888
+igt@kms_psr2_su@page_flip-nv12
+igt@kms_psr2_su@page_flip-p010
+igt@kms_psr2_su@page_flip-xrgb8888
-igt@kms_psr2_su@frontbuffer
-igt@kms_psr2_su@page_flip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html

--===============1072150272753196100==
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
<tr><td><b>Series:</b></td><td>Biplanar testcases (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97232/">https://patchwork.freedesktop.org/series/97232/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6296 -&gt; IGTPW_6460</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html</p>
<h2>Participating hosts (34 -&gt; 33)</h2>
<p>Missing    (1): fi-bsw-cyan </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6460 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6296/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/198">i915#198</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6296 -&gt; IGTPW_6460</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10949: c43a205a07b34ebbf7fe9205454a422147791ef3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6460: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6460/index.html<br />
  IGT_6296: 1869d560c550ac273f495076ead46f8a337fc20b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_psr2_sf@overlay-plane-update-continuous-sf<br />
+igt@kms_psr2_su@frontbuffer-xrgb8888<br />
+igt@kms_psr2_su@page_flip-nv12<br />
+igt@kms_psr2_su@page_flip-p010<br />
+igt@kms_psr2_su@page_flip-xrgb8888<br />
-igt@kms_psr2_su@frontbuffer<br />
-igt@kms_psr2_su@page_flip</p>

</body>
</html>

--===============1072150272753196100==--

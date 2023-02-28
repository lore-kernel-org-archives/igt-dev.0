Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4872552619926061815=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Tue, 28 Feb 2023 05:58:49 -0000
Message-ID: <167756392905.15129.9232531007127405607@emeril.freedesktop.org>
References: <20230227113407.20192-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230227113407.20192-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_add_invalid_pixel_format_tests_=28rev3=29?=
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

--===============4872552619926061815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: add invalid pixel format tests (rev3)
URL   : https://patchwork.freedesktop.org/series/114416/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12789 -> IGTPW_8537
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8537 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/fi-kbl-soraka/igt@debugfs_test@basic-hwmon.html

  * igt@gem_exec_fence@basic-busy@vecs0:
    - fi-kbl-soraka:      NOTRUN -> [ABORT][2] ([i915#8233])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@vecs0.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#8233]: https://gitlab.freedesktop.org/drm/intel/issues/8233


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7174 -> IGTPW_8537

  CI-20190529: 20190529
  CI_DRM_12789: 8589fd9227ca62484e8599cbd62216230c2c9a64 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8537: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html
  IGT_7174: 55642b7805d6fc5b987b396c2bbfa46db654db4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane@invalid-pixel-format-settings

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html

--===============4872552619926061815==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: add invalid pixel format tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114416/">https://patchwork.freedesktop.org/series/114416/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12789 -&gt; IGTPW_8537</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8537 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/fi-kbl-soraka/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8233">i915#8233</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7174 -&gt; IGTPW_8537</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12789: 8589fd9227ca62484e8599cbd62216230c2c9a64 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8537: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8537/index.html<br />
  IGT_7174: 55642b7805d6fc5b987b396c2bbfa46db654db4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane@invalid-pixel-format-settings</p>

</body>
</html>

--===============4872552619926061815==--

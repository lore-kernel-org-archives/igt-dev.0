Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4601946366598867814=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Fri, 22 Sep 2023 10:17:32 -0000
Message-ID: <169537785206.5199.7910982651897285617@emeril.freedesktop.org>
References: <20230915124409.3926662-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230915124409.3926662-1-tejas.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?xe=5Fdrm=5Ffdinfo=3A_Add_tests_to_read_and_verify_fdinfo_=28rev?=
 =?utf-8?q?5=29?=
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

--===============4601946366598867814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_drm_fdinfo: Add tests to read and verify fdinfo (rev5)
URL   : https://patchwork.freedesktop.org/series/123264/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13668 -> IGTPW_9848
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9848 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][1] ([i915#3546]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7496 -> IGTPW_9848

  CI-20190529: 20190529
  CI_DRM_13668: 5413464caa6cf37b1f511ba81d894ca40a28cbf2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html
  IGT_7496: 6a96d3ad178e468b74a58cc10dead2f57bc1558d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_drm_fdinfo@basic
+igt@xe_drm_fdinfo@drm-active
+igt@xe_drm_fdinfo@drm-shared
+igt@xe_drm_fdinfo@drm-total-resident

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html

--===============4601946366598867814==
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
<tr><td><b>Series:</b></td><td>tests/xe_drm_fdinfo: Add tests to read and verify fdinfo (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123264/">https://patchwork.freedesktop.org/series/123264/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13668 -&gt; IGTPW_9848</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9848 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7496 -&gt; IGTPW_9848</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13668: 5413464caa6cf37b1f511ba81d894ca40a28cbf2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9848/index.html<br />
  IGT_7496: 6a96d3ad178e468b74a58cc10dead2f57bc1558d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_drm_fdinfo@basic<br />
+igt@xe_drm_fdinfo@drm-active<br />
+igt@xe_drm_fdinfo@drm-shared<br />
+igt@xe_drm_fdinfo@drm-total-resident</p>

</body>
</html>

--===============4601946366598867814==--

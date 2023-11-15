Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2879899968776125393=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 15 Nov 2023 16:05:50 -0000
Message-ID: <170006435049.645.7068701852815114486@emeril.freedesktop.org>
References: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IHRo?=
 =?utf-8?q?e_usage_of_Rendercopy_in_KMS_tests_=28rev2=29?=
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

--===============2879899968776125393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix the usage of Rendercopy in KMS tests (rev2)
URL   : https://patchwork.freedesktop.org/series/126444/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13879 -> IGTPW_10193
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): bat-rpls-1 bat-mtlp-8 fi-snb-2520m fi-hsw-4770 

Known issues
------------

  Here are the changes found in IGTPW_10193 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][1] ([i915#1845] / [i915#3546]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#9648]: https://gitlab.freedesktop.org/drm/intel/issues/9648


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7590 -> IGTPW_10193

  CI-20190529: 20190529
  CI_DRM_13879: 45e4a5375bbab024819330e217b152926a872aac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html
  IGT_7590: c484e1422184a3183d11f1595e53a6715574520f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dirtyfb@default-dirtyfb-ioctl
+igt@kms_dirtyfb@drrs-dirtyfb-ioctl
+igt@kms_dirtyfb@fbc-dirtyfb-ioctl
+igt@kms_dirtyfb@psr-dirtyfb-ioctl
-igt@kms_dirtyfb@dirtyfb-ioctl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html

--===============2879899968776125393==
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
<tr><td><b>Series:</b></td><td>Fix the usage of Rendercopy in KMS tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126444/">https://patchwork.freedesktop.org/series/126444/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13879 -&gt; IGTPW_10193</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Missing    (4): bat-rpls-1 bat-mtlp-8 fi-snb-2520m fi-hsw-4770 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10193 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7590 -&gt; IGTPW_10193</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13879: 45e4a5375bbab024819330e217b152926a872aac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10193/index.html<br />
  IGT_7590: c484e1422184a3183d11f1595e53a6715574520f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dirtyfb@default-dirtyfb-ioctl<br />
+igt@kms_dirtyfb@drrs-dirtyfb-ioctl<br />
+igt@kms_dirtyfb@fbc-dirtyfb-ioctl<br />
+igt@kms_dirtyfb@psr-dirtyfb-ioctl<br />
-igt@kms_dirtyfb@dirtyfb-ioctl</p>

</body>
</html>

--===============2879899968776125393==--

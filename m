Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6842987566352613831=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_drm-uapi/xe=3A_Remove_sync_?=
 =?utf-8?q?binds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 14 Dec 2023 20:29:50 -0000
Message-ID: <170258579081.19959.8743886254317377940@emeril.freedesktop.org>
References: <20231214192408.661690-1-matthew.brost@intel.com>
In-Reply-To: <20231214192408.661690-1-matthew.brost@intel.com>
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

--===============6842987566352613831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe: Remove sync binds
URL   : https://patchwork.freedesktop.org/series/127834/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14022 -> IGTPW_10422
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (4): bat-jsl-1 bat-dg2-9 bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10422 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] ([fdo#109271]) +28 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
    - fi-bsw-n3050:       [DMESG-WARN][2] ([i915#1982]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14022/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7643 -> IGTPW_10422

  CI-20190529: 20190529
  CI_DRM_14022: 87fdea3fd86a02e2e7855e372c0d3fb32e53e4e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10422: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html
  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html

--===============6842987566352613831==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe: Remove sync binds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127834/">https://patchwork.freedesktop.org/series/127834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14022 -&gt; IGTPW_10422</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (4): bat-jsl-1 bat-dg2-9 bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10422 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@basic:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14022/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7643 -&gt; IGTPW_10422</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14022: 87fdea3fd86a02e2e7855e372c0d3fb32e53e4e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10422: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10422/index.html<br />
  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6842987566352613831==--

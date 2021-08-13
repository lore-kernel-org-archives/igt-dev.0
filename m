Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2664342916157511417=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Aug 2021 08:17:36 -0000
Message-ID: <162884265633.17680.4825649396811134914@emeril.freedesktop.org>
References: <20210813073858.1360821-1-mika.kahola@intel.com>
In-Reply-To: <20210813073858.1360821-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Limit_plane_testing_to_3_planes_by_de?=
 =?utf-8?q?fault_=28rev2=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2664342916157511417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_multiple: Limit plane testing to 3 planes by default (rev2)
URL   : https://patchwork.freedesktop.org/series/91170/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10481 -> IGTPW_6120
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html

Known issues
------------

  Here are the changes found in IGTPW_6120 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic:
    - fi-bsw-nick:        [PASS][1] -> [DMESG-WARN][2] ([i915#3428])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10481/fi-bsw-nick/igt@gem_ctx_exec@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/fi-bsw-nick/igt@gem_ctx_exec@basic.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][3] ([i915#3428])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-1115g4:      [FAIL][4] ([i915#1888]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10481/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-apl-guc bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6175 -> IGTPW_6120

  CI-20190529: 20190529
  CI_DRM_10481: 7a2a60f961bd7bcc00aacb1d590a2b11ff2a93bd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6120: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html
  IGT_6175: c91f99c74b966f635d7e2eb898bf0f78383d281b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html

--===============2664342916157511417==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_multiple: Limit plane testing to 3 planes by default (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91170/">https://patchwork.freedesktop.org/series/91170/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10481 -&gt; IGTPW_6120</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6120 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10481/fi-bsw-nick/igt@gem_ctx_exec@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/fi-bsw-nick/igt@gem_ctx_exec@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10481/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-apl-guc bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6175 -&gt; IGTPW_6120</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10481: 7a2a60f961bd7bcc00aacb1d590a2b11ff2a93bd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6120: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6120/index.html<br />
  IGT_6175: c91f99c74b966f635d7e2eb898bf0f78383d281b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2664342916157511417==--

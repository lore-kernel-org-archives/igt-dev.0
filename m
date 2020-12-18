Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Dec 2020 06:52:27 -0000
Message-ID: <160827434745.27181.6345500886505860936@emeril.freedesktop.org>
References: <20201218060635.8416-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201218060635.8416-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3Areduce_execution_time_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1929735777=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1929735777==
Content-Type: multipart/alternative;
 boundary="===============7488591676525216011=="

--===============7488591676525216011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition:reduce execution time (rev5)
URL   : https://patchwork.freedesktop.org/series/84516/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9502 -> IGTPW_5310
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html

Known issues
------------

  Here are the changes found in IGTPW_5310 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-kbl-soraka/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@gem_tiled_blits@basic:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/fi-tgl-y/igt@gem_tiled_blits@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-tgl-y/igt@gem_tiled_blits@basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          [PASS][4] -> [DMESG-WARN][5] ([i915#1226])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  
#### Possible fixes ####

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5908 -> IGTPW_5310

  CI-20190529: 20190529
  CI_DRM_9502: 062fb02ead4596719cd755fc28bcb44858a3d80b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html
  IGT_5908: b8b1391f7bfff83397ddc47c0083c2c7ed06be37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html

--===============7488591676525216011==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition:reduce execution time (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84516/">https://patchwork.freedesktop.org/series/84516/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9502 -&gt; IGTPW_5310</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5310 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-kbl-soraka/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/fi-tgl-y/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-tgl-y/igt@gem_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_self_import@basic-with_one_bo_two_files:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5908 -&gt; IGTPW_5310</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9502: 062fb02ead4596719cd755fc28bcb44858a3d80b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html<br />
  IGT_5908: b8b1391f7bfff83397ddc47c0083c2c7ed06be37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7488591676525216011==--

--===============1929735777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1929735777==--

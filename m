Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5762869915930993653=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Jan 2022 08:20:19 -0000
Message-ID: <164318521921.25401.6850623860350100385@emeril.freedesktop.org>
References: <20220126073410.11108-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20220126073410.11108-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Check_plane_capabilities_properly_in_async_fl?=
 =?utf-8?q?ip_tests?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5762869915930993653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_fb: Check plane capabilities properly in async flip tests
URL   : https://patchwork.freedesktop.org/series/99349/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11137 -> IGTPW_6579
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html

Participating hosts (48 -> 41)
------------------------------

  Missing    (7): fi-hsw-4200u fi-bdw-gvtdvm fi-bsw-cyan fi-icl-u2 fi-ctg-p8600 fi-kbl-8809g fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6579 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-skl-6600u:       NOTRUN -> [FAIL][1] ([i915#4547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-skl-6600u/igt@i915_selftest@live.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][2] -> [DMESG-FAIL][3] ([i915#295])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11137/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [PASS][4] -> [DMESG-WARN][5] ([i915#295]) +10 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11137/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][6] ([i915#1436] / [i915#4312])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-skl-6600u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - {fi-tgl-dsi}:       [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11137/fi-tgl-dsi/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-tgl-dsi/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6332 -> IGTPW_6579

  CI-20190529: 20190529
  CI_DRM_11137: 4d22013ea4c52e5dd3625861c9c65fb8027f53a6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6579: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html
  IGT_6332: 27c9c3f5181a840c777399be7681d2cadd7940cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html

--===============5762869915930993653==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_fb: Check plane capabilities properly in async flip tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99349/">https://patchwork.freedesktop.org/series/99349/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11137 -&gt; IGTPW_6579</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html</p>
<h2>Participating hosts (48 -&gt; 41)</h2>
<p>Missing    (7): fi-hsw-4200u fi-bdw-gvtdvm fi-bsw-cyan fi-icl-u2 fi-ctg-p8600 fi-kbl-8809g fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6579 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-skl-6600u/igt@i915_selftest@live.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11137/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11137/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-pipe-c:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11137/fi-tgl-dsi/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/fi-tgl-dsi/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6332 -&gt; IGTPW_6579</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11137: 4d22013ea4c52e5dd3625861c9c65fb8027f53a6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6579: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6579/index.html<br />
  IGT_6332: 27c9c3f5181a840c777399be7681d2cadd7940cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5762869915930993653==--

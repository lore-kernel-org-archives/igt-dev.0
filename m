Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 12 Feb 2021 06:30:39 -0000
Message-ID: <161311143932.25820.13139807160122812866@emeril.freedesktop.org>
References: <20210212054447.31713-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20210212054447.31713-1-mario.kleiner.de@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms-hdr=3A_Fix_HDMI=5FSTATIC=5FMETADATA=5FTYPE1=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0861335603=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0861335603==
Content-Type: multipart/alternative;
 boundary="===============3757307242614753485=="

--===============3757307242614753485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms-hdr: Fix HDMI_STATIC_METADATA_TYPE1.
URL   : https://patchwork.freedesktop.org/series/87009/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9768 -> IGTPW_5501
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html

Known issues
------------

  Here are the changes found in IGTPW_5501 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9768/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-u2:          [PASS][3] -> [FAIL][4] ([i915#1161] / [i915#262])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9768/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9768/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (44 -> 37)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-ehl-2 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6001 -> IGTPW_5501

  CI-20190529: 20190529
  CI_DRM_9768: b7a8fa73560e31af5b637bbf60d472f5a9e52856 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5501: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html
  IGT_6001: d0d6f5e14ef181c93e4b503b05d9c18fa480e09d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html

--===============3757307242614753485==
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
<tr><td><b>Series:</b></td><td>tests/kms-hdr: Fix HDMI_STATIC_METADATA_TYPE1.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87009/">https://patchwork.freedesktop.org/series/87009/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9768 -&gt; IGTPW_5501</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5501 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9768/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9768/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@debugfs_test@read_all_entries:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9768/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 37)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-ehl-2 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6001 -&gt; IGTPW_5501</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9768: b7a8fa73560e31af5b637bbf60d472f5a9e52856 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5501: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5501/index.html<br />
  IGT_6001: d0d6f5e14ef181c93e4b503b05d9c18fa480e09d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3757307242614753485==--

--===============0861335603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0861335603==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 30 Dec 2020 18:05:40 -0000
Message-ID: <160935154053.26070.5120695680160835212@emeril.freedesktop.org>
References: <20201230161952.1658206-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201230161952.1658206-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fsuspend=3A_Remove_legacy_ring_abi?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1481904236=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1481904236==
Content-Type: multipart/alternative;
 boundary="===============6102101264102162510=="

--===============6102101264102162510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_suspend: Remove legacy ring abi
URL   : https://patchwork.freedesktop.org/series/85328/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9534 -> IGTPW_5343
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html

Known issues
------------

  Here are the changes found in IGTPW_5343 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9534/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  
#### Possible fixes ####

  * igt@gem_basic@create-fd-close:
    - fi-tgl-y:           [DMESG-WARN][4] ([i915#402]) -> [PASS][5] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9534/fi-tgl-y/igt@gem_basic@create-fd-close.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-tgl-y/igt@gem_basic@create-fd-close.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#2411] / [i915#402]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9534/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 35)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5930 -> IGTPW_5343

  CI-20190529: 20190529
  CI_DRM_9534: 797de7a6fea9a997e5b529af8994b2f251779d0a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5343: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html
  IGT_5930: 9efe3bfcb2b1c3613dddc8761425aa6943fa162d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_suspend@cached-
+igt@gem_exec_suspend@cached--s3
+igt@gem_exec_suspend@cached--s4
+igt@gem_exec_suspend@uncached-
+igt@gem_exec_suspend@uncached--s3
+igt@gem_exec_suspend@uncached--s4
-igt@gem_exec_suspend@blt-cached
-igt@gem_exec_suspend@blt-cached-s3
-igt@gem_exec_suspend@blt-cached-s4
-igt@gem_exec_suspend@blt-uncached
-igt@gem_exec_suspend@blt-uncached-s3
-igt@gem_exec_suspend@blt-uncached-s4
-igt@gem_exec_suspend@bsd1-cached
-igt@gem_exec_suspend@bsd1-cached-s3
-igt@gem_exec_suspend@bsd1-cached-s4
-igt@gem_exec_suspend@bsd1-uncached
-igt@gem_exec_suspend@bsd1-uncached-s3
-igt@gem_exec_suspend@bsd1-uncached-s4
-igt@gem_exec_suspend@bsd2-cached
-igt@gem_exec_suspend@bsd2-cached-s3
-igt@gem_exec_suspend@bsd2-cached-s4
-igt@gem_exec_suspend@bsd2-uncached
-igt@gem_exec_suspend@bsd2-uncached-s3
-igt@gem_exec_suspend@bsd2-uncached-s4
-igt@gem_exec_suspend@bsd-cached
-igt@gem_exec_suspend@bsd-cached-s3
-igt@gem_exec_suspend@bsd-cached-s4
-igt@gem_exec_suspend@bsd-uncached
-igt@gem_exec_suspend@bsd-uncached-s3
-igt@gem_exec_suspend@bsd-uncached-s4
-igt@gem_exec_suspend@default-cached
-igt@gem_exec_suspend@default-cached-s3
-igt@gem_exec_suspend@default-cached-s4
-igt@gem_exec_suspend@default-uncached
-igt@gem_exec_suspend@default-uncached-s3
-igt@gem_exec_suspend@default-uncached-s4
-igt@gem_exec_suspend@render-cached
-igt@gem_exec_suspend@render-cached-s3
-igt@gem_exec_suspend@render-cached-s4
-igt@gem_exec_suspend@render-uncached
-igt@gem_exec_suspend@render-uncached-s3
-igt@gem_exec_suspend@render-uncached-s4
-igt@gem_exec_suspend@vebox-cached
-igt@gem_exec_suspend@vebox-cached-s3
-igt@gem_exec_suspend@vebox-cached-s4
-igt@gem_exec_suspend@vebox-uncached
-igt@gem_exec_suspend@vebox-uncached-s3
-igt@gem_exec_suspend@vebox-uncached-s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html

--===============6102101264102162510==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_suspend: Remove legacy ring abi</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85328/">https://patchwork.freedesktop.org/series/85328/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9534 -&gt; IGTPW_5343</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5343 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9534/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_basic@create-fd-close:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9534/fi-tgl-y/igt@gem_basic@create-fd-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-tgl-y/igt@gem_basic@create-fd-close.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9534/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 35)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5930 -&gt; IGTPW_5343</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9534: 797de7a6fea9a997e5b529af8994b2f251779d0a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5343: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5343/index.html<br />
  IGT_5930: 9efe3bfcb2b1c3613dddc8761425aa6943fa162d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_suspend@cached-<br />
+igt@gem_exec_suspend@cached--s3<br />
+igt@gem_exec_suspend@cached--s4<br />
+igt@gem_exec_suspend@uncached-<br />
+igt@gem_exec_suspend@uncached--s3<br />
+igt@gem_exec_suspend@uncached--s4<br />
-igt@gem_exec_suspend@blt-cached<br />
-igt@gem_exec_suspend@blt-cached-s3<br />
-igt@gem_exec_suspend@blt-cached-s4<br />
-igt@gem_exec_suspend@blt-uncached<br />
-igt@gem_exec_suspend@blt-uncached-s3<br />
-igt@gem_exec_suspend@blt-uncached-s4<br />
-igt@gem_exec_suspend@bsd1-cached<br />
-igt@gem_exec_suspend@bsd1-cached-s3<br />
-igt@gem_exec_suspend@bsd1-cached-s4<br />
-igt@gem_exec_suspend@bsd1-uncached<br />
-igt@gem_exec_suspend@bsd1-uncached-s3<br />
-igt@gem_exec_suspend@bsd1-uncached-s4<br />
-igt@gem_exec_suspend@bsd2-cached<br />
-igt@gem_exec_suspend@bsd2-cached-s3<br />
-igt@gem_exec_suspend@bsd2-cached-s4<br />
-igt@gem_exec_suspend@bsd2-uncached<br />
-igt@gem_exec_suspend@bsd2-uncached-s3<br />
-igt@gem_exec_suspend@bsd2-uncached-s4<br />
-igt@gem_exec_suspend@bsd-cached<br />
-igt@gem_exec_suspend@bsd-cached-s3<br />
-igt@gem_exec_suspend@bsd-cached-s4<br />
-igt@gem_exec_suspend@bsd-uncached<br />
-igt@gem_exec_suspend@bsd-uncached-s3<br />
-igt@gem_exec_suspend@bsd-uncached-s4<br />
-igt@gem_exec_suspend@default-cached<br />
-igt@gem_exec_suspend@default-cached-s3<br />
-igt@gem_exec_suspend@default-cached-s4<br />
-igt@gem_exec_suspend@default-uncached<br />
-igt@gem_exec_suspend@default-uncached-s3<br />
-igt@gem_exec_suspend@default-uncached-s4<br />
-igt@gem_exec_suspend@render-cached<br />
-igt@gem_exec_suspend@render-cached-s3<br />
-igt@gem_exec_suspend@render-cached-s4<br />
-igt@gem_exec_suspend@render-uncached<br />
-igt@gem_exec_suspend@render-uncached-s3<br />
-igt@gem_exec_suspend@render-uncached-s4<br />
-igt@gem_exec_suspend@vebox-cached<br />
-igt@gem_exec_suspend@vebox-cached-s3<br />
-igt@gem_exec_suspend@vebox-cached-s4<br />
-igt@gem_exec_suspend@vebox-uncached<br />
-igt@gem_exec_suspend@vebox-uncached-s3<br />
-igt@gem_exec_suspend@vebox-uncached-s4</p>

</body>
</html>

--===============6102101264102162510==--

--===============1481904236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1481904236==--

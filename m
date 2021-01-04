Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Jan 2021 11:52:32 -0000
Message-ID: <160976115262.24931.6273939629741790130@emeril.freedesktop.org>
References: <20210104104324.3125175-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210104104324.3125175-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fspin=5Fbatch=3A_Convert_to_dynamic_engine_discovery?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1898356659=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1898356659==
Content-Type: multipart/alternative;
 boundary="===============3958010752409112245=="

--===============3958010752409112245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_spin_batch: Convert to dynamic engine discovery
URL   : https://patchwork.freedesktop.org/series/85438/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9541 -> IGTPW_5348
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html

Known issues
------------

  Here are the changes found in IGTPW_5348 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][3] -> [INCOMPLETE][4] ([i915#142] / [i915#2405])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@runner@aborted:
    - fi-byt-j1900:       NOTRUN -> [FAIL][5] ([i915#1814] / [i915#2505])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-byt-j1900/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5941 -> IGTPW_5348

  CI-20190529: 20190529
  CI_DRM_9541: e8f34fa9c86e87ec32f92ec9b615e468928233f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5348: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html
  IGT_5941: 58b135e66be4fa4db8f668fa5d125b31537cb9a6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_spin_batch@engines
+igt@gem_spin_batch@legacy
+igt@gem_spin_batch@legacy-resubmit
+igt@gem_spin_batch@legacy-resubmit-new
+igt@gem_spin_batch@resubmit
+igt@gem_spin_batch@resubmit-all
+igt@gem_spin_batch@resubmit-new
+igt@gem_spin_batch@resubmit-new-all
-igt@gem_spin_batch@bcs0
-igt@gem_spin_batch@legacy-blt
-igt@gem_spin_batch@legacy-bsd1
-igt@gem_spin_batch@legacy-bsd2
-igt@gem_spin_batch@legacy-default
-igt@gem_spin_batch@legacy-render
-igt@gem_spin_batch@legacy-resubmit-blt
-igt@gem_spin_batch@legacy-resubmit-bsd1
-igt@gem_spin_batch@legacy-resubmit-bsd2
-igt@gem_spin_batch@legacy-resubmit-default
-igt@gem_spin_batch@legacy-resubmit-new-blt
-igt@gem_spin_batch@legacy-resubmit-new-bsd1
-igt@gem_spin_batch@legacy-resubmit-new-bsd2
-igt@gem_spin_batch@legacy-resubmit-new-default
-igt@gem_spin_batch@legacy-resubmit-new-render
-igt@gem_spin_batch@legacy-resubmit-new-vebox
-igt@gem_spin_batch@legacy-resubmit-render
-igt@gem_spin_batch@legacy-resubmit-vebox
-igt@gem_spin_batch@legacy-vebox
-igt@gem_spin_batch@rcs0
-igt@gem_spin_batch@resubmit-all-bcs0
-igt@gem_spin_batch@resubmit-all-rcs0
-igt@gem_spin_batch@resubmit-all-vcs0
-igt@gem_spin_batch@resubmit-all-vcs1
-igt@gem_spin_batch@resubmit-all-vcs2
-igt@gem_spin_batch@resubmit-all-vecs0
-igt@gem_spin_batch@resubmit-bcs0
-igt@gem_spin_batch@resubmit-new-all-bcs0
-igt@gem_spin_batch@resubmit-new-all-rcs0
-igt@gem_spin_batch@resubmit-new-all-vcs0
-igt@gem_spin_batch@resubmit-new-all-vcs1
-igt@gem_spin_batch@resubmit-new-all-vcs2
-igt@gem_spin_batch@resubmit-new-all-vecs0
-igt@gem_spin_batch@resubmit-new-bcs0
-igt@gem_spin_batch@resubmit-new-rcs0
-igt@gem_spin_batch@resubmit-new-vcs0
-igt@gem_spin_batch@resubmit-new-vcs1
-igt@gem_spin_batch@resubmit-new-vcs2
-igt@gem_spin_batch@resubmit-new-vecs0
-igt@gem_spin_batch@resubmit-rcs0
-igt@gem_spin_batch@resubmit-vcs0
-igt@gem_spin_batch@resubmit-vcs1
-igt@gem_spin_batch@resubmit-vcs2
-igt@gem_spin_batch@resubmit-vecs0
-igt@gem_spin_batch@vcs0
-igt@gem_spin_batch@vcs1
-igt@gem_spin_batch@vcs2
-igt@gem_spin_batch@vecs0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html

--===============3958010752409112245==
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
<tr><td><b>Series:</b></td><td>i915/gem_spin_batch: Convert to dynamic engine discovery</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85438/">https://patchwork.freedesktop.org/series/85438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9541 -&gt; IGTPW_5348</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5348 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-byt-j1900/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_self_import@basic-with_two_bos:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5941 -&gt; IGTPW_5348</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9541: e8f34fa9c86e87ec32f92ec9b615e468928233f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5348: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html<br />
  IGT_5941: 58b135e66be4fa4db8f668fa5d125b31537cb9a6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_spin_batch@engines<br />
+igt@gem_spin_batch@legacy<br />
+igt@gem_spin_batch@legacy-resubmit<br />
+igt@gem_spin_batch@legacy-resubmit-new<br />
+igt@gem_spin_batch@resubmit<br />
+igt@gem_spin_batch@resubmit-all<br />
+igt@gem_spin_batch@resubmit-new<br />
+igt@gem_spin_batch@resubmit-new-all<br />
-igt@gem_spin_batch@bcs0<br />
-igt@gem_spin_batch@legacy-blt<br />
-igt@gem_spin_batch@legacy-bsd1<br />
-igt@gem_spin_batch@legacy-bsd2<br />
-igt@gem_spin_batch@legacy-default<br />
-igt@gem_spin_batch@legacy-render<br />
-igt@gem_spin_batch@legacy-resubmit-blt<br />
-igt@gem_spin_batch@legacy-resubmit-bsd1<br />
-igt@gem_spin_batch@legacy-resubmit-bsd2<br />
-igt@gem_spin_batch@legacy-resubmit-default<br />
-igt@gem_spin_batch@legacy-resubmit-new-blt<br />
-igt@gem_spin_batch@legacy-resubmit-new-bsd1<br />
-igt@gem_spin_batch@legacy-resubmit-new-bsd2<br />
-igt@gem_spin_batch@legacy-resubmit-new-default<br />
-igt@gem_spin_batch@legacy-resubmit-new-render<br />
-igt@gem_spin_batch@legacy-resubmit-new-vebox<br />
-igt@gem_spin_batch@legacy-resubmit-render<br />
-igt@gem_spin_batch@legacy-resubmit-vebox<br />
-igt@gem_spin_batch@legacy-vebox<br />
-igt@gem_spin_batch@rcs0<br />
-igt@gem_spin_batch@resubmit-all-bcs0<br />
-igt@gem_spin_batch@resubmit-all-rcs0<br />
-igt@gem_spin_batch@resubmit-all-vcs0<br />
-igt@gem_spin_batch@resubmit-all-vcs1<br />
-igt@gem_spin_batch@resubmit-all-vcs2<br />
-igt@gem_spin_batch@resubmit-all-vecs0<br />
-igt@gem_spin_batch@resubmit-bcs0<br />
-igt@gem_spin_batch@resubmit-new-all-bcs0<br />
-igt@gem_spin_batch@resubmit-new-all-rcs0<br />
-igt@gem_spin_batch@resubmit-new-all-vcs0<br />
-igt@gem_spin_batch@resubmit-new-all-vcs1<br />
-igt@gem_spin_batch@resubmit-new-all-vcs2<br />
-igt@gem_spin_batch@resubmit-new-all-vecs0<br />
-igt@gem_spin_batch@resubmit-new-bcs0<br />
-igt@gem_spin_batch@resubmit-new-rcs0<br />
-igt@gem_spin_batch@resubmit-new-vcs0<br />
-igt@gem_spin_batch@resubmit-new-vcs1<br />
-igt@gem_spin_batch@resubmit-new-vcs2<br />
-igt@gem_spin_batch@resubmit-new-vecs0<br />
-igt@gem_spin_batch@resubmit-rcs0<br />
-igt@gem_spin_batch@resubmit-vcs0<br />
-igt@gem_spin_batch@resubmit-vcs1<br />
-igt@gem_spin_batch@resubmit-vcs2<br />
-igt@gem_spin_batch@resubmit-vecs0<br />
-igt@gem_spin_batch@vcs0<br />
-igt@gem_spin_batch@vcs1<br />
-igt@gem_spin_batch@vcs2<br />
-igt@gem_spin_batch@vecs0</p>

</body>
</html>

--===============3958010752409112245==--

--===============1898356659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1898356659==--

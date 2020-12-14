Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 14 Dec 2020 22:50:52 -0000
Message-ID: <160798625232.28166.3182646245348805020@emeril.freedesktop.org>
References: <20201214205945.816389-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201214205945.816389-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fshrink=3A_Refactor_allocation_sizing_based_on_available_me?=
 =?utf-8?q?mory?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0322444640=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0322444640==
Content-Type: multipart/alternative;
 boundary="===============4853410427388526389=="

--===============4853410427388526389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_shrink: Refactor allocation sizing based on available memory
URL   : https://patchwork.freedesktop.org/series/84919/
State : success

== Summary ==

CI Bug Log - changes from IGT_5896 -> IGTPW_5289
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5289 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5289, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5289:

### IGT changes ###

#### Warnings ####

  * igt@gem_linear_blits@basic:
    - fi-tgl-y:           [DMESG-WARN][1] ([i915#402]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@gem_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@gem_linear_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5289 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@basic:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@gem_flink_basic@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@gem_flink_basic@basic.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-tgl-y:           [PASS][5] -> [DMESG-FAIL][6] ([i915#2601])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-snb-2600:        NOTRUN -> [SKIP][7] ([fdo#109271]) +30 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-snb-2600:        NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-snb-2600:        [DMESG-WARN][9] ([i915#2772]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@prime_vgem@basic-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-gdg-551:         [SKIP][13] ([fdo#109271]) -> [INCOMPLETE][14] ([i915#172])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#172]: https://gitlab.freedesktop.org/drm/intel/issues/172
  [i915#2601]: https://gitlab.freedesktop.org/drm/intel/issues/2601
  [i915#2772]: https://gitlab.freedesktop.org/drm/intel/issues/2772
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5896 -> IGTPW_5289

  CI-20190529: 20190529
  CI_DRM_9482: 279e4ca8a7117e617c498833deaa287b797e7d09 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5289: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html
  IGT_5896: f8189464485ccbd07776e8c1a3aa1582e365cfe0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html

--===============4853410427388526389==
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
<tr><td><b>Series:</b></td><td>i915/gem_shrink: Refactor allocation sizing based on available memory</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84919/">https://patchwork.freedesktop.org/series/84919/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5896 -&gt; IGTPW_5289</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5289 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5289, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5289:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@gem_linear_blits@basic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@gem_linear_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@gem_linear_blits@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5289 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@gem_flink_basic@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@gem_flink_basic@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2601">i915#2601</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2772">i915#2772</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-snb-2600/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-tgl-y/igt@prime_vgem@basic-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-tgl-y/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@amdgpu/amd_prime@i915-to-amd:<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5896/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/fi-gdg-551/igt@amdgpu/amd_prime@i915-to-amd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/172">i915#172</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5896 -&gt; IGTPW_5289</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9482: 279e4ca8a7117e617c498833deaa287b797e7d09 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5289: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5289/index.html<br />
  IGT_5896: f8189464485ccbd07776e8c1a3aa1582e365cfe0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4853410427388526389==--

--===============0322444640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0322444640==--

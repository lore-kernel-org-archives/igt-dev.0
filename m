Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Dec 2020 07:06:50 -0000
Message-ID: <160810241038.16509.14890399054355210293@emeril.freedesktop.org>
References: <20201216064227.4660-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201216064227.4660-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX2F0?=
 =?utf-8?q?omic=5Ftransition=3AConvert_nx-modeset-transitions_subtest_to_d?=
 =?utf-8?q?ynamic_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0493995885=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0493995885==
Content-Type: multipart/alternative;
 boundary="===============0165676463177179257=="

--===============0165676463177179257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_atomic_transition:Convert nx-modeset-transitions subtest to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/84903/
State : success

== Summary ==

CI Bug Log - changes from IGT_5903 -> IGTPW_5297
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html

Known issues
------------

  Here are the changes found in IGTPW_5297 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][1] -> [FAIL][2] ([i915#1161] / [i915#262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5903/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262


Participating hosts (42 -> 37)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (6): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-tgl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5903 -> IGTPW_5297

  CI-20190529: 20190529
  CI_DRM_9489: bef2104ec6e0aa163b1b01b661e734b08b567aeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5297: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html
  IGT_5903: e4a5c72eaa83aa07ff6847e4c166c17dd29722f0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic_transition@modeset-transition
+igt@kms_atomic_transition@modeset-transition-fencing
+igt@kms_atomic_transition@modeset-transition-nonblocking
+igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
-igt@kms_atomic_transition@1x-modeset-transitions
-igt@kms_atomic_transition@1x-modeset-transitions-fencing
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@2x-modeset-transitions
-igt@kms_atomic_transition@2x-modeset-transitions-fencing
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@3x-modeset-transitions
-igt@kms_atomic_transition@3x-modeset-transitions-fencing
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@4x-modeset-transitions
-igt@kms_atomic_transition@4x-modeset-transitions-fencing
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@5x-modeset-transitions
-igt@kms_atomic_transition@5x-modeset-transitions-fencing
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing
-igt@kms_atomic_transition@6x-modeset-transitions
-igt@kms_atomic_transition@6x-modeset-transitions-fencing
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html

--===============0165676463177179257==
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
<tr><td><b>Series:</b></td><td>kms_atomic_transition:Convert nx-modeset-transitions subtest to dynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84903/">https://patchwork.freedesktop.org/series/84903/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5903 -&gt; IGTPW_5297</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5297 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium@dp-crc-fast:<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5903/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (6): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-tgl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5903 -&gt; IGTPW_5297</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9489: bef2104ec6e0aa163b1b01b661e734b08b567aeb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5297: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5297/index.html<br />
  IGT_5903: e4a5c72eaa83aa07ff6847e4c166c17dd29722f0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_atomic_transition@modeset-transition<br />
+igt@kms_atomic_transition@modeset-transition-fencing<br />
+igt@kms_atomic_transition@modeset-transition-nonblocking<br />
+igt@kms_atomic_transition@modeset-transition-nonblocking-fencing<br />
-igt@kms_atomic_transition@1x-modeset-transitions<br />
-igt@kms_atomic_transition@1x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@2x-modeset-transitions<br />
-igt@kms_atomic_transition@2x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@3x-modeset-transitions<br />
-igt@kms_atomic_transition@3x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@4x-modeset-transitions<br />
-igt@kms_atomic_transition@4x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@5x-modeset-transitions<br />
-igt@kms_atomic_transition@5x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing<br />
-igt@kms_atomic_transition@6x-modeset-transitions<br />
-igt@kms_atomic_transition@6x-modeset-transitions-fencing<br />
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking<br />
-igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing</p>

</body>
</html>

--===============0165676463177179257==--

--===============0493995885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0493995885==--

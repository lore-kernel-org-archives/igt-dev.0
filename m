Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Jul 2021 06:27:36 -0000
Message-ID: <162702165676.3042.18028199317660301489@emeril.freedesktop.org>
References: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTGltaXQg?=
 =?utf-8?q?the_HANG_tests_to_two_pipes_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1332438845=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1332438845==
Content-Type: multipart/alternative;
 boundary="===============2241035431240184674=="

--===============2241035431240184674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit the HANG tests to two pipes (rev2)
URL   : https://patchwork.freedesktop.org/series/92187/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10376 -> IGTPW_6046
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html

Known issues
------------

  Here are the changes found in IGTPW_6046 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#3004]: https://gitlab.freedesktop.org/drm/intel/issues/3004


Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6147 -> IGTPW_6046

  CI-20190529: 20190529
  CI_DRM_10376: 299bd09eafa6bf94ac922867ee0c797f8e569d3b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6046: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html
  IGT_6147: f3994c2cd99a1acfe991a8cc838a387dcb36598a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_busy@basic-hang
+igt@kms_busy@extended-modeset-hang-newfb
+igt@kms_busy@extended-modeset-hang-newfb-with-reset
+igt@kms_busy@extended-modeset-hang-oldfb
+igt@kms_busy@extended-modeset-hang-oldfb-with-reset
+igt@kms_busy@extended-pageflip-hang-newfb
+igt@kms_busy@extended-pageflip-hang-oldfb
+igt@kms_busy@extended-pageflip-modeset-hang-oldfb
-igt@kms_busy@basic-flip-pipe-a
-igt@kms_busy@basic-flip-pipe-b
-igt@kms_busy@basic-flip-pipe-c
-igt@kms_busy@basic-flip-pipe-d
-igt@kms_busy@basic-flip-pipe-e
-igt@kms_busy@basic-flip-pipe-f
-igt@kms_busy@basic-modeset-pipe-a
-igt@kms_busy@basic-modeset-pipe-b
-igt@kms_busy@basic-modeset-pipe-c
-igt@kms_busy@basic-modeset-pipe-d
-igt@kms_busy@basic-modeset-pipe-e
-igt@kms_busy@basic-modeset-pipe-f
-igt@kms_busy@extended-modeset-hang-newfb-pipe-a
-igt@kms_busy@extended-modeset-hang-newfb-pipe-b
-igt@kms_busy@extended-modeset-hang-newfb-pipe-c
-igt@kms_busy@extended-modeset-hang-newfb-pipe-d
-igt@kms_busy@extended-modeset-hang-newfb-pipe-e
-igt@kms_busy@extended-modeset-hang-newfb-pipe-f
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-a
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-b
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-c
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-d
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-e
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-f
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-a
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-b
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-c
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-d
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-e
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-f
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-a
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-b
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-c
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-d
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-e
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-f
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-a
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-b
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-c
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-d
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-e
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-f
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-a
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-b
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-c
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-d
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-e
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-f
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-a
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-b
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-c
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-d
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-e
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html

--===============2241035431240184674==
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
<tr><td><b>Series:</b></td><td>Limit the HANG tests to two pipes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92187/">https://patchwork.freedesktop.org/series/92187/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10376 -&gt; IGTPW_6046</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6046 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3:<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10376/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6147 -&gt; IGTPW_6046</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10376: 299bd09eafa6bf94ac922867ee0c797f8e569d3b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6046: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6046/index.html<br />
  IGT_6147: f3994c2cd99a1acfe991a8cc838a387dcb36598a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_busy@basic-hang<br />
+igt@kms_busy@extended-modeset-hang-newfb<br />
+igt@kms_busy@extended-modeset-hang-newfb-with-reset<br />
+igt@kms_busy@extended-modeset-hang-oldfb<br />
+igt@kms_busy@extended-modeset-hang-oldfb-with-reset<br />
+igt@kms_busy@extended-pageflip-hang-newfb<br />
+igt@kms_busy@extended-pageflip-hang-oldfb<br />
+igt@kms_busy@extended-pageflip-modeset-hang-oldfb<br />
-igt@kms_busy@basic-flip-pipe-a<br />
-igt@kms_busy@basic-flip-pipe-b<br />
-igt@kms_busy@basic-flip-pipe-c<br />
-igt@kms_busy@basic-flip-pipe-d<br />
-igt@kms_busy@basic-flip-pipe-e<br />
-igt@kms_busy@basic-flip-pipe-f<br />
-igt@kms_busy@basic-modeset-pipe-a<br />
-igt@kms_busy@basic-modeset-pipe-b<br />
-igt@kms_busy@basic-modeset-pipe-c<br />
-igt@kms_busy@basic-modeset-pipe-d<br />
-igt@kms_busy@basic-modeset-pipe-e<br />
-igt@kms_busy@basic-modeset-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-newfb-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-newfb-with-reset-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-oldfb-pipe-f<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-a<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-b<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-c<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-d<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-e<br />
-igt@kms_busy@extended-modeset-hang-oldfb-with-reset-pipe-f<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-hang-newfb-pipe-f<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-hang-oldfb-pipe-f<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-a<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-b<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-c<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-d<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-e<br />
-igt@kms_busy@extended-pageflip-modeset-hang-oldfb-pipe-f</p>

</body>
</html>

--===============2241035431240184674==--

--===============1332438845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1332438845==--

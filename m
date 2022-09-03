Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2265551206087221419=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Sat, 03 Sep 2022 22:50:33 -0000
Message-ID: <166224543392.27810.7601843100424156056@emeril.freedesktop.org>
References: <20220903174803.2937836-1-alex.hung@amd.com>
In-Reply-To: <20220903174803.2937836-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2CV4=5D_tests/kms=5Funiversal=5Fplane=3A_?=
 =?utf-8?q?Enable_gen9=5Ftest=5Fpipe_for_all_devices_=28rev2=29?=
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

--===============2265551206087221419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,V4] tests/kms_universal_plane: Enable gen9_test_pipe for all devices (rev2)
URL   : https://patchwork.freedesktop.org/series/108096/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12068 -> IGTPW_7731
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7731 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7731, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html

Participating hosts (25 -> 30)
------------------------------

  Additional (7): bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-adln-1 bat-jsl-3 bat-rpls-1 bat-dg2-11 
  Missing    (2): fi-rkl-11600 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7731:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-bdw-5557u:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12068/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_7731 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][3] -> [DMESG-FAIL][4] ([i915#4528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12068/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#2403] / [i915#4312])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/fi-pnv-d510/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6641]: https://gitlab.freedesktop.org/drm/intel/issues/6641


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6642 -> IGTPW_7731

  CI-20190529: 20190529
  CI_DRM_12068: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7731: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html
  IGT_6642: c018ce1d1ab8e570f665cf5d58c9802a44d66cc1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html

--===============2265551206087221419==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,V4] tests/kms_universal_plane: Enable gen9_test_pipe for all devices (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108096/">https://patchwork.freedesktop.org/series/108096/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12068 -&gt; IGTPW_7731</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7731 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7731, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html</p>
<h2>Participating hosts (25 -&gt; 30)</h2>
<p>Additional (7): bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-adln-1 bat-jsl-3 bat-rpls-1 bat-dg2-11 <br />
  Missing    (2): fi-rkl-11600 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7731:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12068/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7731 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12068/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6642 -&gt; IGTPW_7731</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12068: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7731: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7731/index.html<br />
  IGT_6642: c018ce1d1ab8e570f665cf5d58c9802a44d66cc1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f</p>

</body>
</html>

--===============2265551206087221419==--

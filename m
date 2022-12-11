Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9100709222557104228=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Sun, 11 Dec 2022 21:00:06 -0000
Message-ID: <167079240630.863.4559499702367100804@emeril.freedesktop.org>
References: <20221211195238.120566-1-robdclark@gmail.com>
In-Reply-To: <20221211195238.120566-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_lib=3A_Add_helper_to_wait_and_close_fe?=
 =?utf-8?q?nce_fd?=
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

--===============9100709222557104228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] lib: Add helper to wait and close fence fd
URL   : https://patchwork.freedesktop.org/series/111827/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12491 -> IGTPW_8218
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html

Participating hosts (41 -> 22)
------------------------------

  Missing    (19): fi-kbl-soraka bat-adls-5 bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-rpls-2 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-hsw-4770 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick bat-kbl-2 bat-adlp-9 bat-adlp-4 

Known issues
------------

  Here are the changes found in IGTPW_8218 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#4983])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][3] -> [INCOMPLETE][4] ([i915#4817])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - {bat-adln-1}:       [DMESG-FAIL][5] ([i915#4258]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/bat-adln-1/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/bat-adln-1/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][7] ([i915#6298]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7090 -> IGTPW_8218

  CI-20190529: 20190529
  CI_DRM_12491: d322881f7e33af24901ee8ccaec3beef82f21203 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8218: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html
  IGT_7090: 5aafcf060b6dfbb2fa7aace76c8074d98ac7da8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@msm_shrink@copy-gpu-8
+igt@msm_shrink@copy-gpu-32
+igt@msm_shrink@copy-gpu-madvise-8
+igt@msm_shrink@copy-gpu-madvise-32
+igt@msm_shrink@copy-gpu-oom-8
+igt@msm_shrink@copy-gpu-oom-32
+igt@msm_shrink@copy-gpu-sanitycheck-8
+igt@msm_shrink@copy-gpu-sanitycheck-32
+igt@msm_shrink@copy-mmap-8
+igt@msm_shrink@copy-mmap-32
+igt@msm_shrink@copy-mmap-dmabuf-8
+igt@msm_shrink@copy-mmap-dmabuf-32
+igt@msm_shrink@copy-mmap-dmabuf-madvise-8
+igt@msm_shrink@copy-mmap-dmabuf-madvise-32
+igt@msm_shrink@copy-mmap-dmabuf-oom-8
+igt@msm_shrink@copy-mmap-dmabuf-oom-32
+igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-8
+igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-32
+igt@msm_shrink@copy-mmap-madvise-8
+igt@msm_shrink@copy-mmap-madvise-32
+igt@msm_shrink@copy-mmap-oom-8
+igt@msm_shrink@copy-mmap-oom-32
+igt@msm_shrink@copy-mmap-sanitycheck-8
+igt@msm_shrink@copy-mmap-sanitycheck-32

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html

--===============9100709222557104228==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] lib: Add helper to wait and close fence fd</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111827/">https://patchwork.freedesktop.org/series/111827/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12491 -&gt; IGTPW_8218</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html</p>
<h2>Participating hosts (41 -&gt; 22)</h2>
<p>Missing    (19): fi-kbl-soraka bat-adls-5 bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-rpls-2 fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-hsw-4770 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick bat-kbl-2 bat-adlp-9 bat-adlp-4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8218 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/bat-adln-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/bat-adln-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12491/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7090 -&gt; IGTPW_8218</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12491: d322881f7e33af24901ee8ccaec3beef82f21203 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8218: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8218/index.html<br />
  IGT_7090: 5aafcf060b6dfbb2fa7aace76c8074d98ac7da8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@msm_shrink@copy-gpu-8<br />
+igt@msm_shrink@copy-gpu-32<br />
+igt@msm_shrink@copy-gpu-madvise-8<br />
+igt@msm_shrink@copy-gpu-madvise-32<br />
+igt@msm_shrink@copy-gpu-oom-8<br />
+igt@msm_shrink@copy-gpu-oom-32<br />
+igt@msm_shrink@copy-gpu-sanitycheck-8<br />
+igt@msm_shrink@copy-gpu-sanitycheck-32<br />
+igt@msm_shrink@copy-mmap-8<br />
+igt@msm_shrink@copy-mmap-32<br />
+igt@msm_shrink@copy-mmap-dmabuf-8<br />
+igt@msm_shrink@copy-mmap-dmabuf-32<br />
+igt@msm_shrink@copy-mmap-dmabuf-madvise-8<br />
+igt@msm_shrink@copy-mmap-dmabuf-madvise-32<br />
+igt@msm_shrink@copy-mmap-dmabuf-oom-8<br />
+igt@msm_shrink@copy-mmap-dmabuf-oom-32<br />
+igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-8<br />
+igt@msm_shrink@copy-mmap-dmabuf-sanitycheck-32<br />
+igt@msm_shrink@copy-mmap-madvise-8<br />
+igt@msm_shrink@copy-mmap-madvise-32<br />
+igt@msm_shrink@copy-mmap-oom-8<br />
+igt@msm_shrink@copy-mmap-oom-32<br />
+igt@msm_shrink@copy-mmap-sanitycheck-8<br />
+igt@msm_shrink@copy-mmap-sanitycheck-32</p>

</body>
</html>

--===============9100709222557104228==--

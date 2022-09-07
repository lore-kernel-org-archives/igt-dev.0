Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7929478585023813613=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Wed, 07 Sep 2022 08:34:15 -0000
Message-ID: <166253965561.19838.7643395162118624327@emeril.freedesktop.org>
References: <20220907072916.405508-1-ananya.sharma@intel.com>
In-Reply-To: <20220907072916.405508-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSUdUIGNs?=
 =?utf-8?q?ean-up_tasks_=28rev4=29?=
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

--===============7929478585023813613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT clean-up tasks (rev4)
URL   : https://patchwork.freedesktop.org/series/104318/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12085 -> IGTPW_7748
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7748 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-rkl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#4983])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][3] -> [INCOMPLETE][4] ([i915#5982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bsw-kefka/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][7] -> [FAIL][8] ([i915#6298])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-kefka:       [INCOMPLETE][9] ([i915#5847]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-bsw-kefka/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bsw-kefka/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][11] ([i915#4983] / [i915#5828]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/bat-rpls-1/igt@i915_selftest@live@reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5828]: https://gitlab.freedesktop.org/drm/intel/issues/5828
  [i915#5847]: https://gitlab.freedesktop.org/drm/intel/issues/5847
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6646 -> IGTPW_7748

  CI-20190529: 20190529
  CI_DRM_12085: 5af6266021c109c3254a3807d6a36b1e1a4ab4fe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7748: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html
  IGT_6646: c1f420ae84b76079cd32ac014cfdf95b5f2922f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@cursor-fb-leak
+igt@kms_universal_plane@disable-primary-vs-flip
+igt@kms_universal_plane@universal-plane-functional
+igt@kms_universal_plane@universal-plane-gen9-features
+igt@kms_universal_plane@universal-plane-sanity
-igt@kms_universal_plane@cursor-fb-leak-pipe-a
-igt@kms_universal_plane@cursor-fb-leak-pipe-b
-igt@kms_universal_plane@cursor-fb-leak-pipe-c
-igt@kms_universal_plane@cursor-fb-leak-pipe-d
-igt@kms_universal_plane@cursor-fb-leak-pipe-e
-igt@kms_universal_plane@cursor-fb-leak-pipe-f
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f
-igt@kms_universal_plane@universal-plane-pipe-a-functional
-igt@kms_universal_plane@universal-plane-pipe-a-sanity
-igt@kms_universal_plane@universal-plane-pipe-b-functional
-igt@kms_universal_plane@universal-plane-pipe-b-sanity
-igt@kms_universal_plane@universal-plane-pipe-c-functional
-igt@kms_universal_plane@universal-plane-pipe-c-sanity
-igt@kms_universal_plane@universal-plane-pipe-d-functional
-igt@kms_universal_plane@universal-plane-pipe-d-sanity
-igt@kms_universal_plane@universal-plane-pipe-e-functional
-igt@kms_universal_plane@universal-plane-pipe-e-sanity
-igt@kms_universal_plane@universal-plane-pipe-f-functional
-igt@kms_universal_plane@universal-plane-pipe-f-sanity

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html

--===============7929478585023813613==
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
<tr><td><b>Series:</b></td><td>IGT clean-up tasks (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104318/">https://patchwork.freedesktop.org/series/104318/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12085 -&gt; IGTPW_7748</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7748 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bsw-kefka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/fi-bsw-kefka/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5847">i915#5847</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/fi-bsw-kefka/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12085/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5828">i915#5828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6646 -&gt; IGTPW_7748</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12085: 5af6266021c109c3254a3807d6a36b1e1a4ab4fe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7748: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7748/index.html<br />
  IGT_6646: c1f420ae84b76079cd32ac014cfdf95b5f2922f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@cursor-fb-leak<br />
+igt@kms_universal_plane@disable-primary-vs-flip<br />
+igt@kms_universal_plane@universal-plane-functional<br />
+igt@kms_universal_plane@universal-plane-gen9-features<br />
+igt@kms_universal_plane@universal-plane-sanity<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-a<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-b<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-c<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-d<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-e<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-f<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f<br />
-igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-a-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-b-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-c-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-d-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-e-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-f-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-f-sanity</p>

</body>
</html>

--===============7929478585023813613==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1145553354903699371=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Wed, 05 Jul 2023 20:29:45 -0000
Message-ID: <168858898563.24207.4774889373791380633@emeril.freedesktop.org>
References: <20230705193454.14033-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230705193454.14033-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fpm=5Frpm=3A_Try_the_standard_=22ddc=22_symlink_for_i2c_r?=
 =?utf-8?q?ead?=
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

--===============1145553354903699371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_pm_rpm: Try the standard "ddc" symlink for i2c read
URL   : https://patchwork.freedesktop.org/series/120250/
State : success

== Summary ==

CI Bug Log - changes from IGT_7372 -> IGTPW_9345
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-kbl-soraka fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_9345 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][1] -> [DMESG-FAIL][2] ([i915#7059])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         NOTRUN -> [TIMEOUT][3] ([i915#6794] / [i915#7392])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [PASS][4] -> [DMESG-FAIL][5] ([i915#7269])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [PASS][6] -> [ABORT][7] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#7981] / [i915#8347])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-rpls-2/igt@i915_selftest@live@reset.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [PASS][8] -> [DMESG-WARN][9] ([i915#6367])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-1:         NOTRUN -> [WARN][10] ([i915#8747])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][11] ([i915#6687] / [i915#7978] / [i915#8668])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - fi-elk-e7500:       [PASS][12] -> [FAIL][13] ([i915#2122])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [ABORT][14] ([i915#7920] / [i915#7982]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-rpls-1/igt@i915_selftest@live@requests.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         [SKIP][16] ([i915#1072]) -> [ABORT][17] ([i915#8434] / [i915#8668])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7372 -> IGTPW_9345

  CI-20190529: 20190529
  CI_DRM_13346: c5442b2363bf5ad916805d105ff03ce5805070e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9345: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html
  IGT_7372: c25f0c2ed0d9b44dcd48f4ba93bdc1fc0dfec625 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html

--===============1145553354903699371==
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
<tr><td><b>Series:</b></td><td>tests/i915_pm_rpm: Try the standard &quot;ddc&quot; symlink for i2c read</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120250/">https://patchwork.freedesktop.org/series/120250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7372 -&gt; IGTPW_9345</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-kbl-soraka fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9345 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-mtlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7269">i915#7269</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8747">i915#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@cursor_plane_move:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7372/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8434">i915#8434</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7372 -&gt; IGTPW_9345</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13346: c5442b2363bf5ad916805d105ff03ce5805070e5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9345: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9345/index.html<br />
  IGT_7372: c25f0c2ed0d9b44dcd48f4ba93bdc1fc0dfec625 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1145553354903699371==--

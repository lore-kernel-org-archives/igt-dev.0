Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 11:24:49 -0000
Message-ID: <160984588995.13808.7675111590695602142@emeril.freedesktop.org>
References: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?avoid_recalculating_refecence_crcs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0028951813=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0028951813==
Content-Type: multipart/alternative;
 boundary="===============1080829340526802789=="

--===============1080829340526802789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs
URL   : https://patchwork.freedesktop.org/series/85490/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9545 -> IGTPW_5352
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5352 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5352, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5352:

### IGT changes ###

#### Warnings ####

  * igt@i915_hangman@error-state-basic:
    - fi-apl-guc:         [DMESG-WARN][1] ([i915#1610]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-apl-guc/igt@i915_hangman@error-state-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-apl-guc/igt@i915_hangman@error-state-basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5352 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ringfill@basic-all:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@gem_ringfill@basic-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-tgl-y/igt@gem_ringfill@basic-all.html

  
#### Possible fixes ####

  * igt@gem_render_tiled_blits@basic:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@gem_render_tiled_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-tgl-y/igt@gem_render_tiled_blits@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][7] ([i915#1161] / [i915#262]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 35)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5942 -> IGTPW_5352

  CI-20190529: 20190529
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html

--===============1080829340526802789==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85490/">https://patchwork.freedesktop.org/series/85490/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9545 -&gt; IGTPW_5352</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5352 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5352, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5352:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_hangman@error-state-basic:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-apl-guc/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-apl-guc/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5352 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_ringfill@basic-all:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-tgl-y/igt@gem_ringfill@basic-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-tgl-y/igt@gem_render_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-tgl-y/igt@gem_render_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 35)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5942 -&gt; IGTPW_5352</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html<br />
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1080829340526802789==--

--===============0028951813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0028951813==--

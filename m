Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 19 Oct 2020 11:57:41 -0000
Message-ID: <160310866149.32024.5808642117412398648@emeril.freedesktop.org>
References: <20201019112459.18286-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201019112459.18286-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_try_to_detect_mid_test_modeset?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1702997207=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1702997207==
Content-Type: multipart/alternative;
 boundary="===============7577295972106642996=="

--===============7577295972106642996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: try to detect mid test modeset
URL   : https://patchwork.freedesktop.org/series/82816/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5822 -> IGTPW_5073
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5073 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5073, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html

Known issues
------------

  Here are the changes found in IGTPW_5073 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5822/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [DMESG-WARN][3] ([i915#1982]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5822/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982


Participating hosts (44 -> 17)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_5073 prevented too many machines from booting.

  Missing    (27): fi-kbl-soraka fi-icl-u2 fi-apl-guc fi-icl-y fi-skl-lmem fi-skl-6600u fi-cml-s fi-tgl-u2 fi-glk-dsi fi-kbl-7500u fi-kbl-7560u fi-skl-6700k2 fi-kbl-r fi-ilk-m540 fi-ehl-1 fi-tgl-dsi fi-skl-guc fi-cfl-8700k fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5073

  CI-20190529: 20190529
  CI_DRM_9162: 837e8c755c4a5087a1f87ccbe6893e37bd99ea85 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5073: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html

--===============7577295972106642996==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: try to detect mid test modeset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82816/">https://patchwork.freedesktop.org/series/82816/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5822 -&gt; IGTPW_5073</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5073 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5073, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5073 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5822/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5822/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 17)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_5073 prevented too many machines from booting.</p>
<p>Missing    (27): fi-kbl-soraka fi-icl-u2 fi-apl-guc fi-icl-y fi-skl-lmem fi-skl-6600u fi-cml-s fi-tgl-u2 fi-glk-dsi fi-kbl-7500u fi-kbl-7560u fi-skl-6700k2 fi-kbl-r fi-ilk-m540 fi-ehl-1 fi-tgl-dsi fi-skl-guc fi-cfl-8700k fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5822 -&gt; IGTPW_5073</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9162: 837e8c755c4a5087a1f87ccbe6893e37bd99ea85 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5073: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5073/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7577295972106642996==--

--===============1702997207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1702997207==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 31 Jan 2021 11:00:14 -0000
Message-ID: <161209081497.18208.15898385313082409492@emeril.freedesktop.org>
References: <20210131102613.3400299-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210131102613.3400299-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYXNzZW1i?=
 =?utf-8?q?ler=3A_Fix_or_suppress_clang_warnings?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0451440398=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0451440398==
Content-Type: multipart/alternative;
 boundary="===============7689005921777814043=="

--===============7689005921777814043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: assembler: Fix or suppress clang warnings
URL   : https://patchwork.freedesktop.org/series/86489/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9706 -> IGTPW_5453
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html

Known issues
------------

  Here are the changes found in IGTPW_5453 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-byt-j1900:       NOTRUN -> [SKIP][1] ([fdo#109271]) +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_tiled_blits@basic:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/fi-tgl-y/igt@gem_render_tiled_blits@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-tgl-y/igt@gem_render_tiled_blits@basic.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-byt-j1900:       NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_basic@create-close:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/fi-tgl-y/igt@gem_basic@create-close.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-tgl-y/igt@gem_basic@create-close.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 38)
------------------------------

  Additional (1): fi-byt-j1900 
  Missing    (6): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5980 -> IGTPW_5453

  CI-20190529: 20190529
  CI_DRM_9706: f9173d6435c6a9bb0b0076ebf9122d876da208ae @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5453: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html
  IGT_5980: e02612921a4e95aef3a368e7468f4337c9dcee7d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html

--===============7689005921777814043==
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
<tr><td><b>Series:</b></td><td>assembler: Fix or suppress clang warnings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86489/">https://patchwork.freedesktop.org/series/86489/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9706 -&gt; IGTPW_5453</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5453 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/fi-tgl-y/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-tgl-y/igt@gem_render_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_basic@create-close:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/fi-tgl-y/igt@gem_basic@create-close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/fi-tgl-y/igt@gem_basic@create-close.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Additional (1): fi-byt-j1900 <br />
  Missing    (6): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5980 -&gt; IGTPW_5453</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9706: f9173d6435c6a9bb0b0076ebf9122d876da208ae @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5453: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5453/index.html<br />
  IGT_5980: e02612921a4e95aef3a368e7468f4337c9dcee7d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7689005921777814043==--

--===============0451440398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0451440398==--

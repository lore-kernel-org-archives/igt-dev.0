Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 03 Sep 2020 09:41:30 -0000
Message-ID: <159912609064.15506.7057051313298010383@emeril.freedesktop.org>
References: <20200903081157.1670-1-srinivasx.k@intel.com>
In-Reply-To: <20200903081157.1670-1-srinivasx.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc_Stripping_rendercopy_implementation_to_use_c?=
 =?utf-8?q?airo?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1374623426=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamati Srinivas <srinivasx.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1374623426==
Content-Type: multipart/alternative;
 boundary="===============4878220264220025672=="

--===============4878220264220025672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc Stripping rendercopy implementation to use cairo
URL   : https://patchwork.freedesktop.org/series/81280/
State : success

== Summary ==

CI Bug Log - changes from IGT_5777 -> IGTPW_4948
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html

Known issues
------------

  Here are the changes found in IGTPW_4948 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][5] ([i915#1982]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-s:           [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [DMESG-WARN][9] ([i915#1982] / [i915#289]) -> [DMESG-WARN][10] ([i915#289])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-icl-u2/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-icl-u2/igt@i915_module_load@reload.html

  
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289


Participating hosts (38 -> 33)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5777 -> IGTPW_4948

  CI-20190529: 20190529
  CI_DRM_8956: a0761632b0f443c3c018aad55866fbda1429770d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4948: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html
  IGT_5777: c240b5c00d58860e376b012cc3c883c17ae63f37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html

--===============4878220264220025672==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc Stripping rendercopy implementation to use cairo</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81280/">https://patchwork.freedesktop.org/series/81280/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5777 -&gt; IGTPW_4948</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4948 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5777/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (38 -&gt; 33)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5777 -&gt; IGTPW_4948</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8956: a0761632b0f443c3c018aad55866fbda1429770d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4948: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4948/index.html<br />
  IGT_5777: c240b5c00d58860e376b012cc3c883c17ae63f37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4878220264220025672==--

--===============1374623426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1374623426==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0077718850212802985=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Wed, 03 May 2023 06:33:27 -0000
Message-ID: <168309560775.9280.14483211073688030248@emeril.freedesktop.org>
References: <20230426105249.3897491-1-jouni.hogander@intel.com>
In-Reply-To: <20230426105249.3897491-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdGNh?=
 =?utf-8?q?ses_for_dirtyfb_ioctl_=28rev6=29?=
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

--===============0077718850212802985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testcases for dirtyfb ioctl (rev6)
URL   : https://patchwork.freedesktop.org/series/116130/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13098 -> IGTPW_8900
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8900 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-adlm-1:         [PASS][1] -> [ABORT][2] ([i915#7677])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/bat-adlm-1/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-adlm-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [PASS][3] -> [ABORT][4] ([i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][5] ([i915#1845] / [i915#5354])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [DMESG-FAIL][6] ([i915#7269]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - {bat-mtlp-6}:       [DMESG-WARN][8] ([i915#6367]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
  [i915#7677]: https://gitlab.freedesktop.org/drm/intel/issues/7677
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7277 -> IGTPW_8900

  CI-20190529: 20190529
  CI_DRM_13098: 1b2487d0f24450f2a330f44f204a22fd4e31a403 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dirtyfb@dirtyfb-ioctl
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-blue
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-green
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-red
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-blue
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-green
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-red

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html

--===============0077718850212802985==
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
<tr><td><b>Series:</b></td><td>Testcases for dirtyfb ioctl (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116130/">https://patchwork.freedesktop.org/series/116130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13098 -&gt; IGTPW_8900</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8900 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7677">i915#7677</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/fi-kbl-soraka/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7269">i915#7269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13098/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7277 -&gt; IGTPW_8900</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13098: 1b2487d0f24450f2a330f44f204a22fd4e31a403 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8900/index.html<br />
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dirtyfb@dirtyfb-ioctl<br />
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-blue<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-green<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-red<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-blue<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-green<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-red</p>

</body>
</html>

--===============0077718850212802985==--

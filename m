Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9147788018578269450=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Mon, 29 May 2023 07:43:37 -0000
Message-ID: <168534621726.27507.7182236305221270135@emeril.freedesktop.org>
References: <20230529064719.461815-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230529064719.461815-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2lu?=
 =?utf-8?q?stdone=3A_GEN12_and_XEHP_INSTDONE_initialization?=
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

--===============9147788018578269450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/instdone: GEN12 and XEHP INSTDONE initialization
URL   : https://patchwork.freedesktop.org/series/118476/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13198 -> IGTPW_9053
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html

Participating hosts (38 -> 38)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_9053 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         NOTRUN -> [ABORT][1] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-skl-6600u:       NOTRUN -> [SKIP][2] ([fdo#109271])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/fi-skl-6600u/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-skl-6600u:       [DMESG-FAIL][3] ([i915#8189]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-skl-6600u:       [ABORT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [ABORT][7] ([i915#4983] / [i915#7911] / [i915#7920]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-rpls-1/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - {bat-mtlp-6}:       [DMESG-WARN][9] ([i915#6367]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [FAIL][11] ([i915#7932]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [SKIP][13] ([i915#3555] / [i915#4579]) -> [ABORT][14] ([i915#4579] / [i915#8260])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7308 -> IGTPW_9053

  CI-20190529: 20190529
  CI_DRM_13198: cf59b48ea3c0c0075d7c4e8538177d38999da7b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9053: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html
  IGT_7308: 766edf96979bf13a10c9985c007f2baca5c9e308 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html

--===============9147788018578269450==
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
<tr><td><b>Series:</b></td><td>lib/instdone: GEN12 and XEHP INSTDONE initialization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118476/">https://patchwork.freedesktop.org/series/118476/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13198 -&gt; IGTPW_9053</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9053 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/fi-skl-6600u/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8189">i915#8189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/fi-skl-6600u/igt@dmabuf@all-tests@dma_fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/fi-skl-6600u/igt@dmabuf@all-tests@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13198/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7308 -&gt; IGTPW_9053</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13198: cf59b48ea3c0c0075d7c4e8538177d38999da7b0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9053: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9053/index.html<br />
  IGT_7308: 766edf96979bf13a10c9985c007f2baca5c9e308 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9147788018578269450==--

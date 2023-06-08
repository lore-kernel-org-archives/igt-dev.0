Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1928191441083089984=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Thu, 08 Jun 2023 04:23:26 -0000
Message-ID: <168619820649.18385.1627381681934337029@emeril.freedesktop.org>
References: <20230605154710.460104-1-swati2.sharma@intel.com>
In-Reply-To: <20230605154710.460104-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliOiBm?=
 =?utf-8?q?ix_typo_in_clamp16=28=29?=
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

--===============1928191441083089984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: fix typo in clamp16()
URL   : https://patchwork.freedesktop.org/series/118876/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13231 -> IGTPW_9104
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9104 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][1] ([i915#8189])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-blb-e6850:       NOTRUN -> [ABORT][2] ([i915#8144])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       NOTRUN -> [SKIP][3] ([fdo#109271]) +36 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@active:
    - bat-dg1-5:          [PASS][4] -> [DMESG-FAIL][5] ([i915#8618])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-dg1-5/igt@i915_selftest@live@active.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-dg1-5/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [PASS][6] -> [TIMEOUT][7] ([i915#6794] / [i915#7392])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-rpls-2/igt@i915_selftest@live@mman.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-2:         NOTRUN -> [ABORT][8] ([i915#6687])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-adls-5:         NOTRUN -> [SKIP][9] ([i915#7828])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][10] ([i915#3546]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adls-5:         NOTRUN -> [SKIP][11] ([i915#1845])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-blb-e6850:       NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#4579])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adls-5:         [ABORT][13] ([i915#8210]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#8144]: https://gitlab.freedesktop.org/drm/intel/issues/8144
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
  [i915#8210]: https://gitlab.freedesktop.org/drm/intel/issues/8210
  [i915#8618]: https://gitlab.freedesktop.org/drm/intel/issues/8618


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7319 -> IGTPW_9104

  CI-20190529: 20190529
  CI_DRM_13231: 60f1f7c0a570a431f8ca8cc697f7fe8bc0badb83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9104: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html
  IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html

--===============1928191441083089984==
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
<tr><td><b>Series:</b></td><td>lib: fix typo in clamp16()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118876/">https://patchwork.freedesktop.org/series/118876/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13231 -&gt; IGTPW_9104</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9104 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8189">i915#8189</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8144">i915#8144</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-dg1-5/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-dg1-5/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8618">i915#8618</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8210">i915#8210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7319 -&gt; IGTPW_9104</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13231: 60f1f7c0a570a431f8ca8cc697f7fe8bc0badb83 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9104: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html<br />
  IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1928191441083089984==--

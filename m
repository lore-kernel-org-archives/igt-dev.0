Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3091866990704023564=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 21 Apr 2023 10:52:05 -0000
Message-ID: <168207432526.5825.4704979014296223540@emeril.freedesktop.org>
References: <20230421085253.2344889-1-jouni.hogander@intel.com>
In-Reply-To: <20230421085253.2344889-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVGVzdGNh?=
 =?utf-8?q?ses_for_dirtyfb_ioctl_=28rev4=29?=
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

--===============3091866990704023564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testcases for dirtyfb ioctl (rev4)
URL   : https://patchwork.freedesktop.org/series/116130/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7264 -> IGTPW_8838
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8838 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8838, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8838:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-atsm-1/igt@gem_exec_suspend@basic-s0@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-atsm-1/igt@gem_exec_suspend@basic-s0@lmem0.html

  
Known issues
------------

  Here are the changes found in IGTPW_8838 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-rkl-11600:       [PASS][3] -> [FAIL][4] ([fdo#103375])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         [PASS][5] -> [ABORT][6] ([i915#6687] / [i915#7978])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@slpc:
    - bat-adln-1:         NOTRUN -> [DMESG-FAIL][7] ([i915#6997])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-adln-1/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-bsw-nick:        NOTRUN -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/fi-bsw-nick/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-adln-1:         NOTRUN -> [SKIP][9] ([i915#7828])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-adln-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][10] -> [FAIL][11] ([i915#7932])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][12] ([i915#7913]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [INCOMPLETE][14] ([i915#4983] / [i915#7609]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [DMESG-WARN][16] ([i915#7794]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-rpls-1/igt@i915_selftest@live@reset.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7794]: https://gitlab.freedesktop.org/drm/intel/issues/7794
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7264 -> IGTPW_8838

  CI-20190529: 20190529
  CI_DRM_13039: 13aec8c5451c1c81d81b6b8ef1b29da9f29a7396 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8838: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html
  IGT_7264: 2f0a07378e58e5c7d7b589b39ace7e3a2317f6b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dirtyfb@dirtyfb-ioctl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html

--===============3091866990704023564==
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
<tr><td><b>Series:</b></td><td>Testcases for dirtyfb ioctl (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116130/">https://patchwork.freedesktop.org/series/116130/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7264 -&gt; IGTPW_8838</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8838 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8838, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8838:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0@lmem0:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-atsm-1/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-atsm-1/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8838 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/fi-bsw-nick/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-adln-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7264/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7794">i915#7794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7264 -&gt; IGTPW_8838</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13039: 13aec8c5451c1c81d81b6b8ef1b29da9f29a7396 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8838: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8838/index.html<br />
  IGT_7264: 2f0a07378e58e5c7d7b589b39ace7e3a2317f6b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dirtyfb@dirtyfb-ioctl</p>

</body>
</html>

--===============3091866990704023564==--

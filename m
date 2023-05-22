Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0120764521834196739=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Mon, 22 May 2023 13:45:32 -0000
Message-ID: <168476313217.28283.9830970674831563990@emeril.freedesktop.org>
References: <20230522123605.17416-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230522123605.17416-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50ZWdy?=
 =?utf-8?q?ate_igt=5Fspin=5Fnew_with_Xe=2E?=
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

--===============0120764521834196739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Integrate igt_spin_new with Xe.
URL   : https://patchwork.freedesktop.org/series/118121/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13173 -> IGTPW_9017
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (1): bat-adlp-11 
  Missing    (2): bat-rpls-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9017 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][1] ([i915#1845] / [i915#5354]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][2] -> [FAIL][3] ([i915#7932])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13173/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_migrate:
    - {bat-mtlp-6}:       [INCOMPLETE][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13173/bat-mtlp-6/igt@i915_selftest@live@gem_migrate.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-mtlp-6/igt@i915_selftest@live@gem_migrate.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [FAIL][6] ([i915#7932]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13173/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7299 -> IGTPW_9017

  CI-20190529: 20190529
  CI_DRM_13173: ec24952f0cdb991b5a210ade43a479d293c054d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9017: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html
  IGT_7299: 3effd4be7f6c867d942532b3fe18d6c54fffbd7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_spin_batch@spin-all
+igt@xe_spin_batch@spin-batch

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html

--===============0120764521834196739==
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
<tr><td><b>Series:</b></td><td>Integrate igt_spin_new with Xe.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118121/">https://patchwork.freedesktop.org/series/118121/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13173 -&gt; IGTPW_9017</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (1): bat-adlp-11 <br />
  Missing    (2): bat-rpls-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9017 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13173/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_migrate:</p>
<ul>
<li>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13173/bat-mtlp-6/igt@i915_selftest@live@gem_migrate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-mtlp-6/igt@i915_selftest@live@gem_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13173/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7299 -&gt; IGTPW_9017</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13173: ec24952f0cdb991b5a210ade43a479d293c054d6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9017: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9017/index.html<br />
  IGT_7299: 3effd4be7f6c867d942532b3fe18d6c54fffbd7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_spin_batch@spin-all<br />
+igt@xe_spin_batch@spin-batch</p>

</body>
</html>

--===============0120764521834196739==--

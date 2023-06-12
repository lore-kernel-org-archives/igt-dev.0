Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4890140800566870140=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Date: Mon, 12 Jun 2023 13:32:06 -0000
Message-ID: <168657672649.26645.2096040645727788530@emeril.freedesktop.org>
References: <20230612124916.7372-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230612124916.7372-1-dominik.karol.piatkowski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_KUnit_=28rev6=29?=
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

--===============4890140800566870140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce KUnit (rev6)
URL   : https://patchwork.freedesktop.org/series/114612/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13262 -> IGTPW_9148
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9148 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][1] ([i915#6367])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-1/igt@i915_selftest@live@slpc.html
    - bat-adlp-9:         [PASS][2] -> [DMESG-WARN][3] ([i915#6367])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-adlp-9/igt@i915_selftest@live@slpc.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-adlp-9/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][4] ([i915#6687] / [i915#7978])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][5] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-rpls-1/igt@i915_selftest@live@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [DMESG-WARN][7] ([i915#6367]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-2/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [FAIL][9] ([i915#7932]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7326 -> IGTPW_9148

  CI-20190529: 20190529
  CI_DRM_13262: 26f62dc5b6119b2fcc3380b76e25dbe3903060a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html
  IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@drm_buddy@drm_buddy_test
+igt@drm_mm@drm_mm_test
+igt@kms_selftest@drm_cmdline
+igt@kms_selftest@drm_damage
+igt@kms_selftest@drm_dp_mst
+igt@kms_selftest@drm_format
+igt@kms_selftest@drm_format_helper
+igt@kms_selftest@drm_plane
+igt@kms_selftest@framebuffer
+igt@xe_live_ktest@bo
+igt@xe_live_ktest@dmabuf
+igt@xe_live_ktest@migrate
+igt@xe_live_ktest@pci
+igt@xe_live_ktest@rtp
+igt@xe_live_ktest@wa
-igt@drm_buddy@all-tests
-igt@drm_mm@all-tests
-igt@kms_selftest@all-tests
-igt@xe_spin_batch@spin-all
-igt@xe_spin_batch@spin-basic
-igt@xe_spin_batch@spin-basic-all
-igt@xe_spin_batch@spin-batch

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html

--===============4890140800566870140==
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
<tr><td><b>Series:</b></td><td>Introduce KUnit (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114612/">https://patchwork.freedesktop.org/series/114612/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13262 -&gt; IGTPW_9148</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9148 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-adlp-9/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-adlp-9/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-rpls-2/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13262/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7326 -&gt; IGTPW_9148</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13262: 26f62dc5b6119b2fcc3380b76e25dbe3903060a0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9148/index.html<br />
  IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@drm_buddy@drm_buddy_test<br />
+igt@drm_mm@drm_mm_test<br />
+igt@kms_selftest@drm_cmdline<br />
+igt@kms_selftest@drm_damage<br />
+igt@kms_selftest@drm_dp_mst<br />
+igt@kms_selftest@drm_format<br />
+igt@kms_selftest@drm_format_helper<br />
+igt@kms_selftest@drm_plane<br />
+igt@kms_selftest@framebuffer<br />
+igt@xe_live_ktest@bo<br />
+igt@xe_live_ktest@dmabuf<br />
+igt@xe_live_ktest@migrate<br />
+igt@xe_live_ktest@pci<br />
+igt@xe_live_ktest@rtp<br />
+igt@xe_live_ktest@wa<br />
-igt@drm_buddy@all-tests<br />
-igt@drm_mm@all-tests<br />
-igt@kms_selftest@all-tests<br />
-igt@xe_spin_batch@spin-all<br />
-igt@xe_spin_batch@spin-basic<br />
-igt@xe_spin_batch@spin-basic-all<br />
-igt@xe_spin_batch@spin-batch</p>

</body>
</html>

--===============4890140800566870140==--

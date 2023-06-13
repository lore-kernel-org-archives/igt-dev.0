Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8986266846452729863=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Date: Tue, 13 Jun 2023 10:27:51 -0000
Message-ID: <168665207143.21694.12533561415546495592@emeril.freedesktop.org>
References: <20230613094455.2636571-1-christoph.manszewski@intel.com>
In-Reply-To: <20230613094455.2636571-1-christoph.manszewski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliOiBB?=
 =?utf-8?q?void_macro_redifinition_in_gen7/gen8=5Fmedia=2Eh_=28rev2=29?=
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

--===============8986266846452729863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Avoid macro redifinition in gen7/gen8_media.h (rev2)
URL   : https://patchwork.freedesktop.org/series/119125/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13264 -> IGTPW_9156
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-kbl-x1275 fi-rkl-11600 fi-cfl-8109u fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9156 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13264/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [PASS][3] -> [DMESG-WARN][4] ([i915#7699])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13264/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][5] ([i915#3546]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7326 -> IGTPW_9156

  CI-20190529: 20190529
  CI_DRM_13264: 807d06e86e11466ef4fe74e2ddcb93de8e3a535b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9156: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html
  IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@drm_buddy@all-tests
+igt@drm_mm@all-tests
+igt@kms_selftest@all-tests
-igt@drm_buddy@drm_buddy_test
-igt@drm_mm@drm_mm_test
-igt@kms_selftest@drm_cmdline
-igt@kms_selftest@drm_damage
-igt@kms_selftest@drm_dp_mst
-igt@kms_selftest@drm_format
-igt@kms_selftest@drm_format_helper
-igt@kms_selftest@drm_plane
-igt@kms_selftest@framebuffer
-igt@xe_live_ktest@bo
-igt@xe_live_ktest@dmabuf
-igt@xe_live_ktest@migrate
-igt@xe_live_ktest@pci
-igt@xe_live_ktest@rtp
-igt@xe_live_ktest@wa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html

--===============8986266846452729863==
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
<tr><td><b>Series:</b></td><td>lib: Avoid macro redifinition in gen7/gen8_media.h (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119125/">https://patchwork.freedesktop.org/series/119125/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13264 -&gt; IGTPW_9156</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-kbl-x1275 fi-rkl-11600 fi-cfl-8109u fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9156 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13264/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13264/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7326 -&gt; IGTPW_9156</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13264: 807d06e86e11466ef4fe74e2ddcb93de8e3a535b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9156: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9156/index.html<br />
  IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@drm_buddy@all-tests<br />
+igt@drm_mm@all-tests<br />
+igt@kms_selftest@all-tests<br />
-igt@drm_buddy@drm_buddy_test<br />
-igt@drm_mm@drm_mm_test<br />
-igt@kms_selftest@drm_cmdline<br />
-igt@kms_selftest@drm_damage<br />
-igt@kms_selftest@drm_dp_mst<br />
-igt@kms_selftest@drm_format<br />
-igt@kms_selftest@drm_format_helper<br />
-igt@kms_selftest@drm_plane<br />
-igt@kms_selftest@framebuffer<br />
-igt@xe_live_ktest@bo<br />
-igt@xe_live_ktest@dmabuf<br />
-igt@xe_live_ktest@migrate<br />
-igt@xe_live_ktest@pci<br />
-igt@xe_live_ktest@rtp<br />
-igt@xe_live_ktest@wa</p>

</body>
</html>

--===============8986266846452729863==--

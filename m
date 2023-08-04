Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5872640185797829638=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 04 Aug 2023 10:13:09 -0000
Message-ID: <169114398990.2854.290135892335178529@emeril.freedesktop.org>
References: <20230804084237.3940595-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230804084237.3940595-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fpsr=3A_Fix_to_use_proper_API_to_support_XE?=
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

--===============5872640185797829638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_psr: Fix to use proper API to support XE
URL   : https://patchwork.freedesktop.org/series/122016/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13473 -> IGTPW_9515
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9515 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [PASS][3] -> [DMESG-WARN][4] ([i915#7699])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [PASS][5] -> [ABORT][6] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-rpls-2/igt@i915_selftest@live@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-8:         [PASS][7] -> [DMESG-WARN][8] ([i915#6367])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-mtlp-8/igt@i915_selftest@live@slpc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-mtlp-8/igt@i915_selftest@live@slpc.html
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][9] ([i915#6367])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][10] ([i915#6687] / [i915#7978] / [i915#8668])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8109u:       [FAIL][11] ([i915#7940]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][13] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-rpls-1/igt@i915_selftest@live@reset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][15] ([i915#6367]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-skl-guc:         [FAIL][17] ([i915#7691]) -> [FAIL][18] ([i915#7940])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/fi-skl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/fi-skl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7414 -> IGTPW_9515

  CI-20190529: 20190529
  CI_DRM_13473: 561c056959bf2ef8576cf3cfb59e3c5fd2951015 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9515: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html
  IGT_7414: 056c9d7f2a63dd6d0b9b6462b4ab1b096178dcc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html

--===============5872640185797829638==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_psr: Fix to use proper API to support XE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122016/">https://patchwork.freedesktop.org/series/122016/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13473 -&gt; IGTPW_9515</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9515 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-mtlp-8/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13473/fi-skl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691">i915#7691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/fi-skl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7414 -&gt; IGTPW_9515</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13473: 561c056959bf2ef8576cf3cfb59e3c5fd2951015 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9515: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9515/index.html<br />
  IGT_7414: 056c9d7f2a63dd6d0b9b6462b4ab1b096178dcc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5872640185797829638==--

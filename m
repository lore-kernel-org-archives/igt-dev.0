Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0227764387876929266=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 07 Mar 2023 11:49:53 -0000
Message-ID: <167818979349.31453.15315943206473893494@emeril.freedesktop.org>
References: <20230307104519.706553-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307104519.706553-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3RhcnQg?=
 =?utf-8?q?using_intel=5Fgpu=5Fcommands=2Eh_header_=28rev2=29?=
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

--===============0227764387876929266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Start using intel_gpu_commands.h header (rev2)
URL   : https://patchwork.freedesktop.org/series/114619/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12821 -> IGTPW_8565
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html

Participating hosts (36 -> 35)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8565 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] ([i915#7911])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@guc:
    - bat-rpls-2:         [PASS][3] -> [DMESG-WARN][4] ([i915#7852])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/bat-rpls-2/igt@i915_selftest@live@guc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/bat-rpls-2/igt@i915_selftest@live@guc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-apl-guc:         [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         [PASS][7] -> [ABORT][8] ([i915#6687])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [DMESG-FAIL][9] ([i915#6367] / [i915#7913] / [i915#7996]) -> [DMESG-FAIL][10] ([i915#6997] / [i915#7913])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7182 -> IGTPW_8565

  CI-20190529: 20190529
  CI_DRM_12821: 24f94240c4bca70cadfd00528ffd56c3049e5f58 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8565: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html
  IGT_7182: b25ca07c7a75bfda3358c3450810bc023dd7cee9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html

--===============0227764387876929266==
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
<tr><td><b>Series:</b></td><td>Start using intel_gpu_commands.h header (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114619/">https://patchwork.freedesktop.org/series/114619/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12821 -&gt; IGTPW_8565</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8565 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/bat-rpls-2/igt@i915_selftest@live@guc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/bat-rpls-2/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12821/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7996">i915#7996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7182 -&gt; IGTPW_8565</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12821: 24f94240c4bca70cadfd00528ffd56c3049e5f58 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8565: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8565/index.html<br />
  IGT_7182: b25ca07c7a75bfda3358c3450810bc023dd7cee9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0227764387876929266==--

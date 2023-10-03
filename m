Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3956996298922241931=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Tue, 03 Oct 2023 10:01:12 -0000
Message-ID: <169632727278.4383.13026724206875290753@emeril.freedesktop.org>
References: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGNv?=
 =?utf-8?q?py_basic_test_to_exercise_blt_commands_=28rev5=29?=
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

--===============3956996298922241931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add copy basic test to exercise blt commands (rev5)
URL   : https://patchwork.freedesktop.org/series/122615/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13703 -> IGTPW_9909
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_9909 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13703/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][3] -> [ABORT][4] ([i915#9414])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13703/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
#### Possible fixes ####

  * igt@gem_busy@busy@all-engines:
    - bat-mtlp-8:         [DMESG-FAIL][5] ([i915#8962]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13703/bat-mtlp-8/igt@gem_busy@busy@all-engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/bat-mtlp-8/igt@gem_busy@busy@all-engines.html

  
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7508 -> IGTPW_9909

  CI-20190529: 20190529
  CI_DRM_13703: db3606b4b70e8205895c2c57892bb7b1f2d436a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9909: 9909
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_copy_basic@mem-copy-0x3fff
+igt@xe_copy_basic@mem-copy-0x369
+igt@xe_copy_basic@mem-copy-0xfd
+igt@xe_copy_basic@mem-copy-0xffff
+igt@xe_copy_basic@mem-set-0x3fff
+igt@xe_copy_basic@mem-set-0x369
+igt@xe_copy_basic@mem-set-0xfd
+igt@xe_copy_basic@mem-set-0xffff

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/index.html

--===============3956996298922241931==
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
<tr><td><b>Series:</b></td><td>Add copy basic test to exercise blt commands (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122615/">https://patchwork.freedesktop.org/series/122615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13703 -&gt; IGTPW_9909</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9909 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13703/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13703/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_busy@busy@all-engines:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13703/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9909/bat-mtlp-8/igt@gem_busy@busy@all-engines.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7508 -&gt; IGTPW_9909</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13703: db3606b4b70e8205895c2c57892bb7b1f2d436a4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9909: 9909<br />
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_copy_basic@mem-copy-0x3fff<br />
+igt@xe_copy_basic@mem-copy-0x369<br />
+igt@xe_copy_basic@mem-copy-0xfd<br />
+igt@xe_copy_basic@mem-copy-0xffff<br />
+igt@xe_copy_basic@mem-set-0x3fff<br />
+igt@xe_copy_basic@mem-set-0x369<br />
+igt@xe_copy_basic@mem-set-0xfd<br />
+igt@xe_copy_basic@mem-set-0xffff</p>

</body>
</html>

--===============3956996298922241931==--

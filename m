Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7900314008544590592=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 12 Nov 2021 01:21:30 -0000
Message-ID: <163668009084.27229.2041464563404469708@emeril.freedesktop.org>
References: <20211112002439.35913-1-matthew.brost@intel.com>
In-Reply-To: <20211112002439.35913-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdCBw?=
 =?utf-8?q?arallel_execbuf?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7900314008544590592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test parallel execbuf
URL   : https://patchwork.freedesktop.org/series/96836/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10872 -> IGTPW_6394
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html

Participating hosts (29 -> 24)
------------------------------

  Missing    (5): fi-kbl-soraka bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-4 

Known issues
------------

  Here are the changes found in IGTPW_6394 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10872/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][3] ([fdo#109271] / [i915#1436] / [i915#3428] / [i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][4] ([i915#4269]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10872/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6279 -> IGTPW_6394

  CI-20190529: 20190529
  CI_DRM_10872: 50c74a91cbcff9d1ca50d3774391c4757e9816b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html
  IGT_6279: 1c70b17877974491273ac3fb1de93ba75309df79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_exec_balancer@parallel
+igt@gem_exec_balancer@parallel-balancer
+igt@gem_exec_balancer@parallel-bb-first
+igt@gem_exec_balancer@parallel-contexts
+igt@gem_exec_balancer@parallel-keep-in-fence
+igt@gem_exec_balancer@parallel-keep-submit-fence
+igt@gem_exec_balancer@parallel-ordering
+igt@gem_exec_balancer@parallel-out-fence

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html

--===============7900314008544590592==
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
<tr><td><b>Series:</b></td><td>Test parallel execbuf</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96836/">https://patchwork.freedesktop.org/series/96836/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10872 -&gt; IGTPW_6394</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html</p>
<h2>Participating hosts (29 -&gt; 24)</h2>
<p>Missing    (5): fi-kbl-soraka bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-4 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6394 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10872/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10872/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6279 -&gt; IGTPW_6394</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10872: 50c74a91cbcff9d1ca50d3774391c4757e9816b8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6394/index.html<br />
  IGT_6279: 1c70b17877974491273ac3fb1de93ba75309df79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_balancer@parallel<br />
+igt@gem_exec_balancer@parallel-balancer<br />
+igt@gem_exec_balancer@parallel-bb-first<br />
+igt@gem_exec_balancer@parallel-contexts<br />
+igt@gem_exec_balancer@parallel-keep-in-fence<br />
+igt@gem_exec_balancer@parallel-keep-submit-fence<br />
+igt@gem_exec_balancer@parallel-ordering<br />
+igt@gem_exec_balancer@parallel-out-fence</p>

</body>
</html>

--===============7900314008544590592==--

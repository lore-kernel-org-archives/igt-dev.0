Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6517655654763611536=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 19 Sep 2023 15:30:09 -0000
Message-ID: <169513740976.3668.3860808816308263030@emeril.freedesktop.org>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdUFQSSBB?=
 =?utf-8?q?lignment_-_take_1?=
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

--===============6517655654763611536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - take 1
URL   : https://patchwork.freedesktop.org/series/123916/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13651 -> IGTPW_9827
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9827 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9827, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (1): bat-rpls-2 
  Missing    (4): fi-hsw-4770 bat-adlm-1 fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9827:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-mtlp-8:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-8/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-mtlp-8/igt@i915_module_load@load.html

  * igt@runner@aborted:
    - bat-rpls-2:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-rpls-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_9827 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@fds:
    - bat-mtlp-6:         [PASS][4] -> [ABORT][5] ([i915#9262])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][6] ([i915#1845])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [ABORT][7] ([i915#7913]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][9] ([i915#7952]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][11] ([IGT#3] / [i915#6121]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7493 -> IGTPW_9827

  CI-20190529: 20190529
  CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9827: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_exec_balancer@many-cm-parallel-basic
+igt@xe_exec_balancer@many-cm-parallel-rebind
+igt@xe_exec_balancer@many-cm-parallel-userptr
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@many-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@many-execqueues-cm-parallel-basic
+igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@no-exec-cm-parallel-basic
+igt@xe_exec_balancer@no-exec-cm-parallel-rebind
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@once-cm-parallel-basic
+igt@xe_exec_balancer@once-cm-parallel-rebind
+igt@xe_exec_balancer@once-cm-parallel-userptr
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@once-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@twice-cm-parallel-basic
+igt@xe_exec_balancer@twice-cm-parallel-rebind
+igt@xe_exec_balancer@twice-cm-parallel-userptr
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind
+igt@xe_query@query-cs-cycles
+igt@xe_query@query-gt-list
+igt@xe_query@query-invalid-cs-cycles
-igt@xe_mmio@mmio-invalid
-igt@xe_mmio@mmio-timestamp
-igt@xe_query@query-gts

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html

--===============6517655654763611536==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - take 1</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123916/">https://patchwork.freedesktop.org/series/123916/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13651 -&gt; IGTPW_9827</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9827 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9827, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (1): bat-rpls-2 <br />
  Missing    (4): fi-hsw-4770 bat-adlm-1 fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9827:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-8/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-mtlp-8/igt@i915_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-rpls-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9827 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7493 -&gt; IGTPW_9827</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9827: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9827/index.html<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_balancer@many-cm-parallel-basic<br />
+igt@xe_exec_balancer@many-cm-parallel-rebind<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-basic<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-basic<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-rebind<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@once-cm-parallel-basic<br />
+igt@xe_exec_balancer@once-cm-parallel-rebind<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@twice-cm-parallel-basic<br />
+igt@xe_exec_balancer@twice-cm-parallel-rebind<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind<br />
+igt@xe_query@query-cs-cycles<br />
+igt@xe_query@query-gt-list<br />
+igt@xe_query@query-invalid-cs-cycles<br />
-igt@xe_mmio@mmio-invalid<br />
-igt@xe_mmio@mmio-timestamp<br />
-igt@xe_query@query-gts</p>

</body>
</html>

--===============6517655654763611536==--

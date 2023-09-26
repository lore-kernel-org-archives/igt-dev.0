Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8684393478415249751=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 26 Sep 2023 15:03:52 -0000
Message-ID: <169574063289.20980.9973022678831756459@emeril.freedesktop.org>
References: <20230926130054.6-1-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdUFQSSBB?=
 =?utf-8?q?lignment_-_take_1_=28rev2=29?=
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

--===============8684393478415249751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - take 1 (rev2)
URL   : https://patchwork.freedesktop.org/series/123916/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13681 -> IGTPW_9881
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html

Participating hosts (41 -> 39)
------------------------------

  Additional (1): bat-dg2-14 
  Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9881 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [PASS][3] -> [FAIL][4] ([i915#9276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [PASS][5] -> [ABORT][6] ([i915#8668])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [ABORT][7] ([i915#8668]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
#### Warnings ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][9] ([i915#9262]) -> [ABORT][10] ([i915#9414])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7503 -> IGTPW_9881

  CI-20190529: 20190529
  CI_DRM_13681: b57407d0de043fc22b000a941a404ab103849e06 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9881: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html
  IGT_7503: 7503


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
+igt@xe_exec_threads@threads-hang-rebind-err
+igt@xe_exec_threads@threads-hang-userptr-rebind-err
+igt@xe_exec_threads@threads-rebind-err
+igt@xe_exec_threads@threads-userptr-rebind-err
+igt@xe_query@query-cs-cycles
+igt@xe_query@query-gt-list
+igt@xe_query@query-invalid-cs-cycles
-igt@xe_exec_threads@threads-hang-shared-vm-rebind-err
-igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err
-igt@xe_exec_threads@threads-shared-vm-rebind-err
-igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err
-igt@xe_mmio@mmio-invalid
-igt@xe_mmio@mmio-timestamp
-igt@xe_query@query-gts
-igt@xe_vm@vm-async-ops-err
-igt@xe_vm@vm-async-ops-err-destroy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html

--===============8684393478415249751==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - take 1 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123916/">https://patchwork.freedesktop.org/series/123916/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13681 -&gt; IGTPW_9881</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Additional (1): bat-dg2-14 <br />
  Missing    (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9881 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13681/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7503 -&gt; IGTPW_9881</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13681: b57407d0de043fc22b000a941a404ab103849e06 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9881: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9881/index.html<br />
  IGT_7503: 7503</p>
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
+igt@xe_exec_threads@threads-hang-rebind-err<br />
+igt@xe_exec_threads@threads-hang-userptr-rebind-err<br />
+igt@xe_exec_threads@threads-rebind-err<br />
+igt@xe_exec_threads@threads-userptr-rebind-err<br />
+igt@xe_query@query-cs-cycles<br />
+igt@xe_query@query-gt-list<br />
+igt@xe_query@query-invalid-cs-cycles<br />
-igt@xe_exec_threads@threads-hang-shared-vm-rebind-err<br />
-igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err<br />
-igt@xe_exec_threads@threads-shared-vm-rebind-err<br />
-igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err<br />
-igt@xe_mmio@mmio-invalid<br />
-igt@xe_mmio@mmio-timestamp<br />
-igt@xe_query@query-gts<br />
-igt@xe_vm@vm-async-ops-err<br />
-igt@xe_vm@vm-async-ops-err-destroy</p>

</body>
</html>

--===============8684393478415249751==--

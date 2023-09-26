Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2603925013566936025=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Tue, 26 Sep 2023 19:46:37 -0000
Message-ID: <169575759788.20979.6540543868618813148@emeril.freedesktop.org>
References: <20230926184748.199187-1-robdclark@gmail.com>
In-Reply-To: <20230926184748.199187-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/3=5D_lib/drmtest=3A_Use_module_table_for_ch?=
 =?utf-8?b?aXBzZXRfdG9fc3RyKCk=?=
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

--===============2603925013566936025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] lib/drmtest: Use module table for chipset_to_str()
URL   : https://patchwork.freedesktop.org/series/124290/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13682 -> IGTPW_9882
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_9882 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-9:         [PASS][1] -> [INCOMPLETE][2] ([i915#7913])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-9/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-9/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][3] -> [ABORT][4] ([i915#9414])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [PASS][5] -> [ABORT][6] ([i915#8668])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
#### Possible fixes ####

  * igt@kms_chamelium_frames@dp-crc-fast:
    - {bat-dg2-13}:       [DMESG-WARN][7] ([Intel XE#485]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - bat-adlp-11:        [DMESG-WARN][9] ([i915#6868]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html

  * igt@kms_flip@basic-plain-flip@c-dp6:
    - bat-adlp-11:        [FAIL][11] ([i915#6121]) -> [PASS][12] +8 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_flip@basic-plain-flip@c-dp6.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_flip@basic-plain-flip@c-dp6.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][13] ([i915#9276]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5:
    - bat-adlp-11:        [DMESG-FAIL][15] ([i915#6868]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-5:
    - bat-adlp-11:        [FAIL][17] ([i915#9047]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-5.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:
    - bat-adlp-11:        [ABORT][19] ([i915#8668]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-11:        [FAIL][21] ([i915#8803]) -> [SKIP][22] ([i915#4093])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8803]: https://gitlab.freedesktop.org/drm/intel/issues/8803
  [i915#9047]: https://gitlab.freedesktop.org/drm/intel/issues/9047
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7503 -> IGTPW_9882

  CI-20190529: 20190529
  CI_DRM_13682: a42554bf0755b80fdfb8e91ca35ae6835bb3534d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9882: 9882
  IGT_7503: 7503


Testlist changes
----------------

+igt@xe_exec_threads@threads-hang-shared-vm-rebind-err
+igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err
+igt@xe_exec_threads@threads-shared-vm-rebind-err
+igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err
+igt@xe_mmio@mmio-invalid
+igt@xe_mmio@mmio-timestamp
+igt@xe_query@query-gts
+igt@xe_vm@vm-async-ops-err
+igt@xe_vm@vm-async-ops-err-destroy
-igt@xe_exec_balancer@many-cm-parallel-basic
-igt@xe_exec_balancer@many-cm-parallel-rebind
-igt@xe_exec_balancer@many-cm-parallel-userptr
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@many-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@many-execqueues-cm-parallel-basic
-igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@no-exec-cm-parallel-basic
-igt@xe_exec_balancer@no-exec-cm-parallel-rebind
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@once-cm-parallel-basic
-igt@xe_exec_balancer@once-cm-parallel-rebind
-igt@xe_exec_balancer@once-cm-parallel-userptr
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@once-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@twice-cm-parallel-basic
-igt@xe_exec_balancer@twice-cm-parallel-rebind
-igt@xe_exec_balancer@twice-cm-parallel-userptr
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind
-igt@xe_exec_threads@threads-hang-rebind-err
-igt@xe_exec_threads@threads-hang-userptr-rebind-err
-igt@xe_exec_threads@threads-rebind-err
-igt@xe_exec_threads@threads-userptr-rebind-err
-igt@xe_query@query-cs-cycles
-igt@xe_query@query-gt-list
-igt@xe_query@query-invalid-cs-cycles

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/index.html

--===============2603925013566936025==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] lib/drmtest: Use module table for chipset_to_str()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124290/">https://patchwork.freedesktop.org/series/124290/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13682 -&gt; IGTPW_9882</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9882 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/485">Intel XE#485</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_flip@basic-plain-flip@c-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_flip@basic-plain-flip@c-dp6.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13682/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8803">i915#8803</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9882/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7503 -&gt; IGTPW_9882</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13682: a42554bf0755b80fdfb8e91ca35ae6835bb3534d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9882: 9882<br />
  IGT_7503: 7503</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_threads@threads-hang-shared-vm-rebind-err<br />
+igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind-err<br />
+igt@xe_exec_threads@threads-shared-vm-rebind-err<br />
+igt@xe_exec_threads@threads-shared-vm-userptr-rebind-err<br />
+igt@xe_mmio@mmio-invalid<br />
+igt@xe_mmio@mmio-timestamp<br />
+igt@xe_query@query-gts<br />
+igt@xe_vm@vm-async-ops-err<br />
+igt@xe_vm@vm-async-ops-err-destroy<br />
-igt@xe_exec_balancer@many-cm-parallel-basic<br />
-igt@xe_exec_balancer@many-cm-parallel-rebind<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-basic<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-basic<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-rebind<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@once-cm-parallel-basic<br />
-igt@xe_exec_balancer@once-cm-parallel-rebind<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@twice-cm-parallel-basic<br />
-igt@xe_exec_balancer@twice-cm-parallel-rebind<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind<br />
-igt@xe_exec_threads@threads-hang-rebind-err<br />
-igt@xe_exec_threads@threads-hang-userptr-rebind-err<br />
-igt@xe_exec_threads@threads-rebind-err<br />
-igt@xe_exec_threads@threads-userptr-rebind-err<br />
-igt@xe_query@query-cs-cycles<br />
-igt@xe_query@query-gt-list<br />
-igt@xe_query@query-invalid-cs-cycles</p>

</body>
</html>

--===============2603925013566936025==--

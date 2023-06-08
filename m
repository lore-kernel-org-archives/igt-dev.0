Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8936588129904210117=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 08 Jun 2023 15:22:15 -0000
Message-ID: <168623773589.18384.3000525301724171307@emeril.freedesktop.org>
References: <20230608140208.41492-1-matthew.brost@intel.com>
In-Reply-To: <20230608140208.41492-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_tests/xe=3A_Sync_with_latest_uAPI?=
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

--===============8936588129904210117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/xe: Sync with latest uAPI
URL   : https://patchwork.freedesktop.org/series/119080/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13250 -> IGTPW_9136
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html

Participating hosts (34 -> 34)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9136:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5:
    - {bat-adlp-11}:      NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5.html

  
Known issues
------------

  Here are the changes found in IGTPW_9136 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-dg2-11:         NOTRUN -> [SKIP][2] ([i915#7828])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [DMESG-FAIL][3] ([i915#4258] / [i915#7913]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@guc:
    - bat-rpls-1:         [DMESG-WARN][5] ([i915#7852]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-1/igt@i915_selftest@live@guc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-rpls-1/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [TIMEOUT][7] ([i915#6794] / [i915#7392]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-2/igt@i915_selftest@live@mman.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@requests:
    - bat-dg2-11:         [ABORT][9] ([i915#7913]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-dg2-11/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-dg2-11/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - {bat-adlp-11}:      [DMESG-WARN][11] ([i915#6868]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - {bat-adlp-11}:      [FAIL][13] ([i915#6121]) -> [PASS][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-adlp-11}:      [SKIP][15] ([i915#4342]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - {bat-adlp-11}:      [ABORT][17] ([i915#4423]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7322 -> IGTPW_9136

  CI-20190529: 20190529
  CI_DRM_13250: 6a7540294ecfbf5a517d3a6603adef6e92474808 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9136: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html
  IGT_7322: 2dd77d6d827a308caae49ce3eba759c2bab394ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_exec_basic@many-engines-many-vm-null
+igt@xe_exec_basic@many-engines-many-vm-null-defer-bind
+igt@xe_exec_basic@many-engines-many-vm-null-defer-mmap
+igt@xe_exec_basic@many-engines-many-vm-null-rebind
+igt@xe_exec_basic@many-engines-null
+igt@xe_exec_basic@many-engines-null-defer-bind
+igt@xe_exec_basic@many-engines-null-defer-mmap
+igt@xe_exec_basic@many-engines-null-rebind
+igt@xe_exec_basic@many-null
+igt@xe_exec_basic@many-null-defer-bind
+igt@xe_exec_basic@many-null-defer-mmap
+igt@xe_exec_basic@many-null-rebind
+igt@xe_exec_basic@no-exec-null
+igt@xe_exec_basic@no-exec-null-defer-bind
+igt@xe_exec_basic@no-exec-null-defer-mmap
+igt@xe_exec_basic@no-exec-null-rebind
+igt@xe_exec_basic@once-null
+igt@xe_exec_basic@once-null-defer-bind
+igt@xe_exec_basic@once-null-defer-mmap
+igt@xe_exec_basic@once-null-rebind
+igt@xe_exec_basic@twice-null
+igt@xe_exec_basic@twice-null-defer-bind
+igt@xe_exec_basic@twice-null-defer-mmap
+igt@xe_exec_basic@twice-null-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html

--===============8936588129904210117==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/xe: Sync with latest uAPI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119080/">https://patchwork.freedesktop.org/series/119080/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13250 -&gt; IGTPW_9136</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html</p>
<h2>Participating hosts (34 -&gt; 34)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9136:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5:<ul>
<li>{bat-adlp-11}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9136 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium_hpd@common-hpd-after-suspend:<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-1/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-rpls-1/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-dg2-11/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-dg2-11/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7322 -&gt; IGTPW_9136</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13250: 6a7540294ecfbf5a517d3a6603adef6e92474808 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9136: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9136/index.html<br />
  IGT_7322: 2dd77d6d827a308caae49ce3eba759c2bab394ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_basic@many-engines-many-vm-null<br />
+igt@xe_exec_basic@many-engines-many-vm-null-defer-bind<br />
+igt@xe_exec_basic@many-engines-many-vm-null-defer-mmap<br />
+igt@xe_exec_basic@many-engines-many-vm-null-rebind<br />
+igt@xe_exec_basic@many-engines-null<br />
+igt@xe_exec_basic@many-engines-null-defer-bind<br />
+igt@xe_exec_basic@many-engines-null-defer-mmap<br />
+igt@xe_exec_basic@many-engines-null-rebind<br />
+igt@xe_exec_basic@many-null<br />
+igt@xe_exec_basic@many-null-defer-bind<br />
+igt@xe_exec_basic@many-null-defer-mmap<br />
+igt@xe_exec_basic@many-null-rebind<br />
+igt@xe_exec_basic@no-exec-null<br />
+igt@xe_exec_basic@no-exec-null-defer-bind<br />
+igt@xe_exec_basic@no-exec-null-defer-mmap<br />
+igt@xe_exec_basic@no-exec-null-rebind<br />
+igt@xe_exec_basic@once-null<br />
+igt@xe_exec_basic@once-null-defer-bind<br />
+igt@xe_exec_basic@once-null-defer-mmap<br />
+igt@xe_exec_basic@once-null-rebind<br />
+igt@xe_exec_basic@twice-null<br />
+igt@xe_exec_basic@twice-null-defer-bind<br />
+igt@xe_exec_basic@twice-null-defer-mmap<br />
+igt@xe_exec_basic@twice-null-rebind</p>

</body>
</html>

--===============8936588129904210117==--

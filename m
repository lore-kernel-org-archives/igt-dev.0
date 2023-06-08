Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5354042960381116217=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Thu, 08 Jun 2023 16:32:18 -0000
Message-ID: <168624193848.18387.10568705646036089879@emeril.freedesktop.org>
References: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZ2VtX2N0?=
 =?utf-8?q?x=5Ffreq=3A_multi-gt_support_and_disable_efficient_freq_=28rev2?=
 =?utf-8?q?=29?=
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

--===============5354042960381116217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_ctx_freq: multi-gt support and disable efficient freq (rev2)
URL   : https://patchwork.freedesktop.org/series/118893/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13250 -> IGTPW_9137
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html

Participating hosts (34 -> 34)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between CI_DRM_13250 and IGTPW_9137:

### New IGT tests (1) ###

  * igt@gem_ctx_freq@sysfs@gt0:
    - Statuses : 30 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9137 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_ctx_freq@sysfs@gt0} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#4579])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-ilk-650/igt@gem_ctx_freq@sysfs@gt0.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4579])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-blb-e6850/igt@gem_ctx_freq@sysfs@gt0.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4579])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-pnv-d510/igt@gem_ctx_freq@sysfs@gt0.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4579])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-elk-e7500/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-9:         [PASS][5] -> [DMESG-FAIL][6] ([i915#7699] / [i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-9/igt@i915_selftest@live@migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-9/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [PASS][7] -> [ABORT][8] ([i915#7913] / [i915#7982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-2/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-rpls-2/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#7828])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@guc:
    - bat-rpls-1:         [DMESG-WARN][10] ([i915#7852]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-1/igt@i915_selftest@live@guc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-rpls-1/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@requests:
    - bat-dg2-11:         [ABORT][12] ([i915#7913]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-dg2-11/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-dg2-11/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - {bat-adlp-11}:      [DMESG-WARN][14] ([i915#6868]) -> [PASS][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - {bat-adlp-11}:      [FAIL][16] ([i915#6121]) -> [PASS][17] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-adlp-11}:      [SKIP][18] ([i915#4342]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4309]: https://gitlab.freedesktop.org/drm/intel/issues/4309
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7322 -> IGTPW_9137

  CI-20190529: 20190529
  CI_DRM_13250: 6a7540294ecfbf5a517d3a6603adef6e92474808 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9137: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html
  IGT_7322: 2dd77d6d827a308caae49ce3eba759c2bab394ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_exec_basic@many-engines-many-vm-null
-igt@xe_exec_basic@many-engines-many-vm-null-defer-bind
-igt@xe_exec_basic@many-engines-many-vm-null-defer-mmap
-igt@xe_exec_basic@many-engines-many-vm-null-rebind
-igt@xe_exec_basic@many-engines-null
-igt@xe_exec_basic@many-engines-null-defer-bind
-igt@xe_exec_basic@many-engines-null-defer-mmap
-igt@xe_exec_basic@many-engines-null-rebind
-igt@xe_exec_basic@many-null
-igt@xe_exec_basic@many-null-defer-bind
-igt@xe_exec_basic@many-null-defer-mmap
-igt@xe_exec_basic@many-null-rebind
-igt@xe_exec_basic@no-exec-null
-igt@xe_exec_basic@no-exec-null-defer-bind
-igt@xe_exec_basic@no-exec-null-defer-mmap
-igt@xe_exec_basic@no-exec-null-rebind
-igt@xe_exec_basic@once-null
-igt@xe_exec_basic@once-null-defer-bind
-igt@xe_exec_basic@once-null-defer-mmap
-igt@xe_exec_basic@once-null-rebind
-igt@xe_exec_basic@twice-null
-igt@xe_exec_basic@twice-null-defer-bind
-igt@xe_exec_basic@twice-null-defer-mmap
-igt@xe_exec_basic@twice-null-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html

--===============5354042960381116217==
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
<tr><td><b>Series:</b></td><td>gem_ctx_freq: multi-gt support and disable efficient freq (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118893/">https://patchwork.freedesktop.org/series/118893/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13250 -&gt; IGTPW_9137</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html</p>
<h2>Participating hosts (34 -&gt; 34)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13250 and IGTPW_9137:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_ctx_freq@sysfs@gt0:<ul>
<li>Statuses : 30 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9137 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_ctx_freq@sysfs@gt0} (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-ilk-650/igt@gem_ctx_freq@sysfs@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-blb-e6850/igt@gem_ctx_freq@sysfs@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-pnv-d510/igt@gem_ctx_freq@sysfs@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/fi-elk-e7500/igt@gem_ctx_freq@sysfs@gt0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-9/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-9/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7982">i915#7982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-rpls-1/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-rpls-1/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-dg2-11/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-dg2-11/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-adlp-11}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13250/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7322 -&gt; IGTPW_9137</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13250: 6a7540294ecfbf5a517d3a6603adef6e92474808 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9137: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9137/index.html<br />
  IGT_7322: 2dd77d6d827a308caae49ce3eba759c2bab394ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_exec_basic@many-engines-many-vm-null<br />
-igt@xe_exec_basic@many-engines-many-vm-null-defer-bind<br />
-igt@xe_exec_basic@many-engines-many-vm-null-defer-mmap<br />
-igt@xe_exec_basic@many-engines-many-vm-null-rebind<br />
-igt@xe_exec_basic@many-engines-null<br />
-igt@xe_exec_basic@many-engines-null-defer-bind<br />
-igt@xe_exec_basic@many-engines-null-defer-mmap<br />
-igt@xe_exec_basic@many-engines-null-rebind<br />
-igt@xe_exec_basic@many-null<br />
-igt@xe_exec_basic@many-null-defer-bind<br />
-igt@xe_exec_basic@many-null-defer-mmap<br />
-igt@xe_exec_basic@many-null-rebind<br />
-igt@xe_exec_basic@no-exec-null<br />
-igt@xe_exec_basic@no-exec-null-defer-bind<br />
-igt@xe_exec_basic@no-exec-null-defer-mmap<br />
-igt@xe_exec_basic@no-exec-null-rebind<br />
-igt@xe_exec_basic@once-null<br />
-igt@xe_exec_basic@once-null-defer-bind<br />
-igt@xe_exec_basic@once-null-defer-mmap<br />
-igt@xe_exec_basic@once-null-rebind<br />
-igt@xe_exec_basic@twice-null<br />
-igt@xe_exec_basic@twice-null-defer-bind<br />
-igt@xe_exec_basic@twice-null-defer-mmap<br />
-igt@xe_exec_basic@twice-null-rebind</p>

</body>
</html>

--===============5354042960381116217==--

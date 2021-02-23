Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Feb 2021 10:18:14 -0000
Message-ID: <161407549404.21178.9808824175064630144@emeril.freedesktop.org>
References: <20210223083259.32367-1-nidhi1.gupta@intel.com>
In-Reply-To: <20210223083259.32367-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Ffrontbuffer=5Ftracking=3Amodified_subtest_name?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0263288072=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0263288072==
Content-Type: multipart/alternative;
 boundary="===============6446844513459250690=="

--===============6446844513459250690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_frontbuffer_tracking:modified subtest name
URL   : https://patchwork.freedesktop.org/series/87308/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9797 -> IGTPW_5545
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9797 and IGTPW_5545:

### New IGT tests (5) ###

  * igt@i915_pm_backlight@basic-brightness:
    - Statuses : 16 pass(s) 20 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - Statuses : 27 pass(s) 9 skip(s)
    - Exec time: [0.0, 6.79] s

  * igt@i915_pm_rpm@basic-rte:
    - Statuses : 27 pass(s) 9 skip(s)
    - Exec time: [0.61, 17.95] s

  * igt@i915_pm_rpm@module-reload:
    - Statuses : 2 dmesg-warn(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 57.00] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 33 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_5545 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][4] -> [FAIL][5] ([i915#1888])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [INCOMPLETE][8] ([i915#2940]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6013 -> IGTPW_5545

  CI-20190529: 20190529
  CI_DRM_9797: 9aef35dcec027549b22e895e2027adc1ba41b1c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html
  IGT_6013: a6c7181747850161377dae5161d33c0675ab273e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt
+igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt
+igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt
+igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt
+igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt
-igt@kms_frontbuffer_tracking@drrs-farfromfence
-igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence
-igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbcpsr-farfromfence
-igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack
-igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack
-igt@kms_frontbuffer_tracking@fbc-farfromfence
-igt@kms_frontbuffer_tracking@psrdrrs-farfromfence
-igt@kms_frontbuffer_tracking@psr-farfromfence

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html

--===============6446844513459250690==
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
<tr><td><b>Series:</b></td><td>tests/kms_frontbuffer_tracking:modified subtest name</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87308/">https://patchwork.freedesktop.org/series/87308/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9797 -&gt; IGTPW_5545</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9797 and IGTPW_5545:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 16 pass(s) 20 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 27 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 6.79] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 27 pass(s) 9 skip(s)</li>
<li>Exec time: [0.61, 17.95] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 57.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>Statuses : 33 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5545 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9797/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6013 -&gt; IGTPW_5545</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9797: 9aef35dcec027549b22e895e2027adc1ba41b1c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5545/index.html<br />
  IGT_6013: a6c7181747850161377dae5161d33c0675ab273e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@psrdrrs-farfromfence-mmap-gtt<br />
+igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt<br />
-igt@kms_frontbuffer_tracking@drrs-farfromfence<br />
-igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence<br />
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-1p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-2p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-farfromfence<br />
-igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbcpsr-farfromfence<br />
-igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack<br />
-igt@kms_frontbuffer_tracking@fbc-farfromfence<br />
-igt@kms_frontbuffer_tracking@psrdrrs-farfromfence<br />
-igt@kms_frontbuffer_tracking@psr-farfromfence</p>

</body>
</html>

--===============6446844513459250690==--

--===============0263288072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0263288072==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9061200690054145656=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 Oct 2021 05:26:46 -0000
Message-ID: <163479400681.20177.10131008075058419010@emeril.freedesktop.org>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ0NTIGVu?=
 =?utf-8?q?gine_and_engine_resets_test?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============9061200690054145656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CCS engine and engine resets test
URL   : https://patchwork.freedesktop.org/series/96095/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10767 -> IGTPW_6339
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html

Known issues
------------

  Here are the changes found in IGTPW_6339 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-1115g4:      [PASS][2] -> [FAIL][3] ([i915#1888])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][4] -> [DMESG-WARN][5] ([i915#4269])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][6] ([i915#3921]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - fi-cfl-8109u:       [FAIL][8] ([i915#4165]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [DMESG-WARN][10] ([i915#295]) -> [PASS][11] +14 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4165]: https://gitlab.freedesktop.org/drm/intel/issues/4165
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269


Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-kbl-soraka bat-dg1-6 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6258 -> IGTPW_6339

  CI-20190529: 20190529
  CI_DRM_10767: 4d947bb057406e5c30081736db70da3f5726e0cd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6339: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html
  IGT_6258: 4c80c71d7dec29b6376846ae96bd04dc0b6e34d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_ctx_persistence@saturated-hostile-nopreempt
+igt@gem_ctx_switch@ccs0
+igt@gem_ctx_switch@ccs0-forked
+igt@gem_ctx_switch@ccs0-forked-heavy
+igt@gem_ctx_switch@ccs0-forked-heavy-interruptible
+igt@gem_ctx_switch@ccs0-forked-heavy-queue
+igt@gem_ctx_switch@ccs0-forked-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs0-forked-interruptible
+igt@gem_ctx_switch@ccs0-forked-queue
+igt@gem_ctx_switch@ccs0-forked-queue-interruptible
+igt@gem_ctx_switch@ccs0-heavy
+igt@gem_ctx_switch@ccs0-heavy-interruptible
+igt@gem_ctx_switch@ccs0-heavy-queue
+igt@gem_ctx_switch@ccs0-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs0-interruptible
+igt@gem_ctx_switch@ccs0-queue
+igt@gem_ctx_switch@ccs0-queue-interruptible
+igt@gem_ctx_switch@ccs1
+igt@gem_ctx_switch@ccs1-forked
+igt@gem_ctx_switch@ccs1-forked-heavy
+igt@gem_ctx_switch@ccs1-forked-heavy-interruptible
+igt@gem_ctx_switch@ccs1-forked-heavy-queue
+igt@gem_ctx_switch@ccs1-forked-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs1-forked-interruptible
+igt@gem_ctx_switch@ccs1-forked-queue
+igt@gem_ctx_switch@ccs1-forked-queue-interruptible
+igt@gem_ctx_switch@ccs1-heavy
+igt@gem_ctx_switch@ccs1-heavy-interruptible
+igt@gem_ctx_switch@ccs1-heavy-queue
+igt@gem_ctx_switch@ccs1-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs1-interruptible
+igt@gem_ctx_switch@ccs1-queue
+igt@gem_ctx_switch@ccs1-queue-interruptible
+igt@gem_ctx_switch@ccs2
+igt@gem_ctx_switch@ccs2-forked
+igt@gem_ctx_switch@ccs2-forked-heavy
+igt@gem_ctx_switch@ccs2-forked-heavy-interruptible
+igt@gem_ctx_switch@ccs2-forked-heavy-queue
+igt@gem_ctx_switch@ccs2-forked-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs2-forked-interruptible
+igt@gem_ctx_switch@ccs2-forked-queue
+igt@gem_ctx_switch@ccs2-forked-queue-interruptible
+igt@gem_ctx_switch@ccs2-heavy
+igt@gem_ctx_switch@ccs2-heavy-interruptible
+igt@gem_ctx_switch@ccs2-heavy-queue
+igt@gem_ctx_switch@ccs2-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs2-interruptible
+igt@gem_ctx_switch@ccs2-queue
+igt@gem_ctx_switch@ccs2-queue-interruptible
+igt@gem_ctx_switch@ccs3
+igt@gem_ctx_switch@ccs3-forked
+igt@gem_ctx_switch@ccs3-forked-heavy
+igt@gem_ctx_switch@ccs3-forked-heavy-interruptible
+igt@gem_ctx_switch@ccs3-forked-heavy-queue
+igt@gem_ctx_switch@ccs3-forked-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs3-forked-interruptible
+igt@gem_ctx_switch@ccs3-forked-queue
+igt@gem_ctx_switch@ccs3-forked-queue-interruptible
+igt@gem_ctx_switch@ccs3-heavy
+igt@gem_ctx_switch@ccs3-heavy-interruptible
+igt@gem_ctx_switch@ccs3-heavy-queue
+igt@gem_ctx_switch@ccs3-heavy-queue-interruptible
+igt@gem_ctx_switch@ccs3-interruptible
+igt@gem_ctx_switch@ccs3-queue
+igt@gem_ctx_switch@ccs3-queue-interruptible

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html

--===============9061200690054145656==
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
<tr><td><b>Series:</b></td><td>CCS engine and engine resets test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96095/">https://patchwork.freedesktop.org/series/96095/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10767 -&gt; IGTPW_6339</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6339 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp1:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4165">i915#4165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10767/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> +14 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): fi-kbl-soraka bat-dg1-6 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6258 -&gt; IGTPW_6339</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10767: 4d947bb057406e5c30081736db70da3f5726e0cd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6339: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6339/index.html<br />
  IGT_6258: 4c80c71d7dec29b6376846ae96bd04dc0b6e34d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_ctx_persistence@saturated-hostile-nopreempt<br />
+igt@gem_ctx_switch@ccs0<br />
+igt@gem_ctx_switch@ccs0-forked<br />
+igt@gem_ctx_switch@ccs0-forked-heavy<br />
+igt@gem_ctx_switch@ccs0-forked-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs0-forked-heavy-queue<br />
+igt@gem_ctx_switch@ccs0-forked-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs0-forked-interruptible<br />
+igt@gem_ctx_switch@ccs0-forked-queue<br />
+igt@gem_ctx_switch@ccs0-forked-queue-interruptible<br />
+igt@gem_ctx_switch@ccs0-heavy<br />
+igt@gem_ctx_switch@ccs0-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs0-heavy-queue<br />
+igt@gem_ctx_switch@ccs0-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs0-interruptible<br />
+igt@gem_ctx_switch@ccs0-queue<br />
+igt@gem_ctx_switch@ccs0-queue-interruptible<br />
+igt@gem_ctx_switch@ccs1<br />
+igt@gem_ctx_switch@ccs1-forked<br />
+igt@gem_ctx_switch@ccs1-forked-heavy<br />
+igt@gem_ctx_switch@ccs1-forked-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs1-forked-heavy-queue<br />
+igt@gem_ctx_switch@ccs1-forked-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs1-forked-interruptible<br />
+igt@gem_ctx_switch@ccs1-forked-queue<br />
+igt@gem_ctx_switch@ccs1-forked-queue-interruptible<br />
+igt@gem_ctx_switch@ccs1-heavy<br />
+igt@gem_ctx_switch@ccs1-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs1-heavy-queue<br />
+igt@gem_ctx_switch@ccs1-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs1-interruptible<br />
+igt@gem_ctx_switch@ccs1-queue<br />
+igt@gem_ctx_switch@ccs1-queue-interruptible<br />
+igt@gem_ctx_switch@ccs2<br />
+igt@gem_ctx_switch@ccs2-forked<br />
+igt@gem_ctx_switch@ccs2-forked-heavy<br />
+igt@gem_ctx_switch@ccs2-forked-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs2-forked-heavy-queue<br />
+igt@gem_ctx_switch@ccs2-forked-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs2-forked-interruptible<br />
+igt@gem_ctx_switch@ccs2-forked-queue<br />
+igt@gem_ctx_switch@ccs2-forked-queue-interruptible<br />
+igt@gem_ctx_switch@ccs2-heavy<br />
+igt@gem_ctx_switch@ccs2-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs2-heavy-queue<br />
+igt@gem_ctx_switch@ccs2-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs2-interruptible<br />
+igt@gem_ctx_switch@ccs2-queue<br />
+igt@gem_ctx_switch@ccs2-queue-interruptible<br />
+igt@gem_ctx_switch@ccs3<br />
+igt@gem_ctx_switch@ccs3-forked<br />
+igt@gem_ctx_switch@ccs3-forked-heavy<br />
+igt@gem_ctx_switch@ccs3-forked-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs3-forked-heavy-queue<br />
+igt@gem_ctx_switch@ccs3-forked-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs3-forked-interruptible<br />
+igt@gem_ctx_switch@ccs3-forked-queue<br />
+igt@gem_ctx_switch@ccs3-forked-queue-interruptible<br />
+igt@gem_ctx_switch@ccs3-heavy<br />
+igt@gem_ctx_switch@ccs3-heavy-interruptible<br />
+igt@gem_ctx_switch@ccs3-heavy-queue<br />
+igt@gem_ctx_switch@ccs3-heavy-queue-interruptible<br />
+igt@gem_ctx_switch@ccs3-interruptible<br />
+igt@gem_ctx_switch@ccs3-queue<br />
+igt@gem_ctx_switch@ccs3-queue-interruptible</p>

</body>
</html>

--===============9061200690054145656==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9014658663501708820=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Mon, 11 Sep 2023 13:04:28 -0000
Message-ID: <169443746864.31369.2062281182270246243@emeril.freedesktop.org>
References: <20230911122256.30665-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20230911122256.30665-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciBpOTE1X3Bp?=
 =?utf-8?q?pe=5Fstress_fixes?=
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

--===============9014658663501708820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915_pipe_stress fixes
URL   : https://patchwork.freedesktop.org/series/123537/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7479_BAT -> XEIGTPW_9764_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_9764_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] ([Intel XE#609]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         NOTRUN -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][3] ([Intel XE#632])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          NOTRUN -> [FAIL][4] ([Intel XE#389]) +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#261]) +15 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][6] ([Intel XE#482]) +2 other tests dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#288]) +17 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][8] ([Intel XE#526])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#263])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@xe_mmap@vram.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#526]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/526
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632


Build changes
-------------

  * IGT: IGT_7479 -> IGTPW_9764

  IGTPW_9764: 9764
  IGT_7479: 84ec7fe5b86ca4c7449d63ca833ca8cbe350f1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/index.html

--===============9014658663501708820==
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
<tr><td><b>Series:</b></td><td>i915_pipe_stress fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123537/">https://patchwork.freedesktop.org/series/123537/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7479_BAT -&gt; XEIGTPW_9764_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9764_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) +2 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +15 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/526">Intel XE#526</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9764/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7479 -&gt; IGTPW_9764</li>
</ul>
<p>IGTPW_9764: 9764<br />
  IGT_7479: 84ec7fe5b86ca4c7449d63ca833ca8cbe350f1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689</p>

</body>
</html>

--===============9014658663501708820==--

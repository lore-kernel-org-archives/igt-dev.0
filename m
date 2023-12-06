Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1609875531668576410=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 19:20:10 -0000
Message-ID: <170189041088.26425.6044101824295697799@emeril.freedesktop.org>
References: <20231206144452.19745-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206144452.19745-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIENJLnhlQkFUOiBmYWlsdXJlIGZvciBSRkM6IGRy?=
 =?utf-8?q?m-uapi/xe=3A_add_exec=5Fqueue=5Fid_member_to_drm=5Fxe=5Fwait=5F?=
 =?utf-8?q?user=5Ffence_structure_=28rev4=29?=
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

--===============1609875531668576410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure (rev4)
URL   : https://patchwork.freedesktop.org/series/127364/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7625_BAT -> XEIGTPW_10354_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10354_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10354_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10354_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [TIMEOUT][2] +2 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +25 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +17 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] +30 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_live_ktest@dmabuf:
    - bat-pvc-2:          [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_live_ktest@dmabuf.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_live_ktest@dmabuf.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] +29 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][17] ([Intel XE#482]) -> [FAIL][18] +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10354_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [PASS][19] -> [FAIL][20] ([Intel XE#524])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-pvc-2:          [PASS][21] -> [FAIL][22] ([Intel XE#818])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] ([Intel XE#818])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][25] -> [FAIL][26] ([Intel XE#818])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][27] ([Intel XE#480]) -> [PASS][28] +2 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/818


Build changes
-------------

  * IGT: IGT_7625 -> IGTPW_10354
  * Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -> xe-555-42c08951a31c679822795d72ada017e004d89102

  IGTPW_10354: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10354/index.html
  IGT_7625: f40c67d84e142095ac6215be154e1f3710f26cba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a
  xe-555-42c08951a31c679822795d72ada017e004d89102: 42c08951a31c679822795d72ada017e004d89102

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/index.html

--===============1609875531668576410==
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
<tr><td><b>Series:</b></td><td>RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127364/">https://patchwork.freedesktop.org/series/127364/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7625_BAT -&gt; XEIGTPW_10354_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10354_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10354_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10354_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_live_ktest@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_live_ktest@dmabuf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-small-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10354_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7625/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10354/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7625 -&gt; IGTPW_10354</li>
<li>Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -&gt; xe-555-42c08951a31c679822795d72ada017e004d89102</li>
</ul>
<p>IGTPW_10354: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10354/index.html<br />
  IGT_7625: f40c67d84e142095ac6215be154e1f3710f26cba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a<br />
  xe-555-42c08951a31c679822795d72ada017e004d89102: 42c08951a31c679822795d72ada017e004d89102</p>

</body>
</html>

--===============1609875531668576410==--

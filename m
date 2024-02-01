Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C48C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 17:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482110F1FB;
	Thu,  1 Feb 2024 17:21:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4C10F1FB;
 Thu,  1 Feb 2024 17:21:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2782507834887168133=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_introduce_Xe_multigpu_and_o?=
 =?utf-8?q?ther_multi-GPU_helpers_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Feb 2024 17:21:49 -0000
Message-ID: <170680810942.895526.9960874747411510796@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240201155047.48608-1-kamil.konieczny@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============2782507834887168133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev6)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14209 -> IGTPW_10626
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10626:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ctx_exec@basic:
    - {bat-arls-2}:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-arls-2/igt@gem_ctx_exec@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/bat-arls-2/igt@gem_ctx_exec@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_10626 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-apl-guc:         [DMESG-WARN][3] ([i915#180] / [i915#8585]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@i915_module_load@load.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-9:         [ABORT][5] ([i915#10021]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-adlp-9/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/bat-adlp-9/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [DMESG-WARN][7] -> [PASS][8] +39 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-apl-guc:         [DMESG-WARN][9] ([i915#180]) -> [PASS][10] +22 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [DMESG-WARN][11] ([i915#180] / [i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-apl-guc:         [DMESG-WARN][13] ([i915#180] / [i915#8585]) -> [DMESG-WARN][14] ([i915#180] / [i915#1982] / [i915#8585])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - fi-apl-guc:         [DMESG-WARN][15] ([i915#180] / [i915#8585]) -> [DMESG-WARN][16] ([i915#180] / [i915#8585] / [i915#8703]) +5 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - fi-apl-guc:         [DMESG-WARN][17] ([i915#180]) -> [DMESG-WARN][18] ([i915#180] / [i915#8703]) +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-apl-guc:         [DMESG-WARN][19] -> [DMESG-WARN][20] ([i915#8703])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10021]: https://gitlab.freedesktop.org/drm/intel/issues/10021
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8703]: https://gitlab.freedesktop.org/drm/intel/issues/8703


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7700 -> IGTPW_10626

  CI-20190529: 20190529
  CI_DRM_14209: 3e58a4940c44430f20cad20ead5e1b77ed209cde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10626: 10626
  IGT_7700: 7700


Testlist changes
----------------

+igt@gem_mmap@multigpu-basic
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind
+igt@xe_exec_basic@multigpu-no-exec-basic
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind
+igt@xe_exec_basic@multigpu-no-exec-null
+igt@xe_exec_basic@multigpu-no-exec-null-defer-bind
+igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap
+igt@xe_exec_basic@multigpu-no-exec-null-rebind
+igt@xe_exec_basic@multigpu-no-exec-rebind
+igt@xe_exec_basic@multigpu-no-exec-userptr
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-no-exec-userptr-rebind
+igt@xe_exec_basic@multigpu-once-basic
+igt@xe_exec_basic@multigpu-once-basic-defer-bind
+igt@xe_exec_basic@multigpu-once-basic-defer-mmap
+igt@xe_exec_basic@multigpu-once-bindexecqueue
+igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind
+igt@xe_exec_basic@multigpu-once-null
+igt@xe_exec_basic@multigpu-once-null-defer-bind
+igt@xe_exec_basic@multigpu-once-null-defer-mmap
+igt@xe_exec_basic@multigpu-once-null-rebind
+igt@xe_exec_basic@multigpu-once-rebind
+igt@xe_exec_basic@multigpu-once-userptr
+igt@xe_exec_basic@multigpu-once-userptr-invalidate
+igt@xe_exec_basic@multigpu-once-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-once-userptr-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/index.html

--===============2782507834887168133==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14209 -&gt; IGTPW_10626</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10626:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_ctx_exec@basic:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-arls-2/igt@gem_ctx_exec@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/bat-arls-2/igt@gem_ctx_exec@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10626 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10626/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7700 -&gt; IGTPW_10626</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14209: 3e58a4940c44430f20cad20ead5e1b77ed209cde @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10626: 10626<br />
  IGT_7700: 7700</p>
<h2>Testlist changes</h2>
<p>+igt@gem_mmap@multigpu-basic<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-basic<br />
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind<br />
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-null<br />
+igt@xe_exec_basic@multigpu-no-exec-null-defer-bind<br />
+igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap<br />
+igt@xe_exec_basic@multigpu-no-exec-null-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-once-basic<br />
+igt@xe_exec_basic@multigpu-once-basic-defer-bind<br />
+igt@xe_exec_basic@multigpu-once-basic-defer-mmap<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-once-null<br />
+igt@xe_exec_basic@multigpu-once-null-defer-bind<br />
+igt@xe_exec_basic@multigpu-once-null-defer-mmap<br />
+igt@xe_exec_basic@multigpu-once-null-rebind<br />
+igt@xe_exec_basic@multigpu-once-rebind<br />
+igt@xe_exec_basic@multigpu-once-userptr<br />
+igt@xe_exec_basic@multigpu-once-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-once-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-once-userptr-rebind</p>

</body>
</html>

--===============2782507834887168133==--

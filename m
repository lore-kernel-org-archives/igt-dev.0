Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B1C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 18:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43CF10F30D;
	Wed, 20 Mar 2024 18:33:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC2310FEC6;
 Wed, 20 Mar 2024 18:32:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6790103960700597222=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_introduce_Xe_multigpu_and_o?=
 =?utf-8?q?ther_multi-GPU_helpers_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 Mar 2024 18:32:59 -0000
Message-ID: <171095957925.921315.15554135943297642960@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
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

--===============6790103960700597222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev14)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14457 -> IGTPW_10866
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (2): bat-jsl-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10866 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][1] ([i915#10462])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@info:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@kms_addfb_basic@bad-pitch-65536:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][6] ([i915#10457]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_addfb_basic@bad-pitch-65536.html

  * igt@kms_addfb_basic@too-high:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][7] ([i915#10455])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-FAIL][8] ([i915#10454])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][9] ([i915#10454]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][10] +17 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][11] ([IGT#3])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][12] +58 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-3:         [DMESG-WARN][13] ([i915#5591]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#10454]: https://gitlab.freedesktop.org/drm/intel/issues/10454
  [i915#10455]: https://gitlab.freedesktop.org/drm/intel/issues/10455
  [i915#10457]: https://gitlab.freedesktop.org/drm/intel/issues/10457
  [i915#10462]: https://gitlab.freedesktop.org/drm/intel/issues/10462
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7770 -> IGTPW_10866

  CI-20190529: 20190529
  CI_DRM_14457: cfe25dc9ae2e1add3f2605831bf6d8bea481164b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html
  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

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
-igt@xe_exec_compute_mode@lr-mode-workload

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html

--===============6790103960700597222==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14457 -&gt; IGTPW_10866</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (2): bat-jsl-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10866 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10462">i915#10462</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-65536:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_addfb_basic@bad-pitch-65536.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10457">i915#10457</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10455">i915#10455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10454">i915#10454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10454">i915#10454</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +17 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">SKIP</a> +58 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7770 -&gt; IGTPW_10866</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14457: cfe25dc9ae2e1add3f2605831bf6d8bea481164b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html<br />
  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic<br />
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
+igt@xe_exec_basic@multigpu-once-userptr-rebind<br />
-igt@xe_exec_compute_mode@lr-mode-workload</p>

</body>
</html>

--===============6790103960700597222==--

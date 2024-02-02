Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8A2C48291
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 17:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1A10E122;
	Fri,  2 Feb 2024 17:38:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDA310E122;
 Fri,  2 Feb 2024 17:38:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0118830559309788879=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_introduce_Xe_multigpu_and_o?=
 =?utf-8?q?ther_multi-GPU_helpers_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Feb 2024 17:38:31 -0000
Message-ID: <170689551132.953176.2258498496277694226@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
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

--===============0118830559309788879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev7)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14212 -> IGTPW_10633
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-adlp-6 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10633:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@coherency:
    - {bat-arls-2}:       [DMESG-WARN][1] ([i915#10194]) -> [DMESG-FAIL][2] +22 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14212/bat-arls-2/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/bat-arls-2/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@ring_submission:
    - {bat-arls-2}:       NOTRUN -> [DMESG-FAIL][3] +10 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/bat-arls-2/igt@i915_selftest@live@ring_submission.html

  
Known issues
------------

  Here are the changes found in IGTPW_10633 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - bat-adln-1:         [DMESG-FAIL][4] ([i915#10010]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14212/bat-adln-1/igt@i915_selftest@live@gt_pm.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/bat-adln-1/igt@i915_selftest@live@gt_pm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10010]: https://gitlab.freedesktop.org/drm/intel/issues/10010
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7702 -> IGTPW_10633

  CI-20190529: 20190529
  CI_DRM_14212: 1dd92467500a5ead3e44bbdfe15e064dd79b65ef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10633: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html
  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html

--===============0118830559309788879==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14212 -&gt; IGTPW_10633</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-adlp-6 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10633:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14212/bat-arls-2/igt@i915_selftest@live@coherency.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/bat-arls-2/igt@i915_selftest@live@coherency.html">DMESG-FAIL</a> +22 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/bat-arls-2/igt@i915_selftest@live@ring_submission.html">DMESG-FAIL</a> +10 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10633 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14212/bat-adln-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10010">i915#10010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/bat-adln-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7702 -&gt; IGTPW_10633</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14212: 1dd92467500a5ead3e44bbdfe15e064dd79b65ef @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10633: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10633/index.html<br />
  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============0118830559309788879==--

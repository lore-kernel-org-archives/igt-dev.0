Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216CC47DDF
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 05:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51B112458;
	Mon, 29 Jan 2024 05:24:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93DC112455;
 Mon, 29 Jan 2024 05:24:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5907389879167580272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fprime=3A_Add_XE?=
 =?utf-8?q?_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 29 Jan 2024 05:24:29 -0000
Message-ID: <170650586995.789298.1458038525413093410@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129050726.19143-1-nidhi1.gupta@intel.com>
In-Reply-To: <20240129050726.19143-1-nidhi1.gupta@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============5907389879167580272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_prime: Add XE support (rev4)
URL   : https://patchwork.freedesktop.org/series/128045/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14187 -> IGTPW_10596
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/index.html

Participating hosts (35 -> 31)
------------------------------

  Missing    (4): bat-rpls-2 bat-kbl-2 fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_10596 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_hangman@error-state-basic:
    - bat-mtlp-6:         [PASS][1] -> [ABORT][2] ([i915#9414])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/bat-mtlp-6/igt@i915_hangman@error-state-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/bat-mtlp-6/igt@i915_hangman@error-state-basic.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#7911])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [PASS][5] -> [DMESG-WARN][6] ([i915#9730]) +36 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-WARN][8] ([i915#8585]) +41 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][9] -> [DMESG-WARN][10] ([i915#180] / [i915#8585]) +45 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bsw-nick:        [DMESG-FAIL][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlm-1:         [INCOMPLETE][13] ([i915#9413]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html

  
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7694 -> IGTPW_10596

  CI-20190529: 20190529
  CI_DRM_14187: 0f1b42b9d395bd4097b2846230a13869dc638216 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10596: 10596
  IGT_7694: 814cd9883b94be1c61d830b2c1279dc2265476bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_mmap@basic-multigpu
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind
-igt@xe_exec_basic@multigpu-no-exec-basic
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@multigpu-no-exec-null
-igt@xe_exec_basic@multigpu-no-exec-null-defer-bind
-igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap
-igt@xe_exec_basic@multigpu-no-exec-null-rebind
-igt@xe_exec_basic@multigpu-no-exec-rebind
-igt@xe_exec_basic@multigpu-no-exec-userptr
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-no-exec-userptr-rebind
-igt@xe_exec_basic@multigpu-once-basic
-igt@xe_exec_basic@multigpu-once-basic-defer-bind
-igt@xe_exec_basic@multigpu-once-basic-defer-mmap
-igt@xe_exec_basic@multigpu-once-bindexecqueue
-igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@multigpu-once-null
-igt@xe_exec_basic@multigpu-once-null-defer-bind
-igt@xe_exec_basic@multigpu-once-null-defer-mmap
-igt@xe_exec_basic@multigpu-once-null-rebind
-igt@xe_exec_basic@multigpu-once-rebind
-igt@xe_exec_basic@multigpu-once-userptr
-igt@xe_exec_basic@multigpu-once-userptr-invalidate
-igt@xe_exec_basic@multigpu-once-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-once-userptr-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/index.html

--===============5907389879167580272==
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
<tr><td><b>Series:</b></td><td>tests/kms_prime: Add XE support (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128045/">https://patchwork.freedesktop.org/series/128045/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14187 -&gt; IGTPW_10596</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/index.html</p>
<h2>Participating hosts (35 -&gt; 31)</h2>
<p>Missing    (4): bat-rpls-2 bat-kbl-2 fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10596 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/bat-mtlp-6/igt@i915_hangman@error-state-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/bat-mtlp-6/igt@i915_hangman@error-state-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +41 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +45 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/fi-bsw-nick/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14187/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10596/bat-adlm-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7694 -&gt; IGTPW_10596</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14187: 0f1b42b9d395bd4097b2846230a13869dc638216 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10596: 10596<br />
  IGT_7694: 814cd9883b94be1c61d830b2c1279dc2265476bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_mmap@basic-multigpu<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-basic<br />
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind<br />
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-null<br />
-igt@xe_exec_basic@multigpu-no-exec-null-defer-bind<br />
-igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap<br />
-igt@xe_exec_basic@multigpu-no-exec-null-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-once-basic<br />
-igt@xe_exec_basic@multigpu-once-basic-defer-bind<br />
-igt@xe_exec_basic@multigpu-once-basic-defer-mmap<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-once-null<br />
-igt@xe_exec_basic@multigpu-once-null-defer-bind<br />
-igt@xe_exec_basic@multigpu-once-null-defer-mmap<br />
-igt@xe_exec_basic@multigpu-once-null-rebind<br />
-igt@xe_exec_basic@multigpu-once-rebind<br />
-igt@xe_exec_basic@multigpu-once-userptr<br />
-igt@xe_exec_basic@multigpu-once-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-once-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-once-userptr-rebind</p>

</body>
</html>

--===============5907389879167580272==--

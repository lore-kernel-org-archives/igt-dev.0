Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A118C48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 15:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E844710EBC5;
	Fri, 16 Feb 2024 15:58:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431410EBBA;
 Fri, 16 Feb 2024 15:58:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3577154551958120419=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Filr=3A_F?=
 =?utf-8?q?ix_psr_eDP_crc_read_timeout_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Feb 2024 15:58:30 -0000
Message-ID: <170809911001.37758.7151860943205289557@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240131194342.182455-1-hersenxs.wu@amd.com>
In-Reply-To: <20240131194342.182455-1-hersenxs.wu@amd.com>
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

--===============3577154551958120419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout (rev3)
URL   : https://patchwork.freedesktop.org/series/129382/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14284 -> IGTPW_10687
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/index.html

Participating hosts (36 -> 35)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10687 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][4] ([i915#4103]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9886])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][6] ([fdo#109285])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#3555])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic@smem:
    - {bat-arls-1}:       [DMESG-WARN][8] ([i915#10194]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14284/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-arls-1/igt@gem_exec_create@basic@smem.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [CRASH][10] ([i915#9947]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14284/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
  [i915#9947]: https://gitlab.freedesktop.org/drm/intel/issues/9947


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7716 -> IGTPW_10687

  CI-20190529: 20190529
  CI_DRM_14284: 2b0582c5f6c84859252ce7da41fc8829c88e17a7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10687: 10687
  IGT_7716: 7716


Testlist changes
----------------

+igt@xe_access_counter@invalid-param
+igt@xe_exec_fault_mode@many-basic-imm
+igt@xe_exec_fault_mode@many-bindexecqueue-imm
+igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm
+igt@xe_exec_fault_mode@many-execqueues-basic-imm
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm
+igt@xe_exec_fault_mode@many-execqueues-rebind-imm
+igt@xe_exec_fault_mode@many-execqueues-userptr-imm
+igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm
+igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm
+igt@xe_exec_fault_mode@many-rebind-imm
+igt@xe_exec_fault_mode@many-userptr-imm
+igt@xe_exec_fault_mode@many-userptr-invalidate-imm
+igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@many-userptr-rebind-imm
+igt@xe_exec_fault_mode@once-basic-imm
+igt@xe_exec_fault_mode@once-bindexecqueue-imm
+igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm
+igt@xe_exec_fault_mode@once-rebind-imm
+igt@xe_exec_fault_mode@once-userptr-imm
+igt@xe_exec_fault_mode@once-userptr-invalidate-imm
+igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@once-userptr-rebind-imm
+igt@xe_exec_fault_mode@twice-basic-imm
+igt@xe_exec_fault_mode@twice-bindexecqueue-imm
+igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
+igt@xe_exec_fault_mode@twice-rebind-imm
+igt@xe_exec_fault_mode@twice-userptr-imm
+igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
+igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm
+igt@xe_exec_fault_mode@twice-userptr-rebind-imm
+igt@xe_exec_queue_property@job_timeout_ms-property-min-max
+igt@xe_exec_queue_property@preempt_timeout_us-property-min-max
+igt@xe_exec_reset@cancel
+igt@xe_exec_reset@cm-execqueue-reset
+igt@xe_exec_reset@execqueue-reset
+igt@xe_exec_reset@parallel-cancel
+igt@xe_exec_reset@parallel-execqueue-reset
+igt@xe_exec_reset@virtual-cancel
+igt@xe_exec_reset@virtual-execqueue-reset
-igt@xe_exec_queue_property@invalid-property
-igt@xe_vm@bind-flag-invalid

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/index.html

--===============3577154551958120419==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129382/">https://patchwork.freedesktop.org/series/129382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14284 -&gt; IGTPW_10687</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10687 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14284/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14284/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9947">i915#9947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7716 -&gt; IGTPW_10687</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14284: 2b0582c5f6c84859252ce7da41fc8829c88e17a7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10687: 10687<br />
  IGT_7716: 7716</p>
<h2>Testlist changes</h2>
<p>+igt@xe_access_counter@invalid-param<br />
+igt@xe_exec_fault_mode@many-basic-imm<br />
+igt@xe_exec_fault_mode@many-bindexecqueue-imm<br />
+igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm<br />
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm<br />
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-basic-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-rebind-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-userptr-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@many-rebind-imm<br />
+igt@xe_exec_fault_mode@many-userptr-imm<br />
+igt@xe_exec_fault_mode@many-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@many-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@once-basic-imm<br />
+igt@xe_exec_fault_mode@once-bindexecqueue-imm<br />
+igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm<br />
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm<br />
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@once-rebind-imm<br />
+igt@xe_exec_fault_mode@once-userptr-imm<br />
+igt@xe_exec_fault_mode@once-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@once-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@twice-basic-imm<br />
+igt@xe_exec_fault_mode@twice-bindexecqueue-imm<br />
+igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm<br />
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm<br />
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm<br />
+igt@xe_exec_fault_mode@twice-rebind-imm<br />
+igt@xe_exec_fault_mode@twice-userptr-imm<br />
+igt@xe_exec_fault_mode@twice-userptr-invalidate-imm<br />
+igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm<br />
+igt@xe_exec_fault_mode@twice-userptr-rebind-imm<br />
+igt@xe_exec_queue_property@job_timeout_ms-property-min-max<br />
+igt@xe_exec_queue_property@preempt_timeout_us-property-min-max<br />
+igt@xe_exec_reset@cancel<br />
+igt@xe_exec_reset@cm-execqueue-reset<br />
+igt@xe_exec_reset@execqueue-reset<br />
+igt@xe_exec_reset@parallel-cancel<br />
+igt@xe_exec_reset@parallel-execqueue-reset<br />
+igt@xe_exec_reset@virtual-cancel<br />
+igt@xe_exec_reset@virtual-execqueue-reset<br />
-igt@xe_exec_queue_property@invalid-property<br />
-igt@xe_vm@bind-flag-invalid</p>

</body>
</html>

--===============3577154551958120419==--

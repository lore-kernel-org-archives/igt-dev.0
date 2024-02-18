Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE83BC48BC4
	for <igt-dev@archiver.kernel.org>; Sun, 18 Feb 2024 06:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F52510E08A;
	Sun, 18 Feb 2024 06:04:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A813110E089;
 Sun, 18 Feb 2024 06:04:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8176887564051962817=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_add_GC_11=2E5?=
 =?utf-8?q?=2E1_to_GC_11=2E5=2E0_family?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 18 Feb 2024 06:04:30 -0000
Message-ID: <170823627068.72442.6350219579679590832@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240218051955.2280087-1-jesse.zhang@amd.com>
In-Reply-To: <20240218051955.2280087-1-jesse.zhang@amd.com>
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

--===============8176887564051962817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family
URL   : https://patchwork.freedesktop.org/series/130044/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14287 -> IGTPW_10691
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html

Participating hosts (36 -> 35)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (2): bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10691 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] ([fdo#109271]) +35 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][6] ([i915#4103]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9886])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][8] ([fdo#109285])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#9197]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][10] ([i915#3555])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10215]: https://gitlab.freedesktop.org/drm/intel/issues/10215
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7716 -> IGTPW_10691

  CI-20190529: 20190529
  CI_DRM_14287: b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10691: 10691
  IGT_7716: 7716


Testlist changes
----------------

-igt@xe_oa@blocking
-igt@xe_oa@buffer-fill
-igt@xe_oa@closed-fd-and-unmapped-access
-igt@xe_oa@create-destroy-userspace-config
-igt@xe_oa@disabled-read-error
-igt@xe_oa@enable-disable
-igt@xe_oa@invalid-create-userspace-config
-igt@xe_oa@invalid-map-oa-buffer
-igt@xe_oa@invalid-oa-exponent
-igt@xe_oa@invalid-oa-format-id
-igt@xe_oa@invalid-oa-metric-set-id
-igt@xe_oa@invalid-remove-userspace-config
-igt@xe_oa@map-oa-buffer
-igt@xe_oa@missing-sample-flags
-igt@xe_oa@mi-rpc
-igt@xe_oa@mmio-triggered-reports
-igt@xe_oa@non-privileged-access-vaddr
-igt@xe_oa@non-privileged-map-oa-buffer
-igt@xe_oa@non-sampling-read-error
-igt@xe_oa@non-system-wide-paranoid
-igt@xe_oa@non-zero-reason
-igt@xe_oa@oa-exponents
-igt@xe_oa@oa-formats
-igt@xe_oa@oa-regs-whitelisted
-igt@xe_oa@oa-tlb-invalidate
-igt@xe_oa@oa-unit-concurrent-oa-buffer-read
-igt@xe_oa@oa-unit-exclusive-stream-exec-q
-igt@xe_oa@oa-unit-exclusive-stream-sample-oa
-igt@xe_oa@polling
-igt@xe_oa@polling-small-buf
-igt@xe_oa@privileged-forked-access-vaddr
-igt@xe_oa@rc6-disable
-igt@xe_oa@short-reads
-igt@xe_oa@stress-open-close
-igt@xe_oa@sysctl-defaults
-igt@xe_oa@unprivileged-single-ctx-counters
-igt@xe_oa@whitelisted-registers-userspace-config
-igt@xe_oa@xe-ref-count
-igt@xe_query@multigpu-query-oa-units
-igt@xe_query@query-oa-units

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html

--===============8176887564051962817==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130044/">https://patchwork.freedesktop.org/series/130044/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14287 -&gt; IGTPW_10691</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (2): bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10691 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7716 -&gt; IGTPW_10691</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14287: b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10691: 10691<br />
  IGT_7716: 7716</p>
<h2>Testlist changes</h2>
<p>-igt@xe_oa@blocking<br />
-igt@xe_oa@buffer-fill<br />
-igt@xe_oa@closed-fd-and-unmapped-access<br />
-igt@xe_oa@create-destroy-userspace-config<br />
-igt@xe_oa@disabled-read-error<br />
-igt@xe_oa@enable-disable<br />
-igt@xe_oa@invalid-create-userspace-config<br />
-igt@xe_oa@invalid-map-oa-buffer<br />
-igt@xe_oa@invalid-oa-exponent<br />
-igt@xe_oa@invalid-oa-format-id<br />
-igt@xe_oa@invalid-oa-metric-set-id<br />
-igt@xe_oa@invalid-remove-userspace-config<br />
-igt@xe_oa@map-oa-buffer<br />
-igt@xe_oa@missing-sample-flags<br />
-igt@xe_oa@mi-rpc<br />
-igt@xe_oa@mmio-triggered-reports<br />
-igt@xe_oa@non-privileged-access-vaddr<br />
-igt@xe_oa@non-privileged-map-oa-buffer<br />
-igt@xe_oa@non-sampling-read-error<br />
-igt@xe_oa@non-system-wide-paranoid<br />
-igt@xe_oa@non-zero-reason<br />
-igt@xe_oa@oa-exponents<br />
-igt@xe_oa@oa-formats<br />
-igt@xe_oa@oa-regs-whitelisted<br />
-igt@xe_oa@oa-tlb-invalidate<br />
-igt@xe_oa@oa-unit-concurrent-oa-buffer-read<br />
-igt@xe_oa@oa-unit-exclusive-stream-exec-q<br />
-igt@xe_oa@oa-unit-exclusive-stream-sample-oa<br />
-igt@xe_oa@polling<br />
-igt@xe_oa@polling-small-buf<br />
-igt@xe_oa@privileged-forked-access-vaddr<br />
-igt@xe_oa@rc6-disable<br />
-igt@xe_oa@short-reads<br />
-igt@xe_oa@stress-open-close<br />
-igt@xe_oa@sysctl-defaults<br />
-igt@xe_oa@unprivileged-single-ctx-counters<br />
-igt@xe_oa@whitelisted-registers-userspace-config<br />
-igt@xe_oa@xe-ref-count<br />
-igt@xe_query@multigpu-query-oa-units<br />
-igt@xe_query@query-oa-units</p>

</body>
</html>

--===============8176887564051962817==--

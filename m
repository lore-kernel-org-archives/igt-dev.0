Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B477C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 04:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A77010EA9C;
	Thu, 21 Mar 2024 04:21:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCBA10EA85;
 Thu, 21 Mar 2024 04:21:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5850048491431139775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=3A_Skip_amdgpu=27?=
 =?utf-8?q?s_writeback_connectors_on_panning_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Mar 2024 04:21:13 -0000
Message-ID: <171099487305.938557.9138270095381582457@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321020646.844372-1-alex.hung@amd.com>
In-Reply-To: <20240321020646.844372-1-alex.hung@amd.com>
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

--===============5850048491431139775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Skip amdgpu's writeback connectors on panning tests
URL   : https://patchwork.freedesktop.org/series/131397/
State : success

== Summary ==

CI Bug Log - changes from IGT_7773 -> IGTPW_10869
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/index.html

Participating hosts (38 -> 31)
------------------------------

  Missing    (7): bat-dg1-7 fi-apl-guc fi-snb-2520m fi-glk-j4005 fi-kbl-8809g bat-jsl-1 bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_10869 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-14:         [PASS][1] -> [FAIL][2] ([i915#10378])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-dg2-8:          [PASS][3] -> [ABORT][4] ([i915#10366])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [WARN][5] ([i915#10436]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-3:         [DMESG-WARN][7] ([i915#5591]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7773 -> IGTPW_10869

  CI-20190529: 20190529
  CI_DRM_14459: b8290992108644cb99d7d9db2921bb25369ead3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10869: 10869
  IGT_7773: 7773

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/index.html

--===============5850048491431139775==
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
<tr><td><b>Series:</b></td><td>tests/kms: Skip amdgpu&#x27;s writeback connectors on panning tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131397/">https://patchwork.freedesktop.org/series/131397/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7773 -&gt; IGTPW_10869</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/index.html</p>
<h2>Participating hosts (38 -&gt; 31)</h2>
<p>Missing    (7): bat-dg1-7 fi-apl-guc fi-snb-2520m fi-glk-j4005 fi-kbl-8809g bat-jsl-1 bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10869 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10436">i915#10436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10869/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7773 -&gt; IGTPW_10869</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14459: b8290992108644cb99d7d9db2921bb25369ead3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10869: 10869<br />
  IGT_7773: 7773</p>

</body>
</html>

--===============5850048491431139775==--

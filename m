Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E343C4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 11:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F5210E520;
	Tue, 13 Feb 2024 11:37:26 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5018910E520;
 Tue, 13 Feb 2024 11:37:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0903904374444264759=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/8=5D_tests/prime=5Fnv=5Ftest=3A_switch_over_to_intel?=
 =?utf-8?q?=5Fbuf=5Finit=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Feb 2024 11:37:26 -0000
Message-ID: <170782424632.1202360.1716467550787908090@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213100125.90085-1-matthew.auld@intel.com>
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
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

--===============0903904374444264759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/8] tests/prime_nv_test: switch over to intel_buf_init()
URL   : https://patchwork.freedesktop.org/series/129826/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14260 -> IGTPW_10665
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_10665 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [PASS][1] -> [INCOMPLETE][2] ([i915#9413])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14260/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic@smem:
    - {bat-arls-1}:       [DMESG-WARN][3] ([i915#10194]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14260/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/bat-arls-1/igt@gem_exec_create@basic@smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7710 -> IGTPW_10665

  CI-20190529: 20190529
  CI_DRM_14260: d395a4fdb0e78537f06bb401a9501b8467c774a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10665: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@perf_pmu@flr-npd
-igt@perf_pmu@flr-npd-close-after-unbind
-igt@perf_pmu@flr-npd-event-group
-igt@perf_pmu@flr-npd-separate-events
-igt@perf_pmu@forked-flr-npd
-igt@perf_pmu@forked-flr-npd-event-group
-igt@perf_pmu@forked-flr-npd-separate-events

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html

--===============0903904374444264759==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/8] tests/prime_nv_test: switch over to intel_buf_init()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129826/">https://patchwork.freedesktop.org/series/129826/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14260 -&gt; IGTPW_10665</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10665 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14260/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_create@basic@smem:<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14260/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7710 -&gt; IGTPW_10665</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14260: d395a4fdb0e78537f06bb401a9501b8467c774a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10665: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html<br />
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@perf_pmu@flr-npd<br />
-igt@perf_pmu@flr-npd-close-after-unbind<br />
-igt@perf_pmu@flr-npd-event-group<br />
-igt@perf_pmu@flr-npd-separate-events<br />
-igt@perf_pmu@forked-flr-npd<br />
-igt@perf_pmu@forked-flr-npd-event-group<br />
-igt@perf_pmu@forked-flr-npd-separate-events</p>

</body>
</html>

--===============0903904374444264759==--

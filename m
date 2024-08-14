Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB8C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 19:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A25891D9;
	Wed, 14 Aug 2024 19:22:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D57891D9;
 Wed, 14 Aug 2024 19:22:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8269962898262785241=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_lib/xe=3A_Add_XE=5FMAX=5FENGINE=5FINSTANCE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Aug 2024 19:22:07 -0000
Message-ID: <172366332728.633948.6748661255772466170@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814175013.3679997-1-lucas.demarchi@intel.com>
In-Reply-To: <20240814175013.3679997-1-lucas.demarchi@intel.com>
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

--===============8269962898262785241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/xe: Add XE_MAX_ENGINE_INSTANCE
URL   : https://patchwork.freedesktop.org/series/137317/
State : success

== Summary ==

CI Bug Log - changes from IGT_7970 -> IGTPW_11578
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-arlh-3 fi-snb-2520m fi-elk-e7500 

Known issues
------------

  Here are the changes found in IGTPW_11578 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - bat-arls-1:         [PASS][1] -> [DMESG-FAIL][2] ([i915#10262]) +7 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-1/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-1/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-mtlp-8:         [DMESG-WARN][3] ([i915#1982]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@gt_tlb:
    - bat-arls-2:         [DMESG-WARN][5] ([i915#10341]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-2/igt@i915_selftest@live@gt_tlb.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-2/igt@i915_selftest@live@gt_tlb.html

  * igt@i915_selftest@live@ring_submission:
    - bat-arls-2:         [DMESG-FAIL][7] ([i915#10262]) -> [PASS][8] +24 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-2/igt@i915_selftest@live@ring_submission.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-2/igt@i915_selftest@live@ring_submission.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [DMESG-FAIL][9] ([i915#10262]) -> [DMESG-WARN][10] ([i915#11349] / [i915#11378])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-2/igt@i915_selftest@live@hangcheck.html
    - bat-arls-1:         [DMESG-WARN][11] ([i915#11349] / [i915#11378]) -> [DMESG-WARN][12] ([i915#11378])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7970 -> IGTPW_11578

  CI-20190529: 20190529
  CI_DRM_15231: 79d8c33863d99ac1b04afcce123bdc2ad919e993 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11578: 11578
  IGT_7970: 496e86347f8607d032ed59cdad5eb018e5be6933 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/index.html

--===============8269962898262785241==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/xe: Add XE_MAX_ENGINE_INSTANCE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137317/">https://patchwork.freedesktop.org/series/137317/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7970 -&gt; IGTPW_11578</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-arlh-3 fi-snb-2520m fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11578 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-1/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_tlb:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-2/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-2/igt@i915_selftest@live@gt_tlb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-2/igt@i915_selftest@live@ring_submission.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-2/igt@i915_selftest@live@ring_submission.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11578/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7970 -&gt; IGTPW_11578</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15231: 79d8c33863d99ac1b04afcce123bdc2ad919e993 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11578: 11578<br />
  IGT_7970: 496e86347f8607d032ed59cdad5eb018e5be6933 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8269962898262785241==--

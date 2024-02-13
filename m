Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5658BC48260
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 07:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6963B10E161;
	Tue, 13 Feb 2024 07:17:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F84B10E161;
 Tue, 13 Feb 2024 07:17:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1800096111564157766=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_i915/pmu=3A_Add_pmu_tests_t?=
 =?utf-8?q?o_catch_unbind_cleanup_issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Feb 2024 07:17:35 -0000
Message-ID: <170780865525.1183349.9003381530678573378@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213062948.32735-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240213062948.32735-1-umesh.nerlige.ramappa@intel.com>
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

--===============1800096111564157766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/pmu: Add pmu tests to catch unbind cleanup issues
URL   : https://patchwork.freedesktop.org/series/129809/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14259 -> IGTPW_10664
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html

Participating hosts (37 -> 35)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (3): bat-adlm-1 bat-atsm-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10664:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@execlists:
    - {bat-arls-1}:       [DMESG-WARN][1] ([i915#10194]) -> [DMESG-FAIL][2] +7 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14259/bat-arls-1/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-arls-1/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - {bat-arls-1}:       NOTRUN -> [DMESG-FAIL][3] +6 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-arls-1/igt@i915_selftest@live@guc_multi_lrc.html

  
Known issues
------------

  Here are the changes found in IGTPW_10664 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1849])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][5] ([fdo#109271]) +35 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - {bat-arls-1}:       [DMESG-WARN][6] ([i915#10194]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14259/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7710 -> IGTPW_10664

  CI-20190529: 20190529
  CI_DRM_14259: e370df7a4fb4125cb8eee1b00ff1592808ed9786 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10664: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@perf_pmu@flr-npd
+igt@perf_pmu@flr-npd-close-after-unbind
+igt@perf_pmu@flr-npd-event-group
+igt@perf_pmu@flr-npd-separate-events
+igt@perf_pmu@forked-flr-npd
+igt@perf_pmu@forked-flr-npd-event-group
+igt@perf_pmu@forked-flr-npd-separate-events

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html

--===============1800096111564157766==
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
<tr><td><b>Series:</b></td><td>i915/pmu: Add pmu tests to catch unbind cleanup issues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129809/">https://patchwork.freedesktop.org/series/129809/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14259 -&gt; IGTPW_10664</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (3): bat-adlm-1 bat-atsm-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10664:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14259/bat-arls-1/igt@i915_selftest@live@execlists.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-arls-1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>{bat-arls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-arls-1/igt@i915_selftest@live@guc_multi_lrc.html">DMESG-FAIL</a> +6 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10664 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@ccs0:<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14259/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7710 -&gt; IGTPW_10664</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14259: e370df7a4fb4125cb8eee1b00ff1592808ed9786 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10664: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10664/index.html<br />
  IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@perf_pmu@flr-npd<br />
+igt@perf_pmu@flr-npd-close-after-unbind<br />
+igt@perf_pmu@flr-npd-event-group<br />
+igt@perf_pmu@flr-npd-separate-events<br />
+igt@perf_pmu@forked-flr-npd<br />
+igt@perf_pmu@forked-flr-npd-event-group<br />
+igt@perf_pmu@forked-flr-npd-separate-events</p>

</body>
</html>

--===============1800096111564157766==--

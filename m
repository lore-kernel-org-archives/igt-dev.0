Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2ACF07C6
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 08:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2DC10E2BF;
	Thu, 10 Oct 2024 08:45:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0766E10E2BF;
 Thu, 10 Oct 2024 08:45:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1203075936228057850=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=3A_Add_tests_to_valid?=
 =?utf-8?q?ate_GT_coarse_power_gating_status_and_toggle_coarse_power_gating_?=
 =?utf-8?q?states_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Oct 2024 08:45:30 -0000
Message-ID: <172854993002.1214362.3909823765710316638@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010080048.1989232-1-sk.anirban@intel.com>
In-Reply-To: <20241010080048.1989232-1-sk.anirban@intel.com>
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

--===============1203075936228057850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev3)
URL   : https://patchwork.freedesktop.org/series/139808/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8063_BAT -> XEIGTPW_11896_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11896_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pm_residency@cpg-basic} (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-lnl-2/igt@xe_pm_residency@cpg-basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-atsm-2/igt@xe_pm_residency@cpg-basic.html
    - bat-lnl-1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-lnl-1/igt@xe_pm_residency@cpg-basic.html

  * {igt@xe_pm_residency@toggle-gt-cpg} (NEW):
    - bat-adlp-vf:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-vf/igt@xe_pm_residency@toggle-gt-cpg.html
    - bat-pvc-2:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-pvc-2/igt@xe_pm_residency@toggle-gt-cpg.html

  
New tests
---------

  New tests have been introduced between XEIGT_8063_BAT and XEIGTPW_11896_BAT:

### New IGT tests (2) ###

  * igt@xe_pm_residency@cpg-basic:
    - Statuses : 4 pass(s) 5 skip(s)
    - Exec time: [0.0, 6.40] s

  * igt@xe_pm_residency@toggle-gt-cpg:
    - Statuses : 7 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.15] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11896_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#288]) +32 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#2229])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [INCOMPLETE][9] ([Intel XE#2874]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8063/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8063 -> IGTPW_11896
  * Linux: xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852 -> xe-2043-96555ff51bb9d38e366c6069f21577abb8213df0

  IGTPW_11896: 11896
  IGT_8063: 8063
  xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: e1aba2bf4f79f2f8ae7ce538124d445fc91df852
  xe-2043-96555ff51bb9d38e366c6069f21577abb8213df0: 96555ff51bb9d38e366c6069f21577abb8213df0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/index.html

--===============1203075936228057850==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139808/">https://patchwork.freedesktop.org/series/139808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8063_BAT -&gt; XEIGTPW_11896_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11896_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_pm_residency@cpg-basic} (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-lnl-2/igt@xe_pm_residency@cpg-basic.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-atsm-2/igt@xe_pm_residency@cpg-basic.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-lnl-1/igt@xe_pm_residency@cpg-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm_residency@toggle-gt-cpg} (NEW):</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-vf/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-pvc-2/igt@xe_pm_residency@toggle-gt-cpg.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8063_BAT and XEIGTPW_11896_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>Statuses : 4 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 6.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-cpg:</p>
<ul>
<li>Statuses : 7 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11896_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8063/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11896/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8063 -&gt; IGTPW_11896</li>
<li>Linux: xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852 -&gt; xe-2043-96555ff51bb9d38e366c6069f21577abb8213df0</li>
</ul>
<p>IGTPW_11896: 11896<br />
  IGT_8063: 8063<br />
  xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: e1aba2bf4f79f2f8ae7ce538124d445fc91df852<br />
  xe-2043-96555ff51bb9d38e366c6069f21577abb8213df0: 96555ff51bb9d38e366c6069f21577abb8213df0</p>

</body>
</html>

--===============1203075936228057850==--

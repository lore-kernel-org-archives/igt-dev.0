Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E32510AB82D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 23:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425710E20C;
	Thu, 26 Mar 2026 23:58:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3A010E20C;
 Thu, 26 Mar 2026 23:58:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8570406425131301933=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_fault-injection_tests_?=
 =?utf-8?q?for_Freq_Throttle_Reasons?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 23:58:28 -0000
Message-ID: <177456950829.404030.1790672246030441012@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326052917.2511216-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260326052917.2511216-1-ravi.kishore.koppuravuri@intel.com>
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

--===============8570406425131301933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add fault-injection tests for Freq Throttle Reasons
URL   : https://patchwork.freedesktop.org/series/163889/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8833_FULL -> XEIGTPW_14860_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14860_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14860_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14860_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@throttle-reason-fail-psys_pl1 (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][1] +14 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-5/igt@xe_fault_injection@throttle-reason-fail-psys_pl1.html

  
New tests
---------

  New tests have been introduced between XEIGT_8833_FULL and XEIGTPW_14860_FULL:

### New IGT tests (15) ###

  * igt@xe_fault_injection@throttle-reason-fail-fastvmode:
    - Statuses : 1 fail(s)
    - Exec time: [0.30] s

  * igt@xe_fault_injection@throttle-reason-fail-iccmax:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-max_vid:
    - Statuses : 1 fail(s)
    - Exec time: [0.34] s

  * igt@xe_fault_injection@throttle-reason-fail-mem_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-p0_freq:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-pkg_pl1:
    - Statuses : 1 fail(s)
    - Exec time: [0.32] s

  * igt@xe_fault_injection@throttle-reason-fail-pkg_pl2:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-pl4_limit:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-psys_crit:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-psys_pl1:
    - Statuses : 1 fail(s)
    - Exec time: [0.27] s

  * igt@xe_fault_injection@throttle-reason-fail-psys_pl2:
    - Statuses : 1 fail(s)
    - Exec time: [0.29] s

  * igt@xe_fault_injection@throttle-reason-fail-ratl:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@xe_fault_injection@throttle-reason-fail-soc_avg_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-soc_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-vr_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14860_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#301]) +3 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][4] -> [SKIP][5] ([Intel XE#4692] / [Intel XE#7508])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#4459]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508


Build changes
-------------

  * IGT: IGT_8833 -> IGTPW_14860
  * Linux: xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d -> xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875

  IGTPW_14860: abffe96110150468ab70eaf0dd2a94a39e2a7a4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8833: 8833
  xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d: ddf93a5c967d452d7c3ab937818c20b95498842d
  xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875: bff01d5de5118e98342ba4531ae5ac39eb9d9875

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/index.html

--===============8570406425131301933==
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
<tr><td><b>Series:</b></td><td>Add fault-injection tests for Freq Throttle Reasons</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163889/">https://patchwork.freedesktop.org/series/163889/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8833_FULL -&gt; XEIGTPW_14860_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14860_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14860_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14860_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@throttle-reason-fail-psys_pl1 (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-5/igt@xe_fault_injection@throttle-reason-fail-psys_pl1.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8833_FULL and XEIGTPW_14860_FULL:</p>
<h3>New IGT tests (15)</h3>
<ul>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-fastvmode:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-iccmax:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-max_vid:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-mem_thermal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-p0_freq:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-pkg_pl1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-pkg_pl2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-pl4_limit:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-psys_crit:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-psys_pl1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-psys_pl2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-ratl:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-soc_avg_thermal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-soc_thermal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-vr_thermal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14860_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508">Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8833 -&gt; IGTPW_14860</li>
<li>Linux: xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d -&gt; xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875</li>
</ul>
<p>IGTPW_14860: abffe96110150468ab70eaf0dd2a94a39e2a7a4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8833: 8833<br />
  xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d: ddf93a5c967d452d7c3ab937818c20b95498842d<br />
  xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875: bff01d5de5118e98342ba4531ae5ac39eb9d9875</p>

</body>
</html>

--===============8570406425131301933==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABD810A88D4
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 17:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B10510E261;
	Thu, 26 Mar 2026 17:12:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14210E053;
 Thu, 26 Mar 2026 17:12:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8413505872547787107=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_1/1=5D_tests/intel/xe=5Ffa?=
 =?utf-8?q?ult=5Finjection=3A_Add_fault-injection_tests_for_Freq_Throttle_Re?=
 =?utf-8?q?asons?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 17:12:49 -0000
Message-ID: <177454516902.402672.18385732704723642328@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326050628.2510944-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260326050628.2510944-1-ravi.kishore.koppuravuri@intel.com>
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

--===============8413505872547787107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: 1/1] tests/intel/xe_fault_injection: Add fault-injection tests for Freq Throttle Reasons
URL   : https://patchwork.freedesktop.org/series/163888/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8831_FULL -> XEIGTPW_14859_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14859_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14859_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14859_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@throttle-reason-fail-psys_pl1 (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][1] +12 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-3/igt@xe_fault_injection@throttle-reason-fail-psys_pl1.html

  
New tests
---------

  New tests have been introduced between XEIGT_8831_FULL and XEIGTPW_14859_FULL:

### New IGT tests (15) ###

  * igt@xe_fault_injection@throttle-reason-fail-fastvmode:
    - Statuses : 1 fail(s)
    - Exec time: [0.33] s

  * igt@xe_fault_injection@throttle-reason-fail-iccmax:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_fault_injection@throttle-reason-fail-max_vid:
    - Statuses : 1 fail(s)
    - Exec time: [0.32] s

  * igt@xe_fault_injection@throttle-reason-fail-mem_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@xe_fault_injection@throttle-reason-fail-p0_freq:
    - Statuses : 1 fail(s)
    - Exec time: [0.36] s

  * igt@xe_fault_injection@throttle-reason-fail-pkg_pl1:
    - Statuses : 1 fail(s)
    - Exec time: [0.27] s

  * igt@xe_fault_injection@throttle-reason-fail-pkg_pl2:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@xe_fault_injection@throttle-reason-fail-pl4_limit:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-psys_crit:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-psys_pl1:
    - Statuses : 1 fail(s)
    - Exec time: [0.34] s

  * igt@xe_fault_injection@throttle-reason-fail-psys_pl2:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-ratl:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-soc_avg_thermal:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_fault_injection@throttle-reason-fail-soc_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@throttle-reason-fail-vr_thermal:
    - Statuses : 1 fail(s)
    - Exec time: [0.29] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14859_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-lnl:          [PASS][2] -> [ABORT][3] ([Intel XE#4760])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#7340])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][6] -> [SKIP][7] ([Intel XE#4692] / [Intel XE#7508])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#5625])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][10] ([Intel XE#301]) -> [PASS][11] +2 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][12] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508


Build changes
-------------

  * IGT: IGT_8831 -> IGTPW_14859
  * Linux: xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc -> xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78

  IGTPW_14859: 14859
  IGT_8831: 8831
  xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc: 3239a1a0a30dea3fe135700010ee4e41841877bc
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/index.html

--===============8413505872547787107==
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
<tr><td><b>Series:</b></td><td>1/1] tests/intel/xe_fault_injection: Add fault-injection tests for Freq Throttle Reasons</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163888/">https://patchwork.freedesktop.org/series/163888/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8831_FULL -&gt; XEIGTPW_14859_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14859_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14859_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14859_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@throttle-reason-fail-psys_pl1 (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-3/igt@xe_fault_injection@throttle-reason-fail-psys_pl1.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8831_FULL and XEIGTPW_14859_FULL:</p>
<h3>New IGT tests (15)</h3>
<ul>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-fastvmode:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-iccmax:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-max_vid:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-mem_thermal:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-p0_freq:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-pkg_pl1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-pkg_pl2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
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
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-psys_pl2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-ratl:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@throttle-reason-fail-soc_avg_thermal:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Exec time: [0.29] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14859_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508">Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14859/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8831 -&gt; IGTPW_14859</li>
<li>Linux: xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc -&gt; xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78</li>
</ul>
<p>IGTPW_14859: 14859<br />
  IGT_8831: 8831<br />
  xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc: 3239a1a0a30dea3fe135700010ee4e41841877bc<br />
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78</p>

</body>
</html>

--===============8413505872547787107==--

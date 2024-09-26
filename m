Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB525CDE00D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A6110EB71;
	Thu, 26 Sep 2024 14:55:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2935A10EB9C;
 Thu, 26 Sep 2024 14:55:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7180061838338286176=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fasync=5Fflips=3A_A?=
 =?utf-8?q?sync_flips_suspend_resume_test_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 14:55:20 -0000
Message-ID: <172736252016.1107837.8278793508908003917@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
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

--===============7180061838338286176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Async flips suspend resume test (rev5)
URL   : https://patchwork.freedesktop.org/series/138302/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8032_BAT -> XEIGTPW_11812_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11812_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11812_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11812_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume (NEW):
    - {bat-bmg-2}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-bmg-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1 (NEW):
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - bat-bmg-1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-bmg-1/igt@kms_async_flips@invalid-async-flip.html
    - bat-lnl-1:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-lnl-1/igt@kms_async_flips@invalid-async-flip.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-dg2-oem2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-time-stamp:
    - bat-lnl-2:          NOTRUN -> [SKIP][6] +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-lnl-2/igt@kms_async_flips@test-time-stamp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@test-cursor:
    - {bat-bmg-2}:        NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-bmg-2/igt@kms_async_flips@test-cursor.html

  
New tests
---------

  New tests have been introduced between XEIGT_8032_BAT and XEIGTPW_11812_BAT:

### New IGT tests (13) ###

  * igt@kms_async_flips@async-flip-suspend-resume:
    - Statuses : 1 dmesg-warn(s) 3 pass(s) 5 skip(s)
    - Exec time: [0.0, 18.68] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.53] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [3.54, 5.14] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.46] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.52] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [3.50, 5.20] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.32] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.43] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [3.44, 5.12] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.60] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [3.56] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11812_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][8] ([Intel XE#324]) +7 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@alternate-sync-async-flip.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2463]) +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-vf/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume (NEW):
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][10] ([Intel XE#1033]) +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - bat-pvc-2:          NOTRUN -> [SKIP][11] ([Intel XE#1024]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-pvc-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#1033])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#801]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-dg2-oem2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x:
    - bat-adlp-7:         NOTRUN -> [FAIL][14] ([Intel XE#911]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][15] ([Intel XE#1033] / [Intel XE#324])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][16] ([Intel XE#1033] / [Intel XE#324])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y.html

  * igt@kms_async_flips@crc:
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#1024]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-atsm-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][18] ([Intel XE#324]) +2 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_async_flips@test-cursor:
    - bat-lnl-1:          NOTRUN -> [SKIP][19] ([Intel XE#664])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-lnl-1/igt@kms_async_flips@test-cursor.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11812
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1979-0aa16240f88c313ecd35be3cb750288c4e44cf18

  IGTPW_11812: 11812
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1979-0aa16240f88c313ecd35be3cb750288c4e44cf18: 0aa16240f88c313ecd35be3cb750288c4e44cf18

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/index.html

--===============7180061838338286176==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Async flips suspend resume test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138302/">https://patchwork.freedesktop.org/series/138302/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_BAT -&gt; XEIGTPW_11812_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11812_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11812_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11812_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume (NEW):</p>
<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-bmg-2/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1 (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-lnl-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-dg2-oem2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-lnl-2/igt@kms_async_flips@test-time-stamp.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_async_flips@test-cursor:<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-bmg-2/igt@kms_async_flips@test-cursor.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8032_BAT and XEIGTPW_11812_BAT:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 18.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [3.54, 5.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [3.50, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [3.44, 5.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11812_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +7 other tests dmesg-warn</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-vf/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-pvc-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +6 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-dg2-oem2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-atsm-2/igt@kms_async_flips@crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-adlp-7/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11812/bat-lnl-1/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11812</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1979-0aa16240f88c313ecd35be3cb750288c4e44cf18</li>
</ul>
<p>IGTPW_11812: 11812<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1979-0aa16240f88c313ecd35be3cb750288c4e44cf18: 0aa16240f88c313ecd35be3cb750288c4e44cf18</p>

</body>
</html>

--===============7180061838338286176==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BA6CF58F9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 09:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A4E10E055;
	Fri, 20 Sep 2024 09:32:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4863C10E055;
 Fri, 20 Sep 2024 09:32:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7527849804149758952=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_git_format-patch_-o_my-series_?=
 =?utf-8?q?HEAD=2E=2E=2Eorigin/master_-v6_--cover-letter?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 09:32:04 -0000
Message-ID: <172682472428.1049997.8929170712205939763@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920075618.633792-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240920075618.633792-1-santhosh.reddy.guddati@intel.com>
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

--===============7527849804149758952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: git format-patch -o my-series HEAD...origin/master -v6 --cover-letter
URL   : https://patchwork.freedesktop.org/series/138906/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8029_BAT -> XEIGTPW_11772_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11772_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11772_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11772_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flip@alternate-sync-async-flip (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-adlp-7/igt@kms_async_flip@alternate-sync-async-flip.html
    - bat-bmg-1:          NOTRUN -> [SKIP][2] +6 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-bmg-1/igt@kms_async_flip@alternate-sync-async-flip.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-adlp-vf/igt@kms_async_flip@alternate-sync-async-flip.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4] +6 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-lnl-2/igt@kms_async_flip@alternate-sync-async-flip.html

  * {igt@kms_async_flip@async-flip-suspend-resume} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][5] +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-atsm-2/igt@kms_async_flip@async-flip-suspend-resume.html

  * igt@kms_async_flip@invalid-async-flip (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][6] +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-pvc-2/igt@kms_async_flip@invalid-async-flip.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-dg2-oem2/igt@kms_async_flip@invalid-async-flip.html
    - bat-lnl-1:          NOTRUN -> [SKIP][8] +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-lnl-1/igt@kms_async_flip@invalid-async-flip.html

  * igt@kms_async_flip@test-time-stamp (NEW):
    - {bat-bmg-2}:        NOTRUN -> [SKIP][9] +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-bmg-2/igt@kms_async_flip@test-time-stamp.html

  
New tests
---------

  New tests have been introduced between XEIGT_8029_BAT and XEIGTPW_11772_BAT:

### New IGT tests (7) ###

  * igt@kms_async_flip@alternate-sync-async-flip:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@async-flip-suspend-resume:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@async-flip-with-page-flip-events:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@crc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@invalid-async-flip:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@test-cursor:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@test-time-stamp:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_8029 -> IGTPW_11772
  * Linux: xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a -> xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990

  IGTPW_11772: 2170372bd990c9b3e86a0b6d119e79b4bd0e3549 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8029: d22cd438e6356bd7c2ee55436553cdcadd55193a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a: d4340c1de6d417c7b3edac187c3af011b146701a
  xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/index.html

--===============7527849804149758952==
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
<tr><td><b>Series:</b></td><td>git format-patch -o my-series HEAD...origin/master -v6 --cover-letter</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138906/">https://patchwork.freedesktop.org/series/138906/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8029_BAT -&gt; XEIGTPW_11772_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11772_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11772_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11772_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flip@alternate-sync-async-flip (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-adlp-7/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-bmg-1/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-adlp-vf/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-lnl-2/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flip@async-flip-suspend-resume} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-atsm-2/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@invalid-async-flip (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-pvc-2/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-dg2-oem2/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-lnl-1/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-time-stamp (NEW):</p>
<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11772/bat-bmg-2/igt@kms_async_flip@test-time-stamp.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8029_BAT and XEIGTPW_11772_BAT:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_async_flip@alternate-sync-async-flip:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@async-flip-suspend-resume:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@async-flip-with-page-flip-events:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@crc:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@invalid-async-flip:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-cursor:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-time-stamp:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8029 -&gt; IGTPW_11772</li>
<li>Linux: xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a -&gt; xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990</li>
</ul>
<p>IGTPW_11772: 2170372bd990c9b3e86a0b6d119e79b4bd0e3549 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8029: d22cd438e6356bd7c2ee55436553cdcadd55193a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a: d4340c1de6d417c7b3edac187c3af011b146701a<br />
  xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990</p>

</body>
</html>

--===============7527849804149758952==--

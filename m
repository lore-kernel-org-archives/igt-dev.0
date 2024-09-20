Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C265ACF58FC
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 09:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727110E7FA;
	Fri, 20 Sep 2024 09:38:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8710E80B;
 Fri, 20 Sep 2024 09:38:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0961621190844372667=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Async_flips_suspend_resume_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 09:38:23 -0000
Message-ID: <172682510362.1050030.13226674652383461270@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920080035.633836-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240920080035.633836-1-santhosh.reddy.guddati@intel.com>
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

--===============0961621190844372667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Async flips suspend resume test (rev3)
URL   : https://patchwork.freedesktop.org/series/138302/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15441 -> IGTPW_11773
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11773 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11773, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-dg2-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11773:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flip@alternate-sync-async-flip (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][1] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlp-9/igt@kms_async_flip@alternate-sync-async-flip.html
    - bat-twl-2:          NOTRUN -> [SKIP][2] +6 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-twl-2/igt@kms_async_flip@alternate-sync-async-flip.html
    - bat-rpls-4:         NOTRUN -> [SKIP][3] +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-rpls-4/igt@kms_async_flip@alternate-sync-async-flip.html
    - bat-twl-1:          NOTRUN -> [SKIP][4] +6 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-twl-1/igt@kms_async_flip@alternate-sync-async-flip.html

  * {igt@kms_async_flip@async-flip-suspend-resume} (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][5] +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-jsl-1/igt@kms_async_flip@async-flip-suspend-resume.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-tgl-1115g4/igt@kms_async_flip@async-flip-suspend-resume.html
    - bat-arls-1:         NOTRUN -> [SKIP][7] +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arls-1/igt@kms_async_flip@async-flip-suspend-resume.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][8] +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-mtlp-6/igt@kms_async_flip@async-flip-suspend-resume.html
    - bat-arls-2:         NOTRUN -> [SKIP][9] +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arls-2/igt@kms_async_flip@async-flip-suspend-resume.html

  * igt@kms_async_flip@crc (NEW):
    - bat-dg2-9:          NOTRUN -> [SKIP][10] +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg2-9/igt@kms_async_flip@crc.html
    - bat-adlp-11:        NOTRUN -> [SKIP][11] +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlp-11/igt@kms_async_flip@crc.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][12] +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-mtlp-8/igt@kms_async_flip@crc.html

  * igt@kms_async_flip@invalid-async-flip (NEW):
    - {bat-arlh-3}:       NOTRUN -> [SKIP][13] +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arlh-3/igt@kms_async_flip@invalid-async-flip.html
    - bat-dg1-7:          NOTRUN -> [SKIP][14] +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg1-7/igt@kms_async_flip@invalid-async-flip.html

  * igt@kms_async_flip@test-cursor (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][15] +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg2-14/igt@kms_async_flip@test-cursor.html
    - bat-arls-5:         NOTRUN -> [SKIP][16] +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arls-5/igt@kms_async_flip@test-cursor.html
    - bat-adlm-1:         NOTRUN -> [SKIP][17] +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlm-1/igt@kms_async_flip@test-cursor.html
    - bat-rplp-1:         NOTRUN -> [SKIP][18] +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-rplp-1/igt@kms_async_flip@test-cursor.html
    - bat-arlh-2:         NOTRUN -> [SKIP][19] +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arlh-2/igt@kms_async_flip@test-cursor.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][20] +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-rkl-11600/igt@kms_async_flip@test-cursor.html
    - bat-dg2-8:          NOTRUN -> [SKIP][21] +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg2-8/igt@kms_async_flip@test-cursor.html

  * igt@kms_async_flip@test-time-stamp (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][22] +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlp-6/igt@kms_async_flip@test-time-stamp.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15441 and IGTPW_11773:

### New IGT tests (7) ###

  * igt@kms_async_flip@alternate-sync-async-flip:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@async-flip-suspend-resume:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@async-flip-with-page-flip-events:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@crc:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@invalid-async-flip:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@test-cursor:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flip@test-time-stamp:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11773 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flip@alternate-sync-async-flip (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][23] +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-kbl-7567u/igt@kms_async_flip@alternate-sync-async-flip.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][24] +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-cfl-8700k/igt@kms_async_flip@alternate-sync-async-flip.html

  * {igt@kms_async_flip@async-flip-suspend-resume} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][25] +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-cfl-guc/igt@kms_async_flip@async-flip-suspend-resume.html

  * igt@kms_async_flip@async-flip-with-page-flip-events (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][26] +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-glk-j4005/igt@kms_async_flip@async-flip-with-page-flip-events.html

  * igt@kms_async_flip@crc (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][27] +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-kbl-x1275/igt@kms_async_flip@crc.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][28] +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-cfl-8109u/igt@kms_async_flip@crc.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][29] +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-kbl-guc/igt@kms_async_flip@crc.html

  * igt@kms_async_flip@invalid-async-flip (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][30] +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-pnv-d510/igt@kms_async_flip@invalid-async-flip.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][31] +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-ivb-3770/igt@kms_async_flip@invalid-async-flip.html

  * igt@kms_async_flip@test-cursor (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][32] +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-apl-1/igt@kms_async_flip@test-cursor.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][33] +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-elk-e7500/igt@kms_async_flip@test-cursor.html
    - bat-kbl-2:          NOTRUN -> [SKIP][34] +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-kbl-2/igt@kms_async_flip@test-cursor.html

  * igt@kms_async_flip@test-time-stamp (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][35] +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-blb-e6850/igt@kms_async_flip@test-time-stamp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8029 -> IGTPW_11773

  CI-20190529: 20190529
  CI_DRM_15441: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11773: 3ec020c4448e1f4a7d51bcc71e360bc1b4d783b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8029: d22cd438e6356bd7c2ee55436553cdcadd55193a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/index.html

--===============0961621190844372667==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Async flips suspend resume test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138302/">https://patchwork.freedesktop.org/series/138302/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15441 -&gt; IGTPW_11773</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11773 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11773, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-dg2-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11773:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flip@alternate-sync-async-flip (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlp-9/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-twl-2/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-rpls-4/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-twl-1/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flip@async-flip-suspend-resume} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-jsl-1/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-tgl-1115g4/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arls-1/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-mtlp-6/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arls-2/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@crc (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg2-9/igt@kms_async_flip@crc.html">SKIP</a> +6 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlp-11/igt@kms_async_flip@crc.html">SKIP</a> +6 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-mtlp-8/igt@kms_async_flip@crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@invalid-async-flip (NEW):</p>
<ul>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arlh-3/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg1-7/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-cursor (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg2-14/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arls-5/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlm-1/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-rplp-1/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-arlh-2/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-rkl-11600/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-dg2-8/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-time-stamp (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-adlp-6/igt@kms_async_flip@test-time-stamp.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15441 and IGTPW_11773:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_async_flip@alternate-sync-async-flip:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@async-flip-suspend-resume:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@async-flip-with-page-flip-events:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@crc:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@invalid-async-flip:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-cursor:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-time-stamp:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11773 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flip@alternate-sync-async-flip (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-kbl-7567u/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-cfl-8700k/igt@kms_async_flip@alternate-sync-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flip@async-flip-suspend-resume} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-cfl-guc/igt@kms_async_flip@async-flip-suspend-resume.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@async-flip-with-page-flip-events (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-glk-j4005/igt@kms_async_flip@async-flip-with-page-flip-events.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@crc (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-kbl-x1275/igt@kms_async_flip@crc.html">SKIP</a> +6 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-cfl-8109u/igt@kms_async_flip@crc.html">SKIP</a> +6 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-kbl-guc/igt@kms_async_flip@crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@invalid-async-flip (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-pnv-d510/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-ivb-3770/igt@kms_async_flip@invalid-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-cursor (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-apl-1/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-elk-e7500/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/bat-kbl-2/igt@kms_async_flip@test-cursor.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flip@test-time-stamp (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11773/fi-blb-e6850/igt@kms_async_flip@test-time-stamp.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8029 -&gt; IGTPW_11773</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15441: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11773: 3ec020c4448e1f4a7d51bcc71e360bc1b4d783b5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8029: d22cd438e6356bd7c2ee55436553cdcadd55193a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0961621190844372667==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B05CC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 22:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D5A10E305;
	Tue, 30 Jul 2024 22:21:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A486A10E344;
 Tue, 30 Jul 2024 22:21:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8124353563424119791=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_add_test_to_validate_fallba?=
 =?utf-8?q?ck_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 22:21:11 -0000
Message-ID: <172237807166.465689.11664839496701980120@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
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

--===============8124353563424119791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev2)
URL   : https://patchwork.freedesktop.org/series/134660/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15157 -> IGTPW_11500
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-11 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11500:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a} (NEW):
    - bat-adls-6:         NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adls-6/igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a.html
    - bat-dg2-8:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-8/igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a.html

  * {igt@kms_dp_fallback@dp-fallback@dp-1-pipe-c} (NEW):
    - bat-adlp-9:         NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-9/igt@kms_dp_fallback@dp-fallback@dp-1-pipe-c.html

  * {igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c} (NEW):
    - bat-adlp-6:         NOTRUN -> [FAIL][4] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-6/igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c.html
    - bat-arls-5:         NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-5/igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c.html

  * {igt@kms_dp_fallback@mst-fallback} (NEW):
    - bat-jsl-1:          NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-jsl-1/igt@kms_dp_fallback@mst-fallback.html
    - bat-adlp-6:         NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-6/igt@kms_dp_fallback@mst-fallback.html
    - bat-arlh-2:         NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arlh-2/igt@kms_dp_fallback@mst-fallback.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/fi-rkl-11600/igt@kms_dp_fallback@mst-fallback.html
    - {bat-arlh-3}:       NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arlh-3/igt@kms_dp_fallback@mst-fallback.html
    - bat-dg1-7:          NOTRUN -> [SKIP][11] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg1-7/igt@kms_dp_fallback@mst-fallback.html
    - bat-twl-2:          NOTRUN -> [SKIP][12] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-twl-2/igt@kms_dp_fallback@mst-fallback.html
    - bat-rpls-4:         NOTRUN -> [SKIP][13] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-rpls-4/igt@kms_dp_fallback@mst-fallback.html
    - bat-twl-1:          NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-twl-1/igt@kms_dp_fallback@mst-fallback.html
    - bat-dg2-14:         NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-14/igt@kms_dp_fallback@mst-fallback.html
    - bat-adlm-1:         NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlm-1/igt@kms_dp_fallback@mst-fallback.html
    - bat-rplp-1:         NOTRUN -> [SKIP][17] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-rplp-1/igt@kms_dp_fallback@mst-fallback.html
    - bat-arls-1:         NOTRUN -> [SKIP][18] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-1/igt@kms_dp_fallback@mst-fallback.html

  * {igt@kms_dp_fallback@uhbr-fallback} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-mtlp-6/igt@kms_dp_fallback@uhbr-fallback.html
    - bat-dg2-9:          NOTRUN -> [SKIP][20] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-9/igt@kms_dp_fallback@uhbr-fallback.html
    - bat-adlp-11:        NOTRUN -> [SKIP][21] +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-11/igt@kms_dp_fallback@uhbr-fallback.html
    - bat-arls-2:         NOTRUN -> [SKIP][22] +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-2/igt@kms_dp_fallback@uhbr-fallback.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][23] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-mtlp-8/igt@kms_dp_fallback@uhbr-fallback.html

  * {igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][24] +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-9/igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a.html
    - bat-dg2-8:          NOTRUN -> [SKIP][25] +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-8/igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a.html

  * {igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-b} (NEW):
    - bat-adls-6:         NOTRUN -> [SKIP][26] +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adls-6/igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-b.html

  * {igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-b} (NEW):
    - bat-arls-5:         NOTRUN -> [SKIP][27] +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-5/igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-b.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - {bat-arlh-3}:       [PASS][28] -> [INCOMPLETE][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arlh-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arlh-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15157 and IGTPW_11500:

### New IGT tests (19) ###

  * igt@kms_dp_fallback@dp-fallback:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a:
    - Statuses : 2 fail(s) 1 incomplete(s)
    - Exec time: [0.0, 1.12] s

  * igt@kms_dp_fallback@dp-fallback@dp-1-pipe-b:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.01, 25.02] s

  * igt@kms_dp_fallback@dp-fallback@dp-1-pipe-c:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.83, 24.22] s

  * igt@kms_dp_fallback@dp-fallback@dp-1-pipe-d:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.02, 26.36] s

  * igt@kms_dp_fallback@dp-fallback@dp-3-pipe-a:
    - Statuses : 2 fail(s)
    - Exec time: [1.39, 1.97] s

  * igt@kms_dp_fallback@dp-fallback@dp-3-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [26.54, 27.40] s

  * igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c:
    - Statuses : 2 fail(s)
    - Exec time: [1.06, 2.08] s

  * igt@kms_dp_fallback@dp-fallback@dp-3-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [26.60, 27.97] s

  * igt@kms_dp_fallback@mst-fallback:
    - Statuses : 24 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback:
    - Statuses : 19 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-b:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-c:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-d:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-d:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_11500 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [PASS][30] -> [DMESG-WARN][31] ([i915#11349] / [i915#11378])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * {igt@kms_dp_fallback@mst-fallback} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][32] +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/fi-cfl-8700k/igt@kms_dp_fallback@mst-fallback.html
    - bat-kbl-2:          NOTRUN -> [SKIP][33] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-kbl-2/igt@kms_dp_fallback@mst-fallback.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [DMESG-WARN][34] ([i915#11349] / [i915#11378]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7942 -> IGTPW_11500

  CI-20190529: 20190529
  CI_DRM_15157: 4b1ff33f467ab28809de294cdda1ee9f6e16298d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11500: 11500
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/index.html

--===============8124353563424119791==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15157 -&gt; IGTPW_11500</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-11 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11500:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adls-6/igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-8/igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@dp-fallback@dp-1-pipe-c} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-9/igt@kms_dp_fallback@dp-fallback@dp-1-pipe-c.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-6/igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c.html">FAIL</a> +1 other test fail</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-5/igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@mst-fallback} (NEW):</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-jsl-1/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-6/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +4 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arlh-2/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/fi-rkl-11600/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>{bat-arlh-3}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arlh-3/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg1-7/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-twl-2/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-rpls-4/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-twl-1/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-14/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlm-1/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-rplp-1/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-1/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@uhbr-fallback} (NEW):</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-mtlp-6/igt@kms_dp_fallback@uhbr-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-9/igt@kms_dp_fallback@uhbr-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-11/igt@kms_dp_fallback@uhbr-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-2/igt@kms_dp_fallback@uhbr-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-mtlp-8/igt@kms_dp_fallback@uhbr-fallback.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adlp-9/igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a.html">SKIP</a> +4 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-dg2-8/igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-b} (NEW):</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-adls-6/igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-b.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-b} (NEW):</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-5/igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-b.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arlh-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arlh-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15157 and IGTPW_11500:</p>
<h3>New IGT tests (19)</h3>
<ul>
<li>
<p>igt@kms_dp_fallback@dp-fallback:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 fail(s) 1 incomplete(s)</li>
<li>Exec time: [0.0, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.01, 25.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.83, 24.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.02, 26.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-3-pipe-a:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.39, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-3-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [26.54, 27.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-3-pipe-c:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.06, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@dp-fallback@dp-3-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [26.60, 27.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@mst-fallback:</p>
<ul>
<li>Statuses : 24 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback:</p>
<ul>
<li>Statuses : 19 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-1-pipe-d:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_fallback@uhbr-fallback@dp-3-pipe-d:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11500 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_fallback@mst-fallback} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/fi-cfl-8700k/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-kbl-2/igt@kms_dp_fallback@mst-fallback.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378">i915#11378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11500/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7942 -&gt; IGTPW_11500</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15157: 4b1ff33f467ab28809de294cdda1ee9f6e16298d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11500: 11500<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8124353563424119791==--

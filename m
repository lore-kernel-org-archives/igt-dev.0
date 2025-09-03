Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E381CA1005
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 02:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB1810E0A9;
	Wed,  3 Sep 2025 02:26:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2FD10E0A9;
 Wed,  3 Sep 2025 02:26:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3488751901987953679=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_kms=5Fflip=5Ftiling=3A_re?=
 =?utf-8?q?duce_exec=2E_time_for_sim_env?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Sep 2025 02:26:02 -0000
Message-ID: <175686636276.296565.3019672573848506123@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250902095450.1236804-1-jeevan.b@intel.com>
In-Reply-To: <20250902095450.1236804-1-jeevan.b@intel.com>
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

--===============3488751901987953679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip_tiling: reduce exec. time for sim env
URL   : https://patchwork.freedesktop.org/series/153853/
State : success

== Summary ==

CI Bug Log - changes from IGT_8520 -> IGTPW_13676
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): bat-adlp-6 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8520 and IGTPW_13676:

### New IGT tests (1) ###

  * igt@kms_flip@basic-plain-flip@d-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  

Known issues
------------

  Here are the changes found in IGTPW_13676 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@late_gt_pm:
    - bat-dg2-8:          [PASS][3] -> [ABORT][4] ([i915#14201])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-8/igt@i915_selftest@live@late_gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-8/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [PASS][9] -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-arls-6/igt@i915_selftest@live@workarounds.html
    - bat-dg2-8:          [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-8/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-8/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][17] ([i915#12061]) -> [ABORT][18] ([i915#14201])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-8/igt@i915_selftest@live.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-8/igt@i915_selftest@live.html
    - bat-atsm-1:         [DMESG-FAIL][19] ([i915#12061] / [i915#14204]) -> [DMESG-FAIL][20] ([i915#12061] / [i915#13929])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-atsm-1/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][21] ([i915#14204]) -> [DMESG-FAIL][22] ([i915#13929])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-atsm-1/igt@i915_selftest@live@mman.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8520 -> IGTPW_13676

  CI-20190529: 20190529
  CI_DRM_17119: 97a9560f0f1dd0a4472e669ff2188d0a8293b375 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13676: 13676
  IGT_8520: 8520

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/index.html

--===============3488751901987953679==
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
<tr><td><b>Series:</b></td><td>kms_flip_tiling: reduce exec. time for sim env</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153853/">https://patchwork.freedesktop.org/series/153853/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8520 -&gt; IGTPW_13676</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): bat-adlp-6 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8520 and IGTPW_13676:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-dp2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13676 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-8/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-8/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-8/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-dg2-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8520/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13676/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8520 -&gt; IGTPW_13676</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17119: 97a9560f0f1dd0a4472e669ff2188d0a8293b375 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13676: 13676<br />
  IGT_8520: 8520</p>

</body>
</html>

--===============3488751901987953679==--

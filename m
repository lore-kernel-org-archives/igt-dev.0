Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F430C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0777810E289;
	Mon, 19 May 2025 15:49:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7B710E289;
 Mon, 19 May 2025 15:49:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9103955422798151596=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Block_u?=
 =?utf-8?q?nsupported_dirty_rect_test_for_i915?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 May 2025 15:49:56 -0000
Message-ID: <174766979657.11.11641734363491380110@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519091403.3305383-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250519091403.3305383-1-santhosh.reddy.guddati@intel.com>
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

--===============9103955422798151596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Block unsupported dirty rect test for i915
URL   : https://patchwork.freedesktop.org/series/149173/
State : success

== Summary ==

CI Bug Log - changes from IGT_8367 -> IGTPW_13142
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13142 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [DMESG-FAIL][2] ([i915#14243]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@active:
    - fi-bsw-nick:        [PASS][3] -> [DMESG-FAIL][4] ([i915#14045]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/fi-bsw-nick/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/fi-bsw-nick/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@gem:
    - bat-arlh-2:         [PASS][5] -> [ABORT][6] ([i915#13723])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-2/igt@i915_selftest@live@gem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-2/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [PASS][9] -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][11] -> [DMESG-FAIL][12] ([i915#12061]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [PASS][13] -> [DMESG-FAIL][14] ([i915#12061]) +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [DMESG-FAIL][19] ([i915#12061]) -> [ABORT][20] ([i915#13723])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-2/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
  [i915#14045]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14045
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8367 -> IGTPW_13142

  CI-20190529: 20190529
  CI_DRM_16565: 36da6a9300fc8686d01b5450723200dafd89526f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13142: 13142
  IGT_8367: 8367

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/index.html

--===============9103955422798151596==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Block unsupported dirty rect test for i915</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149173/">https://patchwork.freedesktop.org/series/149173/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8367 -&gt; IGTPW_13142</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13142 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/fi-bsw-nick/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/fi-bsw-nick/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14045">i915#14045</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-2/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-2/igt@i915_selftest@live@gem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8367/bat-arlh-2/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13142/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8367 -&gt; IGTPW_13142</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16565: 36da6a9300fc8686d01b5450723200dafd89526f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13142: 13142<br />
  IGT_8367: 8367</p>

</body>
</html>

--===============9103955422798151596==--

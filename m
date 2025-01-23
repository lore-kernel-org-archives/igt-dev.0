Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65303C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 21:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0C410E8A4;
	Thu, 23 Jan 2025 21:09:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2073710E8A4;
 Thu, 23 Jan 2025 21:09:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4738599439274106195=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fcompute=3A_Us?=
 =?utf-8?q?e_LR_mode_for_compute_when_using_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Jan 2025 21:09:19 -0000
Message-ID: <173766655912.3694609.5389029281788943603@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123193050.2433439-1-francois.dugast@intel.com>
In-Reply-To: <20250123193050.2433439-1-francois.dugast@intel.com>
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

--===============4738599439274106195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute: Use LR mode for compute when using Xe
URL   : https://patchwork.freedesktop.org/series/143899/
State : success

== Summary ==

CI Bug Log - changes from IGT_8207 -> IGTPW_12489
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/index.html

Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-snb-2520m bat-jsl-3 bat-twl-1 bat-jsl-1 bat-twl-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12489:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@load:
    - {bat-mtlp-9}:       [DMESG-WARN][1] ([i915#13494]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-9/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-9/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_12489 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-pnv-d510:        [PASS][3] -> [ABORT][4] ([i915#13203])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/fi-pnv-d510/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/fi-pnv-d510/igt@i915_module_load@load.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - bat-dg2-13:         NOTRUN -> [SKIP][5] ([Intel XE#484] / [i915#4550]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][6] ([i915#12061]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          [SKIP][8] ([i915#5274]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-mtlp-6:         [SKIP][10] ([i915#5274] / [i915#9792]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-14:         [SKIP][12] ([i915#5274]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-11:         [SKIP][14] ([i915#5274]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-mtlp-8:         [SKIP][16] ([i915#5274]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-8:          [SKIP][18] ([i915#5274]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html
    - {bat-mtlp-9}:       [SKIP][20] ([i915#5274]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-9/igt@kms_force_connector_basic@prune-stale-modes.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-9/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-arlh-3:         [SKIP][22] ([i915#12648]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-arlh-3/igt@kms_force_connector_basic@prune-stale-modes.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-arlh-3/igt@kms_force_connector_basic@prune-stale-modes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12648]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12648
  [i915#13203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8207 -> IGTPW_12489
  * Linux: CI_DRM_16003 -> CI_DRM_16011

  CI-20190529: 20190529
  CI_DRM_16003: db7cf8d52a41001ea2780cf834fed3dc490343d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16011: b0181cc14ba055406c6014d1dce81765dfb69103 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12489: cc113d5687ccbcacd9d676a3028bb772ada46038 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/index.html

--===============4738599439274106195==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute: Use LR mode for compute when using Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143899/">https://patchwork.freedesktop.org/series/143899/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8207 -&gt; IGTPW_12489</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/index.html</p>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-snb-2520m bat-jsl-3 bat-twl-1 bat-jsl-1 bat-twl-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12489:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12489 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/fi-pnv-d510/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/fi-pnv-d510/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13203">i915#13203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-13/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550">i915#4550</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-mtlp-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-mtlp-9/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8207/bat-arlh-3/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12648">i915#12648</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12489/bat-arlh-3/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8207 -&gt; IGTPW_12489</li>
<li>Linux: CI_DRM_16003 -&gt; CI_DRM_16011</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16003: db7cf8d52a41001ea2780cf834fed3dc490343d2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16011: b0181cc14ba055406c6014d1dce81765dfb69103 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12489: cc113d5687ccbcacd9d676a3028bb772ada46038 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4738599439274106195==--

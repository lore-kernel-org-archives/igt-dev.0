Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEDFCA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 18:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9F310E27C;
	Mon, 25 Aug 2025 18:50:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7034D10E27C;
 Mon, 25 Aug 2025 18:50:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1001820119383099578=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_Unbind_before_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Aug 2025 18:50:46 -0000
Message-ID: <175614784643.268230.6586905092557899632@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
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

--===============1001820119383099578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: Unbind before tests (rev2)
URL   : https://patchwork.freedesktop.org/series/153175/
State : success

== Summary ==

CI Bug Log - changes from IGT_8507 -> IGTPW_13632
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_13632 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][2] -> [DMESG-WARN][3] ([i915#13494])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-mtlp-9/igt@i915_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][4] -> [DMESG-FAIL][5] ([i915#12061]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-skl-6600u:       [ABORT][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [DMESG-FAIL][10] ([i915#12061]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-twl-2:          [ABORT][12] ([i915#14365]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-twl-2/igt@i915_selftest@live@workarounds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-twl-2/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#14365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8507 -> IGTPW_13632

  CI-20190529: 20190529
  CI_DRM_17065: a7c735c1739662dcc431bda50653821bff0d63fb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13632: 75734f3f8d20a3af9e559bc8ee0bd941867876a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8507: 8507

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/index.html

--===============1001820119383099578==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: Unbind before tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153175/">https://patchwork.freedesktop.org/series/153175/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8507 -&gt; IGTPW_13632</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13632 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8507/bat-twl-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365">i915#14365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13632/bat-twl-2/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8507 -&gt; IGTPW_13632</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17065: a7c735c1739662dcc431bda50653821bff0d63fb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13632: 75734f3f8d20a3af9e559bc8ee0bd941867876a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8507: 8507</p>

</body>
</html>

--===============1001820119383099578==--

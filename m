Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6263C0219E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 08:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EDE10E26F;
	Wed, 12 Feb 2025 08:32:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EA610E26F;
 Wed, 12 Feb 2025 08:32:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5234234735285220595=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner?=
 =?utf-8?q?=3A_Add_a_new_test_to_validate_non-joiner_mode_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Feb 2025 08:32:08 -0000
Message-ID: <173934912827.1222194.13572000730482497623@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212073604.1580120-1-jeevan.b@intel.com>
In-Reply-To: <20250212073604.1580120-1-jeevan.b@intel.com>
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

--===============5234234735285220595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev7)
URL   : https://patchwork.freedesktop.org/series/143972/
State : success

== Summary ==

CI Bug Log - changes from IGT_8228 -> IGTPW_12577
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/index.html

Participating hosts (43 -> 42)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12577 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-14:         [PASS][1] -> [ABORT][2] ([i915#13571])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12904]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-apl-1/igt@dmabuf@all-tests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][5] -> [DMESG-WARN][6] ([i915#13494])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-mtlp-9/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-twl-2:          NOTRUN -> [ABORT][7] ([i915#12919] / [i915#13503])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_engines:
    - bat-twl-2:          NOTRUN -> [ABORT][8] ([i915#12919])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-twl-2/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [PASS][9] -> [DMESG-FAIL][10] ([i915#12061])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-pnv-d510:        NOTRUN -> [SKIP][11] +33 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_contexts:
    - bat-twl-1:          [ABORT][12] ([i915#12919]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-twl-1/igt@i915_selftest@live@gt_contexts.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-twl-1/igt@i915_selftest@live@gt_contexts.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][14] ([i915#12061]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503
  [i915#13571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8228 -> IGTPW_12577
  * Linux: CI_DRM_16103 -> CI_DRM_16112

  CI-20190529: 20190529
  CI_DRM_16103: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16112: a5fe717b56653a6f5e5b98ed07d5fe54789465c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12577: 12577
  IGT_8228: 8228

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/index.html

--===============5234234735285220595==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143972/">https://patchwork.freedesktop.org/series/143972/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8228 -&gt; IGTPW_12577</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12577 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571">i915#13571</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503">i915#13503</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-twl-2/igt@i915_selftest@live@gt_engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-twl-1/igt@i915_selftest@live@gt_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-twl-1/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12577/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8228 -&gt; IGTPW_12577</li>
<li>Linux: CI_DRM_16103 -&gt; CI_DRM_16112</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16103: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16112: a5fe717b56653a6f5e5b98ed07d5fe54789465c9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12577: 12577<br />
  IGT_8228: 8228</p>

</body>
</html>

--===============5234234735285220595==--

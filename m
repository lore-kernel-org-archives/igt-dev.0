Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF02CD4846
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 02:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011EE10E960;
	Tue, 12 May 2026 02:53:05 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B910E960;
 Tue, 12 May 2026 02:52:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0202527419518257375=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/chamelium/kms=5Fcha?=
 =?utf-8?q?melium=5Fcolor=3A_Add_YUYV_and_NV12_coverage_to_color_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 02:52:48 -0000
Message-ID: <177855436847.60084.17124643915986954332@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511102936.115495-1-pranay.samala@intel.com>
In-Reply-To: <20260511102936.115495-1-pranay.samala@intel.com>
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

--===============0202527419518257375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium/kms_chamelium_color: Add YUYV and NV12 coverage to color subtests
URL   : https://patchwork.freedesktop.org/series/166306/
State : success

== Summary ==

CI Bug Log - changes from IGT_8903 -> IGTPW_15151
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m fi-elk-e7500 

New tests
---------

  New tests have been introduced between IGT_8903 and IGTPW_15151:

### New IGT tests (1) ###

  * igt@gem_exec_basic@basic@ccs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_15151 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8903/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8903 -> IGTPW_15151
  * Linux: CI_DRM_18467 -> CI_DRM_18469

  CI-20190529: 20190529
  CI_DRM_18467: f8ee23694aa6be213355905a78f79bb1b0861565 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18469: 0ce1c813197dfbe15ff14143da97ec11161e1795 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15151: b086aebd8efcc20d3090a596d72569fb56a7d63b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/index.html

--===============0202527419518257375==
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
<tr><td><b>Series:</b></td><td>tests/chamelium/kms_chamelium_color: Add YUYV and NV12 coverage to color subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166306/">https://patchwork.freedesktop.org/series/166306/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8903 -&gt; IGTPW_15151</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m fi-elk-e7500 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8903 and IGTPW_15151:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_exec_basic@basic@ccs0-lmem0:<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15151 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8903/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15151/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8903 -&gt; IGTPW_15151</li>
<li>Linux: CI_DRM_18467 -&gt; CI_DRM_18469</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18467: f8ee23694aa6be213355905a78f79bb1b0861565 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18469: 0ce1c813197dfbe15ff14143da97ec11161e1795 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15151: b086aebd8efcc20d3090a596d72569fb56a7d63b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0202527419518257375==--

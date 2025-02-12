Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC0EC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 10:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FD810E32C;
	Wed, 12 Feb 2025 10:09:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB55210E32C;
 Wed, 12 Feb 2025 10:09:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5533889498826111042=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/xe=5Ffault=5Finject?=
 =?utf-8?q?ion=3A_Inject_error_for_xe=5Fsync=5Fentry=5Fparse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Feb 2025 10:09:00 -0000
Message-ID: <173935494076.1256068.1433591698252440304@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212090448.3068963-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250212090448.3068963-1-priyanka.dandamudi@intel.com>
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

--===============5533889498826111042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_fault_injection: Inject error for xe_sync_entry_parse
URL   : https://patchwork.freedesktop.org/series/144708/
State : success

== Summary ==

CI Bug Log - changes from IGT_8228 -> IGTPW_12579
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12579 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-8:          [PASS][1] -> [ABORT][2] ([i915#13571])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][3] -> [DMESG-WARN][4] ([i915#13494])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-mtlp-9/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/bat-mtlp-9/igt@i915_module_load@load.html

  
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8228 -> IGTPW_12579
  * Linux: CI_DRM_16103 -> CI_DRM_16113

  CI-20190529: 20190529
  CI_DRM_16103: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16113: 212e6e1842223b745408ec6ae15be3009bb8635e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12579: 41a832ea34e362c9d62ab21d30402930b6739bf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8228: 8228

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/index.html

--===============5533889498826111042==
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
<tr><td><b>Series:</b></td><td>tests/xe_fault_injection: Inject error for xe_sync_entry_parse</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144708/">https://patchwork.freedesktop.org/series/144708/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8228 -&gt; IGTPW_12579</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12579 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571">i915#13571</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8228/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12579/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8228 -&gt; IGTPW_12579</li>
<li>Linux: CI_DRM_16103 -&gt; CI_DRM_16113</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16103: 93f37b8d57cb5f1db7818eb395ad810ad1ed8b77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16113: 212e6e1842223b745408ec6ae15be3009bb8635e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12579: 41a832ea34e362c9d62ab21d30402930b6739bf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8228: 8228</p>

</body>
</html>

--===============5533889498826111042==--

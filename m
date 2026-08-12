Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE87DC5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 14:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9A10F023;
	Wed, 12 Aug 2026 14:13:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7BF10F01C;
 Wed, 12 Aug 2026 14:12:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1466483859959559127=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_CMRR_subtests_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Aug 2026 14:12:42 -0000
Message-ID: <178654396237.43908.13986074063289671498@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
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

--===============1466483859959559127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CMRR subtests (rev4)
URL   : https://patchwork.freedesktop.org/series/171615/
State : success

== Summary ==

CI Bug Log - changes from IGT_9052 -> IGTPW_15664
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/index.html

Participating hosts (38 -> 34)
------------------------------

  Missing    (4): fi-hsw-4770 fi-glk-j4005 fi-snb-2520m bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15664 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@perf:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +13 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9052/fi-kbl-7567u/igt@i915_selftest@live@perf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/fi-kbl-7567u/igt@i915_selftest@live@perf.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9052 -> IGTPW_15664
  * Linux: CI_DRM_18980 -> CI_DRM_18982

  CI-20190529: 20190529
  CI_DRM_18980: aabf41c0ea0ad661a2e384e51955b24343f6ca25 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18982: 96ddbb14986632af742523e68f90d51c138c57f0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15664: 88d475ce1257e96e412f238f819fe929f18a3947 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9052: 9052

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/index.html

--===============1466483859959559127==
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
<tr><td><b>Series:</b></td><td>Add CMRR subtests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171615/">https://patchwork.freedesktop.org/series/171615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9052 -&gt; IGTPW_15664</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/index.html</p>
<h2>Participating hosts (38 -&gt; 34)</h2>
<p>Missing    (4): fi-hsw-4770 fi-glk-j4005 fi-snb-2520m bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15664 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@perf:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9052/fi-kbl-7567u/igt@i915_selftest@live@perf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15664/fi-kbl-7567u/igt@i915_selftest@live@perf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9052 -&gt; IGTPW_15664</li>
<li>Linux: CI_DRM_18980 -&gt; CI_DRM_18982</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18980: aabf41c0ea0ad661a2e384e51955b24343f6ca25 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18982: 96ddbb14986632af742523e68f90d51c138c57f0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15664: 88d475ce1257e96e412f238f819fe929f18a3947 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9052: 9052</p>

</body>
</html>

--===============1466483859959559127==--

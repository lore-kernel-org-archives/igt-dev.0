Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626F2C52D71
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 20:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FC810E7FE;
	Thu,  8 Aug 2024 20:28:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12BF10E7FE;
 Thu,  8 Aug 2024 20:28:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3155814306089934849=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Add_?=
 =?utf-8?q?syncs-signal_test_for_OA_syncs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 Aug 2024 20:28:02 -0000
Message-ID: <172314888265.550660.18264616276791933631@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808173632.4027344-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240808173632.4027344-1-ashutosh.dixit@intel.com>
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

--===============3155814306089934849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Add syncs-signal test for OA syncs
URL   : https://patchwork.freedesktop.org/series/137056/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15201 -> IGTPW_11546
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/index.html

Participating hosts (39 -> 35)
------------------------------

  Missing    (4): bat-dg2-11 fi-kbl-8809g fi-snb-2520m fi-elk-e7500 

Known issues
------------

  Here are the changes found in IGTPW_11546 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [PASS][1] -> [INCOMPLETE][2] ([i915#9413])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15201/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7962 -> IGTPW_11546

  CI-20190529: 20190529
  CI_DRM_15201: 6eced4bb82542c5f00a48e4d7b66a10905736961 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11546: 11546
  IGT_7962: 7962

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/index.html

--===============3155814306089934849==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Add syncs-signal test for OA syncs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137056/">https://patchwork.freedesktop.org/series/137056/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15201 -&gt; IGTPW_11546</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/index.html</p>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): bat-dg2-11 fi-kbl-8809g fi-snb-2520m fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11546 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15201/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11546/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7962 -&gt; IGTPW_11546</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15201: 6eced4bb82542c5f00a48e4d7b66a10905736961 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11546: 11546<br />
  IGT_7962: 7962</p>

</body>
</html>

--===============3155814306089934849==--

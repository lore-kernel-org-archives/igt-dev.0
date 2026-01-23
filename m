Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20293D72347
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 08:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B28210E2AF;
	Fri, 23 Jan 2026 08:19:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000610E27B;
 Fri, 23 Jan 2026 08:19:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0871133403075306985=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_RFC_tests/intel/xe=5Fexec?=
 =?utf-8?q?=5Freset=3A_Filter_expected_timeout_dmesg_during_reset_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jan 2026 08:19:19 -0000
Message-ID: <176915635999.186607.3298380488043391684@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123065238.48129-1-sobin.thomas@intel.com>
In-Reply-To: <20260123065238.48129-1-sobin.thomas@intel.com>
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

--===============0871133403075306985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC tests/intel/xe_exec_reset: Filter expected timeout dmesg during reset tests
URL   : https://patchwork.freedesktop.org/series/160538/
State : success

== Summary ==

CI Bug Log - changes from IGT_8715 -> IGTPW_14404
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/index.html

Participating hosts (43 -> 39)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-tgl-1115g4 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14404 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8715/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8715 -> IGTPW_14404
  * Linux: CI_DRM_17875 -> CI_DRM_17876

  CI-20190529: 20190529
  CI_DRM_17875: f20afcc51cabf38938961caf0e634144aa21b6a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17876: 4a255b429d80f8b0800bdef43ba3175b771e77ff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14404: 14404
  IGT_8715: 8715

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/index.html

--===============0871133403075306985==
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
<tr><td><b>Series:</b></td><td>RFC tests/intel/xe_exec_reset: Filter expected timeout dmesg during reset tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160538/">https://patchwork.freedesktop.org/series/160538/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8715 -&gt; IGTPW_14404</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/index.html</p>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-tgl-1115g4 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14404 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8715/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14404/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8715 -&gt; IGTPW_14404</li>
<li>Linux: CI_DRM_17875 -&gt; CI_DRM_17876</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17875: f20afcc51cabf38938961caf0e634144aa21b6a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17876: 4a255b429d80f8b0800bdef43ba3175b771e77ff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14404: 14404<br />
  IGT_8715: 8715</p>

</body>
</html>

--===============0871133403075306985==--

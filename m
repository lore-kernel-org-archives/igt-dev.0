Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A3E91289
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 07:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E8D10E7CD;
	Thu,  5 Feb 2026 07:30:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EAB10E7CD;
 Thu,  5 Feb 2026 07:30:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3148769993872458389=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_DONT=5FMERGE=3Atests/inte?=
 =?utf-8?q?l/xe=5Fcompute=3A_Robust_SR-IOV/VF/PF_and_per-GT_ccs=5Fmode_attri?=
 =?utf-8?q?bute_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Feb 2026 07:30:44 -0000
Message-ID: <177027664418.225549.368280149666588493@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205041640.1357478-1-nishit.sharma@intel.com>
In-Reply-To: <20260205041640.1357478-1-nishit.sharma@intel.com>
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

--===============3148769993872458389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DONT_MERGE:tests/intel/xe_compute: Robust SR-IOV/VF/PF and per-GT ccs_mode attribute handling (rev2)
URL   : https://patchwork.freedesktop.org/series/161048/
State : success

== Summary ==

CI Bug Log - changes from IGT_8738 -> IGTPW_14499
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_14499 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8738/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8738 -> IGTPW_14499

  CI-20190529: 20190529
  CI_DRM_17935: 8883ec84c85819dacca94997b60371c3ed57ee29 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14499: ee631f99b9d0d6492631d628f2a2dccd103bd114 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8738: b3fc8fb534a27517f2a49e63ef993e7550b9b959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/index.html

--===============3148769993872458389==
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
<tr><td><b>Series:</b></td><td>DONT_MERGE:tests/intel/xe_compute: Robust SR-IOV/VF/PF and per-GT ccs_mode attribute handling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161048/">https://patchwork.freedesktop.org/series/161048/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8738 -&gt; IGTPW_14499</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14499 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8738/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14499/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8738 -&gt; IGTPW_14499</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17935: 8883ec84c85819dacca94997b60371c3ed57ee29 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14499: ee631f99b9d0d6492631d628f2a2dccd103bd114 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8738: b3fc8fb534a27517f2a49e63ef993e7550b9b959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3148769993872458389==--

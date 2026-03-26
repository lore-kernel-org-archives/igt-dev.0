Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5F10AB808
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 19:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF3910EB01;
	Thu, 26 Mar 2026 19:11:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4024D10E642;
 Thu, 26 Mar 2026 19:11:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4596562064731622804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_intel-ci=3A_Add_Xe_FULL_c?=
 =?utf-8?q?hamelium_run_type_and_testlist_improvements_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 19:11:39 -0000
Message-ID: <177455229922.403161.2555316484642697263@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326090417.864673-1-sowmiya.s@intel.com>
In-Reply-To: <20260326090417.864673-1-sowmiya.s@intel.com>
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

--===============4596562064731622804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Add Xe FULL chamelium run type and testlist improvements (rev5)
URL   : https://patchwork.freedesktop.org/series/163129/
State : success

== Summary ==

CI Bug Log - changes from IGT_8834 -> IGTPW_14863
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 bat-mtlp-9 

Known issues
------------

  Here are the changes found in IGTPW_14863 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-dg2-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8834 -> IGTPW_14863
  * Linux: CI_DRM_18222 -> CI_DRM_18226

  CI-20190529: 20190529
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18226: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14863: 14863
  IGT_8834: 8834

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/index.html

--===============4596562064731622804==
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
<tr><td><b>Series:</b></td><td>intel-ci: Add Xe FULL chamelium run type and testlist improvements (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163129/">https://patchwork.freedesktop.org/series/163129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8834 -&gt; IGTPW_14863</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 bat-mtlp-9 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14863 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14863/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8834 -&gt; IGTPW_14863</li>
<li>Linux: CI_DRM_18222 -&gt; CI_DRM_18226</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18226: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14863: 14863<br />
  IGT_8834: 8834</p>

</body>
</html>

--===============4596562064731622804==--

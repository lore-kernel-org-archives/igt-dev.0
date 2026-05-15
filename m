Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319F3CD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 00:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9857710E125;
	Fri, 15 May 2026 00:59:50 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD1B10E125;
 Fri, 15 May 2026 00:59:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8506234272548204487=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_tests/amdgpu=3A_Fix_queue_reset_monitor_logic_and_allow_-ET?=
 =?utf-8?q?IME_in_CS_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 15 May 2026 00:59:33 -0000
Message-ID: <177880677380.72886.13892325726579225688@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514235000.125069-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260514235000.125069-1-vitaly.prosyak@amd.com>
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

--===============8506234272548204487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/amdgpu: Fix queue reset monitor logic and allow -ETIME in CS helper
URL   : https://patchwork.freedesktop.org/series/166608/
State : success

== Summary ==

CI Bug Log - changes from IGT_8912 -> IGTPW_15187
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15187 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][1] ([i915#12061]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8912 -> IGTPW_15187
  * Linux: CI_DRM_18489 -> CI_DRM_18492

  CI-20190529: 20190529
  CI_DRM_18489: 121c16f9d8c56ea07263df84ab971cc10870fe88 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18492: 2edbd77a2045d12d30c95dbb5842b831e3da0035 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15187: 2b679f12e7f7e7ad4ce135558bce3aa2019705c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/index.html

--===============8506234272548204487==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/amdgpu: Fix queue reset monitor logic and allow -ETIME in CS helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166608/">https://patchwork.freedesktop.org/series/166608/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8912 -&gt; IGTPW_15187</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15187 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15187/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8912 -&gt; IGTPW_15187</li>
<li>Linux: CI_DRM_18489 -&gt; CI_DRM_18492</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18489: 121c16f9d8c56ea07263df84ab971cc10870fe88 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18492: 2edbd77a2045d12d30c95dbb5842b831e3da0035 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15187: 2b679f12e7f7e7ad4ce135558bce3aa2019705c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8506234272548204487==--

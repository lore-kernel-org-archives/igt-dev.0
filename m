Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DC5CFB43C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C1510E0E7;
	Mon,  7 Oct 2024 17:44:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1AB10E0E7;
 Mon,  7 Oct 2024 17:43:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0930340998208582409=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Prev?=
 =?utf-8?q?enting_test_failures_by_omitting_rc6_disable_test_if_=27gtidle=27?=
 =?utf-8?q?_node_is_missing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Oct 2024 17:43:58 -0000
Message-ID: <172832303837.1199610.18052372426513777167@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007042202.138153-1-soham.purkait@intel.com>
In-Reply-To: <20241007042202.138153-1-soham.purkait@intel.com>
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

--===============0930340998208582409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Preventing test failures by omitting rc6 disable test if 'gtidle' node is missing
URL   : https://patchwork.freedesktop.org/series/139608/
State : success

== Summary ==

CI Bug Log - changes from IGT_8054 -> IGTPW_11876
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/index.html

Participating hosts (43 -> 43)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_11876 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2] ([i915#12216]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/bat-mtlp-8/igt@i915_selftest@live.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [DMESG-WARN][3] ([i915#10341] / [i915#12133]) -> [ABORT][4] ([i915#12061] / [i915#12133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-WARN][5] ([i915#10341] / [i915#11637]) -> [ABORT][6] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8054 -> IGTPW_11876
  * Linux: CI_DRM_15484 -> CI_DRM_15485

  CI-20190529: 20190529
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11876: 6f78e20c00d9547466ce27fca779e117be92642d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/index.html

--===============0930340998208582409==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Preventing test failures by omitting rc6 disable test if &#x27;gtidle&#x27; node is missing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139608/">https://patchwork.freedesktop.org/series/139608/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8054 -&gt; IGTPW_11876</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/index.html</p>
<h2>Participating hosts (43 -&gt; 43)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11876 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216">i915#12216</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/bat-arls-5/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8054/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11876/bat-arls-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8054 -&gt; IGTPW_11876</li>
<li>Linux: CI_DRM_15484 -&gt; CI_DRM_15485</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15484: 92d12099cc768f36cf676ee1b014442a5c5ba965 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15485: 39a016b276ce8adac629cc6c31892d0b7d2af634 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11876: 6f78e20c00d9547466ce27fca779e117be92642d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0930340998208582409==--

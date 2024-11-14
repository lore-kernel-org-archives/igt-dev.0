Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A536D65C40
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 05:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3982D10E125;
	Thu, 14 Nov 2024 05:46:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4445310E125;
 Thu, 14 Nov 2024 05:46:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2080839411745573066=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Add_pci=5Fmembarrier_test_i?=
 =?utf-8?q?n_xe=5Fmmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 14 Nov 2024 05:46:16 -0000
Message-ID: <173156317627.3943594.9383260252229090952@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
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

--===============2080839411745573066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add pci_membarrier test in xe_mmap (rev2)
URL   : https://patchwork.freedesktop.org/series/141296/
State : success

== Summary ==

CI Bug Log - changes from IGT_8107 -> IGTPW_12099
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/index.html

Participating hosts (47 -> 45)
------------------------------

  Missing    (2): bat-arls-5 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12099 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][1] -> [DMESG-WARN][2] ([i915#12253])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8107/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][3] ([i915#12759]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8107/bat-dg2-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [DMESG-FAIL][5] ([i915#9500]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8107/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12759]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12759
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8107 -> IGTPW_12099
  * Linux: CI_DRM_15689 -> CI_DRM_15692

  CI-20190529: 20190529
  CI_DRM_15689: 169c7cd31a373ed31054abb423981856eb5fb119 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15692: 52166ab72753e6d0d496539d050a5f54d9f2278b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12099: 5a144bb1f42f23136ac96a7be7aab5c946f8c167 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/index.html

--===============2080839411745573066==
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
<tr><td><b>Series:</b></td><td>Add pci_membarrier test in xe_mmap (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141296/">https://patchwork.freedesktop.org/series/141296/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8107 -&gt; IGTPW_12099</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/index.html</p>
<h2>Participating hosts (47 -&gt; 45)</h2>
<p>Missing    (2): bat-arls-5 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12099 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-read:<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8107/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8107/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12759">i915#12759</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/bat-dg2-8/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8107/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12099/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8107 -&gt; IGTPW_12099</li>
<li>Linux: CI_DRM_15689 -&gt; CI_DRM_15692</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15689: 169c7cd31a373ed31054abb423981856eb5fb119 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15692: 52166ab72753e6d0d496539d050a5f54d9f2278b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12099: 5a144bb1f42f23136ac96a7be7aab5c946f8c167 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2080839411745573066==--

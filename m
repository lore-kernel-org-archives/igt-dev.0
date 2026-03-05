Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D6F47CB9
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 19:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0C10EC69;
	Thu,  5 Mar 2026 19:14:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E64910EC69;
 Thu,  5 Mar 2026 19:14:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2155201700217663598=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_intel-ci=3A_Split_chameli?=
 =?utf-8?q?um-only_testlist_for_i915_and_xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Bilal" <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Mar 2026 19:14:01 -0000
Message-ID: <177273804136.322779.4902217289659515164@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
In-Reply-To: <20260305083906.3098168-1-mohammed.bilal@intel.com>
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

--===============2155201700217663598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Split chamelium-only testlist for i915 and xe (rev5)
URL   : https://patchwork.freedesktop.org/series/160957/
State : success

== Summary ==

CI Bug Log - changes from IGT_8781 -> IGTPW_14678
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_14678 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@client:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +13 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8781/fi-kbl-7567u/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/fi-kbl-7567u/igt@i915_selftest@live@client.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8781/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [DMESG-FAIL][5] ([i915#12061] / [i915#15784]) -> [DMESG-FAIL][6] ([i915#15784])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8781/bat-arls-5/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/bat-arls-5/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15784


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8781 -> IGTPW_14678
  * Linux: CI_DRM_18097 -> CI_DRM_18099

  CI-20190529: 20190529
  CI_DRM_18097: 9565ad1c312903452467b9f685c59e2f47f512e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18099: 248385bc21fb2a7565e32a605557cdc6cc854dcb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14678: f2c9b8663891183229eb45ddd6c40f0dfa25f820 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8781: 911c75d8ee24b6d42d31e76bc60149a9350f1190 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/index.html

--===============2155201700217663598==
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
<tr><td><b>Series:</b></td><td>intel-ci: Split chamelium-only testlist for i915 and xe (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160957/">https://patchwork.freedesktop.org/series/160957/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8781 -&gt; IGTPW_14678</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14678 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@client:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8781/fi-kbl-7567u/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/fi-kbl-7567u/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8781/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8781/bat-arls-5/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15784">i915#15784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14678/bat-arls-5/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15784">i915#15784</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8781 -&gt; IGTPW_14678</li>
<li>Linux: CI_DRM_18097 -&gt; CI_DRM_18099</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18097: 9565ad1c312903452467b9f685c59e2f47f512e5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18099: 248385bc21fb2a7565e32a605557cdc6cc854dcb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14678: f2c9b8663891183229eb45ddd6c40f0dfa25f820 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8781: 911c75d8ee24b6d42d31e76bc60149a9350f1190 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2155201700217663598==--

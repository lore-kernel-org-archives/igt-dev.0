Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3494D4921F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 12:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C3310E349;
	Fri, 12 Dec 2025 12:42:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE0110E349;
 Fri, 12 Dec 2025 12:42:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2527056602272480703=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_docs=3A_update_for_platfo?=
 =?utf-8?q?rm-neutrality_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pawel Sikora" <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Dec 2025 12:42:41 -0000
Message-ID: <176554336109.80749.5599422736178985214@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212110301.342433-1-pawel.sikora@intel.com>
In-Reply-To: <20251212110301.342433-1-pawel.sikora@intel.com>
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

--===============2527056602272480703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: docs: update for platform-neutrality (rev5)
URL   : https://patchwork.freedesktop.org/series/158808/
State : success

== Summary ==

CI Bug Log - changes from IGT_8664 -> IGTPW_14201
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_14201 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-jsl-1:          [PASS][1] -> [DMESG-FAIL][2] ([i915#15394]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-jsl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@client:
    - fi-kbl-7567u:       [PASS][3] -> [DMESG-WARN][4] ([i915#13735]) +13 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/fi-kbl-7567u/igt@i915_selftest@live@client.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/fi-kbl-7567u/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8664 -> IGTPW_14201
  * Linux: CI_DRM_17659 -> CI_DRM_17669

  CI-20190529: 20190529
  CI_DRM_17659: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17669: 7b8d2fe4514c3edbca3326b592b2fb0bd530527d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14201: 21ac7b6cb37c8e33dde4b37b5e63ea4181cde282 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/index.html

--===============2527056602272480703==
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
<tr><td><b>Series:</b></td><td>docs: update for platform-neutrality (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158808/">https://patchwork.freedesktop.org/series/158808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8664 -&gt; IGTPW_14201</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14201 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394">i915#15394</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/fi-kbl-7567u/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/fi-kbl-7567u/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8664/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14201/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8664 -&gt; IGTPW_14201</li>
<li>Linux: CI_DRM_17659 -&gt; CI_DRM_17669</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17659: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17669: 7b8d2fe4514c3edbca3326b592b2fb0bd530527d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14201: 21ac7b6cb37c8e33dde4b37b5e63ea4181cde282 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2527056602272480703==--

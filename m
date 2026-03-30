Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A31061B2A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 23:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C882510E1A3;
	Mon, 30 Mar 2026 23:52:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2F710E1A3;
 Mon, 30 Mar 2026 23:52:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6709317564815213123=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/kms=3A_only_keep_vali?=
 =?utf-8?q?d_igt=5Fcrtc=5Ft_around?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Mar 2026 23:52:26 -0000
Message-ID: <177491474609.414889.12014522909803177114@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1774856079.git.jani.nikula@intel.com>
In-Reply-To: <cover.1774856079.git.jani.nikula@intel.com>
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

--===============6709317564815213123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: only keep valid igt_crtc_t around
URL   : https://patchwork.freedesktop.org/series/164059/
State : success

== Summary ==

CI Bug Log - changes from IGT_8836 -> IGTPW_14880
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_14880 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-adlp-11:        [PASS][1] -> [DMESG-FAIL][2] ([i915#12964]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-adlp-11/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-adlp-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-dg2-8:          [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-dg2-8/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arlh-2:         [INCOMPLETE][9] -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@memory_region:
    - bat-mtlp-9:         [INCOMPLETE][11] -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-mtlp-9/igt@i915_selftest@live@memory_region.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-mtlp-9/igt@i915_selftest@live@memory_region.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8836 -> IGTPW_14880
  * Linux: CI_DRM_18251 -> CI_DRM_18252

  CI-20190529: 20190529
  CI_DRM_18251: 169e5b6f809026c4a0cb3a736b48378ca8e8fecb @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18252: 247b271f2f09fedf9c4cc85fcc338217fc396a9a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14880: 703bf0f8ece598dad1b383b53f2535864077da0c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8836: 8836

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/index.html

--===============6709317564815213123==
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
<tr><td><b>Series:</b></td><td>lib/kms: only keep valid igt_crtc_t around</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164059/">https://patchwork.freedesktop.org/series/164059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8836 -&gt; IGTPW_14880</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14880 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-adlp-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-adlp-11/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@memory_region:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-mtlp-9/igt@i915_selftest@live@memory_region.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-mtlp-9/igt@i915_selftest@live@memory_region.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8836/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14880/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8836 -&gt; IGTPW_14880</li>
<li>Linux: CI_DRM_18251 -&gt; CI_DRM_18252</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18251: 169e5b6f809026c4a0cb3a736b48378ca8e8fecb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18252: 247b271f2f09fedf9c4cc85fcc338217fc396a9a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14880: 703bf0f8ece598dad1b383b53f2535864077da0c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8836: 8836</p>

</body>
</html>

--===============6709317564815213123==--

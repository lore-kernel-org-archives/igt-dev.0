Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F2C02183
	for <igt-dev@archiver.kernel.org>; Sat, 18 Jan 2025 00:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895CC10E11E;
	Sat, 18 Jan 2025 00:00:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DBA10E11E;
 Sat, 18 Jan 2025 00:00:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6560113793462058046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_igt=5Frunner=27s_cmdl?=
 =?utf-8?q?ine_to_results?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 18 Jan 2025 00:00:04 -0000
Message-ID: <173715840437.923178.14278897492827199684@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117231751.429703-1-lucas.demarchi@intel.com>
In-Reply-To: <20250117231751.429703-1-lucas.demarchi@intel.com>
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

--===============6560113793462058046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add igt_runner's cmdline to results
URL   : https://patchwork.freedesktop.org/series/143699/
State : success

== Summary ==

CI Bug Log - changes from IGT_8198 -> IGTPW_12457
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/index.html

Participating hosts (44 -> 41)
------------------------------

  Missing    (3): bat-apl-1 bat-rpls-4 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12457 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8198 -> IGTPW_12457
  * Linux: CI_DRM_15978 -> CI_DRM_15979

  CI-20190529: 20190529
  CI_DRM_15978: db09bf4e722f65089b91798e6d490d21b8dd8143 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15979: 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12457: 12457
  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/index.html

--===============6560113793462058046==
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
<tr><td><b>Series:</b></td><td>Add igt_runner&#x27;s cmdline to results</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143699/">https://patchwork.freedesktop.org/series/143699/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8198 -&gt; IGTPW_12457</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Missing    (3): bat-apl-1 bat-rpls-4 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12457 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests@dma_fence_chain:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12457/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8198 -&gt; IGTPW_12457</li>
<li>Linux: CI_DRM_15978 -&gt; CI_DRM_15979</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15978: db09bf4e722f65089b91798e6d490d21b8dd8143 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15979: 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12457: 12457<br />
  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6560113793462058046==--

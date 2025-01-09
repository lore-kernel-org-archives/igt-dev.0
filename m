Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A54E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 18:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5048310EF05;
	Thu,  9 Jan 2025 18:31:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B310EF00;
 Thu,  9 Jan 2025 18:31:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6185871522245872369=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdp=5Fli?=
 =?utf-8?q?nktrain=5Ffallback=3A_Reduce_debug_loglevel_dynamically?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jan 2025 18:31:20 -0000
Message-ID: <173644748083.1707559.1445835350605307414@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109170729.47646-1-pranay.samala@intel.com>
In-Reply-To: <20250109170729.47646-1-pranay.samala@intel.com>
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

--===============6185871522245872369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically
URL   : https://patchwork.freedesktop.org/series/143342/
State : success

== Summary ==

CI Bug Log - changes from IGT_8184 -> IGTPW_12420
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12420 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [PASS][1] -> [INCOMPLETE][2] ([i915#9413]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8184/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/bat-adlp-9/igt@i915_selftest@live@workarounds.html

  * igt@runner@aborted:
    - bat-twl-2:          NOTRUN -> [FAIL][3] ([i915#13173])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/bat-twl-2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-6:         [DMESG-FAIL][4] ([i915#13393]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8184/bat-mtlp-6/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/bat-mtlp-6/igt@i915_selftest@live.html

  
  [i915#13173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13173
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8184 -> IGTPW_12420
  * Linux: CI_DRM_15930 -> CI_DRM_15932

  CI-20190529: 20190529
  CI_DRM_15930: c9da975358cd0763449f08b7063ee935eace4f8c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15932: 15b0ea8b453b7e91a74530afa85a602eaca01527 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12420: a8fe7fb5d072b53d480730eb01c1bf72f6783988 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/index.html

--===============6185871522245872369==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143342/">https://patchwork.freedesktop.org/series/143342/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8184 -&gt; IGTPW_12420</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12420 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8184/bat-adlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/bat-adlp-9/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/bat-twl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13173">i915#13173</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8184/bat-mtlp-6/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12420/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8184 -&gt; IGTPW_12420</li>
<li>Linux: CI_DRM_15930 -&gt; CI_DRM_15932</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15930: c9da975358cd0763449f08b7063ee935eace4f8c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15932: 15b0ea8b453b7e91a74530afa85a602eaca01527 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12420: a8fe7fb5d072b53d480730eb01c1bf72f6783988 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6185871522245872369==--

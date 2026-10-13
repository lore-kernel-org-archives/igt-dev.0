Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB70CC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 08:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A43810E403;
	Tue, 13 Oct 2026 08:42:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3E10F614;
 Tue, 13 Oct 2026 08:41:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0221412570956620721=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fvm=3A_Va?=
 =?utf-8?q?lidate_host_memory_for_overcommit_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Oct 2026 08:41:22 -0000
Message-ID: <179188088228.16945.4793489941465758026@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013073532.2885788-1-sobin.thomas@intel.com>
In-Reply-To: <20261013073532.2885788-1-sobin.thomas@intel.com>
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

--===============0221412570956620721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Validate host memory for overcommit tests (rev3)
URL   : https://patchwork.freedesktop.org/series/174990/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9141 -> IGTPW_15976
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15976 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15976, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15976:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-pnv-d510:        [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9141/fi-pnv-d510/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/fi-pnv-d510/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_15976 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [PASS][3] -> [DMESG-WARN][4] ([i915#15673])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9141/bat-adlp-6/igt@core_auth@basic-auth.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/bat-adlp-6/igt@core_auth@basic-auth.html

  
#### Possible fixes ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [DMESG-WARN][5] ([i915#15673]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9141/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9141 -> IGTPW_15976

  CI-20190529: 20190529
  CI_DRM_19327: 882b0f966d25236f00d6ec0c349f7948d2ed1376 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15976: e0d841505e9dee343a6901fc76bb47a3b83f4909 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9141: 272395cfec06bd5809c9b9c0a17a32f34c48799c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/index.html

--===============0221412570956620721==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Validate host memory for overcommit tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174990/">https://patchwork.freedesktop.org/series/174990/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9141 -&gt; IGTPW_15976</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15976 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15976, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15976:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9141/fi-pnv-d510/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/fi-pnv-d510/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15976 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9141/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9141/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15976/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9141 -&gt; IGTPW_15976</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19327: 882b0f966d25236f00d6ec0c349f7948d2ed1376 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15976: e0d841505e9dee343a6901fc76bb47a3b83f4909 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9141: 272395cfec06bd5809c9b9c0a17a32f34c48799c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0221412570956620721==--

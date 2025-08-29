Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A0DC8303F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 05:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEE310E052;
	Fri, 29 Aug 2025 05:15:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90BB10E052;
 Fri, 29 Aug 2025 05:15:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1326343898826790498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fevict=5Fcc?=
 =?utf-8?q?s=3A_This_patch_adjust_object_size_as_per_VRAM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Aug 2025 05:15:17 -0000
Message-ID: <175644451768.282463.9065179197107183176@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829035609.858784-1-sobin.thomas@intel.com>
In-Reply-To: <20250829035609.858784-1-sobin.thomas@intel.com>
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

--===============1326343898826790498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_evict_ccs: This patch adjust object size as per VRAM
URL   : https://patchwork.freedesktop.org/series/153679/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8514_BAT -> XEIGTPW_13659_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13659_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
#### Warnings ####

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][5] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][6] ([Intel XE#688])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-adlp-vm:        [SKIP][7] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][8] ([Intel XE#688])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8514 -> IGTPW_13659
  * Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -> xe-3635-669eae0e8de0328817f4ce7d3c4a3ef834850751

  IGTPW_13659: 4b88f9f282fb4ac65e3d77af427b22f565ff84ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8514: 8514
  xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97
  xe-3635-669eae0e8de0328817f4ce7d3c4a3ef834850751: 669eae0e8de0328817f4ce7d3c4a3ef834850751

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/index.html

--===============1326343898826790498==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_evict_ccs: This patch adjust object size as per VRAM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153679/">https://patchwork.freedesktop.org/series/153679/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8514_BAT -&gt; XEIGTPW_13659_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13659_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-simple:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8514/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13659/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8514 -&gt; IGTPW_13659</li>
<li>Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -&gt; xe-3635-669eae0e8de0328817f4ce7d3c4a3ef834850751</li>
</ul>
<p>IGTPW_13659: 4b88f9f282fb4ac65e3d77af427b22f565ff84ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8514: 8514<br />
  xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97<br />
  xe-3635-669eae0e8de0328817f4ce7d3c4a3ef834850751: 669eae0e8de0328817f4ce7d3c4a3ef834850751</p>

</body>
</html>

--===============1326343898826790498==--

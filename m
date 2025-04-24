Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07070C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 03:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D08C10E71D;
	Thu, 24 Apr 2025 03:26:48 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D7910E71D;
 Thu, 24 Apr 2025 03:26:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7051798390415275522=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv1=2C1/1=5D_/tests/intel/xe=5Feudebug=5Fonline=3A_Remove_cre?=
 =?utf-8?q?ate=5Fmetadata=5Ftrigger_on_debugger_reattachment=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Apr 2025 03:26:47 -0000
Message-ID: <174546520720.3589.1805741075954142627@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423113138.88260-1-jan.sokolowski@intel.com>
In-Reply-To: <20250423113138.88260-1-jan.sokolowski@intel.com>
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

--===============7051798390415275522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v1,1/1] /tests/intel/xe_eudebug_online: Remove create_metadata_trigger on debugger reattachment.
URL   : https://patchwork.freedesktop.org/series/148130/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8333_BAT -> XEIGTPW_13031_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13031_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4829])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#4829]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
  [Intel XE#4829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829


Build changes
-------------

  * IGT: IGT_8333 -> IGTPW_13031
  * Linux: xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3 -> xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494

  IGTPW_13031: eb9e789ef065e85b3bd3ed3f697c35995dd57957 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8333: 1d01b63833a43f8354882205125d1ed76080109e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3: ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3
  xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494: a8900c1b61e733563cb6dfa5173ff5cd8bb0e494

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/index.html

--===============7051798390415275522==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v1,1/1] /tests/intel/xe_eudebug_online: Remove create_metadata_trigger on debugger reattachment.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148130/">https://patchwork.freedesktop.org/series/148130/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8333_BAT -&gt; XEIGTPW_13031_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13031_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13031/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8333 -&gt; IGTPW_13031</li>
<li>Linux: xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3 -&gt; xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494</li>
</ul>
<p>IGTPW_13031: eb9e789ef065e85b3bd3ed3f697c35995dd57957 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8333: 1d01b63833a43f8354882205125d1ed76080109e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3: ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3<br />
  xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494: a8900c1b61e733563cb6dfa5173ff5cd8bb0e494</p>

</body>
</html>

--===============7051798390415275522==--

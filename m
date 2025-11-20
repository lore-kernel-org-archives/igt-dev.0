Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F58CF8847
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 12:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AF410E27E;
	Thu, 20 Nov 2025 12:09:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA9810E27E;
 Thu, 20 Nov 2025 12:09:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1187772382781289961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fix_CRTC_index_to_pipe_conv?=
 =?utf-8?q?ersion=2C_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Nov 2025 12:09:14 -0000
Message-ID: <176364055471.13788.3031285880275912313@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1763634045.git.jani.nikula@intel.com>
In-Reply-To: <cover.1763634045.git.jani.nikula@intel.com>
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

--===============1187772382781289961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix CRTC index to pipe conversion, cleanup
URL   : https://patchwork.freedesktop.org/series/157831/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8635_BAT -> XEIGTPW_14085_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-dg2-oem2 bat-ptl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_14085_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2434] / [Intel XE#2548])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-bmg-2:          NOTRUN -> [ABORT][2] ([Intel XE#1727] / [Intel XE#4760])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [ABORT][3] ([Intel XE#1727] / [Intel XE#4760]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8635/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760


Build changes
-------------

  * IGT: IGT_8635 -> IGTPW_14085
  * Linux: xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8 -> xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872

  IGTPW_14085: 5c3d6e18e731799ca594034087d013efd1e56631 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8635: 8635
  xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8: a95032b2166b5ae428c065917b843a1caf1e82b8
  xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872: 434668b827ca78eb5bf6645ad31fa6d0217c3872

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/index.html

--===============1187772382781289961==
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
<tr><td><b>Series:</b></td><td>fix CRTC index to pipe conversion, cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157831/">https://patchwork.freedesktop.org/series/157831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8635_BAT -&gt; XEIGTPW_14085_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-dg2-oem2 bat-ptl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14085_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8635/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14085/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8635 -&gt; IGTPW_14085</li>
<li>Linux: xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8 -&gt; xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872</li>
</ul>
<p>IGTPW_14085: 5c3d6e18e731799ca594034087d013efd1e56631 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8635: 8635<br />
  xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8: a95032b2166b5ae428c065917b843a1caf1e82b8<br />
  xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872: 434668b827ca78eb5bf6645ad31fa6d0217c3872</p>

</body>
</html>

--===============1187772382781289961==--

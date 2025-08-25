Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FA9CA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1926D10E502;
	Mon, 25 Aug 2025 16:32:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27E110E507;
 Mon, 25 Aug 2025 16:32:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6829270248322200566=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel-ci=3A_Blocklist_curso?=
 =?utf-8?q?r_frontbuffer_rendering_tests_on_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Aug 2025 16:32:47 -0000
Message-ID: <175613956779.267285.9074057211306528046@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825144324.1585829-1-karthik.b.s@intel.com>
In-Reply-To: <20250825144324.1585829-1-karthik.b.s@intel.com>
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

--===============6829270248322200566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Blocklist cursor frontbuffer rendering tests on xe
URL   : https://patchwork.freedesktop.org/series/153456/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8506_BAT -> XEIGTPW_13631_BAT
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

  Here are the changes found in XEIGTPW_13631_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-vm}:       [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8506 -> IGTPW_13631
  * Linux: xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 -> xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2

  IGTPW_13631: 534a431f3c1b55292b8d0599594787f0bd7af6f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8506: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 5481954bd63bd4d34a5acb2b89fb2caf55bb0695
  xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2: f1bad25fa12671f09a9afaeba55789eb519c1eb2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/index.html

--===============6829270248322200566==
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
<tr><td><b>Series:</b></td><td>intel-ci: Blocklist cursor frontbuffer rendering tests on xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153456/">https://patchwork.freedesktop.org/series/153456/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8506_BAT -&gt; XEIGTPW_13631_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13631_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8506 -&gt; IGTPW_13631</li>
<li>Linux: xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 -&gt; xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2</li>
</ul>
<p>IGTPW_13631: 534a431f3c1b55292b8d0599594787f0bd7af6f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8506: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 5481954bd63bd4d34a5acb2b89fb2caf55bb0695<br />
  xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2: f1bad25fa12671f09a9afaeba55789eb519c1eb2</p>

</body>
</html>

--===============6829270248322200566==--

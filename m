Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26078E7719A
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 22:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F1D10E013;
	Thu,  9 Jan 2025 22:25:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFC310E389;
 Thu,  9 Jan 2025 22:25:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2231023729253372678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Remove_redundant_hotplug_de?=
 =?utf-8?q?tection_assertion_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jan 2025 22:25:00 -0000
Message-ID: <173646150045.1742394.12709137877825564940@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109200911.1243517-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250109200911.1243517-1-ramanaidu.naladala@intel.com>
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

--===============2231023729253372678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove redundant hotplug detection assertion (rev3)
URL   : https://patchwork.freedesktop.org/series/143141/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8184_BAT -> XEIGTPW_12422_BAT
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

  Here are the changes found in XEIGTPW_12422_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2252]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - bat-bmg-1:          NOTRUN -> [SKIP][2] ([Intel XE#2252]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#373]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-lnl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#1024]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-pvc-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#373]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-dg2-oem2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#1024]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-atsm-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2463]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-adlp-vf/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - bat-lnl-2:          NOTRUN -> [SKIP][8] ([Intel XE#373]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-lnl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373


Build changes
-------------

  * IGT: IGT_8184 -> IGTPW_12422
  * Linux: xe-2462-c9da975358cd0763449f08b7063ee935eace4f8c -> xe-2465-e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2

  IGTPW_12422: 8616c1eeda1eb48db1cee782a15467107d1f81cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2462-c9da975358cd0763449f08b7063ee935eace4f8c: c9da975358cd0763449f08b7063ee935eace4f8c
  xe-2465-e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2: e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/index.html

--===============2231023729253372678==
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
<tr><td><b>Series:</b></td><td>Remove redundant hotplug detection assertion (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143141/">https://patchwork.freedesktop.org/series/143141/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8184_BAT -&gt; XEIGTPW_12422_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12422_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-lnl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-pvc-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +3 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-dg2-oem2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-atsm-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-adlp-vf/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12422/bat-lnl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8184 -&gt; IGTPW_12422</li>
<li>Linux: xe-2462-c9da975358cd0763449f08b7063ee935eace4f8c -&gt; xe-2465-e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2</li>
</ul>
<p>IGTPW_12422: 8616c1eeda1eb48db1cee782a15467107d1f81cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2462-c9da975358cd0763449f08b7063ee935eace4f8c: c9da975358cd0763449f08b7063ee935eace4f8c<br />
  xe-2465-e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2: e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2</p>

</body>
</html>

--===============2231023729253372678==--

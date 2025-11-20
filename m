Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB4CFA442
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540D10E7C9;
	Thu, 20 Nov 2025 19:51:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014D210E03B;
 Thu, 20 Nov 2025 19:51:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5272143291538908184=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_igt=3A_Help_out_coccinelle?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Nov 2025 19:51:14 -0000
Message-ID: <176366827499.15064.13956331261112774784@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
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

--===============5272143291538908184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt: Help out coccinelle
URL   : https://patchwork.freedesktop.org/series/157868/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8636_BAT -> XEIGTPW_14090_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14090_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-bmg-2:          NOTRUN -> [ABORT][1] ([Intel XE#1727] / [Intel XE#4760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][2] -> [TIMEOUT][3] ([Intel XE#6506])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8636/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [ABORT][4] ([Intel XE#1727] / [Intel XE#4760]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8636/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][6] ([Intel XE#6519]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8636/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8636 -> IGTPW_14090
  * Linux: xe-4134-13909978d70fc4ded88b778a313b68ad86ba881a -> xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7

  IGTPW_14090: 14090
  IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4134-13909978d70fc4ded88b778a313b68ad86ba881a: 13909978d70fc4ded88b778a313b68ad86ba881a
  xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/index.html

--===============5272143291538908184==
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
<tr><td><b>Series:</b></td><td>igt: Help out coccinelle</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157868/">https://patchwork.freedesktop.org/series/157868/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8636_BAT -&gt; XEIGTPW_14090_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14090_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8636/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8636/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8636/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14090/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8636 -&gt; IGTPW_14090</li>
<li>Linux: xe-4134-13909978d70fc4ded88b778a313b68ad86ba881a -&gt; xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7</li>
</ul>
<p>IGTPW_14090: 14090<br />
  IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4134-13909978d70fc4ded88b778a313b68ad86ba881a: 13909978d70fc4ded88b778a313b68ad86ba881a<br />
  xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7</p>

</body>
</html>

--===============5272143291538908184==--

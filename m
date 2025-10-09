Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B6CCA470
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 07:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDE510E948;
	Thu,  9 Oct 2025 07:31:26 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E0810E93D;
 Thu,  9 Oct 2025 07:31:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0988869581206867844=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel-ci=3A_Block_DRRS_subt?=
 =?utf-8?q?ests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Oct 2025 07:31:25 -0000
Message-ID: <175999508546.21518.16426969671372066556@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009060457.1559432-1-jeevan.b@intel.com>
In-Reply-To: <20251009060457.1559432-1-jeevan.b@intel.com>
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

--===============0988869581206867844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Block DRRS subtests
URL   : https://patchwork.freedesktop.org/series/155652/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8580_BAT -> XEIGTPW_13880_BAT
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

  Here are the changes found in XEIGTPW_13880_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#5440])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8580/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13880/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  
  [Intel XE#5440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5440


Build changes
-------------

  * IGT: IGT_8580 -> IGTPW_13880

  IGTPW_13880: f769f148e222cf3e4398e9118aa6ae8a05451a4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8580: 8580
  xe-3887-a7101e35f29e03562f24ce1220f08350260fc0fc: a7101e35f29e03562f24ce1220f08350260fc0fc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13880/index.html

--===============0988869581206867844==
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
<tr><td><b>Series:</b></td><td>intel-ci: Block DRRS subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155652/">https://patchwork.freedesktop.org/series/155652/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13880/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13880/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8580_BAT -&gt; XEIGTPW_13880_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13880_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8580/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13880/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5440">Intel XE#5440</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8580 -&gt; IGTPW_13880</li>
</ul>
<p>IGTPW_13880: f769f148e222cf3e4398e9118aa6ae8a05451a4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8580: 8580<br />
  xe-3887-a7101e35f29e03562f24ce1220f08350260fc0fc: a7101e35f29e03562f24ce1220f08350260fc0fc</p>

</body>
</html>

--===============0988869581206867844==--

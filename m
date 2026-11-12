Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22838606A323
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 06:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938D210E51C;
	Thu, 12 Nov 2026 06:48:48 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3310E53E;
 Thu, 12 Nov 2026 06:47:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3916027174986680763=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_Avoid_leaking_configfs_device_groups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Nov 2026 06:47:52 -0000
Message-ID: <179446607205.13771.3887698479173450331@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112061324.906135-2-soham.purkait@intel.com>
In-Reply-To: <20261112061324.906135-2-soham.purkait@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3916027174986680763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: Avoid leaking configfs device groups
URL   : https://patchwork.freedesktop.org/series/178368/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9187_BAT -> XEIGTPW_16140_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_16140_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] ([Intel XE#352]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9187/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-ptl-2:          [PASS][3] -> [SKIP][4] ([Intel XE#2853])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9187/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html

  
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352


Build changes
-------------

  * IGT: IGT_9187 -> IGTPW_16140
  * Linux: xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c -> xe-6119-38b6109d22c80ecef2229981ccb7a0a1ac22c329

  IGTPW_16140: 16140
  IGT_9187: 9187
  xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c
  xe-6119-38b6109d22c80ecef2229981ccb7a0a1ac22c329: 38b6109d22c80ecef2229981ccb7a0a1ac22c329

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/index.html

--===============3916027174986680763==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: Avoid leaking configfs device groups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178368/">https://patchwork.freedesktop.org/series/178368/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9187_BAT -&gt; XEIGTPW_16140_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16140_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9187/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9187/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16140/bat-ptl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9187 -&gt; IGTPW_16140</li>
<li>Linux: xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c -&gt; xe-6119-38b6109d22c80ecef2229981ccb7a0a1ac22c329</li>
</ul>
<p>IGTPW_16140: 16140<br />
  IGT_9187: 9187<br />
  xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c<br />
  xe-6119-38b6109d22c80ecef2229981ccb7a0a1ac22c329: 38b6109d22c80ecef2229981ccb7a0a1ac22c329</p>

</body>
</html>

--===============3916027174986680763==--

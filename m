Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A2CA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 12:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E9C10F839;
	Fri,  2 Oct 2026 12:57:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E298010F839;
 Fri,  2 Oct 2026 12:56:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6785730274668629885=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_PCI_configuration_tes?=
 =?utf-8?q?ts_for_SR-IOV_VFs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Oct 2026 12:56:18 -0000
Message-ID: <179094577892.232680.5393504599299348770@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
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

--===============6785730274668629885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PCI configuration tests for SR-IOV VFs
URL   : https://patchwork.freedesktop.org/series/175414/
State : success

== Summary ==

CI Bug Log - changes from IGT_9125 -> IGTPW_15934
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Known issues
------------

  Here are the changes found in IGTPW_15934 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-7567u:       [DMESG-WARN][1] ([i915#13735]) -> [PASS][2] +32 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9125/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-7567u:       [SKIP][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9125/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9125 -> IGTPW_15934

  CI-20190529: 20190529
  CI_DRM_19266: fc5f5579dbfab13003fd4d6c1c9214a558f58c9d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15934: 15934
  IGT_9125: 9125

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/index.html

--===============6785730274668629885==
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
<tr><td><b>Series:</b></td><td>Add PCI configuration tests for SR-IOV VFs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175414/">https://patchwork.freedesktop.org/series/175414/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9125 -&gt; IGTPW_15934</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15934 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9125/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9125/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15934/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9125 -&gt; IGTPW_15934</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19266: fc5f5579dbfab13003fd4d6c1c9214a558f58c9d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15934: 15934<br />
  IGT_9125: 9125</p>

</body>
</html>

--===============6785730274668629885==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5790DCA5FFE
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 04:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B162410E2C6;
	Tue,  6 Oct 2026 04:16:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDC010E1EE;
 Tue,  6 Oct 2026 04:15:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0366305358252721050=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_add_coverage_for_xe=5Fpxp?=
 =?utf-8?q?=5Fdebugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Oct 2026 04:15:15 -0000
Message-ID: <179126011524.242445.6143124975855150058@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
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

--===============0366305358252721050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add coverage for xe_pxp_debugfs
URL   : https://patchwork.freedesktop.org/series/175588/
State : success

== Summary ==

CI Bug Log - changes from IGT_9130 -> IGTPW_15944
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15944 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - bat-jsl-5:          [PASS][1] -> [ABORT][2] ([i915#17262]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9130/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  
  [i915#17262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9130 -> IGTPW_15944
  * Linux: CI_DRM_19281 -> CI_DRM_19285

  CI-20190529: 20190529
  CI_DRM_19281: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19285: 475230f9a51fc19f5097ddcbf94ebf3906d623d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15944: 15944
  IGT_9130: 9130

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/index.html

--===============0366305358252721050==
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
<tr><td><b>Series:</b></td><td>add coverage for xe_pxp_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175588/">https://patchwork.freedesktop.org/series/175588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9130 -&gt; IGTPW_15944</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15944 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9130/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15944/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17262">i915#17262</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9130 -&gt; IGTPW_15944</li>
<li>Linux: CI_DRM_19281 -&gt; CI_DRM_19285</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19281: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19285: 475230f9a51fc19f5097ddcbf94ebf3906d623d5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15944: 15944<br />
  IGT_9130: 9130</p>

</body>
</html>

--===============0366305358252721050==--

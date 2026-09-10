Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D52C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 17:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8E310E28E;
	Thu, 10 Sep 2026 17:07:07 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD0610E28E;
 Thu, 10 Sep 2026 17:06:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3237142614930110758=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/rendercopy=3A_Use_the?=
 =?utf-8?q?_Xe2+_depth_buffer_packet?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 17:06:19 -0000
Message-ID: <178905997997.147775.15432108336472418479@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910123935.4183522-1-jan.maslak@intel.com>
In-Reply-To: <20260910123935.4183522-1-jan.maslak@intel.com>
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

--===============3237142614930110758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/rendercopy: Use the Xe2+ depth buffer packet
URL   : https://patchwork.freedesktop.org/series/173791/
State : success

== Summary ==

CI Bug Log - changes from IGT_9090 -> IGTPW_15825
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15825 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - fi-tgl-1115g4:      [PASS][1] -> [ABORT][2] ([i915#16837] / [i915#16866] / [i915#16876]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9090/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
  [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9090 -> IGTPW_15825

  CI-20190529: 20190529
  CI_DRM_19120: b8885acadfe9e40109912dd45986112b007b0d98 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15825: 15825
  IGT_9090: 9090

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/index.html

--===============3237142614930110758==
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
<tr><td><b>Series:</b></td><td>lib/rendercopy: Use the Xe2+ depth buffer packet</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173791/">https://patchwork.freedesktop.org/series/173791/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9090 -&gt; IGTPW_15825</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15825 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9090/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15825/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9090 -&gt; IGTPW_15825</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19120: b8885acadfe9e40109912dd45986112b007b0d98 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15825: 15825<br />
  IGT_9090: 9090</p>

</body>
</html>

--===============3237142614930110758==--

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A075606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 00:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96ED10E8E2;
	Tue, 20 Oct 2026 00:23:01 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1F710E8E2;
 Tue, 20 Oct 2026 00:22:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8474595782765427954=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_co?=
 =?utf-8?q?ver_single-op_binds_reserving_unused_pgtable_ops_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Oct 2026 00:22:09 -0000
Message-ID: <179245572943.43556.12661745373983008333@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019194557.10403-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20261019194557.10403-1-jagmeet.randhawa@intel.com>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8474595782765427954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: cover single-op binds reserving unused pgtable ops (rev3)
URL   : https://patchwork.freedesktop.org/series/174452/
State : success

== Summary ==

CI Bug Log - changes from IGT_9153 -> IGTPW_16011
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_16011 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#17263])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9153/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][3] +20 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html

  
  [i915#17263]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17263


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9153 -> IGTPW_16011
  * Linux: CI_DRM_19363 -> CI_DRM_19365

  CI-20190529: 20190529
  CI_DRM_19363: 1589bbd5082f5b186f78f59e457bf596bdbd9ab9 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19365: 11ca87190e543407eeda66ed693e9d55cbdaf842 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16011: 16011
  IGT_9153: 9153

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/index.html

--===============8474595782765427954==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: cover single-op binds reserving unused pgtable ops (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174452/">https://patchwork.freedesktop.org/series/174452/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9153 -&gt; IGTPW_16011</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16011 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9153/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17263">i915#17263</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16011/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9153 -&gt; IGTPW_16011</li>
<li>Linux: CI_DRM_19363 -&gt; CI_DRM_19365</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19363: 1589bbd5082f5b186f78f59e457bf596bdbd9ab9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19365: 11ca87190e543407eeda66ed693e9d55cbdaf842 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16011: 16011<br />
  IGT_9153: 9153</p>

</body>
</html>

--===============8474595782765427954==--

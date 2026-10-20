Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571B606A31B
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 09:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600CA10F439;
	Tue, 20 Oct 2026 09:34:07 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4319F10F45C;
 Tue, 20 Oct 2026 09:33:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3337024116866936925=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tools/vmtb=3A_Add_VMTB_BM?=
 =?utf-8?q?G_and_PTL_testlists?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Adam Miszczak" <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Oct 2026 09:33:15 -0000
Message-ID: <179248879526.45575.14874230829623968683@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020074432.58422-1-adam.miszczak@linux.intel.com>
In-Reply-To: <20261020074432.58422-1-adam.miszczak@linux.intel.com>
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

--===============3337024116866936925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/vmtb: Add VMTB BMG and PTL testlists
URL   : https://patchwork.freedesktop.org/series/176467/
State : success

== Summary ==

CI Bug Log - changes from IGT_9153 -> IGTPW_16012
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16012 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][1] +20 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9153 -> IGTPW_16012
  * Linux: CI_DRM_19363 -> CI_DRM_19366

  CI-20190529: 20190529
  CI_DRM_19363: 1589bbd5082f5b186f78f59e457bf596bdbd9ab9 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16012: 16012
  IGT_9153: 9153

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/index.html

--===============3337024116866936925==
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
<tr><td><b>Series:</b></td><td>tools/vmtb: Add VMTB BMG and PTL testlists</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176467/">https://patchwork.freedesktop.org/series/176467/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9153 -&gt; IGTPW_16012</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16012 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-primary-mmap-gtt:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16012/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9153 -&gt; IGTPW_16012</li>
<li>Linux: CI_DRM_19363 -&gt; CI_DRM_19366</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19363: 1589bbd5082f5b186f78f59e457bf596bdbd9ab9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16012: 16012<br />
  IGT_9153: 9153</p>

</body>
</html>

--===============3337024116866936925==--

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0F606A31B
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 22:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57A10EB6C;
	Mon, 19 Oct 2026 22:22:41 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1D10EB3B;
 Mon, 19 Oct 2026 22:21:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0481758072987643195=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_runner=3A_create_new_opti?=
 =?utf-8?q?on_--max-reported-warns_for_dmeg_parsing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 22:21:52 -0000
Message-ID: <179244851244.43364.5285986088455750878@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
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

--===============0481758072987643195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: create new option --max-reported-warns for dmeg parsing
URL   : https://patchwork.freedesktop.org/series/176411/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9153 -> IGTPW_16009
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16009 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16009, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16009:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-bsw-n3050:       NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html

  
Known issues
------------

  Here are the changes found in IGTPW_16009 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][2] +20 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9153 -> IGTPW_16009

  CI-20190529: 20190529
  CI_DRM_19363: 1589bbd5082f5b186f78f59e457bf596bdbd9ab9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16009: 16009
  IGT_9153: 9153

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/index.html

--===============0481758072987643195==
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
<tr><td><b>Series:</b></td><td>runner: create new option --max-reported-warns for dmeg parsing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176411/">https://patchwork.freedesktop.org/series/176411/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9153 -&gt; IGTPW_16009</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16009 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16009, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16009:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16009 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-primary-mmap-gtt:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16009/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9153 -&gt; IGTPW_16009</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19363: 1589bbd5082f5b186f78f59e457bf596bdbd9ab9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16009: 16009<br />
  IGT_9153: 9153</p>

</body>
</html>

--===============0481758072987643195==--

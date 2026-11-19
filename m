Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7F606A330
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 12:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528C7112365;
	Thu, 19 Nov 2026 12:35:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F80D1121C6;
 Thu, 19 Nov 2026 12:34:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3752417474048791826=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fhangma?=
 =?utf-8?q?n=3A_Add_engine-error-state-skipped-capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Nov 2026 12:34:59 -0000
Message-ID: <179509169912.51087.342424757133879953@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3752417474048791826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_hangman: Add engine-error-state-skipped-capture
URL   : https://patchwork.freedesktop.org/series/178889/
State : success

== Summary ==

CI Bug Log - changes from IGT_9197 -> IGTPW_16171
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-skl-6600u 

Known issues
------------

  Here are the changes found in IGTPW_16171 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9197 -> IGTPW_16171
  * Linux: CI_DRM_19554 -> CI_DRM_19560

  CI-20190529: 20190529
  CI_DRM_19554: e2f954ea951b668430703f19387784f203ad71d0 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19560: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16171: 716e4d9c12f72bad9187e4777eb646f4d1b0e68c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9197: 9197

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html

--===============3752417474048791826==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_hangman: Add engine-error-state-skipped-capture</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178889/">https://patchwork.freedesktop.org/series/178889/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9197 -&gt; IGTPW_16171</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-skl-6600u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16171 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9197 -&gt; IGTPW_16171</li>
<li>Linux: CI_DRM_19554 -&gt; CI_DRM_19560</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19554: e2f954ea951b668430703f19387784f203ad71d0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19560: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16171: 716e4d9c12f72bad9187e4777eb646f4d1b0e68c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9197: 9197</p>

</body>
</html>

--===============3752417474048791826==--

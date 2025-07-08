Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F642C8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 19:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9797410E1BA;
	Tue,  8 Jul 2025 19:19:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF4D10E048;
 Tue,  8 Jul 2025 19:19:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0388564102289122661=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fcopy_=3A_A?=
 =?utf-8?q?dd_check_for_memset_and_memcpy_tests=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Jul 2025 19:19:14 -0000
Message-ID: <175200235444.145434.16101194929973877989@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708122056.1698837-1-sobin.thomas@intel.com>
In-Reply-To: <20250708122056.1698837-1-sobin.thomas@intel.com>
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

--===============0388564102289122661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_copy : Add check for memset and memcpy tests.
URL   : https://patchwork.freedesktop.org/series/151334/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8446_BAT -> XEIGTPW_13430_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13430_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13430_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13430_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8446/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13430_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8446/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8446 -> IGTPW_13430

  IGTPW_13430: 13430
  IGT_8446: 5832a01fd5922caabd22e057a6293f6707fac1eb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3372-de097594ab5dac2b7db67759c8ed7ce0e47f6f0c: de097594ab5dac2b7db67759c8ed7ce0e47f6f0c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/index.html

--===============0388564102289122661==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_copy : Add check for memset and memcpy tests.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151334/">https://patchwork.freedesktop.org/series/151334/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8446_BAT -&gt; XEIGTPW_13430_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13430_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13430_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13430_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8446/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13430_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8446/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13430/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8446 -&gt; IGTPW_13430</li>
</ul>
<p>IGTPW_13430: 13430<br />
  IGT_8446: 5832a01fd5922caabd22e057a6293f6707fac1eb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3372-de097594ab5dac2b7db67759c8ed7ce0e47f6f0c: de097594ab5dac2b7db67759c8ed7ce0e47f6f0c</p>

</body>
</html>

--===============0388564102289122661==--

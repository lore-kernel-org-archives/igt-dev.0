Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CAAC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 08:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B91892ED;
	Tue,  7 Jul 2026 08:49:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6965E892ED;
 Tue,  7 Jul 2026 08:49:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2056249448596166289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel-ci/chamelium-on?=
 =?utf-8?q?ly=2Etestlist=3A_Include_additional_chamelium_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jul 2026 08:49:29 -0000
Message-ID: <178341416942.159280.14583258925071848640@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707041956.39997-1-pranay.samala@intel.com>
In-Reply-To: <20260707041956.39997-1-pranay.samala@intel.com>
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

--===============2056249448596166289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/chamelium-only.testlist: Include additional chamelium tests (rev2)
URL   : https://patchwork.freedesktop.org/series/169021/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8991_BAT -> XEIGTPW_15476_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15476_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15476_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15476_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8991/bat-atsm-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15476/bat-atsm-2/igt@xe_waitfence@abstime.html

  


Build changes
-------------

  * IGT: IGT_8991 -> IGTPW_15476
  * Linux: xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 -> xe-5353-13b8728d576d9f91e074837b594bafc01a75632c

  IGTPW_15476: 15476
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907
  xe-5353-13b8728d576d9f91e074837b594bafc01a75632c: 13b8728d576d9f91e074837b594bafc01a75632c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15476/index.html

--===============2056249448596166289==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/chamelium-only.testlist: Include additional chamelium tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169021/">https://patchwork.freedesktop.org/series/169021/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15476/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15476/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8991_BAT -&gt; XEIGTPW_15476_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15476_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15476_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15476_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8991/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15476/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8991 -&gt; IGTPW_15476</li>
<li>Linux: xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 -&gt; xe-5353-13b8728d576d9f91e074837b594bafc01a75632c</li>
</ul>
<p>IGTPW_15476: 15476<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907<br />
  xe-5353-13b8728d576d9f91e074837b594bafc01a75632c: 13b8728d576d9f91e074837b594bafc01a75632c</p>

</body>
</html>

--===============2056249448596166289==--

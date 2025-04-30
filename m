Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC79CC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 18:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2D10E327;
	Wed, 30 Apr 2025 18:23:47 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5210E327;
 Wed, 30 Apr 2025 18:23:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2527186846181480012=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Allow_running_gitlab-ci_pip?=
 =?utf-8?q?e_locally?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 18:23:46 -0000
Message-ID: <174603742625.31323.7352090696621450926@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
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

--===============2527186846181480012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Allow running gitlab-ci pipe locally
URL   : https://patchwork.freedesktop.org/series/148504/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8349_BAT -> XEIGTPW_13072_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13072_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8349/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13072/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8349 -> IGTPW_13072

  IGTPW_13072: afad0b594880d4be0655717c7f548ff89069c015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8349: be0b7853bb2ded0b183e87bdaeab4318a7e2cd52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3013-1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d: 1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13072/index.html

--===============2527186846181480012==
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
<tr><td><b>Series:</b></td><td>Allow running gitlab-ci pipe locally</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148504/">https://patchwork.freedesktop.org/series/148504/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13072/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13072/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8349_BAT -&gt; XEIGTPW_13072_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13072_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8349/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13072/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8349 -&gt; IGTPW_13072</li>
</ul>
<p>IGTPW_13072: afad0b594880d4be0655717c7f548ff89069c015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8349: be0b7853bb2ded0b183e87bdaeab4318a7e2cd52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3013-1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d: 1351e9f42d757ef4ce7d2cf2401aa2b5fe36df6d</p>

</body>
</html>

--===============2527186846181480012==--

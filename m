Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC4D637B0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 20:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691C010E1E0;
	Wed, 13 Nov 2024 20:08:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8C410E1E0;
 Wed, 13 Nov 2024 20:08:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6162599063905583859=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=5Fspin=5Fbatch=3A_Add?=
 =?utf-8?q?_spin-timestamp-check_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 20:08:54 -0000
Message-ID: <173152853416.3666420.9233520581743103852@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113175207.399101-1-pravalika.gurram@intel.com>
In-Reply-To: <20241113175207.399101-1-pravalika.gurram@intel.com>
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

--===============6162599063905583859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_spin_batch: Add spin-timestamp-check (rev4)
URL   : https://patchwork.freedesktop.org/series/140933/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8107_BAT -> XEIGTPW_12095_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12095_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8107/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12095/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * IGT: IGT_8107 -> IGTPW_12095
  * Linux: xe-2221-169c7cd31a373ed31054abb423981856eb5fb119 -> xe-2222-9e35defd02728ad7c06347830022506488668c21

  IGTPW_12095: bc97f1ed54b4c60b1681c0f5e02ca07f9cfba1cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2221-169c7cd31a373ed31054abb423981856eb5fb119: 169c7cd31a373ed31054abb423981856eb5fb119
  xe-2222-9e35defd02728ad7c06347830022506488668c21: 9e35defd02728ad7c06347830022506488668c21

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12095/index.html

--===============6162599063905583859==
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
<tr><td><b>Series:</b></td><td>tests/xe_spin_batch: Add spin-timestamp-check (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140933/">https://patchwork.freedesktop.org/series/140933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12095/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8107_BAT -&gt; XEIGTPW_12095_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12095_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8107/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12095/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8107 -&gt; IGTPW_12095</li>
<li>Linux: xe-2221-169c7cd31a373ed31054abb423981856eb5fb119 -&gt; xe-2222-9e35defd02728ad7c06347830022506488668c21</li>
</ul>
<p>IGTPW_12095: bc97f1ed54b4c60b1681c0f5e02ca07f9cfba1cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2221-169c7cd31a373ed31054abb423981856eb5fb119: 169c7cd31a373ed31054abb423981856eb5fb119<br />
  xe-2222-9e35defd02728ad7c06347830022506488668c21: 9e35defd02728ad7c06347830022506488668c21</p>

</body>
</html>

--===============6162599063905583859==--

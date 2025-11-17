Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC2CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 15:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812F510E3EF;
	Mon, 17 Nov 2025 15:51:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510D710E3E9;
 Mon, 17 Nov 2025 15:51:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7208115336550157352=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/xe/xe=5Fquery=3A_implem?=
 =?utf-8?q?ent_few_query_helpers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Nov 2025 15:51:09 -0000
Message-ID: <176339466932.2323.92291274968816466@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
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

--===============7208115336550157352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: implement few query helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/157140/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8628_BAT -> XEIGTPW_14070_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14070_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8628/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14070/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8628 -> IGTPW_14070
  * Linux: xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11 -> xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab

  IGTPW_14070: 1457218aa88d68f4e2ee0ab690bab190009cfeff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8628: 8628
  xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11: b2e41c70a5eeddce427dc6df02508b6856eb4a11
  xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14070/index.html

--===============7208115336550157352==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: implement few query helpers (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157140/">https://patchwork.freedesktop.org/series/157140/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14070/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14070/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8628_BAT -&gt; XEIGTPW_14070_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14070_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8628/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14070/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8628 -&gt; IGTPW_14070</li>
<li>Linux: xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11 -&gt; xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab</li>
</ul>
<p>IGTPW_14070: 1457218aa88d68f4e2ee0ab690bab190009cfeff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8628: 8628<br />
  xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11: b2e41c70a5eeddce427dc6df02508b6856eb4a11<br />
  xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab</p>

</body>
</html>

--===============7208115336550157352==--

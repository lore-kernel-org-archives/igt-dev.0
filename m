Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2260C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 22:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5980310E15C;
	Mon, 24 Mar 2025 22:22:10 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039C410E15C;
 Mon, 24 Mar 2025 22:22:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0400301032430025210=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fbatchbuffer=3A_?=
 =?utf-8?q?Refactor_igt=5Fget=5Frender=5Fcopyfunc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 24 Mar 2025 22:22:09 -0000
Message-ID: <174285492901.75091.8160370433002769442@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324093627.3711195-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250324093627.3711195-1-sai.teja.pottumuttu@intel.com>
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

--===============0400301032430025210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: Refactor igt_get_render_copyfunc
URL   : https://patchwork.freedesktop.org/series/146654/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8281_BAT -> XEIGTPW_12821_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_12821_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12821_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12821_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          [SKIP][1] ([Intel XE#976]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8281/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12821/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976


Build changes
-------------

  * IGT: IGT_8281 -> IGTPW_12821

  IGTPW_12821: 12821
  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c: 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12821/index.html

--===============0400301032430025210==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: Refactor igt_get_render_copyfunc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146654/">https://patchwork.freedesktop.org/series/146654/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12821/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12821/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8281_BAT -&gt; XEIGTPW_12821_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_12821_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12821_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12821_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc@render:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8281/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12821/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8281 -&gt; IGTPW_12821</li>
</ul>
<p>IGTPW_12821: 12821<br />
  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c: 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c</p>

</body>
</html>

--===============0400301032430025210==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B819E9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 17:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A789289;
	Wed, 18 Feb 2026 17:31:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8615E89289;
 Wed, 18 Feb 2026 17:31:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2314626589765669816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_panthor=3A_Enable_compilati?=
 =?utf-8?q?on_on_big-endian_arch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Feb 2026 17:31:43 -0000
Message-ID: <177143590352.262680.11185693207576271653@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
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

--===============2314626589765669816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: panthor: Enable compilation on big-endian arch
URL   : https://patchwork.freedesktop.org/series/161768/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8760_BAT -> XEIGTPW_14569_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14569_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [DMESG-WARN][1] ([Intel XE#7110]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8760/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * IGT: IGT_8760 -> IGTPW_14569
  * Linux: xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d -> xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5

  IGTPW_14569: 14569
  IGT_8760: 8760
  xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d: fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d
  xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5: 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/index.html

--===============2314626589765669816==
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
<tr><td><b>Series:</b></td><td>panthor: Enable compilation on big-endian arch</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161768/">https://patchwork.freedesktop.org/series/161768/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8760_BAT -&gt; XEIGTPW_14569_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14569_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8760/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8760 -&gt; IGTPW_14569</li>
<li>Linux: xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d -&gt; xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5</li>
</ul>
<p>IGTPW_14569: 14569<br />
  IGT_8760: 8760<br />
  xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d: fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d<br />
  xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5: 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5</p>

</body>
</html>

--===============2314626589765669816==--

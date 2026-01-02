Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1F1FA3755
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 19:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E8E10E2D3;
	Fri,  2 Jan 2026 19:23:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5F10E2D3;
 Fri,  2 Jan 2026 19:23:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2947676145043301939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fdevice=5Finfo?=
 =?utf-8?q?=3A_get_the_xe_=2Egraphics=5Frel_from_GMD=5FID_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Jan 2026 19:23:01 -0000
Message-ID: <176738178144.123322.6663517855061593062@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217043450.241761-1-x.wang@intel.com>
In-Reply-To: <20251217043450.241761-1-x.wang@intel.com>
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

--===============2947676145043301939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_device_info: get the xe .graphics_rel from GMD_ID (rev5)
URL   : https://patchwork.freedesktop.org/series/159129/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8681_BAT -> XEIGTPW_14279_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14279_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [ABORT][1] ([Intel XE#6922] / [Intel XE#6930]) -> [ABORT][2] ([Intel XE#6922])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/bat-bmg-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14279/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#6922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922
  [Intel XE#6930]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930


Build changes
-------------

  * IGT: IGT_8681 -> IGTPW_14279
  * Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -> xe-4322-56a791b474c0faeff1a2ed97660224617c2b9d2b

  IGTPW_14279: 14279
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb
  xe-4322-56a791b474c0faeff1a2ed97660224617c2b9d2b: 56a791b474c0faeff1a2ed97660224617c2b9d2b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14279/index.html

--===============2947676145043301939==
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
<tr><td><b>Series:</b></td><td>lib/intel_device_info: get the xe .graphics_rel from GMD_ID (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159129/">https://patchwork.freedesktop.org/series/159129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14279/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14279/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8681_BAT -&gt; XEIGTPW_14279_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14279_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922">Intel XE#6922</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6930">Intel XE#6930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14279/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6922">Intel XE#6922</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8681 -&gt; IGTPW_14279</li>
<li>Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -&gt; xe-4322-56a791b474c0faeff1a2ed97660224617c2b9d2b</li>
</ul>
<p>IGTPW_14279: 14279<br />
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb<br />
  xe-4322-56a791b474c0faeff1a2ed97660224617c2b9d2b: 56a791b474c0faeff1a2ed97660224617c2b9d2b</p>

</body>
</html>

--===============2947676145043301939==--

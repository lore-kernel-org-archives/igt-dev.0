Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC56AC88E4C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 08:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ECF10F572;
	Fri, 11 Sep 2026 08:24:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556CE10F572;
 Fri, 11 Sep 2026 08:23:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7260511085590102260=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Fdevice=5Fsysfs_coverag?=
 =?utf-8?q?e_updates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2026 08:23:32 -0000
Message-ID: <178911501234.148519.320000246520251448@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
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

--===============7260511085590102260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_device_sysfs coverage updates (rev2)
URL   : https://patchwork.freedesktop.org/series/172769/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9091_BAT -> XEIGTPW_15831_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15831_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [TIMEOUT][1] ([Intel XE#9152]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9091/bat-ptl-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15831/bat-ptl-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#9152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152


Build changes
-------------

  * IGT: IGT_9091 -> IGTPW_15831

  IGTPW_15831: 15831
  IGT_9091: 9091
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15831/index.html

--===============7260511085590102260==
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
<tr><td><b>Series:</b></td><td>xe_device_sysfs coverage updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172769/">https://patchwork.freedesktop.org/series/172769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15831/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15831/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9091_BAT -&gt; XEIGTPW_15831_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15831_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9091/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152">Intel XE#9152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15831/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9091 -&gt; IGTPW_15831</li>
</ul>
<p>IGTPW_15831: 15831<br />
  IGT_9091: 9091<br />
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d</p>

</body>
</html>

--===============7260511085590102260==--

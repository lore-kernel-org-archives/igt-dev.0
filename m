Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6F3C9830E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD7910E178;
	Thu, 24 Sep 2026 08:56:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208F10E178;
 Thu, 24 Sep 2026 08:55:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0694605022909726792=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_include/drm-uapi/amdgpu=3A_add_queue_id_to_user_queue?=
 =?utf-8?q?_wait_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Sep 2026 08:55:44 -0000
Message-ID: <179024014459.202156.13128081117415567158@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924074500.169386-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260924074500.169386-1-Jesse.Zhang@amd.com>
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

--===============0694605022909726792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] include/drm-uapi/amdgpu: add queue id to user queue wait IOCTL
URL   : https://patchwork.freedesktop.org/series/174879/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9111_BAT -> XEIGTPW_15894_BAT
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

  Here are the changes found in XEIGTPW_15894_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][1] ([Intel XE#9109]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15894/bat-ptl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * IGT: IGT_9111 -> IGTPW_15894
  * Linux: xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04 -> xe-5818-1a702d79afe36153e37dd9784fde95f9f86ea03f

  IGTPW_15894: c4192bc8234d2e5296626abca432c748b3b59e47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04
  xe-5818-1a702d79afe36153e37dd9784fde95f9f86ea03f: 1a702d79afe36153e37dd9784fde95f9f86ea03f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15894/index.html

--===============0694605022909726792==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] include/drm-uapi/amdgpu: add queue id to user queue wait IOCTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174879/">https://patchwork.freedesktop.org/series/174879/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15894/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15894/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9111_BAT -&gt; XEIGTPW_15894_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15894_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15894/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9111 -&gt; IGTPW_15894</li>
<li>Linux: xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04 -&gt; xe-5818-1a702d79afe36153e37dd9784fde95f9f86ea03f</li>
</ul>
<p>IGTPW_15894: c4192bc8234d2e5296626abca432c748b3b59e47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04<br />
  xe-5818-1a702d79afe36153e37dd9784fde95f9f86ea03f: 1a702d79afe36153e37dd9784fde95f9f86ea03f</p>

</body>
</html>

--===============0694605022909726792==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D85CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 18:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2344910E645;
	Tue, 28 Oct 2025 18:18:20 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405010E642;
 Tue, 28 Oct 2025 18:18:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2711136688634611439=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_MediaTek_devices_suppor?=
 =?utf-8?q?t_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Oct 2025 18:18:19 -0000
Message-ID: <176167549900.64512.2596426499045643455@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028160738.3624415-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20251028160738.3624415-1-jason-jh.lin@mediatek.com>
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

--===============2711136688634611439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add MediaTek devices support (rev3)
URL   : https://patchwork.freedesktop.org/series/155789/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8599_BAT -> XEIGTPW_13957_BAT
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

  Here are the changes found in XEIGTPW_13957_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8599/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8599/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8599 -> IGTPW_13957

  IGTPW_13957: 9027f4f70ba8bd3d40f189881c59ddadb18283d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8599: b22b9ca357de868f3848269e5eb7c4cc53b3f2d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d: 5742fc7aea99a1326637a7106eeaeac383a1c76d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/index.html

--===============2711136688634611439==
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
<tr><td><b>Series:</b></td><td>Add MediaTek devices support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155789/">https://patchwork.freedesktop.org/series/155789/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8599_BAT -&gt; XEIGTPW_13957_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13957_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8599/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8599/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13957/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8599 -&gt; IGTPW_13957</li>
</ul>
<p>IGTPW_13957: 9027f4f70ba8bd3d40f189881c59ddadb18283d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8599: b22b9ca357de868f3848269e5eb7c4cc53b3f2d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d: 5742fc7aea99a1326637a7106eeaeac383a1c76d</p>

</body>
</html>

--===============2711136688634611439==--

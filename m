Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22E0CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 07:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708EF10E3C3;
	Mon, 22 Sep 2025 07:15:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC2010E3C3;
 Mon, 22 Sep 2025 07:15:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3386461561152721343=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/compute=3A_choose_BO_al?=
 =?utf-8?q?ignment_based_on_driver_type?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Smitha Balasubramanyam" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Sep 2025 07:15:07 -0000
Message-ID: <175852530737.352465.5313700276997259889@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
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

--===============3386461561152721343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/compute: choose BO alignment based on driver type
URL   : https://patchwork.freedesktop.org/series/154823/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8546_BAT -> XEIGTPW_13793_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13793_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8546/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13793/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8546 -> IGTPW_13793
  * Linux: xe-3802-6279a928fb7ed7a69e44171637abf2bf50668a9c -> xe-3807-ab5df5c6e52762d79c15c921a64dc1bc4e3572b1

  IGTPW_13793: a2aaf003fb7b710fdc5f4fba98c844777a2120c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8546: 8546
  xe-3802-6279a928fb7ed7a69e44171637abf2bf50668a9c: 6279a928fb7ed7a69e44171637abf2bf50668a9c
  xe-3807-ab5df5c6e52762d79c15c921a64dc1bc4e3572b1: ab5df5c6e52762d79c15c921a64dc1bc4e3572b1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13793/index.html

--===============3386461561152721343==
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
<tr><td><b>Series:</b></td><td>lib/compute: choose BO alignment based on driver type</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154823/">https://patchwork.freedesktop.org/series/154823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13793/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13793/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8546_BAT -&gt; XEIGTPW_13793_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13793_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8546/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13793/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8546 -&gt; IGTPW_13793</li>
<li>Linux: xe-3802-6279a928fb7ed7a69e44171637abf2bf50668a9c -&gt; xe-3807-ab5df5c6e52762d79c15c921a64dc1bc4e3572b1</li>
</ul>
<p>IGTPW_13793: a2aaf003fb7b710fdc5f4fba98c844777a2120c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8546: 8546<br />
  xe-3802-6279a928fb7ed7a69e44171637abf2bf50668a9c: 6279a928fb7ed7a69e44171637abf2bf50668a9c<br />
  xe-3807-ab5df5c6e52762d79c15c921a64dc1bc4e3572b1: ab5df5c6e52762d79c15c921a64dc1bc4e3572b1</p>

</body>
</html>

--===============3386461561152721343==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D7CCA0EEB
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 00:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFF610E02C;
	Wed, 20 Aug 2025 00:01:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE9810E02C;
 Wed, 20 Aug 2025 00:01:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5420413595356122507=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Flegacy?=
 =?utf-8?q?=3A_don=27t_inhibit_pipe_CRC_calculation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 Aug 2025 00:01:55 -0000
Message-ID: <175564811529.250192.7411090400260840428@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818114207.2251823-1-michal.grzelak@intel.com>
In-Reply-To: <20250818114207.2251823-1-michal.grzelak@intel.com>
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

--===============5420413595356122507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_legacy: don't inhibit pipe CRC calculation (rev3)
URL   : https://patchwork.freedesktop.org/series/151943/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8498_BAT -> XEIGTPW_13604_BAT
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

  Here are the changes found in XEIGTPW_13604_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8498/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13604/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8498 -> IGTPW_13604
  * Linux: xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -> xe-3580-58aeea9c7882b70436d9c2e55e45738711a41621

  IGTPW_13604: e1558e7f5db628fa01cce07d96416dce0dd4f40a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8498: 8498
  xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa
  xe-3580-58aeea9c7882b70436d9c2e55e45738711a41621: 58aeea9c7882b70436d9c2e55e45738711a41621

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13604/index.html

--===============5420413595356122507==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: don&#x27;t inhibit pipe CRC calculation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151943/">https://patchwork.freedesktop.org/series/151943/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13604/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13604/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8498_BAT -&gt; XEIGTPW_13604_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13604_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8498/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13604/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8498 -&gt; IGTPW_13604</li>
<li>Linux: xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -&gt; xe-3580-58aeea9c7882b70436d9c2e55e45738711a41621</li>
</ul>
<p>IGTPW_13604: e1558e7f5db628fa01cce07d96416dce0dd4f40a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8498: 8498<br />
  xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa<br />
  xe-3580-58aeea9c7882b70436d9c2e55e45738711a41621: 58aeea9c7882b70436d9c2e55e45738711a41621</p>

</body>
</html>

--===============5420413595356122507==--

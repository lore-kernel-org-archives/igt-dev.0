Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E338CCD1BF
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 06:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F32910E129;
	Wed, 29 Oct 2025 06:34:19 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9244110E129;
 Wed, 29 Oct 2025 06:34:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5771191699502775227=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_RFC=3A_tools/gputop=3A_Add_?=
 =?utf-8?q?GPU_frequencies_to_the_client_headers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 Oct 2025 06:34:17 -0000
Message-ID: <176171965758.66493.2504615664859454027@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251029053141.3619261-1-s.sebinraj@intel.com>
In-Reply-To: <20251029053141.3619261-1-s.sebinraj@intel.com>
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

--===============5771191699502775227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: tools/gputop: Add GPU frequencies to the client headers (rev2)
URL   : https://patchwork.freedesktop.org/series/156602/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8599_BAT -> XEIGTPW_13961_BAT
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

  Here are the changes found in XEIGTPW_13961_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8599/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13961/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8599 -> IGTPW_13961
  * Linux: xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d -> xe-4000-62fe6039c8508b5dba1f64e3bc8dfe555f95afc2

  IGTPW_13961: 13961
  IGT_8599: b22b9ca357de868f3848269e5eb7c4cc53b3f2d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d: 5742fc7aea99a1326637a7106eeaeac383a1c76d
  xe-4000-62fe6039c8508b5dba1f64e3bc8dfe555f95afc2: 62fe6039c8508b5dba1f64e3bc8dfe555f95afc2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13961/index.html

--===============5771191699502775227==
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
<tr><td><b>Series:</b></td><td>RFC: tools/gputop: Add GPU frequencies to the client headers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156602/">https://patchwork.freedesktop.org/series/156602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13961/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13961/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8599_BAT -&gt; XEIGTPW_13961_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13961_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8599/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13961/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8599 -&gt; IGTPW_13961</li>
<li>Linux: xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d -&gt; xe-4000-62fe6039c8508b5dba1f64e3bc8dfe555f95afc2</li>
</ul>
<p>IGTPW_13961: 13961<br />
  IGT_8599: b22b9ca357de868f3848269e5eb7c4cc53b3f2d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3996-5742fc7aea99a1326637a7106eeaeac383a1c76d: 5742fc7aea99a1326637a7106eeaeac383a1c76d<br />
  xe-4000-62fe6039c8508b5dba1f64e3bc8dfe555f95afc2: 62fe6039c8508b5dba1f64e3bc8dfe555f95afc2</p>

</body>
</html>

--===============5771191699502775227==--

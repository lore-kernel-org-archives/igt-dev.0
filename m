Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5EBE7FDFB
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 00:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447CB10E2F6;
	Tue,  3 Feb 2026 00:54:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465710E496;
 Tue,  3 Feb 2026 00:54:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5059312888624714746=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fflip=3A_test_su?=
 =?utf-8?q?spend_on_one_pair_of_pipes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Feb 2026 00:54:28 -0000
Message-ID: <177008006851.218362.11143183855926694851@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202082700.3194987-1-michal.grzelak@intel.com>
In-Reply-To: <20260202082700.3194987-1-michal.grzelak@intel.com>
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

--===============5059312888624714746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: test suspend on one pair of pipes (rev2)
URL   : https://patchwork.freedesktop.org/series/160582/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8729_BAT -> XEIGTPW_14466_BAT
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

  Here are the changes found in XEIGTPW_14466_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14466/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8729 -> IGTPW_14466
  * Linux: xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93 -> xe-4486-67c3b61c4451b33dbf846f97cb2389b7fb6db09d

  IGTPW_14466: 519c0654f55b1cca04304c23a78995ed64ba65e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8729: 8729
  xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93: 88c5cd5324a45f418e99c62974a746596bc81d93
  xe-4486-67c3b61c4451b33dbf846f97cb2389b7fb6db09d: 67c3b61c4451b33dbf846f97cb2389b7fb6db09d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14466/index.html

--===============5059312888624714746==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: test suspend on one pair of pipes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160582/">https://patchwork.freedesktop.org/series/160582/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14466/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14466/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8729_BAT -&gt; XEIGTPW_14466_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14466_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14466/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8729 -&gt; IGTPW_14466</li>
<li>Linux: xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93 -&gt; xe-4486-67c3b61c4451b33dbf846f97cb2389b7fb6db09d</li>
</ul>
<p>IGTPW_14466: 519c0654f55b1cca04304c23a78995ed64ba65e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8729: 8729<br />
  xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93: 88c5cd5324a45f418e99c62974a746596bc81d93<br />
  xe-4486-67c3b61c4451b33dbf846f97cb2389b7fb6db09d: 67c3b61c4451b33dbf846f97cb2389b7fb6db09d</p>

</body>
</html>

--===============5059312888624714746==--

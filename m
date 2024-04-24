Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9059AC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 23:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DCF10E68B;
	Wed, 24 Apr 2024 23:08:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77F10E68B;
 Wed, 24 Apr 2024 23:08:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4932156520777499267=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Always_?=
 =?utf-8?q?have_at_least_2_pages_bound_in_mmap_hammer_sections_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Apr 2024 23:08:31 -0000
Message-ID: <171400011182.1632086.14985481034844632720@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <ddcb7264271a3aca34f3074e86ab7e04f24f851b.1713995117.git.jagmeet.randhawa@intel.com>
In-Reply-To: <ddcb7264271a3aca34f3074e86ab7e04f24f851b.1713995117.git.jagmeet.randhawa@intel.com>
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

--===============4932156520777499267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Always have at least 2 pages bound in mmap hammer sections (rev2)
URL   : https://patchwork.freedesktop.org/series/132869/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7823_BAT -> XEIGTPW_11067_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7823 -> IGTPW_11067
  * Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -> xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8

  IGTPW_11067: 864eb45daa3848c0b7d53ea1749e4b9e0d254b33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11067/index.html

--===============4932156520777499267==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Always have at least 2 pages bound in mmap hammer sections (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132869/">https://patchwork.freedesktop.org/series/132869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11067/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11067/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7823_BAT -&gt; XEIGTPW_11067_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7823 -&gt; IGTPW_11067</li>
<li>Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -&gt; xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8</li>
</ul>
<p>IGTPW_11067: 864eb45daa3848c0b7d53ea1749e4b9e0d254b33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7<br />
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8</p>

</body>
</html>

--===============4932156520777499267==--

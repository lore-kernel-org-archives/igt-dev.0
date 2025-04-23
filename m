Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9487FC369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 22:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487D410E39E;
	Wed, 23 Apr 2025 22:16:33 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E9710E398;
 Wed, 23 Apr 2025 22:16:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1155078791387049008=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMvaW50ZWwveGVfZmF1bHRf?=
 =?utf-8?b?aW5qZWN0aW9uOiBJbmplY3QgZXJyb3JzIGR1cmluZyB4ZV9ndWNfY3Rfc2VuZF9y?=
 =?utf-8?b?ZWN2KCkgeGVfZ3VjX21taW9fc2VuZF9yZWN2KCkgKHJldjkp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Apr 2025 22:16:31 -0000
Message-ID: <174544659143.2742.4490942352624242294@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250422102941.1678-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250422102941.1678-1-satyanarayana.k.v.p@intel.com>
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

--===============1155078791387049008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv() xe_guc_mmio_send_recv() (rev9)
URL   : https://patchwork.freedesktop.org/series/144466/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8331_BAT -> XEIGTPW_13019_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13019_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4829]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#4829]) -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  
  [Intel XE#4829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829


Build changes
-------------

  * IGT: IGT_8331 -> IGTPW_13019
  * Linux: xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191 -> xe-2982-2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402

  IGTPW_13019: 80282a6ac933646dc5af5808cc81a703dfd6c681 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8331: e209a9bb68d2b524c7eeed1cb87abb4e187f2b78 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191
  xe-2982-2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402: 2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/index.html

--===============1155078791387049008==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv() xe_guc_mmio_send_recv() (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144466/">https://patchwork.freedesktop.org/series/144466/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8331_BAT -&gt; XEIGTPW_13019_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13019_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13019/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8331 -&gt; IGTPW_13019</li>
<li>Linux: xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191 -&gt; xe-2982-2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402</li>
</ul>
<p>IGTPW_13019: 80282a6ac933646dc5af5808cc81a703dfd6c681 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8331: e209a9bb68d2b524c7eeed1cb87abb4e187f2b78 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191<br />
  xe-2982-2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402: 2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402</p>

</body>
</html>

--===============1155078791387049008==--

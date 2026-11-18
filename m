Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD9606A32A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 07:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CA10E6F5;
	Wed, 18 Nov 2026 07:41:42 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8F10E637;
 Wed, 18 Nov 2026 07:40:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8733198469012182136=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2CV2=2C1/8=5D_tests/amdgpu=3A_Add_SLTH_validation_tests_for_tr?=
 =?utf-8?q?ap_handling_and_trap_return=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Nov 2026 07:40:42 -0000
Message-ID: <179498764237.41338.14929911225073113915@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8733198469012182136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/8] tests/amdgpu: Add SLTH validation tests for trap handling and trap return.
URL   : https://patchwork.freedesktop.org/series/178848/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9196_BAT -> XEIGTPW_16168_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9196 -> IGTPW_16168
  * Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -> xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf

  IGTPW_16168: 16168
  IGT_9196: 9196
  xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda
  xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf: 0249d68f50c265a0f17c06fc21906fda945fe2cf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16168/index.html

--===============8733198469012182136==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/8] tests/amdgpu: Add SLTH validation tests for trap handling and trap return.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178848/">https://patchwork.freedesktop.org/series/178848/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16168/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16168/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9196_BAT -&gt; XEIGTPW_16168_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9196 -&gt; IGTPW_16168</li>
<li>Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -&gt; xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf</li>
</ul>
<p>IGTPW_16168: 16168<br />
  IGT_9196: 9196<br />
  xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda<br />
  xe-6169-0249d68f50c265a0f17c06fc21906fda945fe2cf: 0249d68f50c265a0f17c06fc21906fda945fe2cf</p>

</body>
</html>

--===============8733198469012182136==--

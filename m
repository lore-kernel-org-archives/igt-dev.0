Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F6606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 11:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D071810E61F;
	Wed, 28 Oct 2026 11:12:12 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD3F10FB63;
 Wed, 28 Oct 2026 11:11:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8100413935182892256=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/msm/msm=5Fbo=3A_Exten?=
 =?utf-8?q?d_buffer_object_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jitta Vignan" <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Oct 2026 11:11:20 -0000
Message-ID: <179318588003.81125.2423415409972778246@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
In-Reply-To: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
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

--===============8100413935182892256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm/msm_bo: Extend buffer object test
URL   : https://patchwork.freedesktop.org/series/177014/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9169_BAT -> XEIGTPW_16060_BAT
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

  Here are the changes found in XEIGTPW_16060_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9362]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9169/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16060/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362


Build changes
-------------

  * IGT: IGT_9169 -> IGTPW_16060

  IGTPW_16060: 16060
  IGT_9169: 9169
  xe-6018-6a182ac542350dbca9147134654c35e463aa1382: 6a182ac542350dbca9147134654c35e463aa1382

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16060/index.html

--===============8100413935182892256==
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
<tr><td><b>Series:</b></td><td>tests/msm/msm_bo: Extend buffer object test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177014/">https://patchwork.freedesktop.org/series/177014/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16060/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16060/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9169_BAT -&gt; XEIGTPW_16060_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16060_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_compute_preempt@compute-threadgroup-preempt:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9169/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16060/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9169 -&gt; IGTPW_16060</li>
</ul>
<p>IGTPW_16060: 16060<br />
  IGT_9169: 9169<br />
  xe-6018-6a182ac542350dbca9147134654c35e463aa1382: 6a182ac542350dbca9147134654c35e463aa1382</p>

</body>
</html>

--===============8100413935182892256==--

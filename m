Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C536606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 01:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEDB10E67B;
	Tue, 10 Nov 2026 01:08:56 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C0610E1EB;
 Tue, 10 Nov 2026 01:07:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3136310107511739455=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Flink=5Fm?=
 =?utf-8?q?=5Fn=3A_Add_DisplayPort_Link_M/N_ratio_validation_tests_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 01:07:58 -0000
Message-ID: <179427287865.11.4939603788150145739@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
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

--===============3136310107511739455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_link_m_n: Add DisplayPort Link M/N ratio validation tests (rev2)
URL   : https://patchwork.freedesktop.org/series/176310/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9182_BAT -> XEIGTPW_16122_BAT
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

  Here are the changes found in XEIGTPW_16122_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9182/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16122/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9182 -> IGTPW_16122
  * Linux: xe-6095-d72707a042b6aff601449a9cf87e5fe55decbc5c -> xe-6097-808930035a8f606c1e19906bf8f2704b77c08e27

  IGTPW_16122: 16122
  IGT_9182: 9182
  xe-6095-d72707a042b6aff601449a9cf87e5fe55decbc5c: d72707a042b6aff601449a9cf87e5fe55decbc5c
  xe-6097-808930035a8f606c1e19906bf8f2704b77c08e27: 808930035a8f606c1e19906bf8f2704b77c08e27

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16122/index.html

--===============3136310107511739455==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_link_m_n: Add DisplayPort Link M/N ratio validation tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176310/">https://patchwork.freedesktop.org/series/176310/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16122/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16122/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9182_BAT -&gt; XEIGTPW_16122_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16122_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9182/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16122/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9182 -&gt; IGTPW_16122</li>
<li>Linux: xe-6095-d72707a042b6aff601449a9cf87e5fe55decbc5c -&gt; xe-6097-808930035a8f606c1e19906bf8f2704b77c08e27</li>
</ul>
<p>IGTPW_16122: 16122<br />
  IGT_9182: 9182<br />
  xe-6095-d72707a042b6aff601449a9cf87e5fe55decbc5c: d72707a042b6aff601449a9cf87e5fe55decbc5c<br />
  xe-6097-808930035a8f606c1e19906bf8f2704b77c08e27: 808930035a8f606c1e19906bf8f2704b77c08e27</p>

</body>
</html>

--===============3136310107511739455==--

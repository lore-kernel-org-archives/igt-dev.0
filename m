Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86007606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 22:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271CF10E21B;
	Fri, 27 Nov 2026 22:34:34 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0285F10E5C5;
 Fri, 27 Nov 2026 22:33:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0289565972121965493=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm-uapi/drm=3A_sync_with_k?=
 =?utf-8?q?ernel_a1b6cf8e5e7e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Nov 2026 22:33:37 -0000
Message-ID: <179581881700.2888.8169830565971234410@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127120012.79600-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261127120012.79600-1-kamil.konieczny@linux.intel.com>
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

--===============0289565972121965493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/drm: sync with kernel a1b6cf8e5e7e
URL   : https://patchwork.freedesktop.org/series/179870/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9210_BAT -> XEIGTPW_16234_BAT
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

  Here are the changes found in XEIGTPW_16234_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9841])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9210/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4] ([Intel XE#9841])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9210/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * IGT: IGT_9210 -> IGTPW_16234

  IGTPW_16234: 16234
  IGT_9210: 9210
  xe-6251-994d8de7b77818fa55d1b7fc0a06dfd8eff8a595: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/index.html

--===============0289565972121965493==
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
<tr><td><b>Series:</b></td><td>drm-uapi/drm: sync with kernel a1b6cf8e5e7e</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179870/">https://patchwork.freedesktop.org/series/179870/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9210_BAT -&gt; XEIGTPW_16234_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16234_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9210/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9210/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16234/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9210 -&gt; IGTPW_16234</li>
</ul>
<p>IGTPW_16234: 16234<br />
  IGT_9210: 9210<br />
  xe-6251-994d8de7b77818fa55d1b7fc0a06dfd8eff8a595: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595</p>

</body>
</html>

--===============0289565972121965493==--

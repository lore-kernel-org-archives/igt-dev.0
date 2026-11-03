Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EB606E6E2
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 14:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498F710F635;
	Tue,  3 Nov 2026 14:49:22 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FF410F625;
 Tue,  3 Nov 2026 14:48:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1855341032598813392=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/chamelium/kms=5Fchame?=
 =?utf-8?q?lium=5Fhpd=3A_Name_the_host_waker_when_no_PME_is_seen?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Nov 2026 14:48:21 -0000
Message-ID: <179371730128.110810.8863594300625142773@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103093521.1428284-1-pranay.samala@intel.com>
In-Reply-To: <20261103093521.1428284-1-pranay.samala@intel.com>
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

--===============1855341032598813392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium/kms_chamelium_hpd: Name the host waker when no PME is seen
URL   : https://patchwork.freedesktop.org/series/177579/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9176_BAT -> XEIGTPW_16091_BAT
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

  Here are the changes found in XEIGTPW_16091_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9176/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16091/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9176 -> IGTPW_16091
  * Linux: xe-6051-279235273fc6c0a33df863b4a1cc52ec1e73aba5 -> xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17

  IGTPW_16091: 16091
  IGT_9176: 9176
  xe-6051-279235273fc6c0a33df863b4a1cc52ec1e73aba5: 279235273fc6c0a33df863b4a1cc52ec1e73aba5
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16091/index.html

--===============1855341032598813392==
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
<tr><td><b>Series:</b></td><td>tests/chamelium/kms_chamelium_hpd: Name the host waker when no PME is seen</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177579/">https://patchwork.freedesktop.org/series/177579/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16091/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16091/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9176_BAT -&gt; XEIGTPW_16091_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16091_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9176/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16091/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9176 -&gt; IGTPW_16091</li>
<li>Linux: xe-6051-279235273fc6c0a33df863b4a1cc52ec1e73aba5 -&gt; xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17</li>
</ul>
<p>IGTPW_16091: 16091<br />
  IGT_9176: 9176<br />
  xe-6051-279235273fc6c0a33df863b4a1cc52ec1e73aba5: 279235273fc6c0a33df863b4a1cc52ec1e73aba5<br />
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17</p>

</body>
</html>

--===============1855341032598813392==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33373CAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 14:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84AF10EB47;
	Thu, 11 Sep 2025 14:28:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB5110EB45;
 Thu, 11 Sep 2025 14:28:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2273221872498940497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_DONT=5FMERGE=3A_tests/xe=5F?=
 =?utf-8?q?intel=5Fbb=3A_repro_for_pthread=5Fkill=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Sep 2025 14:28:24 -0000
Message-ID: <175760090421.326695.4538718488601194152@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250911114554.2380485-2-zbigniew.kempczynski@intel.com>
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

--===============2273221872498940497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DONT_MERGE: tests/xe_intel_bb: repro for pthread_kill()
URL   : https://patchwork.freedesktop.org/series/154383/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8535_BAT -> XEIGTPW_13732_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13732_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_debugfs@read-all-entries}:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/bat-atsm-2/igt@core_debugfs@read-all-entries.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13732_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8535 -> IGTPW_13732
  * Linux: xe-3724-f251150579f93807f196c33b8716f14c1fd136e6 -> xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60

  IGTPW_13732: 13732
  IGT_8535: 8535
  xe-3724-f251150579f93807f196c33b8716f14c1fd136e6: f251150579f93807f196c33b8716f14c1fd136e6
  xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60: a76438ef96a214378c040a10b853f9b52b4ded60

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/index.html

--===============2273221872498940497==
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
<tr><td><b>Series:</b></td><td>DONT_MERGE: tests/xe_intel_bb: repro for pthread_kill()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154383/">https://patchwork.freedesktop.org/series/154383/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8535_BAT -&gt; XEIGTPW_13732_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13732_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@core_debugfs@read-all-entries}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8535/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13732/bat-atsm-2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13732_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8535 -&gt; IGTPW_13732</li>
<li>Linux: xe-3724-f251150579f93807f196c33b8716f14c1fd136e6 -&gt; xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60</li>
</ul>
<p>IGTPW_13732: 13732<br />
  IGT_8535: 8535<br />
  xe-3724-f251150579f93807f196c33b8716f14c1fd136e6: f251150579f93807f196c33b8716f14c1fd136e6<br />
  xe-3725-a76438ef96a214378c040a10b853f9b52b4ded60: a76438ef96a214378c040a10b853f9b52b4ded60</p>

</body>
</html>

--===============2273221872498940497==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF865C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 06:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4536810E171;
	Thu, 23 Jan 2025 06:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJezouY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8A110E171
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 06:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737615029; x=1769151029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7GtbsGOeoXM7NlSPv4nF4LumqdaycnoqKKB67eZKTB4=;
 b=WJezouY85O4R6aOKziDU1F+xUPT/Iu4MOIok9q9Sj/HXkXoTWzsQ0wva
 nfcq5RAG5Wq/UEpnG/xy3+THdJDQgwWkh7ULZXyXI/nQ0CH3Hl5QWWtRQ
 2sYFd20IzPvn3r+qG6dHpyKdG5N2WoxbjnSL2f8KA53vCTk3neLU1erHY
 zGwh/4M+kzeYvm34ESzlygJQrCCaljYzvwztd58ekYSYBrIM+qA9+RAHX
 Em4iN49cQW1Fb7WhoCZ7JpDh3DappaHYHZAocIMOfAwL0uzIZGJJUBQ5h
 5Vx4it0ec+uLsNAR2sM/13L9Z2/O2R03Aj6fRONvyQWuO8z2o9MAbAhmS w==;
X-CSE-ConnectionGUID: DlOyXAxlQ26Yu4NbshZNAQ==
X-CSE-MsgGUID: nfFvaJv3SGCZrodTpq+tNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37309129"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37309129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:50:29 -0800
X-CSE-ConnectionGUID: kLYFNP+jTuiD3X/YZCnwug==
X-CSE-MsgGUID: 9IR11UGFS8OBs64BEK8dwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107479636"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:50:28 -0800
Date: Thu, 23 Jan 2025 00:50:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 7/7] runner/resultgen: Add cmdline to results.json
Message-ID: <omwtasmowswuhnn4l65qmvq5zscdjury2ezkmlw4mp7twbu26t@m4sxloefokeu>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-8-lucas.demarchi@intel.com>
 <173755030291.5500.6239544066129101929@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173755030291.5500.6239544066129101929@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2025 at 09:51:42AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-01-21 19:57:33-03:00)
>>For easier repro scenarios, add the cmdline to the json: one can see the
>>exact command executed to try to reproduce a CI failure without needing
>>extra files.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> runner/json_tests_data/aborted-after-a-test/reference.json | 1 +
>> runner/json_tests_data/aborted-on-boot/reference.json      | 1 +
>> runner/json_tests_data/dmesg-escapes/reference.json        | 1 +
>> runner/json_tests_data/dmesg-results/reference.json        | 1 +
>> .../dmesg-warn-level-one-piglit-style/reference.json       | 1 +
>> .../dmesg-warn-level-piglit-style/reference.json           | 1 +
>> runner/json_tests_data/dmesg-warn-level/reference.json     | 1 +
>> .../reference.json                                         | 1 +
>> .../dynamic-subtests-keep-all/reference.json               | 3 ++-
>> .../dynamic-subtests-keep-dynamic/reference.json           | 1 +
>> .../dynamic-subtests-keep-requested/reference.json         | 3 ++-
>> .../dynamic-subtests-keep-subtests/reference.json          | 3 ++-
>> runner/json_tests_data/empty-result-files/reference.json   | 1 +
>> runner/json_tests_data/graceful-notrun/reference.json      | 1 +
>> .../incomplete-before-any-subtests/reference.json          | 1 +
>> runner/json_tests_data/normal-run/reference.json           | 1 +
>> .../notrun-results-multiple-mode/reference.json            | 1 +
>> runner/json_tests_data/notrun-results/reference.json       | 1 +
>> runner/json_tests_data/piglit-style-dmesg/reference.json   | 1 +
>> .../json_tests_data/unprintable-characters/reference.json  | 1 +
>> .../warnings-with-dmesg-warns/reference.json               | 1 +
>> runner/json_tests_data/warnings/reference.json             | 1 +
>> runner/resultgen.c                                         | 7 ++++++-
>> 23 files changed, 31 insertions(+), 4 deletions(-)
>>
>>diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/runner/json_tests_data/aborted-after-a-test/reference.json
>>index 0776f7582..50ba9e6e1 100644
>>--- a/runner/json_tests_data/aborted-after-a-test/reference.json
>>+++ b/runner/json_tests_data/aborted-after-a-test/reference.json
>>@@ -3,6 +3,7 @@
>>   "results_version":10,
>>   "name":"normal-run",
>>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>>+  "cmdline":[],
>>   "time_elapsed":{
>>     "__type__":"TimeAttribute",
>>     "start":1539953735.1110389,
>>diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runner/json_tests_data/aborted-on-boot/reference.json
>>index 75f194660..238ec6fff 100644
>>--- a/runner/json_tests_data/aborted-on-boot/reference.json
>>+++ b/runner/json_tests_data/aborted-on-boot/reference.json
>>@@ -3,6 +3,7 @@
>>   "results_version":10,
>>   "name":"normal-run",
>>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>>+  "cmdline":[],
>>   "time_elapsed":{
>>     "__type__":"TimeAttribute",
>>     "start":1539953735.1110389,
>>diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
>>index 91c573106..e74dc89e4 100644
>>--- a/runner/json_tests_data/dmesg-escapes/reference.json
>>+++ b/runner/json_tests_data/dmesg-escapes/reference.json
>>@@ -3,6 +3,7 @@
>>   "results_version":10,
>>   "name":"normal-run",
>>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>>+  "cmdline":[],
>>   "time_elapsed":{
>>     "__type__":"TimeAttribute",
>>     "start":1539953735.1110389,
>>diff --git a/runner/json_tests_data/dmesg-results/reference.json b/runner/json_tests_data/dmesg-results/reference.json
>>index e9e011853..81890f7d2 100644
>>--- a/runner/json_tests_data/dmesg-results/reference.json
>>+++ b/runner/json_tests_data/dmesg-results/reference.json
>>@@ -3,6 +3,7 @@
>>   "results_version":10,
>>   "name":"normal-run",
>>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>>+  "cmdline":[],
>>   "time_elapsed":{
>>     "__type__":"TimeAttribute",
>>     "start":1539953735.1110389,
>>diff --git a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
>>index 8d266cdfa..16c97d3a1 100644
>>--- a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
>>+++ b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
>>@@ -3,6 +3,7 @@
>>   "results_version":10,
>
>Hm... Are we going to continue with 10 as the version after including
>another field? Are there guidelines on how results_version should be
>handled?

good question.... last time it was updated was in 2018, to be compatible
with piglit.

commit 2c793666d8c8328733f5769b16ae5858fee97f3f
Author: Petri Latvala <petri.latvala@intel.com>
Date:   Wed Dec 5 14:53:43 2018 +0200

     runner: Produce json with results_version=10
     
     New piglit bumped its results_version to 10, making glxinfo and pals
     optional in practice, not just by accident. Unfortunately reading
     results with newer piglit attempts to convert the results to version
     10, reading glxinfo and pals, and thus fails. In a hilarious summary:
     A commit to piglit making glxinfo optional makes it mandatory for us.
     
     v2: json unit tests confirmed to be working...
     
     Reported-by: Andi Shyti <andi.shyti@intel.com>
     Signed-off-by: Petri Latvala <petri.latvala@intel.com>
     Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
     Cc: Andi Shyti <andi.shyti@intel.com>
     Tested-by: Andi Shyti <andi.shyti@intel.com>
     Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Does this still work with piglit?  something I didn't test yet.
Thanks for noticing

>
>>   "name":"normal-run",
>>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>>+  "cmdline":[],
>
>Well, cmdline is not supposed to be empty. Shouldn't we have at least a
>fake command here? E.g. ["igt_runner"] or even with some common
>arguments...

if I remember well, I tried that, but then it tries to match the number
of members in the array - it won't match since igt_runner may be
called in different ways. Maybe there's a way to tell the test suite to
ignore the elements of the array. I will check.

Lucas De Marchi

>
>--
>Gustavo Sousa

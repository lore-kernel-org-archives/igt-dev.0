Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED38C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642610E1BA;
	Wed, 22 Jan 2025 12:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWuDS9g3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF7E10E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548746; x=1769084746;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=msdzKd89AeGaogpw2XWTZJKWutIBzSR4Lsv67haLuYU=;
 b=mWuDS9g3IDikRNTB28NENRlU+PJpTQ1uqO8C2frp0Y5ZpVXk6fukYdwA
 u7BaILc01nvvVN4rtoZsctkBV9fv98hjR2qmR6FSUlu5N9qZjNC8D6exU
 BlqOZ+AhZ5kpG7QNvUBKX8o/A302Gk0y+we6dIzE5lWdWFME/b+vQ9/sm
 DuzQtyVMWeF74gV/h43wppkgRxn9yUb4pSJ6jpzkW5gBhns6+WhpfB5jS
 XKCf+q3VeBi6TAbEQhi1KRHbcs3+sf7gJAcYnQe77Luz5/nOfKp69C/3o
 mu1OHIzHov391C4EJD8K73beYlYRD8InELZ7uPuphNGSuz3GX+xuyY61r g==;
X-CSE-ConnectionGUID: sidTdiR6Rh2cqBnQ+87S4Q==
X-CSE-MsgGUID: BakB9IW7SJqb1KODxR/59Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37882673"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37882673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:25:46 -0800
X-CSE-ConnectionGUID: IJ1lzU4XRKmUIh3BkGb+Iw==
X-CSE-MsgGUID: T7n+C6iPRDqvgR3dDjJYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="112142750"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:25:44 -0800
Message-ID: <0495a9f4-1251-4bb1-b59b-87044202a60a@linux.intel.com>
Date: Wed, 22 Jan 2025 13:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 7/7] runner/resultgen: Add cmdline to results.json
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-8-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250121225733.808978-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 21.01.2025 23:57, Lucas De Marchi wrote:
> For easier repro scenarios, add the cmdline to the json: one can see the
> exact command executed to try to reproduce a CI failure without needing
> extra files.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  runner/json_tests_data/aborted-after-a-test/reference.json | 1 +
>  runner/json_tests_data/aborted-on-boot/reference.json      | 1 +
>  runner/json_tests_data/dmesg-escapes/reference.json        | 1 +
>  runner/json_tests_data/dmesg-results/reference.json        | 1 +
>  .../dmesg-warn-level-one-piglit-style/reference.json       | 1 +
>  .../dmesg-warn-level-piglit-style/reference.json           | 1 +
>  runner/json_tests_data/dmesg-warn-level/reference.json     | 1 +
>  .../reference.json                                         | 1 +
>  .../dynamic-subtests-keep-all/reference.json               | 3 ++-
>  .../dynamic-subtests-keep-dynamic/reference.json           | 1 +
>  .../dynamic-subtests-keep-requested/reference.json         | 3 ++-
>  .../dynamic-subtests-keep-subtests/reference.json          | 3 ++-
>  runner/json_tests_data/empty-result-files/reference.json   | 1 +
>  runner/json_tests_data/graceful-notrun/reference.json      | 1 +
>  .../incomplete-before-any-subtests/reference.json          | 1 +
>  runner/json_tests_data/normal-run/reference.json           | 1 +
>  .../notrun-results-multiple-mode/reference.json            | 1 +
>  runner/json_tests_data/notrun-results/reference.json       | 1 +
>  runner/json_tests_data/piglit-style-dmesg/reference.json   | 1 +
>  .../json_tests_data/unprintable-characters/reference.json  | 1 +
>  .../warnings-with-dmesg-warns/reference.json               | 1 +
>  runner/json_tests_data/warnings/reference.json             | 1 +
>  runner/resultgen.c                                         | 7 ++++++-
>  23 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/runner/json_tests_data/aborted-after-a-test/reference.json
> index 0776f7582..50ba9e6e1 100644
> --- a/runner/json_tests_data/aborted-after-a-test/reference.json
> +++ b/runner/json_tests_data/aborted-after-a-test/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runner/json_tests_data/aborted-on-boot/reference.json
> index 75f194660..238ec6fff 100644
> --- a/runner/json_tests_data/aborted-on-boot/reference.json
> +++ b/runner/json_tests_data/aborted-on-boot/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
> index 91c573106..e74dc89e4 100644
> --- a/runner/json_tests_data/dmesg-escapes/reference.json
> +++ b/runner/json_tests_data/dmesg-escapes/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/dmesg-results/reference.json b/runner/json_tests_data/dmesg-results/reference.json
> index e9e011853..81890f7d2 100644
> --- a/runner/json_tests_data/dmesg-results/reference.json
> +++ b/runner/json_tests_data/dmesg-results/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
> index 8d266cdfa..16c97d3a1 100644
> --- a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
> +++ b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json b/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json
> index 4a1e8b313..e40000a27 100644
> --- a/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json
> +++ b/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/dmesg-warn-level/reference.json b/runner/json_tests_data/dmesg-warn-level/reference.json
> index 400e9cfbc..fca3f1a54 100644
> --- a/runner/json_tests_data/dmesg-warn-level/reference.json
> +++ b/runner/json_tests_data/dmesg-warn-level/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
> index 514de06a4..e3a6ffe3b 100644
> --- a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
> +++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"dynamic-subtest-name-in-multiple-subtests",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1560163492.266377,
> diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/reference.json b/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
> index b2b716288..20e626144 100644
> --- a/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
> +++ b/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"dynamic-subtests",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1560163492.266377,
> @@ -168,4 +169,4 @@
>        }
>      }
>    }
> -}
> \ No newline at end of file
> +}
> diff --git a/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json b/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
> index c013d2821..37bd91e84 100644
> --- a/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
> +++ b/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"dynamic-subtests",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1560163492.266377,
> diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json b/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
> index c33c7ce7c..3a717f699 100644
> --- a/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
> +++ b/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"dynamic-subtests",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1560163492.266377,
> @@ -120,4 +121,4 @@
>        }
>      }
>    }
> -}
> \ No newline at end of file
> +}
> diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json b/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
> index e53daa5a5..e4c320a0f 100644
> --- a/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
> +++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"dynamic-subtests",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1560163492.266377,
> @@ -120,4 +121,4 @@
>        }
>      }
>    }
> -}
> \ No newline at end of file
> +}
> diff --git a/runner/json_tests_data/empty-result-files/reference.json b/runner/json_tests_data/empty-result-files/reference.json
> index f81ffb81c..332e20693 100644
> --- a/runner/json_tests_data/empty-result-files/reference.json
> +++ b/runner/json_tests_data/empty-result-files/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"empty-result-files",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/graceful-notrun/reference.json b/runner/json_tests_data/graceful-notrun/reference.json
> index c95bdfecc..ddad3d925 100644
> --- a/runner/json_tests_data/graceful-notrun/reference.json
> +++ b/runner/json_tests_data/graceful-notrun/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"graceful-notrun",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/incomplete-before-any-subtests/reference.json b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
> index 2a4bd4560..5fc1978eb 100644
> --- a/runner/json_tests_data/incomplete-before-any-subtests/reference.json
> +++ b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/normal-run/reference.json b/runner/json_tests_data/normal-run/reference.json
> index 0a00b1ca8..814e46920 100644
> --- a/runner/json_tests_data/normal-run/reference.json
> +++ b/runner/json_tests_data/normal-run/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/notrun-results-multiple-mode/reference.json b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
> index 3f8b7fb09..80ba5ec2c 100644
> --- a/runner/json_tests_data/notrun-results-multiple-mode/reference.json
> +++ b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/notrun-results/reference.json b/runner/json_tests_data/notrun-results/reference.json
> index 800de38c5..42fcd0017 100644
> --- a/runner/json_tests_data/notrun-results/reference.json
> +++ b/runner/json_tests_data/notrun-results/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/piglit-style-dmesg/reference.json b/runner/json_tests_data/piglit-style-dmesg/reference.json
> index bf5d86ee3..6c751dc53 100644
> --- a/runner/json_tests_data/piglit-style-dmesg/reference.json
> +++ b/runner/json_tests_data/piglit-style-dmesg/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/unprintable-characters/reference.json b/runner/json_tests_data/unprintable-characters/reference.json
> index 88c62c34d..e1b3302a5 100644
> --- a/runner/json_tests_data/unprintable-characters/reference.json
> +++ b/runner/json_tests_data/unprintable-characters/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/warnings-with-dmesg-warns/reference.json b/runner/json_tests_data/warnings-with-dmesg-warns/reference.json
> index bd0bb3a3d..67797e789 100644
> --- a/runner/json_tests_data/warnings-with-dmesg-warns/reference.json
> +++ b/runner/json_tests_data/warnings-with-dmesg-warns/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/json_tests_data/warnings/reference.json b/runner/json_tests_data/warnings/reference.json
> index a2b79da9e..2c483fdf5 100644
> --- a/runner/json_tests_data/warnings/reference.json
> +++ b/runner/json_tests_data/warnings/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 87847bf5b..0d3a569cf 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
>  {
>  	struct settings settings;
>  	struct job_list job_list;
> -	struct json_object *obj, *elapsed;
> +	struct json_object *obj, *elapsed, *arr;
>  	struct results results;
>  	int testdirfd, fd;
>  	size_t i;
> @@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
>  		close(fd);
>  	}
>  
> +	arr = json_object_new_array();
> +	for (i = 0; i < settings.cmdline.argc; i++)
> +		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
> +	json_object_object_add(obj, "cmdline", arr);
> +
>  	elapsed = json_object_new_object();
>  	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
>  	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {


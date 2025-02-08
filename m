Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47949C02198
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 13:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7410E030;
	Sat,  8 Feb 2025 13:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwIh+/BV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB1910E030
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Feb 2025 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739020229; x=1770556229;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sLixABrlVTG1DF1mfuf+3LdiYk4bvCKHLnv4ETniwLI=;
 b=EwIh+/BViX2jAJU4O4uMwgte6s6F9pj50xx+4F2NXO0f+/t712yw9GwN
 SsXuIzCeRFFu6uKeGXVXYEKQ4tcbcdZHc/1AGONEqbCtWAkxcAiWO2d86
 TPoe/OYvQfNJ6CbYz7Vs9HZ5al+O7BuFmGc1oBtVNBOsSo5CgCSnZ38JR
 oHivPfUn7NceXR/uC7GU1Ea5X64ch6w5P5TVe1eY0i/aR35DnmPHKKfu/
 cYeoZe9nSSKA9IMcJMFu/sZ98h46uEEFC4USepqSQ9MsnbEFoPlXxn6xC
 LwG/SdibpZCAwB0x6ckEuqkujbdwNPijO+2QGJ+JiG902mNIOE2MnJMj9 A==;
X-CSE-ConnectionGUID: 5/r+E+RAROaxSQwsIRBt3w==
X-CSE-MsgGUID: KwCALIcYQkS93UawJRBoiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39561027"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="39561027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:10:29 -0800
X-CSE-ConnectionGUID: VUPJ6XDfSF2VZhd13VfwQA==
X-CSE-MsgGUID: URi153sBRJ2hldCdwQraoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116712367"
Received: from arossa-mobl1.ger.corp.intel.com (HELO [10.245.98.254])
 ([10.245.98.254])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:10:28 -0800
Message-ID: <7ad63a47-aacb-4d0f-a705-5ad47607970e@linux.intel.com>
Date: Sat, 8 Feb 2025 14:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI i-g-t 00/10] Add igt_runner's cmdline to results
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
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

Hi Lucas,

Re-reviewed and re-tested. I send replies to the patches that did not have
my tags.

Thanks

On 08.02.2025 00:09, Lucas De Marchi wrote:
> Help devs to reproduce what CI is running by dumping what is the command
> line being used. While it's true that in the shard case we don't have
> the testlist, just seeing the right incantation of command line is a
> great improvement.
> 
> I plan to follow this with the env vars, but first want to get this
> in. It seems we already have an environment.txt saved, however that
> doesn't contain the igt_runner's env, only options passed via -e to
> igt_runner which is then forwarded to each test. I'm wondering if this
> is a source of bugs when using igt_resume:  if the environment doesn't
> match, it will run with different options on each execution. (answer:
> yes, it is a source of bugs if the exact environment is not re-created
> for running igt_resume)
> 
> v2:
>   - Fix more leaks as prep commits
>   - Fix leaking argv that got lost in all other pre-existent leaks
>   - Add dummy array to the reference.json files so it passes runner's
>     own tests.
> 
> v3:
>   - Better split patches and reword commit messages according to reviews
>     by Gustavo and Peter
>   - Add generic escape/unescape functions to be used for metadata.txt.
>     Besides preparing for cmdline, it fixes other uses of \n.
>   - Provide a single macro to parse array, which adds the proper code
>     to parse both the array items and the length
> 
> CI: minor adjustements. Let's make sure it passes CI.
> 
> Lucas De Marchi (10):
>   runner/settings: Fix code_coverage_script leak
>   runner: Free settings at the end
>   runner/settings: Deduplicate cleanup
>   runner/settings: Use wrapper macros for each type
>   runner/settings: Match serialization to parse
>   runner/settings: Drop extra strdup
>   runner: Fix use of newline on arguments
>   runner/settings: Add helpers to serialize/parse array
>   runner/settings: Serialize command line
>   runner/resultgen: Add cmdline to results.json
> 
>  .../aborted-after-a-test/reference.json       |   1 +
>  .../aborted-on-boot/reference.json            |   1 +
>  .../dmesg-escapes/reference.json              |   1 +
>  .../dmesg-results/reference.json              |   1 +
>  .../reference.json                            |   1 +
>  .../reference.json                            |   1 +
>  .../dmesg-warn-level/reference.json           |   1 +
>  .../reference.json                            |   1 +
>  .../dynamic-subtests-keep-all/reference.json  |   3 +-
>  .../reference.json                            |   1 +
>  .../reference.json                            |   3 +-
>  .../reference.json                            |   3 +-
>  .../empty-result-files/reference.json         |   1 +
>  .../graceful-notrun/reference.json            |   1 +
>  .../reference.json                            |   1 +
>  .../json_tests_data/normal-run/reference.json |   1 +
>  .../reference.json                            |   1 +
>  .../notrun-results/reference.json             |   1 +
>  .../piglit-style-dmesg/reference.json         |   1 +
>  .../unprintable-characters/reference.json     |   1 +
>  .../warnings-with-dmesg-warns/reference.json  |   1 +
>  .../json_tests_data/warnings/reference.json   |   1 +
>  runner/resultgen.c                            |   7 +-
>  runner/resume.c                               |   2 +
>  runner/runner.c                               |   2 +
>  runner/runner_tests.c                         |   1 +
>  runner/settings.c                             | 277 ++++++++++++++----
>  runner/settings.h                             |   4 +
>  28 files changed, 257 insertions(+), 64 deletions(-)
> 


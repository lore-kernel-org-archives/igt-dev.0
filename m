Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45479FA3743
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 10:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DFE10E260;
	Fri, 13 Sep 2024 10:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REa5+gQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1507610E255
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726225101; x=1757761101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ohEjt7xqhnmM62n92sA/0Au2oxkD302BHgCoSy1/Gcc=;
 b=REa5+gQt6Vlz1eqkNMeWT/OYli6UeuhNPVzxkztwD5W3dmfN3d6yRiS3
 8M1AXs7x+p9jyhUJfU0mwFdZEY8QXTgAa2QYzx4bYLSL9gmxZsBOQuyll
 eX8B20Nfikaeo7kTxt+mnFAFS48BxG77ei/dTmmT4e0cOMjDmdpuvyYM+
 vMT+9/zoDnleHr6CMiYKA7XvNrwmPAcLZ/kaFo4iuyC+DotIbHUUzIhbX
 d1xFSRvcgcx4D2/VHGtfJIJf1GiYVFMQMXQjCb6hB4fWgIumeUUQ3O9JD
 TQFl0b+WRW9p2qMfhk3kmhTPS7gwIx0vLNSipcuym/goA1lE5fflkFvFU w==;
X-CSE-ConnectionGUID: RCuqacKPSyuMN9KUV5cWMg==
X-CSE-MsgGUID: JSk344UTRrawx1h9YyyJ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="50535118"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="50535118"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 03:58:20 -0700
X-CSE-ConnectionGUID: OlwUP3KcRwSv0e1xTKNrNg==
X-CSE-MsgGUID: T2PT6vNVSWKhLM2Pbwgi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="68333034"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 03:58:18 -0700
Message-ID: <81a845ea-9f06-4360-b541-45aa0c5a65bc@intel.com>
Date: Fri, 13 Sep 2024 12:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/1] relax doc generation for non-compiled tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Kamil,

On 12.09.2024 16:04, Kamil Konieczny wrote:
> New tests added with conditional compilation result in error reported
> when generating testlist. For example, with a recent series with new
> eudebug igt tests from here:
> https://patchwork.freedesktop.org/series/136623/
> ("Test coverage for GPU debug support")
> 
> when --exclude-files option was removed from version 6:
> https://patchwork.freedesktop.org/series/136623/#rev6
> 
> then compiling with testplan report warnings:
> 
> xe_eudebug.testlist: Testlist file not found.
> xe_eudebug_online.testlist: Testlist file not found.
> xe_exec_sip_eudebug.testlist: Testlist file not found.
> Warning: Documented igt@xe_eudebug@attach-debug-metadata doesn't exist on source files
> Warning: Documented igt@xe_eudebug@basic-client doesn't exist on source files
> Warning: Documented igt@xe_eudebug@basic-client-th doesn't exist on source files
> [...rest omitted...]
> 
> and exits with an error.
> 
> Relax that check to only report error on missing documentation, and treat
> new added tests without a compiled binary as a new tests under development
> or as tests outside a compilation scope (such as chamelium). This should
> allow to have new tests in documentation and track them.
> 
> With dropped --exclude-files patch and dropped changes in docs/testplan/meson.build
> generation of testplan succeeds and in report it can be find:

Well the only issue I see with this approach is that we actually 
generate documentation for tests that weren't built, while the 
'--exclude_files' flag skips doc generation all together. But if this is 
intended/accepted I am happy to move forward with your solution.

Thanks,
Christoph

> 
> [1897/1905] Generating docs/testplan/xe_tests.rst with a custom command
> xe_eudebug.testlist: Testlist file not found.
> xe_eudebug_online.testlist: Testlist file not found.
> xe_exec_sip_eudebug.testlist: Testlist file not found.
> xe_eudebug: No binary found, test was not compiled.
> xe_eudebug_online: No binary found, test was not compiled.
> xe_exec_sip_eudebug: No binary found, test was not compiled.
> Info: Documented igt@xe_eudebug@attach-debug-metadata don't have a binary xe_eudebug
> Info: Documented igt@xe_eudebug_online@basic-breakpoint don't have a binary xe_eudebug_online
> Info: Documented igt@xe_exec_sip_eudebug@breakpoint-waitsip don't have a binary xe_exec_sip_eudebug
> [1898/1905] Generating docs/testplan/i915_tests.rst with a custom command
> [1899/1905] Generating docs/testplan/kms_tests.rst with a custom command
> [1900/1905] Generating docs/testplan/intel-ci-tests with a custom command
> [1901/1905] Generating docs/testplan/xe_tests.html with a custom command
> [1902/1905] Generating docs/testplan/i915_tests.html with a custom command
> [1903/1905] Compiling C object runner/runner_test.p/runner_tests.c.o
> [1904/1905] Generating docs/testplan/kms_tests.html with a custom command
> [1905/1905] Linking target runner/runner_test
> 
> 
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Kamil Konieczny (1):
>    scripts/test_list: relax treatment of non-compiled tests
> 
>   scripts/test_list.py | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 

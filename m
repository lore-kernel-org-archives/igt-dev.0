Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C022C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 08:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2783310E3AF;
	Mon, 17 Mar 2025 08:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFiWt/Eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1999910E3AF
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742201031; x=1773737031;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kcTRvph4QxNyDttfo40YNVCAWZtVR+gAMmuqfU78zFQ=;
 b=eFiWt/EoG1jnu0E+eptSaerz1N825Rp8vofaACVf62EVa+RXyM7EKHGz
 CJEjPCdN2CRzsQkBVnMPVpFc0rETQmjCP2MZFCdyYBmZIpQH9yThkQvP2
 CNWF+g0DqQEwiFdBQZ7qJPu7Jnnx51GBxhJCiFK0aKhDTa09zlSFgmV9/
 qX725mMZnwuyrfUOb1bOvUcaHeROdkSN3/r4H9J8fKn5Gvv2XhIshJKcZ
 kSMJhazNfnybvYsz/SBU0FqVrA5eDck0d3h65d5uBEzZ+T5NANnzRevUF
 vrPIESBrofht3sTT4bp4ZXAVIb+ZE/j7+qjGyzvRJbdAYodmIa3BggDTF g==;
X-CSE-ConnectionGUID: aFRYORiOT7SYqKMrpUuHpg==
X-CSE-MsgGUID: +ZBCdSucQcKWODwWheGJGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="54665737"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="54665737"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:43:45 -0700
X-CSE-ConnectionGUID: UhXOrpLbQFmyRBNCMRxEnA==
X-CSE-MsgGUID: QIlK2McRR1yFKKlOU/gB9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="121820616"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:43:41 -0700
Message-ID: <9a6a7e82-32a3-4960-ad5e-c70c6f5d81e8@linux.intel.com>
Date: Mon, 17 Mar 2025 09:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak and igt_facts
To: vitaly prosyak <vprosyak@amd.com>, igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-4-peter.senna@linux.intel.com>
 <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
 <58d922a6-d24e-4b2c-a3da-1de97e2b065c@linux.intel.com>
 <7992ba86-f665-469b-907b-89f1057a7238@amd.com>
 <80b7d4e8-2c1e-4b9c-b662-974cc3926a14@amd.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <80b7d4e8-2c1e-4b9c-b662-974cc3926a14@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Vitaly,

On 12.03.2025 23:35, vitaly prosyak wrote:
> Hi Peter,
> 
> We ran the updated igt-runner in our CI with your merged patches, and the memleak feature is working (using the -keach command). However, we noticed what seems to be false positives related to the ACPI driver. The stack is provided below.

Thank you for testing and reporting back! I've noticed false
positives as well. In my case the likelihood of false
positives seems to be related to hardware and test list.

> 
> I haven’t had a chance to investigate this further, but I think it would be a good idea to share our findings upstream for memleaks found outside of the AMDGPU or i915 drivers.

I haven't considered this idea before: reporting other leaks upstream.
You are correct, reporting these leaks is probably a good idea. I'm
unsure on how to proceed here because I see two issues:
 - manual reporting does not scale in the context of our automated
   tests
 - upstream response to the reports

We want kmemleak results to improve our upstream code, but I do not
know if these reports will be welcome everywhere. For projects that
do not have the manpower to fix the issues, we may simply increase
noise.

What do you suggest?

Thank you, and have a great week,

Peter

> 
> Here the stack:
> 
> comm "swapper/0", pid 1, jiffies 4294672730
> 
>  hex dump (first 32 bytes):
> 
>    00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................
> 
>    f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............
> 
>  backtrace (crc 2df71a7e):
> 
>    [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80
> 
>    [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370
> 
>    [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0
> 
>    [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400
> 
>    [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60
> 
>    [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0
> 
>    [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380
> 
>    [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0
> 
>    [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490
> 
>    [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70
> 
>    [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0
> 
>    [<ffffffff83867799>] acpi_scan_init+0x119/0x290
> 
>    [<ffffffff8386711a>] acpi_init+0x23a/0x590
> 
>    [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0
> 
>    [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680
> 
>    [<ffffffff824ca53b>] kernel_init+0x1b/0x170unreferenced object 0xffff888102a2ed18 (size 80):
> 
>  comm "swapper/0", pid 1, jiffies 4294672730
> 
>  hex dump (first 32 bytes):
> 
>    38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....
> 
>    f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......
> 
> Thanks, Vitaly
> 
> 
> On 2025-03-10 16:05, vitaly prosyak wrote:
>> Hi Peter and Kamil,
>>
>> We'll run the tests and I'll follow up on this thread.
>>
>> Really appreciate you merging this—thank you!
>>
>> Best,
>> Vitaly
>>
>> On 2025-03-10 03:07, Peter Senna Tschudin wrote:
>>> Hi Vitaly,
>>>
>>> On 10.03.2025 04:07, vitaly prosyak wrote:
>>>> Hi Peter,
>>>>
>>>> Version 8 of your three patches looks good to me. However, I haven't tested them locally.
>>>> Let me know if you’d like us to run them locally ( not CI)
>>> I ran local tests before sending the patches, so I’m confident there are no major issues.
>>> That said, if you’re able to test them locally as well, it would help confirm that
>>> everything is working as expected. I’d appreciate it if you could run the tests.
>>>
>>>> Thanks for the improvements!
>>> Thank you for reviewing the patches!
>>>
>>> Peter
>>>
>>> [...]


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D00C19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 09:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C953D10EA5A;
	Thu, 27 Feb 2025 09:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C98g7rez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90810EA5A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740647302; x=1772183302;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ltr/1co/Ak1FzAh13y8bqk0Gcdb8wTaj+e1UhrVeeJY=;
 b=C98g7rezd+tmEOqqjSebCYKak+cQWy4AwWyI7pVNer5ZzE11ovexpDs7
 zG3eTteG1CvnFfI+uPNarXMVlAwfeOgPjEHeLEeEL9sb2OYGDUUjaaxV8
 zgPSbnH7SdwEfkXh55M0bXnDeMiIoWlBw4raISneAMlbpdV0TiCQeRk8n
 sDdPwHOkZGNHGVLXp8A+Hzkvkhsl/onmUD8zJwHudRpG9A1DfGeEe2Mlp
 XwH55YrVhPOm22xNLXt3gGmFZLmsZIELytiqGGqbBlclM+TihQpaoyTX1
 ONr09OVRpqHHVM+DthKrZq7WuF84YXLGnFUTouBMHCeISRNk58zR6eGn7 g==;
X-CSE-ConnectionGUID: rsMHAqB8Q8iZB9ITKGottw==
X-CSE-MsgGUID: PbKah+49RRCXrsqcVs5XvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41782054"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41782054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:08:22 -0800
X-CSE-ConnectionGUID: WP0BvUB3TMCCpr4uP7PyPQ==
X-CSE-MsgGUID: 2e0KQCUOSZyDL9PIYn1EXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122212569"
Received: from mviannax-mobl.amr.corp.intel.com (HELO [10.245.80.7])
 ([10.245.80.7])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:08:14 -0800
Message-ID: <dc46ac89-04da-49eb-be06-ce700d9c780e@linux.intel.com>
Date: Thu, 27 Feb 2025 10:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: vitaly prosyak <vprosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
 <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
 <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
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



On 27.02.2025 06:08, vitaly prosyak wrote:
[...]

Hi Vataly,

Thank you for your message.

> Hi Peter,
> 
> Thanks for the update! I really appreciate the effort you’ve put into making the approach more global and vendor-agnostic—great work!
> 
> It would be incredibly useful to have both --kmemleak options available (for the entire test list and individual tests).
> 
> Could you kindly provide guidance on how to add these options (-konce or -keach) to igt-runner? For example, how should I modify the following commands to include them?

The kmemleak patch has not been merged yet. If you'd like to try it before it
gets merged, you can find the patches here:

https://patchwork.freedesktop.org/series/143996/

Regarding the kmemleak integration, I apologize for any confusion in the
discussion. The intended usage is as follows:
 - Create a test list that includes only the tests you want kmemleak to
   scan.
 - Pass the -keach option to igt_runner.

> 
> sudo ./scripts/run-tests.sh -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic

I'm assuming this script calls igt_runner. If so, please add -keach as an
additional command-line argument to igt_runner.

Once the patch is merged, this will enable igt_runner to generate a file
named kmemleak.txt in the results directory. The file will include entries
like:

 "kmemleaks found after running test@name"

to separate different scans within the same file.

Additionally, you can modify your test list to include only the tests you
want kmemleak to scan. This is where I unintentionally added noise to
the discussion.

Since you can create a custom test list and use it with -keach, there is
no need to extend the kmemleak library to support a separate test list.

> 
> or
> 
> sudo ./scripts/run-tests.sh -v -T /home/infra/igt/custom.testlist  
> 
> Thanks again for your great work and support!

Happy to help, let me know if you need anything else!

Peter

> 
> Vitaly
>> [...]


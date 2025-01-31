Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7359DC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 09:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFAD10EA60;
	Fri, 31 Jan 2025 09:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esnFLKk7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DEE10EA6E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738315897; x=1769851897;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6VRcusG67l+Mrye9gmEnPb7aGtZ6V/KiHZjBzuEPp64=;
 b=esnFLKk7AchQfjY7ZZ8FQz7tBiFzTaMGZPxvRkytIaInrS9E6jd7J+aC
 cfFl2k8oatY5F1LTqJzjXCfS/fwQKBIf+nwXD5ne1tp5MIQSOCoiK9cEg
 oIkq0WKDVq8f9tHoqSsqCVe2Ab6wDCMtgPZOb2s75AcQojn46EOVVwjbo
 Emrzt40uNSphyH7wq2JP3QFpvwnRcTg5ZWb2IQOrK7DpWkOL2KtS+Gg7p
 Nh0qx5TWn8mjlcwFyRNc8HtEd7RCpgYYg/AHaWvTT5dXdKaKAQS+2JGgQ
 WjSNOs2XRlhUKz8IEl6mQZuKVjhsyLe9O/QOIrA/ih7kmVL/4DB3yILvl A==;
X-CSE-ConnectionGUID: f0M0KlxyT/iVgvl8qQPPrw==
X-CSE-MsgGUID: V1zPOiqESIKRU4OySRSXXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39042736"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="39042736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 01:31:37 -0800
X-CSE-ConnectionGUID: DOQvMi2PS7muIpZkWwX1YA==
X-CSE-MsgGUID: l8q1KrjRQ4+gg8okfLZSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="110169330"
Received: from kvaradha-mobl.amr.corp.intel.com (HELO [10.245.118.246])
 ([10.245.118.246])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 01:31:36 -0800
Message-ID: <96b339b4-b1e0-46d8-9220-68284c48b0ab@linux.intel.com>
Date: Fri, 31 Jan 2025 10:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 10/10] runner/resultgen: Add cmdline to
 results.json
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-11-lucas.demarchi@intel.com>
 <20250130190055.qn4xxd4y4za6ehuz@kamilkon-desk.igk.intel.com>
 <nhqlawqsr7kwrsuvwtxq5s6yafbcmtawotaxarp3amng5dospx@n6i3bf7zp7jp>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <nhqlawqsr7kwrsuvwtxq5s6yafbcmtawotaxarp3amng5dospx@n6i3bf7zp7jp>
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



On 30.01.2025 20:17, Lucas De Marchi wrote:
> On Thu, Jan 30, 2025 at 08:00:55PM +0100, Kamil Konieczny wrote:
>> Hi Lucas,
>> On 2025-01-30 at 09:21:49 -0800, Lucas De Marchi wrote:
>>> For easier repro scenarios, add the cmdline to the json: one can see the
>>> exact command executed to try to reproduce a CI failure without needing
>>> extra files.
>>>
>>> Adding cmdline to the results.json doesn't need a version upgrade:
>>> piglit can still parse the file.
>>
>> Why not just printing this into stdout before executing test loop?
>> The same way which is already used by igt_facts, so it will go
>> into runnerNN.txt log and will not be duplicated in each and every
>> results.json
> 
> igt_facts print things that is happening between the tests. It's
> monitoring the execution.
> 
> I don't understand the push back here when we already add things
> like version, uname, execution time, etc. You could use the same argument and say "look at the runner.log"
> to see the execution time.

I buy the value of having it at the json because:
 - The json and its derivatives seems to be the longest living artifacts.
   Having runtime setup in the json may indeed help us reproduce issues
   even weeks down the line.
 - For those who have tools consuming the json, the new field makes it
   convenient to extract information. The extra fields makes little
   difference for those who don't.
 - The size overhead for the json is insignificant

Peter

[...]

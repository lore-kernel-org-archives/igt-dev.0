Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67A7C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 11:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6826010E0B7;
	Mon, 27 Jan 2025 11:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsfEsl+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E0910E0B7
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737975958; x=1769511958;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C/sxWdBGWb46iuHvhnii66Kq5ocEQFQ/uO34zjKJ2Zc=;
 b=gsfEsl+AoVYbjf4DfvV7deyWbMzavzYXwKz/LXAolmgbcrYCVIHcOEE2
 Ar6F02SS/goA4DJMVp4aey9MS/gOph+BfzMM0WACsJ8Pdk301Qv4yyH9f
 VPUr3HyH20/gYubJNuGr5npulxUaGDaNh5sj0GTKvd6N/ewKjvQtvhyov
 aAAbftAsXiHVCdH9Pg+qwD8zDVpxyuUBO70zAWA5S+n2P6ZwM4SXuULlY
 FOP9kyBYBNwFwmA8aPM4fyM9inRBWpgzZRWzIlt5cmAdmSgeM8m9z1wHW
 ULSUPn5sKoY8GcOGqGYFPVu2e7zyqVA+dscO4he/kDS/UgLFJPOxQkS3z A==;
X-CSE-ConnectionGUID: kB23LZ8JQUyx8wPnVSE4MQ==
X-CSE-MsgGUID: HAL+IzbpT5ittZ7IWqZudw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49847775"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49847775"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:05:58 -0800
X-CSE-ConnectionGUID: o2Uy/BaCQHupiw1bAdHc3g==
X-CSE-MsgGUID: tsMbcr/nS7yHIscxEDmKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131705927"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:05:55 -0800
Message-ID: <471519fa-1470-4059-bdff-80092c86d1ac@linux.intel.com>
Date: Mon, 27 Jan 2025 12:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] runner/executor: Integrate igt_kmemleak scans
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "stylon.wang@amd.com" <stylon.wang@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "gregory.f.germano@intel.com" <gregory.f.germano@intel.com>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Yu, Jianshui" <jianshui.yu@intel.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250121112944.115491-3-peter.senna@linux.intel.com>
 <CH0PR11MB5444EB782D10812EE5122592E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <CH0PR11MB5444EB782D10812EE5122592E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 22.01.2025 19:18, Cavitt, Jonathan wrote:

[...]

>> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
>> index 8441763f2..a072a92c7 100644
>> --- a/runner/runner_tests.c
>> +++ b/runner/runner_tests.c
>> @@ -191,6 +191,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
>>  	igt_assert_eq(one->dry_run, two->dry_run);
>>  	igt_assert_eq(one->allow_non_root, two->allow_non_root);
>>  	igt_assert_eq(one->facts, two->facts);
>> +	igt_assert_eq(one->kmemleak, two->kmemleak);
>>  	igt_assert_eq(one->sync, two->sync);
>>  	igt_assert_eq(one->log_level, two->log_level);
>>  	igt_assert_eq(one->overwrite, two->overwrite);
>> @@ -304,6 +305,7 @@ igt_main
>>  		igt_assert(igt_list_empty(&settings->env_vars));
>>  		igt_assert(!igt_vec_length(&settings->hook_strs));
>>  		igt_assert(!settings->facts);
>> +		igt_assert(!settings->kmemleak);
>>  		igt_assert(!settings->sync);
>>  		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
>>  		igt_assert(!settings->overwrite);
>> @@ -426,6 +428,7 @@ igt_main
>>  		igt_assert_eq(settings->include_regexes.size, 0);
>>  		igt_assert_eq(settings->exclude_regexes.size, 0);
>>  		igt_assert(!settings->facts);
>> +		igt_assert(!settings->kmemleak);
>>  		igt_assert(!settings->sync);
>>  		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
>>  		igt_assert(!settings->overwrite);
>> @@ -464,6 +467,7 @@ igt_main
>>  				       "-b", blacklist_name,
>>  				       "--blacklist", blacklist2_name,
>>  				       "-f",
>> +				       "-k",
>>  				       "-s",
>>  				       "-l", "verbose",
>>  				       "--overwrite",
>> @@ -523,6 +527,7 @@ igt_main
>>  		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 1)), "echo world");
>>  
>>  		igt_assert(settings->facts);
>> +		igt_assert(settings->kmemleak);
>>  		igt_assert(settings->sync);
>>  		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
>>  		igt_assert(settings->overwrite);
>> @@ -718,30 +723,39 @@ igt_main
>>  	igt_subtest("parse-clears-old-data") {
>>  		const char *argv[] = { "runner",
>>  				       "-n", "foo",
>> +				       "--overwrite",
> 
> NIT:
> What does overwrite do here?  Is its addition related to integrating igt_kmemleak scans?
> 
> If we're adding it in just because it was missing, then that should probably be done
> as a separate patch series.
I needed a larger array, and I could not find a way to increase it's size that would
not require me to rewrite the entire file other than adding a new option. So overwrite
was a simple option that does no harm.


> 
> Lower down, we add "foo", "test-root-dir", and "result-path" to the argv list, and I have
> similar comments with respect to those as well.  Same with the igt_asserts on
> settings->overwrite.
> 
>>  				       "--dry-run",
>>  				       "--allow-non-root",
>>  				       "test-root-dir",
>> -				       "results-path",
>> +				       "results-path"
> 
> NIT:
> Removing the comma from the last element of the list is unnecessary, as many
> of the lists in IGT leave the comma there.

I unfortunately missed this from my review. It was removed by accident. Let me know
if you want me to resend with the comma.

> 
> There's definitely a discussion to be had as to whether or not this is proper
> coding style, and if it's not, there's going to be a lot of refactoring work for us
> in the future.  But irrespective of what that discussion results in, refactoring
> work like this is probably out of scope for this patch series.  Especially since
> "overwrite" isn't being appended to the end of the list (and maybe shouldn't
> be added at all?  See first NIT).
> -Jonathan Cavitt
> 

[...]

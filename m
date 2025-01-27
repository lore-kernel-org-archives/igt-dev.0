Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AF0C0218A
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 17:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242E810E213;
	Mon, 27 Jan 2025 17:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gvev8flK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5667C10E213
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737997725; x=1769533725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uz6vXprsQXu0fJaZIxEC1iAjHCMCd0yB387AvOBu8xM=;
 b=Gvev8flKu1yJmSKXFdxvJwsIgnjBU4g9MKx0yY6odiLlZE+ZrCaENpfR
 DAc2aGolrSfWEo7ObIx0Bce0Zz3xnrl8HOKehcxCyDyOmDDbtufhEmpO3
 ZTgacBm4oogzEEN12TAKYx4FbEXeGxCJAkf5UfFsYAuA1rNoC21nhefnP
 m15TC87+2iPtg60ZLj09dqeyegP5eS0kqM7gAFL50JqdWxLDypCufmXIS
 nhjx9dmR1eaQ159YxKYubK0oST+i7sQyqZW3HUOv2kcN6n0IIFVKgIV/b
 mAwlC1Jb3YoD9vkVuWHdrlwJjYFUYW5qeO+ZXxEl+K8muW95n3nvsrJZo g==;
X-CSE-ConnectionGUID: mCkronWKRS+0jrlO0ugolQ==
X-CSE-MsgGUID: 8GuN/DkQRD2INO+85Upyqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="41305593"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="41305593"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:07:06 -0800
X-CSE-ConnectionGUID: iO3QTQXJRzqYrDxj1XMp8A==
X-CSE-MsgGUID: XB6LPGUrTNOcaljzOLTiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113117476"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:07:03 -0800
Message-ID: <a01835c3-346c-4718-beeb-3b819897c827@linux.intel.com>
Date: Mon, 27 Jan 2025 18:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250127152813.293529-1-peter.senna@linux.intel.com>
 <20250127152813.293529-2-peter.senna@linux.intel.com>
 <CH0PR11MB5444D075498A1D44B88C7230E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <CH0PR11MB5444D075498A1D44B88C7230E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 27.01.2025 17:38, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Peter Senna Tschudin <peter.senna@linux.intel.com> 
> Sent: Monday, January 27, 2025 7:28 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Knop, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattannavar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Taylor, Clinton A <clinton.a.taylor@intel.com>; Yu, Jianshui <jianshui.yu@intel.com>; Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: [PATCH i-g-t v3 1/2] lib/igt_kmemleak: library to interact with kmemleak
>>
>> Adds a simple library for interacting with kmemleak and add
>> unit testing for the library. There are two modes intended to
>> integrate with igt_runner:
>> - once: collect kmemleaks after all test completed
>> - each: collect kmemleaks after eachb test completes
>>
>> To use the library include "igt_kmemleak.h", call
>> igt_kmemleak_init(NULL) to check if kmemleak is enabled and finally
>> call igt_kmemleak() to collect kmemleaks. igt_kmemleak() expect the
>> following arguments:
>>   - const char *last_test: Name of the last lest or NULL
>>   - int resdirfd: file descriptor of the results directory
>>   - bool kmemleak_each: Are we scanning once or scanning after
>>     each test?
>>   - bool sync: sync after each write?
>>
>> CC: Rodrigo.Siqueira@amd.com
>> CC: ramadevi.gandi@intel.com
>> CC: ryszard.knop@intel.com
>> CC: sameer.lattannavar@intel.com
>> CC: lucas.demarchi@intel.com
>> CC: jani.saarinen@intel.com
>> CC: katarzyna.piecielska@intel.com
>> CC: matthew.d.roper@intel.com
>> CC: clinton.a.taylor@intel.com
>> CC: jianshui.yu@intel.com
>> CC: balasubramani.vivekanandan@intel.com
>>
>> Reviewed-by: jonathan.cavitt@intel.com
> 
> My reviewed-by still stands, though I have a NIT/concern below:
> 
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  lib/igt_kmemleak.c       | 274 +++++++++++++++++++++++++++++++++++++++
>>  lib/igt_kmemleak.h       |  16 +++
>>  lib/meson.build          |   1 +
>>  lib/tests/igt_kmemleak.c | 267 ++++++++++++++++++++++++++++++++++++++
>>  lib/tests/meson.build    |   1 +
>>  5 files changed, 559 insertions(+)
>>  create mode 100644 lib/igt_kmemleak.c
>>  create mode 100644 lib/igt_kmemleak.h
>>  create mode 100644 lib/tests/igt_kmemleak.c
>>
> 
> [...]
> 
>> +
>> +	igt_subtest_group {
>> +		igt_subtest("test_igt_kmemleak_once")
>> +			igt_assert(igt_kmemleak(NULL, resdirfd, false, false));
>> +
>> +		igt_subtest("test_igt_kmemleak_each") {
>> +			igt_assert(igt_kmemleak("test_name_1", resdirfd,
>> +						true, false));
>> +			igt_assert(igt_kmemleak("test_name_2", resdirfd,
>> +						true, false));
>> +			igt_assert(igt_kmemleak("test_name_3", resdirfd,
>> +						true, false));
> 
> NIT:
> IIRC, in the first revision of these tests, when igt_kmemleak_init was in charge of the sync
> value, we were passing a value of "true" for sync.  Was that important to preserve, or is it
> acceptable to pass false here as we do currently?

I am honestly not sure. Unit testing uses files that are likely to exists only in memory
thanks to tmpfs. So calls to sync are unlikely to make any practical difference. The downside
seems to be that there are blocks of dead code that will never be tested because of those
'false' flags.

It does not seem to be a big deal for the code as is now, but does not feel right looking
forward. I have enough for a new revision:
- I made a royal mess today trying to catch Patchwork's attention: last patch of v3 still
  says v2 resend.
- I will use the proper Reviewed-by tag with name and email
- I will add the comma back after "results-path"
- I will change unit testing to use both true *and* false for sync

Let me know if you want any other change. I will give time for others to review as well before
sending v4...

> -Jonathan Cavitt
> 
>> +		}
>> +		igt_fixture {
>> +			close(resdirfd);
>> +		}
>> +	}
>> +	igt_fixture
>> +		unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
>> +}
>> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>> index 1ce19f63c..5c42408d5 100644
>> --- a/lib/tests/meson.build
>> +++ b/lib/tests/meson.build
>> @@ -16,6 +16,7 @@ lib_tests = [
>>          'igt_ktap_parser',
>>  	'igt_list_only',
>>  	'igt_invalid_subtest_name',
>> +	'igt_kmemleak',
>>  	'igt_nesting',
>>  	'igt_no_exit',
>>  	'igt_runnercomms_packets',
>> -- 
>> 2.34.1
>>
>>


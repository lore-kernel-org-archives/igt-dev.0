Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3FDC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025C10FDA5;
	Fri, 19 Apr 2024 06:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB5SkLLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E05A10FDA5
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508609; x=1745044609;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8dhcpEY8lwAyT1knDwYUScvNswRREwfYFm/Kv4iMITg=;
 b=CB5SkLLlWcDbYW2m/TmqLFDQik76kKTtlPTk9eA8+7tbuM8F7xh9D1SE
 T7J65I6JGJblrmb3PNMOxbBkBZ+yTRCtBX++6eEJWxHbstvC7v7HXPCWS
 br3mxh5gbWT9XVQcaEPgmZn5fDL+iuJS0o1nAwXYjOKvHpOX9tHLgh3W8
 JSvmRDTGTYVaCu10co1DFFUQ9BwZQtC3rU5eOk1ksIPlm3wG7qT6g4+Sd
 vG9a3xgVNrDH74O5V9fmBB6ajmIw8P3f4qIYF9xG6qrDnbSVWspS77U5n
 /MizNUEUA4UDgY42Zg4BueRL8STb/gb8A4ybGUZWIipn1eaJROwbzP0xf w==;
X-CSE-ConnectionGUID: FvDfD9IyQ9+6hPyYocIMUw==
X-CSE-MsgGUID: 2jNzHDCzS0mSlBUjUen2XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20485522"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20485522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:36:48 -0700
X-CSE-ConnectionGUID: 4JpJuMyHQ/qErgFfNApjkg==
X-CSE-MsgGUID: bvP3g1BJT+SYqH1pTx5Rtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23093621"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 23:36:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 23:36:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 23:36:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 23:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUDNkpFI21N9iGH0PAh0BBy9uYJ7z51glBJWANIwGwT6qd1pKAmCO+wl5CokZv8VWpYeeqQqRIXBzcYpEdtyL7mcFKRNaGd1ExTMM71oP7+Sqq0iQdwqGqxWCrCpEc0QrEu73y+7iVxiTHUliJrb56/vThwuu0nit135wavh5f8HaYGgB0ifs2AsV+LluQT0N48WeEFBP6V3HQnsLNzGwm9o9G+mk05Ox3j00Ma0xEDYONELJIqsuklsWPk6ltMhFBiPfFjSsgnZACcL/7uAT8mKjQckkmCcOluLqzmdYUbApJmSPEdx/kPHTDBmIo8KxXgvfunz8pgdxAiIAqYJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdx6/Zz3ut0uL6Rqb8NvKGG0srI4RfBId9G1VfMBJo0=;
 b=UQ3fj+OT/KYC94xu37cEgXZT4kDH1/PkE3v172Z9R3xVy+ZDmXxu+LSHX2ylhqCtqwaWA9Ses/wmCZH57UlRvNdxxKy07laurzEZDqJwwI0PzgCeHws5QP1btxo/FfVOcQR9wP2l21/HNjURMefUufmmo3hdTjDomUkUSf5NIH6Kg5kQmYIOQJbGmiNGETYseBLObLV3ajcmy87H2xSG8XWkR+NqaEFsqzwLee944Kwu0WthYgY444F/EOci/0T6+AtJ3fFTedZwAc+RZPr5PNycwPYpI7gO3VRrMfHnC0O7jU7Mbo0xxyIF0DSjFaL89g+gu8j4QylQwBBQGpykQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 06:36:40 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 06:36:40 +0000
Message-ID: <f32bd45b-e8c0-445c-bfa9-89ad216c4f0c@intel.com>
Date: Thu, 18 Apr 2024 23:36:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/2] tests/xe_ccs: Update compression check based
 on flat-ccs enablement
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
References: <cover.1713429755.git.akshata.jahagirdar@intel.com>
 <0cfbaccb86155a3e5b6fc5c68447848fb08c51ef.1713429755.git.akshata.jahagirdar@intel.com>
 <20240418135949.ow7vnpidfjeclzcp@zkempczy-mobl2>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240418135949.ow7vnpidfjeclzcp@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: d31245c8-6aba-4e3d-b713-08dc603b11e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: LD5MvyZRzb5QfOqbzxKL5AAb1p/XGij+90YJOgPzvF8a/3aStd8lS2Q5AGSnAGt7rT8DPqLLiqLUzD9nv6KMTKAhs+eeg7Ys09pq8Z/YvcaMTx81LuK1WAE3MvWZFlaEsEu2FagWcPU4N8ljnjX2/M/5Mjc6BZmkOgIDPPTTk9Mb57NEVUe0wTZ+6CJWjzCdoPq/ReHrd4oqUiRhQfku/MyCMYXt1I3oE2iWpkQxTorMMBZTbiJe1ClZ45At0iPDEsn/QhVcJFfeC2rQfmlyQ5XWqaMuCF5ANzdhJ6zmfaCOMmr2lrLhxJ56Jf/GfauNecPYaL8jHdDHUwmM89773gBKqxd4PJ1zfTXafOTfTYxdNePIyLbmU8hXOrQdiBfm8Po4Hv9VIpLrx2qZ9HNmewO7PS4Gu1oAuPJx8Jq2oPcSu7xERIDtskTemfG6UFKF+QMVbKEq0NMusSuiWFNXf8d1nKr1pXpEmHU7oRi7UurRJ/OLQW7pg196RBIK77NFBJF5AbU6CcO5P7tYwPpBS3ZT2qWBhX1kveVl4yeAvgAYRlwH8hzAy7o7bfrEMqYQQGFvhxXD9BLNmRiBrdQspKGn7GirPLF10qo89eCJhHE0a/yCGZUhotAToV218zfpShcs8O95uVQ3PlpMMIKj71LI9C2MhntkDNwPSkwex0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mml3ci9PNUFaeSs2QzN4dkJ5Mm15SGMweTE3SXE4RmkxWmtvTzY0ZytIOU9j?=
 =?utf-8?B?U2ZlS3YrNHNVa3F6ajVsdG1DNTFOYlJIeXREZi9lWlMvcG1NdjVrWlBjcDBV?=
 =?utf-8?B?THV3NDZxcmprM0x6SzRUbFEzT1RnNWtIMmsxbkpNZDlmN0Nhb1JOajYvemw5?=
 =?utf-8?B?bUl5MkxCVFh0Y0YvYkM5NUNVMmhTbE9mNkhLS1I0ZFhENTZ4ekN3YzZzKzRl?=
 =?utf-8?B?YnBPblZVcERmMFMrbERmWmZGOWttazRKUWVaV0ExN3NTT0J4NXI2S2hMMHFo?=
 =?utf-8?B?K3dkYXFMNmJveGoydEhQNkNkNEFBZWpqVzVjTHZWTEw4SHdRZE1yQ2xFR3J3?=
 =?utf-8?B?RGVnZmpUOHB0ZDdXeUxFRTFLQll0Yi8za1RMNTZ5Wis3ZmhIdm9EODV6dmJE?=
 =?utf-8?B?R2xURWlMd2tuZFpsSlJ2UUhPL0pNd0RHN2p3MlByV3JCV0VUU0V6aEh3TGNl?=
 =?utf-8?B?V1hob2FCa2NQNFJTMFRCdWtRbXZ1QU5KM3ZFdkpFaEZzZ09YODQ3RVkxYnFk?=
 =?utf-8?B?L1NPZ0s1NEdyMUdNaC9TV3ZRMUt2a0pidG9HczNMZVQ4Wm0rZklrRDkxd0Jl?=
 =?utf-8?B?OFduNU13M3d0QmU2blRVRURXOEcrUUxwUi9WMVZzMFFRZjdtWUFNRVFRNm5p?=
 =?utf-8?B?NzM4eHFaaEl3RHVpSjVpMFNuRVZLaGdBd3llNlIrMkplbEUvMW5kSHhVM3lF?=
 =?utf-8?B?SXN0R29sc0c4WklRdC9DT1Nla2w1QktYSFhuSnhtSW9LeWxma0g0VjAxczF3?=
 =?utf-8?B?ZlBsclZhbVg4S1JtRE1yT3JHQVV2OHE0Wmxob3ZHdUtxQ2I0SUlGS3JobkZl?=
 =?utf-8?B?aEZ2T1ZFajlyek1NTVNBNWp1WjJrRmt0WitqMTRRQkJUOTNZRXdwTEc4RTc3?=
 =?utf-8?B?WVpMWFNvem5LaTdpUENoZndvbTNrdGZ6VTNPTlZ3WWhOZW8rUk01ZUt4blc3?=
 =?utf-8?B?ZWtFNitYYzVVaXYxSWlJdFprTDFzMXQwR0M3K3JFVmJrd2UyNEdxemJlWWNm?=
 =?utf-8?B?bW1XSVBwdnhEU0Q0QWRwRW5HNGtTQ0RJQmtDYkZycW9lTFA4ckVCcmRBNXNj?=
 =?utf-8?B?bnJjNjBTdFJTRkFUTFV3clNoYXdDNEhSanc4akdnRmJseHI4bkJtTnBSN0tu?=
 =?utf-8?B?OEZmb0w2M2xsS2ZIcHBKRWZkZVNrZ2ZxODhFRkFBOTkxRHZNYnlneWFVTlJL?=
 =?utf-8?B?TVh2OHVQZkZ5eHNqSW9Rb1JsUWpUVEpYaGU5VWx6M21NUytWNFpzWitGdTRP?=
 =?utf-8?B?UEQ5WW9ta0wrK0syYlFzZzZMTmo0MFliQUhUdmVJL0RGMFFoY2FsNzZidWI0?=
 =?utf-8?B?bEhWOEVURFk2bXByVTVSNVhBcUxyOExVYmd5NGRCS2pXamhGSlc5SWo2STBR?=
 =?utf-8?B?Q0FoYmdLN00rWUh0clZYWFJFV0IyS0NqQkRBN3lqdDFyckpWalpUU21oaG9j?=
 =?utf-8?B?Vksycmp2TVVxWmhHanZobGc1RXpFVGtuMUhzNnN1UWZ1eEpLT1lTYmcwOFJI?=
 =?utf-8?B?dktIOFhaLzBaZHB2OHd0ZlhxdkJrRWg0aHQyTHkvVjAwcUUwdkFwS2VTK3dZ?=
 =?utf-8?B?dWlnQ0xLL0lsTEJVekxPdjhwcSsvU3RlbzIwVnVPTHF3cDdsVkh6OU1oaVZB?=
 =?utf-8?B?TmlaNXpHQ1ZMT3FwenQ3bEM4bFBCS1BncXRKU0plcTEySVRNc1lQUDNrbU4x?=
 =?utf-8?B?NVFQbEp2V1pOQnAwUkpNekpndm9sTUtlZjh2WWZpTS95YmU1TWJTMngxSzRC?=
 =?utf-8?B?OEl1cnRlM3VQaTFPOHhTVXBjbGdkY0JOMTNuMk91cTlLT2lpZkxidGo3Nkhy?=
 =?utf-8?B?RkxwZ1BFTEJBWllCRU9tSzdPVzVrT3c1RGhJOG5OdlpNeERnK3dMYy9JeHFB?=
 =?utf-8?B?US9RR0UremFzSzQ2T0JsL1g3L0ZqVDlTNHV5WHpQZzhnbUhQSmxBTUEvSnVV?=
 =?utf-8?B?R1E1RVNIU3hvbERNRTFIbEVRQlJGc3NaakdwWFFFYUR1cmdIVm5JeXo4cTJo?=
 =?utf-8?B?V1VXYmZQTldKSlZqZkd4RTB6cmpISjY5VmI5Q2pqNjBHMTJENTd5TXRNUzN2?=
 =?utf-8?B?R2RSV3hROFRZZ3lkOWVxVmp5cGI2VFhmeTFTcmVzR0Jnbis1bWZVYTZqVkFq?=
 =?utf-8?B?SUZHTkhrdFhxQldadENnSzAveERWUlF4YUg3bWVjekQ2bHBlNDJ5TFFFZmla?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d31245c8-6aba-4e3d-b713-08dc603b11e9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 06:36:40.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /h6EKs95lWLgqCd9bE/r25QATwmiw4uCgnTzr0d69opiZGNAQBdN8/LsTacyDkqIum+laL26Rax1PIRtYgcdYg8t6GQvq5tUMW0HU9nN22I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
X-OriginatorOrg: intel.com
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


On 4/18/2024 6:59 AM, Zbigniew Kempczyński wrote:
> On Thu, Apr 18, 2024 at 01:46:43AM -0700, Akshata Jahagirdar wrote:
>> In Xe2+ platforms,we need to run this test regardless of the status of flat-ccs.
>> Check if the platform supports compression and has flat ccs enabled, and if it
>> doesn't, then update the checks accordingly and proceed with the test.
>>
>> Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying
>> from VRAM -> sysmem the KMD uses mapping with uncompressed PAT so the copy
>> in system memory is guaranteed to be uncompressed. When restoring such buffers
>> from sysmem -> VRAM the KMD can't easily know which pages were originally
>> compressed, so we always use uncompressed -> uncompressed here. so this means
>> there's no need for extra CCS storage on such platforms.
>> Thats why we shouldn't need to run suspend-resume on xe2 dgpu.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index b3bf97af7..d6148dc44 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -162,8 +162,24 @@ static void surf_copy(int xe,
>>   						      (void *)mid->ptr, mid->size);
>>   
>>   		munmap(ccsmap2, ccssize);
>> -		igt_assert(!strcmp(orig, newsum));
>> -		igt_assert(!strcmp(orig2, newsum2));
>> +		if (blt_platform_has_flat_ccs_enabled(xe)) {
>> +			if (IS_GEN(xe, 12) && is_intel_dgfx(xe)) {
>> +				igt_assert(!strcmp(orig, newsum));
>> +				igt_assert(!strcmp(orig2, newsum2));
>> +			} else if (AT_LEAST_GEN(xe, 20)) {
>> +				if (is_intel_dgfx(xe)) {
>> +					/* buffer object would become
>> +					 * uncompressed in xe2+ dgfx
>> +					 */
>> +					igt_assert(!blt_surface_is_compressed(xe, ctx,
>> +							NULL, ahnd, mid));
>> +				} else {
>> +					/* ccs should be present in xe2+ igfx */
>> +					igt_assert(blt_surface_is_compressed(xe, ctx,
>> +							NULL, ahnd, mid));
>> +				}
>> +			}
>> +		}
> This part is fine for me, but below code doesn't work on Xe2/discrete.
> I mean I got:
>
> (xe_ccs:6919) CRITICAL: Test assertion failure function surf_copy, file ../tests/intel/xe_ccs.c:232:
> (xe_ccs:6919) CRITICAL: Failed assertion: result == 0
> (xe_ccs:6919) CRITICAL: Source and destination surfaces are different after restoring source ccs data
>
> After resume we put corrupted, then previous ccs data. In all cases
> along with uncompressed surface this leads to disaster. I mean for
> discrete instead putting original ccs data (this one extracted before
> suspend) you should fill it with zeros. Original ccs data were fine
> before suspend migrated surface to system memory, but after resume
> those ccs data are not valid anymore.
>
> I've verified that for Xe2/discrete:
>
> 	/* retrieve back ccs */
> 	/* memcpy(ccsmap, ccscopy, ccssize); */
> 	memset(ccsmap, 0, ccssize);
>
> does last blit work correctly.
>
> --
> Zbigniew
I see. But doing memset() would fail for ctrl-surf-copy subtest since 
the mid blt object would be compressed all along.
So, we need to copy the original ccs data to the mid blt object to copy 
it correctly to dst blt object.

So, we need to call memset() only in case of suspend-resume.

Best,
Akshata

>>   		g_free(orig);
>>   		g_free(orig2);
>>   		g_free(newsum);
>> @@ -193,7 +209,8 @@ static void surf_copy(int xe,
>>   	intel_ctx_xe_sync(ctx, true);
>>   	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>>   	result = memcmp(src->ptr, dst->ptr, src->size);
>> -	igt_assert(result != 0);
>> +	if (!blt_platform_has_flat_ccs_enabled(xe))
>> +		igt_assert(result != 0);
>>   
>>   	/* retrieve back ccs */
>>   	memcpy(ccsmap, ccscopy, ccssize);
>> @@ -365,7 +382,8 @@ static void block_copy(int xe,
>>   	 * occurs and ctrl surface will be filled with some not-zeroed values.
>>   	 */
>>   	if (mid->compression && FROM_EXP_WH(width, height))
>> -		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
>> +		if (!blt_platform_has_flat_ccs_enabled(xe))
>> +			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
>>   
>>   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>>   
>> -- 
>> 2.34.1
>>

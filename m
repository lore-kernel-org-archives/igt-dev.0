Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDDDC46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 09:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7FA10F85F;
	Tue, 30 Jan 2024 09:33:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F66510F85F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706607237; x=1738143237;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GEbtYpqyPHuCd8X6UuRfLadDVSvfuD+HNcEX/PsJsqY=;
 b=CxCtWYGWIDxunNnQXKA+5zgjF9qkpanuzcu+sBBmJff2PcBmGZX54Vik
 8yjA/YPHJD60TTNCrQFlQu0uVNLIa5ovNUndLxJH2dnzjVS+HEtR8IRgv
 dzwqQbQffHgINn9Fp2bk8Nzv1q6F+zo/tPN42WNh/9qw805jy7XcYbX/Y
 bjgRSgTJKKRqjLdyoC8mTD+NQgk0ukwVlew2TCgyKX5xgKPfBpaPl/dSp
 SPzySjFRF5rKYMI7Gt1vRSL6cyMwBQCFZRSnr7q2+Hpk41joxYuRlpLYT
 QP/kIKjgg+0oH3XcVT0mrx4c2SQ2Gt/vgUqSxohSVapDdn3SULMagf6Bq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10612133"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="10612133"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="22381902"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 01:33:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 01:33:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 01:33:56 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 01:33:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tey0Iu2bw7xFJd8cj9RA6suHsYLv/NoL+uLLiIQbKUIh1YeA95FinKt6SwWxKnjC8QKNFPd/2PNFHRiZJDEB0UOxIUPB3S5oXL6kENSQYa2SZ1mBEcv6EXcoUxgsme2W9RRr/MIH0Ms9eXKhkSresAvaPng+x3/HP/5jQIHaphFnMLl2bJhlnDj3mThsorpMLQWUJ8Xw7mLlXB4lcHyzHPC/Lo1GEjjk3v29VQ8d36MoxF+ioRgywCa3DOxT1HgbhVwEfa6cxl/zmIcR/zQMj5EemtIflvTJ76NN5hBHKFJkH9xpjC21HqtTCREntF5xoMOu/xhbqxxrB/J4dZqguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24SLP1jI2gEywgV1AVF2P+ObwhwzBLbwlCue1ojEnuE=;
 b=AWLrhZnJDo2dHneqhZn+lTSaXY3KixesrRovf44hIed2OBQQlenGwKB+t1kNlpXs/yPzlI8aluVi/9+Kk3nrqUrKj8vkfkxEO14Z4l59CdhAQM0ucTrQB6TcwXDY+Qxy7V9HoAI/rgLidfPDjIKeeb+xbf9ipSbYUp3yQZIAmGmozTqsqJv9NzWLPfwn3eMOPkCIsylKBY29noCui85PTFxZzqpq3BywWyFQSleAbFbheDPDMg1jDrb3iI9z9SzGu+NjSww3VS6nrU3y6FZVpcEZkkzxeNdvHUq29XdKLwibsUDqXgGhJnhkfie2Y4yWVbeK6AU9T8M173eAJf0W7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 09:33:54 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7249.017; Tue, 30 Jan 2024
 09:33:54 +0000
Message-ID: <cfb4ef77-a871-4c4f-bdd4-7dc0a881a6ce@intel.com>
Date: Tue, 30 Jan 2024 15:03:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_atomic: fix basic-inc-all
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 680fe592-b877-46bf-65a3-08dc21769339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTaA8fc3oC6yayo4lkM8N4Hds/hnxy+Q795aM0KaEfuNSBuT0B2KILOR5Wz5uDDw8Az0vtlIWRAMrC41lpvocwkAx+1cTnczmPbhzdbKwnSEtt6S+B/F5Tc3E7UiHSrbRWpT2YHmlZXHmTs2CX0iixpDKrj2lAqDMy7gXaIBx6TevelogYhD2sPYcFky1aQDW/z4e0RVckjn1vYAV1rktw5wMtT1uwVQOwGLPAX5W8STqq+E/0hN/do1Vz7PiCep0KsaMoVxpt3h7YWAHsvTXW5xl1NqmHP238Syxd2yyoJxgmefUvVaX7J/o5UahhS8WUzyaYbapFZh71GzRTlddDU4lGO+qK79KSXOj/Tg1bK8ANv+ukVsz+zH9rzc/nmVV1HI1ik4mJmVzRyiEoKAWdckLs/pQjqBRi4XwaaJ5F4AKjGrsHR/9yW5BNz1eAIxFflrvNAbzsuZKvSd1aZ3YvGlbZxk4ANDcEeeAJJNul6WH9artvKb7xWdTDKlBww+K0QwZFt84BI3zDBmFysECtVkJIN8MI/FsFWVUczf+7iWgGYj6hMkWBXCnI9T/lwMh89zLadMNiH4hvxTCXdr4/BEfK5AE/5VxyJFOo9xtVuxlupEebe3zZlv1xl9s0poxnYXkCJRvMpGFSXfVfoOdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(31686004)(6512007)(6506007)(6666004)(53546011)(83380400001)(36756003)(31696002)(86362001)(82960400001)(44832011)(8936002)(41300700001)(5660300002)(66946007)(38100700002)(478600001)(2616005)(316002)(66476007)(6486002)(66556008)(2906002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlkwb29zQ1BBSzNrMFBLNldEek56UmVoNXcvN1RWanh0NFZYZFJLanVqVDh0?=
 =?utf-8?B?cjNPekpzS29mR2xOdmVpVTk5bHJJRnFMSDhLbVZwWDdrSUx4eldHOTFQaXpo?=
 =?utf-8?B?OUI2Zi95OEkvakZPUEo2VHExbEliTmRyNWZWaE1mQ0RhTzQ1ejJRcnB3VEpq?=
 =?utf-8?B?VmVNUjdRVzV6Q0hqV2xTTlNGSzZKN0M2RDVuOXpKeWxPL2dLdmVDOGk1NDFZ?=
 =?utf-8?B?T3BFekdESytpUW55TDRqTDR3SnVNRmtySWllcHR0OHlTT2wwUVV0NlJRbjJl?=
 =?utf-8?B?UldmVmdHWFBvVGE0ZEg5YXlDZ2hxc0VueUp5dm9ZUzE4YkhWd0svMGM2SE9J?=
 =?utf-8?B?YWVlWXM1Z3RjL3dSVEhDblphbWVtdWVUUEJwaXZiNGxGRDNldm84djNMdkdG?=
 =?utf-8?B?eWJRZ0x1WmNPUzRzR0NwanRJWXhQM2didGxVSXFUWng2cnhzanpSMUNkT2gy?=
 =?utf-8?B?SXFBSmhlSjEwZ0V1NHkzdUlnZlQ1QjBzQk15UnFWYVprTG1RMVhJSWx4cDhi?=
 =?utf-8?B?Wm1nS0FORkpjVGs4WEtMWVpxb2pDRjJ0T25wNzcvbDJaT0FWZG5mWGczbG1D?=
 =?utf-8?B?L2RHTmF4eDdkSkE0YVgyQ2VvYlBJZkZleXU1U3FFRVBXQm5leStYajQ1UzFn?=
 =?utf-8?B?WERwQWNwUlNGU1ZiZjZKajM0VXZFcHVhc1I5VU96YUhHd1E5UUIxaWdFU1Iw?=
 =?utf-8?B?Q29ENlRsalMrRDFwT0J1SU81aWlQNVltSHR0Z1FscWh5RUVwSzNsak1PR3M2?=
 =?utf-8?B?N2VkcXB2Vyt2MTMzeGY1Y3R4czVEUEhFcG51OWxsN2NJeURuaU9ocy9uWno2?=
 =?utf-8?B?ejRsUlBGY1h1K0JqVmZoZ01JdTFDd0ZDMHltZnN6d1lLbUVtUjJjK00yeHFu?=
 =?utf-8?B?Vk45ZzZNTVc3d1Yvd1Uwa2traHViTW9FZTRsN0lNcVBxSExqM0MzTWFLMnJ1?=
 =?utf-8?B?VkV3cUUvOWp3QlpkMWdoUXhsUzJuUTl4NlJ4aFJrSkN5ZGw1NWxCRDRZSDhP?=
 =?utf-8?B?dlpvNDRUZTgvRU94Wkt0eTFHUjlIVVZLbGNrbmJqRnpnSm1MaE5XUXdLaXY4?=
 =?utf-8?B?eWxreHdCRWhRa0VScWxMNmVWMnBwODhuZnRGMUlvaWV6RlQ1K2hWdHozWWd4?=
 =?utf-8?B?TnJUWHBSb0xpOVVxTFU3WDkxbGZiSGF6M1N5RVlaaWVMN3VaWTBEOXluNG1p?=
 =?utf-8?B?cWl4Z2F1SllsK2VITXJTNmp2K282Z05hVys2ZnNOU1pyemlKdE9VZ29SZFM5?=
 =?utf-8?B?S1N6TVUvNUN1OFB2MXZIaE1PcENQNUo1aHc2c3V1NkpCYytZZ0RWSVBJelBP?=
 =?utf-8?B?SGFHKzJSTERCOWxTZW5HTlBOUkZ2M0RsWDBmUHh6QWozN05SdUZiMDE4TlpK?=
 =?utf-8?B?SSt0YnBvL2FtVEhYdmUrZ3dIajhTSmR2V2NuMmMrS1R1R0hnWVF3LzVNeks1?=
 =?utf-8?B?QUpTSGI4QnZqYmtxSGJOSmVwMkJlalE5cWh3LzNWR0k5eFVlTEpHcXI2Q0Rt?=
 =?utf-8?B?aWd5QStoZjFVeGU5ZTY0djY3SzQ0K0xPYit4QmpuVzlZUjlta0tsSTdSNnFz?=
 =?utf-8?B?ams0NmtaaWRCaDVOM1FqYWJZSStGWjJxa0k0KzdnNlB6UFBjaERFV2NLT284?=
 =?utf-8?B?a0ZVS0k5RWtoZEYvSHZkSU13OGM0SE5VeU5UYkoreVhRYkRMcm12dFoxb09C?=
 =?utf-8?B?VWdEaUVJNmg0dFlWMTdhRlEyMXNmMEZlemtINWRGblNNYkxoUkJPMDU2RE1i?=
 =?utf-8?B?aytQeVo0N1B4S1RpY0lacm5XMjB3bXBjckVkTXBKRkV3Qk5UU3BxMkIxZSsr?=
 =?utf-8?B?S2cwY2Yyd28xbHRRb3NMbUYzL2cyR2NWZDYvRkJTQVNNZks5SHcrR0RoTTE5?=
 =?utf-8?B?QUJKS0Q1cmE4Y2w4ZnhDNDNBUVNqNGVTYVFkQTdEc2hERnNYT0NqWUJ3QWpn?=
 =?utf-8?B?NUpSeWdETlZvN0szK3B6eHF1MnZoZkJERHJjUU01cGJ5TXV6bFdNWDNmZFd3?=
 =?utf-8?B?RmNYQmpVUHN6TUk5Q1hndDJBVllZVTdLSmZPZ3FjMmJKdHV0eS8yckRhN29D?=
 =?utf-8?B?cjJ1T0ttcWp1T2tBQWtML1V3NnBuTmtDbk5zbU43YVphMzl1ZHpmMms2QThU?=
 =?utf-8?Q?hsmDjYxvVT6tsLFQ2GDNSr0kW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 680fe592-b877-46bf-65a3-08dc21769339
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 09:33:54.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18zn7z+a9wZU2ckWJPmz/yEDe+VbAlAw9+kmiXn2Ca55TrrlTUxOtc3i9ZJmIe8WKBjLMYgcQW857xCF89PEQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
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


On 1/30/2024 12:24 AM, Kamil Konieczny wrote:
> Previous test removed skips on unsupported system memory on dGPU
> but did it only for basic-dec-all. Fix it for second test
> basic-inc-all. Also while at this, use drm_open_driver and
> drm_close_driver which takes care of xe device get/put.
>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


Thanks completely missed that.

> ---
>   tests/intel/xe_exec_atomic.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index 48c70ec72..d9790da78 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -124,10 +124,8 @@ igt_main
>   	struct drm_xe_engine_class_instance *hwe;
>   	int fd;
>   
> -	igt_fixture {
> +	igt_fixture
>   		fd = drm_open_driver(DRIVER_XE);
> -		xe_device_get(fd);
> -	}
>   
>   	igt_subtest_with_dynamic("basic-dec-all") {
>   		xe_for_each_engine(fd, hwe) {
> @@ -152,8 +150,8 @@ igt_main
>   			uint64_t memreg = all_memory_regions(fd), region;
>   
>   			xe_for_each_mem_region(fd, memreg, region) {
> -
> -				igt_skip_on(!has_atomics(fd, region));
> +				if (!has_atomics(fd, region))
> +					continue;
>   
>   				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>   					      xe_engine_class_string(hwe->engine_class),
> @@ -165,8 +163,6 @@ igt_main
>   		}
>   	}
>   
> -	igt_fixture {
> -		xe_device_put(fd);
> -		close(fd);
> -	}
> +	igt_fixture
> +		drm_close_driver(fd);
>   }

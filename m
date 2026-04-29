Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB7DFF8864
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 04:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5C010E3B9;
	Wed, 29 Apr 2026 04:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxHOwkZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C8C10E3B9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 04:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777436386; x=1808972386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6mIHNnyhSIDhQrSvlULnZimz6cNkpkPc3jnqVGiDmFQ=;
 b=bxHOwkZdR6f1xYEDJV+3w+G4lL57SZ+M0oncSXFPnjB4gxKwmUqQW3Tp
 ZiwoF6eljpZaVAg56Jzx9K/zDTfijUPT6rr5fzWwZEhaOUPbA8a4ezkdo
 iv51AgizTLhQLA6jU9sDg2efwAv2G+kXv7PvJ6H7ar3qUk6rilf2BY1VT
 BIRxJzD+0FlKTA/nuvYekVL7e80f9vM/eVvLr/iJ43czXXGDNobV8alGC
 +kgSUfbXoKZTFnOleMNQq051Ml6SPC4ZX22xiZPUGRVd6NiDnpGEfUeCt
 /PGS7iSNKnGAmeX7iBcnUUCfwlx9k0o2otJgimERYGdeVEtUW/+lc/GBX g==;
X-CSE-ConnectionGUID: YP90Pu+OQ9i6TfTzaMiCWQ==
X-CSE-MsgGUID: iJOzXW+BR8mFndOK2YxduQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82214111"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82214111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 21:19:45 -0700
X-CSE-ConnectionGUID: 7ntwfRsMTCWLM8wJFEHdBg==
X-CSE-MsgGUID: bp5OYho0SVeGX+PNHiPqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234431917"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 21:19:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 21:19:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 21:19:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 21:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlNp3S2mtzRY2G7P3Vl/Rs6p22tAYjFrM6VWhRaZvIzGoTF/A2QWSMJ+r0EwLm4EYqsMlUlFnrUvOVK2WfkVJKBHystG6W5reI367tKVdTBom2Nqx8jWOtW38dw79ya+XZq5YukXHkuGbgLPhgCActqNkFsEqlfJ/4omQFeHIoFRStv4/yLdLKOZ7nSod7l5ojN0HU0sDEnUz1dx/FKy+OEN6tH5gQuLzq6wfgpAyGf7g3UZgJ30QNV24j1u6XgOhDfXvpXdbvvjuZFknujMt/Tw9I9Nxn8yWHJLVlqVRmBmjy4pkik4pGzuLWZAnl3rD5LMjOwaJBYV1So1t/l+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvAiJ1RyNvhEok5aQADWJkwyfZA4q1vkj//DJK8yO/g=;
 b=CZMZPPJRydshzJXexiZRXBXSgdV8UvaeoOPmjIc1EWR5XCL/p7eEwSi+qehmZF3kfb8TTLGkorducPK6UpSR2z5EyD7xiE9RJ1YOhq/dAn2rM1ys9M5BOkVMc4omn+1uOTeki5oibOYlpDxesS02pBlUYm3DEqyBtPHAZYEUJyh7hNmUdB/ngmozFdZAVt9BPjObg9flT2soJm+WI6FBN1deB2qEVOGqOsqnFPFUetcE5xu67IKUkrwkjZoKzsaHwcqUmxJMt/kb9d7R9htrqZC8ck1MF4Gn1llWmCq0v3RAWchOrlasnWjj5cNVob6k6E46u4yBrvbaZmDkPwYycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 04:19:34 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 04:19:34 +0000
Message-ID: <d9fc6af1-df9d-4cf8-9472-b52316c71370@intel.com>
Date: Wed, 29 Apr 2026 09:49:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_madvise: Generalize metadata and
 group purgeable subtests
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-2-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260423063904.3944005-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DS0PR11MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ad9cca-fb01-4e19-62ff-08dea5a68487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: WfxlcwS12YGALs39469hhRw+4ljFUhAi77oyd9OhP4AjIql9dt9xnbuzdzhaYFpRnF0lhjOxC5meGDp4gTxj63lLIFREEp5yvX+DbJxpUDFmFGtLfWxNEB+lBjsZ3XgY7Kqk7muhpfucZ2m0/SkfPJAAtZHRdbg7fsLUjd89V8nlwQ+cKY7BRBdp0GmYzdeOI5Ejb9rQPrpZ6JTUJINQzYMOZxTrnZ3L1cfxxlKoJDROBek5FE/CvGRM5ce98r1ALynfjX0MRRdLmadJ0nip5Sp1fqi60zQFDRBG5dRCO1bt4d8DRtXgwwZiM7IWl5/syuFcGPocgrHWB08HDQDt14k9aNJCJ9LRzYzIQipKWExEfEU9OQoiC/NZq9jTJrtgub3jkpKtWltt4XS/hX19FublYvja1eJ3/Hs7eGYjc8jKrCQDntqomperdQ/MmFORfGloxyZEYGnT7GP1QeuuZSGUWKrXkQ7KvhyDadV4Deo0SeohD5vVlEYoSXAHTnYfj0DGM2p/iXQ1aeVJV9mkhkQRO4L6LgOGFxrQYzCF6AvAN+VtDq8ZGavaD4k1L1j0cXriI7RjzO1cbt8BT97XCCfHgP+UlOZBMJqc81uvyhcQml5vdGFA7tuAYUL5nAX8S1DP742sLW+nglUL//Dlo1s8Jz4W4JEKV3uAqajzsFDsTCRG29LXjtJ/TrpkAqk3I2MYSsBC5sW0q3Sq2mEF1HdUaFgAjqioI3rhT4H585I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWx4aCtPRmZQTE96dnc4UzluUEJKYjZWdEI4RzltVTJiVmVjWEVyVnRFbExG?=
 =?utf-8?B?ZWlrYXF5dVg5dk9Uc2RMK1ZvT2RkeG1pZWJzWER3NjFKajR4clFDNzlTZU5w?=
 =?utf-8?B?OXlGelpEVlVNVTZBSEptaHhLY29EdlgwYmFLY0lTa2pxd0JWWXBGN040M081?=
 =?utf-8?B?azJtWkFvRzhYZnhSU045cy9jY2lHNnovZ1ZTMUNlQTI4UC9FMnRORUY2b3Vr?=
 =?utf-8?B?K1BMenV1bU5YUzhaY0IrNjBoeEdjSHpxUzFSaXZNekZUVml0RGt6SCt5SFVF?=
 =?utf-8?B?ckNyUGVQdUw4M1NPeXVvZXJ0TXZuV216YzlJKys5RFR2WHRXWk0vOHBnUUps?=
 =?utf-8?B?THVaN1pHVnVOWUhCN3N0aUFTSVQySzJKMkZ2WjZsbUFVcDJzbjFTSWlqWFpU?=
 =?utf-8?B?elViUDREODE5TXJhRUthUldkaVp6VVpPcjNNclJSY2JQVm96U25BWHF5YUQx?=
 =?utf-8?B?OTlrd0h3dTlPdHBiUEYxRHR0dzBieHpBSWdYcWdRdml6aDZwVnZUNml5NUJm?=
 =?utf-8?B?K1Q4VkVoUmJFMEtFOEtJQmh1VWJ6Y0dVUDNHanFFVVM4NnVXYVhEK0ZQQzZ6?=
 =?utf-8?B?SzVyWVlIdkZ4amZ5ajFYQnFFM1BKTGJxNi9WUFdtUm41cFFWcG4ya2NrOVps?=
 =?utf-8?B?eElUYUcxRHZvZVAxR25CYm9kRjJBTlR0aWtoaW0yc2pIV2JwT0YycmFzakRa?=
 =?utf-8?B?WHNJWWo0MGFKNDAvM0hEWElaOVMrcDFlV2FHNzAzek55a0lJbHkyMW5udG4r?=
 =?utf-8?B?KzhFeGplODU2T250NWd1cEQ5VENabVNrT2U3Myt0enZIaTh2d1RZVWtWKzR2?=
 =?utf-8?B?YWhEcnFxdlQ3UWZXWTcrUXc5UEVidjlST3hQbEM1dVNNQmFkZWpma3UxV1RS?=
 =?utf-8?B?RFJTTU1Yd1RGVUVYOVJCc3NvYUlCVTh5TWE4cTBPMXBMTEQrc0I4cWhKNlBy?=
 =?utf-8?B?bytlMjAwQTNadlY2NWU1NEtmbmx5eHRQZWJSdUFLa0dlbFNTY1pOTm44WDVz?=
 =?utf-8?B?QUJVMWRURU5FYUtaK09ZYXlpWmVKeXhMb1Y5cEVodzEreWpwbzV5R3p2alBh?=
 =?utf-8?B?RElUblBZcTczSk9rZjhPam0raEk0SC9ER3J5Z2hJcElWMGxyK0ZKV3dqUk1t?=
 =?utf-8?B?NEwrRncvb01mVVZGdmlieEdCZ1dhRm1mWTJpUXRFYkJGVTVJSDBiYXVPWDNq?=
 =?utf-8?B?dUk3dStKN0JVSHVNWkV5VlhnUlZxN3MrQTdNZ2pZdC93OHNNREZXM012NVJL?=
 =?utf-8?B?TnBXREZqY21DS2wrUmVaV2ZpV1B5QU84aDhoc0ZMdDdQdWpCWDlVLzd4aHVt?=
 =?utf-8?B?K1hPZjJ6Qk5mU250cUszeEd5TjZPbnlTNkd5dURhSHB6UWhjTmdOS3ZjVjlM?=
 =?utf-8?B?K1N4NFN4U3NidTZDeFJzc2ZaMjZPNENpWWxWdmEzaDBnMHh3TUVELy94ckJL?=
 =?utf-8?B?Q0NzczA0VGpxS3ROM1NkRVhIakwwTk5CY1M4SUFrdEg5em5xK1lENEJmVzFw?=
 =?utf-8?B?RUtLaTRUWVBaeldWTGtJdzlRWW5hSXV5NjRxU0wweVlUdG93Qm5ack5Zb2U0?=
 =?utf-8?B?REc5bmFIRUhiZjRnejc3Z2xFbm92akJ6bm9xMlh1OXdtVTNqUmdpWTAxc0xu?=
 =?utf-8?B?eWozYnlVck96alg4a2RtQmZpelBPd0xZbThQMndQYWhHdlFnSEt1cFdxbUJk?=
 =?utf-8?B?N0x3Smo1LzBwMHNsSjBDRXllRGh5eEwvZkRKMDdhWnhjVnNUV2pONkEwWm9V?=
 =?utf-8?B?UE1EZTAzSGN4UDJYWWJwY3FOYmxVSXR4ejNEa3Z5b0tTMlBqWDBBZ0RaUWJ5?=
 =?utf-8?B?N3dWMmpUalV4ZGpySFd1VStTVHRmMVBBODJLK01ITnZnOEVCSDN5UDl2cjcx?=
 =?utf-8?B?Y2toVjZTaHN5WXlNRGloYk0zenFzMHBuTmtuK1BrVWkzN0hDbGNiVklVVW9s?=
 =?utf-8?B?UlBRU0tKemc0L0FkMm1EWU1RL1dybVM3MkVaM3psUmZpdzV1Ykp6cWtieHVT?=
 =?utf-8?B?TFB3SXJwRDRiRXYzTkdPSzJvWXlwQ0wrbklGN2dSRWNXeGY0RGVRbWxYdGdY?=
 =?utf-8?B?ZkVLWWg3Z0V3bXJyK2ZpVzNxYWNNMEdTRHpVQlZkcnloRFA0K0Y4alBZUWVY?=
 =?utf-8?B?cFhIckxxS3NKVWVoYm5LalFJTlVQTWJ4S3JQTjRkd1BRbUhaVU9zWkloaFFl?=
 =?utf-8?B?NzRlK2RnVlVIaHpTWlpmVjhnUTFLTFVuZWNCNzJJQ2xQYVJybFlVYjZSbEVh?=
 =?utf-8?B?ZWI4L0dYMm84RFFBemJPWWp6ZC9ldUg5RDVWOFZ6OFhuZjRuUm9SQ1E0ZnpL?=
 =?utf-8?B?T05CRDBBSTF6WmtaWGZVa1NUeEpBVFRsZlYydEZEeGFvVTQ0cFI4UT09?=
X-Exchange-RoutingPolicyChecked: NI/7zrrnOytC0sUKMOtT7775FJgr4ejl+wRJ84nM0JpFv0BXTwP8qAloGzWcPGT+Aj80B1kKjSLxqzJcqE4IFvvIVU0PpCme5j/inPyWKVB0hrNPfmvuRWHm64mMP1Wlneh/WITNCn+TwnTetKQV4oO8lrTdy3RxFVULQWdWMCuTjVh0UpXaOJxv6kRD1zuwwc4glDsZUDQr0u+ykgASQYsxO0FMHwOgEcnh3j7PZREEvu/nVc3x94s2Duam6BUb1xpMGSzOU9gKaeMX9WgeD5GTzlf5FBGfuCCJAvYBVkDq4yXoqk/suYSYEXEb04bqBAbtO7/jqM2TLol2l0BzWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ad9cca-fb01-4e19-62ff-08dea5a68487
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 04:19:34.1521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bq3o5yp56+SJ3dsPbHcitlV0qT4kaM/R8r/dpi9S6FOmiAz2i7dG5kLym5XfCdBBY6ZtB4XINj6+q66WQhJ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8686
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


On 4/23/2026 12:08 PM, Varun Gupta wrote:
> Generalize the test file description and functionality tags from
> purgeable-only to cover upcoming atomic madvise subtests.
>
> Wrap existing purgeable subtests in igt_subtest_group with a dedicated
> fixture so the purgeable capability check does not gate future
> non-purgeable subtests.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_madvise.c | 94 +++++++++++++++++++++-------------------
>   1 file changed, 49 insertions(+), 45 deletions(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index e9bf55ff5..e79cafbff 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -4,11 +4,11 @@
>    */
>   
>   /**
> - * TEST: Validate purgeable BO madvise functionality
> + * TEST: Validate madvise functionality
>    * Category: Core
>    * Mega feature: General Core features
>    * Sub-category: Memory management tests
> - * Functionality: madvise, purgeable
> + * Functionality: madvise, purgeable, atomic
>    */
>   
>   #include "igt.h"
> @@ -776,51 +776,55 @@ int igt_main()
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
>   		xe_device_get(fd);
> -		igt_require_f(xe_has_purgeable_support(fd),
> -			      "Kernel does not support purgeable buffer objects\n");
>   	}
>   
> -	igt_subtest("dontneed-before-mmap")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_before_mmap(fd);
> -			break;
> -		}
> -
> -	igt_subtest("purged-mmap-blocked")
> -		xe_for_each_engine(fd, hwe) {
> -			test_purged_mmap_blocked(fd);
> -			break;
> -		}
> -
> -	igt_subtest("dontneed-after-mmap")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_after_mmap(fd);
> -			break;
> -		}
> -
> -	igt_subtest("dontneed-before-exec")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_before_exec(fd, hwe);
> -			break;
> -		}
> -
> -	igt_subtest("dontneed-after-exec")
> -		xe_for_each_engine(fd, hwe) {
> -			test_dontneed_after_exec(fd, hwe);
> -			break;
> -		}
> -
> -	igt_subtest("per-vma-tracking")
> -		xe_for_each_engine(fd, hwe) {
> -			test_per_vma_tracking(fd);
> -			break;
> -		}
> -
> -	igt_subtest("per-vma-protection")
> -		xe_for_each_engine(fd, hwe) {
> -			test_per_vma_protection(fd, hwe);
> -			break;
> -		}
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_f(xe_has_purgeable_support(fd),
> +				      "Kernel does not support purgeable buffer objects\n");
> +
> +		igt_subtest("dontneed-before-mmap")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_before_mmap(fd);
> +				break;
> +			}
> +
> +		igt_subtest("purged-mmap-blocked")
> +			xe_for_each_engine(fd, hwe) {
> +				test_purged_mmap_blocked(fd);
> +				break;
> +			}
> +
> +		igt_subtest("dontneed-after-mmap")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_after_mmap(fd);
> +				break;
> +			}
> +
> +		igt_subtest("dontneed-before-exec")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_before_exec(fd, hwe);
> +				break;
> +			}
> +
> +		igt_subtest("dontneed-after-exec")
> +			xe_for_each_engine(fd, hwe) {
> +				test_dontneed_after_exec(fd, hwe);
> +				break;
> +			}
> +
> +		igt_subtest("per-vma-tracking")
> +			xe_for_each_engine(fd, hwe) {
> +				test_per_vma_tracking(fd);
> +				break;
> +			}
> +
> +		igt_subtest("per-vma-protection")
> +			xe_for_each_engine(fd, hwe) {
> +				test_per_vma_protection(fd, hwe);
> +				break;
> +			}
> +	}
>   
>   	igt_fixture() {
>   		xe_device_put(fd);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>


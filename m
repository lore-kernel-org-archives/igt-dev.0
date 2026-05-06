Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF7CD3427
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 02:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52D810E4D1;
	Wed,  6 May 2026 02:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCi8GuUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E910E4D5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 02:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778036130; x=1809572130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S4lp8LYDARlRA+NVbhZFVvxuGPTHZrPpdyldWts0PSo=;
 b=OCi8GuUn5jJXId+Iy/GTu8Qz7h7+n2QvO7+u6Imsx1GRdZ4xLbFMA6fW
 610TI3dANuP4KaGe5ziLZYeCNWdFn21gLz589t9ILK35pvtM0mND03rOb
 rwYefvsspYT5HObK6eLXbZGkRNJZedqqPUQ4FYt8wxdsjNou94cbCkH2d
 2HSm9NQB9b7xz/MEGiirr5AZVVgXu69WQpEIJCbXfj4nDO9+QsoDKL5YX
 BZKNqNBEtDrNzDGiyK7dJNkiKIwdO6ydZR/x6jG5v+9dc1kR41bJzQnkZ
 Q31mTzYps7n67MvpLtL56zkVbZuFK39ga80uuRAl4isx1+NoCd8w8A87w g==;
X-CSE-ConnectionGUID: XPcf/j8mS4GV15eZB7PATA==
X-CSE-MsgGUID: jumxA0Q6RiqE7ScHwZ91dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96352538"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="96352538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:55:30 -0700
X-CSE-ConnectionGUID: DsnSP/L9T5u9mlr2gqganw==
X-CSE-MsgGUID: XDGPsozwQ3ql61/NM7WlvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="259656191"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:55:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 19:55:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 19:55:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 19:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1ML7HVy1mHJHsoN1tGPje4+dlgh2FcFi6650PQQ2iYr0HZn5xKL6DmDCfWewZDaehfFI/h96vFdeC/EWSPQXJEb2ezGvqQRIoKE1f2E1M5XafN+lyWkqf8bJcpPqyvTaib97NspKEyFGjAbq4AP0SHuO4AlZm5Ip8LKYnLUAA0c7oaUJrfiU2O2K4771iP4FiStJY4jzypkLl4jTLvkbSq/dCjJ/wK63AHOEX9lA6E1rqKkywyrOybKYG5MVTIivC6jErzEUaa8HSKBLS9bXXDopIy9F/9Q+FwjjOKXsvGE1PZN8c1uXpFmS3m71yMaEvMKQyX06kJGTKNgGqF91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41K+g3Q7RnuuWixUWjJRbH5hhy4NF3S2vJl/35aX+8M=;
 b=m/wz4e0xCNrH+Bd3ADcvA1x0cf5FRWtBrR7+APNSl2kEsWA8E9UtLBJiwDXLet5mDAIaD0kYqY6u1B8apq16QfjKsmwhlS9tGVB2F8a9ePPFC3cssiP2GCN5mDmkZ/b17wWnqAdOc+1PdZTfrAjDTCbR6cC4CTWr0a0A8hxHYEHTlCoE0hn+bGZNWQ7HHlPlnMHoaloMbf6BelnPmhPprj6Zp3U2IHrqYsMGz3PmHxOBiF3W/mKYkkE5vxoJvDUWJOuw2Ju5kHCsde+Dfml0Otjski9fDWKHAHH5mu8a4kHkBWEi7Llo5/BsO2YuElScWA/EOutU256uE93vpnIvNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 by DSVPR11MB9742.namprd11.prod.outlook.com (2603:10b6:8:34c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 02:55:21 +0000
Received: from PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580]) by PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 02:55:21 +0000
Message-ID: <9c0f2a57-dece-4d71-b8bc-5333cbff015d@intel.com>
Date: Wed, 6 May 2026 08:25:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] tests/intel/xe_oa: Wa_14026633728
To: <igt-dev@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>
References: <20260506024443.612636-1-shekhar.chauhan@intel.com>
 <20260506024443.612636-3-shekhar.chauhan@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260506024443.612636-3-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::7) To PH7PR11MB8600.namprd11.prod.outlook.com
 (2603:10b6:510:30a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8600:EE_|DSVPR11MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: 54026c77-e828-4d54-7413-08deab1ae9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Mw9rHxNRjeAUOJ4b10HpfO9o4pWaqu1/jK0Vlilv4DL4mtJJ2butxqHbYcNA7Qz5AF3uNq9G+DhoJHpPFtLFZEtVDMB9E9vbQD07e3Ji9A1kE/yoKBDdOzDoGxq2gT3kfoFqqYe4Wmff66FxyS6nq4A3eUwRE2oGzuKpkiqweQbLOLNGkNqR1B3OjMBHCrhU/5u6XFj96S+pEIUB6Eaydr9mLzj8D8R9YuHInTjt2IPtfdsM/8jT6JNM8w1aQdnHHh94AHZknExXnrtFmMwIcn7LhbJgoSseSCnYXuvjwHJxzb2cs/sVTytp7LiCnbxS+jldDnEsuEDD2Cr8ULt1ECV2koi099FWLtxfFvr7i5x/fRDccMCcqqJqRyGG9eubKHMA0HnOwCQoC3UodaQHqUBUKyS5RecGUZT1x58Y3YTbrjXgzwsLsRHZbLqtFW3+vgqnol1N1DtQKu5y0dNVuDbnLfRC0Bsi+7FURfPk0gor1oPJ2Op0oCSLvfqwhX95n1fm5XCLn8WWoTc6QdaorvA/L6+HHQR3M6qqj2Co4Ut4iHCLlxEBRrLAx4ZpkzPsjueCdMMEBhUMTgTjMJIJHje6M2l4Ib48k9xZCeZUgCQ6TZEGJ7lerIGt8IugwzjkDZS3gvaVmUWm4ljhV6nz4G3VgtexAPOgKrwZzO1d4Z2OH3Ys+fF6fJrLY/YwMA7k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8600.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElDWlV0QksyWDBNZEJxNTFvVGdoNXQwQVVML1pMayt0Ulc5M2FpQkM2S2Rt?=
 =?utf-8?B?dEFNdEYyRHJpd3pscXpsNmVOTTZzV3Y2UEVDK3h1dXpSZThMcmh3R2kwMVd5?=
 =?utf-8?B?dFNzdm4xTlZXeWRrZXlZM01iUEU2dzVOQXRhRzRBY3FqK0ZJaVpkck1COUp6?=
 =?utf-8?B?YkQ3SDRkSUZwM1NQRWNNUXh2V0ZWc25QQmJ3WEJxbEpKMlk2aVN4OUhKRUJl?=
 =?utf-8?B?VEFEbkpUTllQL2ltSWhRNFV0M1MwNFBXYXdPKzVaMEQ4VTNYdHhtb3E2cUk4?=
 =?utf-8?B?UWxPOHVwZVJ6d2tlV0FxdGJ3Um5YTmNJL21hZGFpM2ZDL3BEZTlRS0NyOHkw?=
 =?utf-8?B?Z3dKYVFTTHB5QW45bDRCZzFDOXdtUzlSc3NWOTYxa0MwS3VmelZ3NGtnMHd4?=
 =?utf-8?B?dlVJeXBTYjZSN0dBK0tXdi96bkNnbFRwM1JFSjRFWHI5VFVUajlZOXk2VEVx?=
 =?utf-8?B?bW1CTjJCelpObW8xQnNDN1dxRU5qczBUM1ZOR1pJYUlZWmMxb29MQ1ZLVFZw?=
 =?utf-8?B?MGo5bXdSdXU4TUwyblVuREhmc251NmxkSjZaRDRSQlUxenI5aHdkZDhHWTRy?=
 =?utf-8?B?aXFiZHl0U3BqOE5BNkZWcWlUemkxbEgxM2V5Z1lac0RNU2dRenVNaUc4RlR0?=
 =?utf-8?B?Y2M5aW1TSERpL1VzRGszbU5ZcDVIekc2ejVHRGNtMzRtRGYrdVFMMUdMQ2FN?=
 =?utf-8?B?S1hhZ3NVbGE5MmRwcitqdVRTL1VhVzBqSitmSnJseXFzdVpzVU1TMy9TVnE1?=
 =?utf-8?B?N3pmem1zM0tpSExaOE9IUGFGdUJBTjIvdHJmMXZTcXJZek05N2p5Wit2TXZi?=
 =?utf-8?B?SUZENzE1SEhOU0V6cDZ2YU5JRTgwMERnNFJqQ3ZVN1NaTjdVbDlMRkVYcExy?=
 =?utf-8?B?OXBYbEpKODBzQVFibzZxYTlTZlpQZytoMFBnNlFRVUZuaE0yL1AvVENhUmNQ?=
 =?utf-8?B?TWhZOVJsZi8yTFFQbE5VSUFJNm9ZcCtYNDUrb2V6V1dkUWNQSW04TUNEQnBl?=
 =?utf-8?B?V212SU55RjFCeGNjTGJMQmhTWXQwSnRlVmk5dHU1ejdYenJQdEJmN0xtaTZa?=
 =?utf-8?B?VnJ5dG1JdlExUGVmYW5zakNTZ2hzUGpRMjlUSFFGNGRIcEtDWVYrZmVvaDJK?=
 =?utf-8?B?Y1RyTFhFa1BTUnhGWEs3TzhVeUdldGZHMjR6KzJsbjlVb1dTVjN2eWlWYS9H?=
 =?utf-8?B?czBqYmZvTC8vb1pUSkNsWU5XOXdUdXoraG5pVHl6djV5bndWWGtrMy9aTE04?=
 =?utf-8?B?ZXpvOGhpUGFHWW9aYXpGRTBTTEx0bzZjV3ZieVJtRU5SeTJPTktEemJrVTFS?=
 =?utf-8?B?UEk5SXQ3bkM2U2pVOVppM21pZU5DNTBScllDdExqdWoxNnZFM1hFUytpUkVV?=
 =?utf-8?B?YWNJN2VlSGxmY2tEb1QzV3lVMVB4QUszREw5RjRuOFJPZVlGdmxuRUNLMVpF?=
 =?utf-8?B?eWRTS2xsQ3lrcmk3UFlia0Y2QTF5WE1BMXNUKzUxeXppdnhyRHdzcS8zVVhv?=
 =?utf-8?B?NU53cG5ObUJNcE1rTmhYKzZNMUxiU25Rb2Y3bmZxY3YwM2wyLzR2V3hQRzUr?=
 =?utf-8?B?a002bFEyUzFoeXpTL2lhL0M2cGtNNU5vUTdIU2pHSEdLS3JOa3VMeitqalk0?=
 =?utf-8?B?OCt3RFlmOGlaS3ZGNytGU05obHRuc2lWZHE5VGxiTlVrM2NuTWV3cVBCMHM5?=
 =?utf-8?B?WCt0bkw5aVJOYzlRaGxmV0cvTkU1NFNVSXpPVGpEbi9aZWZsRzY4Q0dLeno0?=
 =?utf-8?B?eUZCZjNUZkVTOEJDSEtucXp0RFFYNlhoTVQ2VjVnTit5TEx0eWRxTzd3eThD?=
 =?utf-8?B?VTV2R2NOdXR4Wmg2QjJCdXJvUDBKcW1PMlZUd1RTalJlaUNzelFvVkZieUJm?=
 =?utf-8?B?Q21TbFpUb2dPcVV4OW4zRUl0VWdBWk5UWEpDSkZ0dWlqRjdHSGJCVkZlR09z?=
 =?utf-8?B?TVYxSHVxT1R0MVgrOGtFV3BFNDhrNFdPN0hxSTZWdlJ0RnFmeEFrdEV5U0M1?=
 =?utf-8?B?NVhuK2xjM1FhWjlPWWx1OHFXTmRhdzBYN1QzWHkvRnM5WU9nT1hWS01PbkVy?=
 =?utf-8?B?ZE1Wc2ptUHR3R1NZeVNPdnRLRWtoOWFBbVBFdGVhNTZIdVRWSlBtcFVVK1R5?=
 =?utf-8?B?bTNZYzBhbXcwQmYyWExDeWVSUDVpeU5ZSWxmM1M2MmhLNTB2K0UrYzhFYVEr?=
 =?utf-8?B?WFpyRXFUemJQSVJ5WWVsUnE2YXRtbyt5L0xIdVM5VTFHbzFJa2hub0dEUVNq?=
 =?utf-8?B?QlJ0bDliVXRaK0o5VzRwVzl6OXVRY1dPMnFuRW91bEVhdXFqbnFSaU11N3o3?=
 =?utf-8?B?dG9hQWZLYi85SzZISGJRZVFNT1cvdllOSDZYVURjTEZVbHZkRDFUN05YVkVU?=
 =?utf-8?Q?b5YJacInNMAOklZ4=3D?=
X-Exchange-RoutingPolicyChecked: pgHq2q6hdtSrvbK2mHiPeCLRpNI8ImE8Rqlikqhd8Ihs7eTPBmpWW4fAJaLZvJReUm2rWDZR+UBnBXHP+ySLtR0EyXdFa7IPu+iS5Hkck8KrZJkBEWf7TUnHfqlnE7WonKwXh6acmeTHe1AvR0C738E9pyEul7HT8b0FaP0M4xPG88sGJZURT2TQhnImadHlQa3YDcByyGWMZipJtRGItswMuJ1ELz+e2hscok9C5yt5AqYl0iX0ZmdSDwtN2lqhLHViTVYi3b59jq2L9Y3fbuAJh1TIh9g3Oijtxw7/qyShTVv8MW0OCdra8rbrE4sTRZnAcG6bH/QJKPM1X732ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54026c77-e828-4d54-7413-08deab1ae9dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 02:55:21.5917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3itdiAXmkNm26ErAHt0HjqFROY6EX+dy8vrZwFascfDbiERNRodNT3OF2b9Cs4H0YQ16g1h+rTs0e1yAQxt6TwXxOsDgiduEhhX9PXzHM6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9742
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


On 5/6/2026 8:14, Shekhar Chauhan wrote:
> For MERTOA in CRI, oa buffer can be in device memory. Because of slower
> device mem access, OA exponent values lower than 8 can result in buffer
> overflows. Bump the OA exponent value.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   tests/intel/xe_oa.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 988c46df6..67db20168 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -24,6 +24,7 @@
>   #include "igt_device.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
> +#include "intel_wa.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_oa.h"
> @@ -2643,8 +2644,15 @@ test_buffer_fill(const struct drm_xe_oa_unit *oau)
>   static void
>   test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>   {
> -	/* ~20 micro second period */
> -	int oa_exponent = max_oa_exponent_for_period_lte(20000);
> +	/*
> +	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
> +	 * Because of slower device mem access, OA exponent values lower than 8 can
> +	 * result in buffer overflows.
> +	 * By default, use ~20 micro second period.
> +	 */
> +	int oa_exponent = max(max_oa_exponent_for_period_lte(20000),
> +			      (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> +			       igt_has_intel_wa(drm_fd, "14026633728")) ? 8 : 0);

I agree that the v2 was more readable. But, the issue in using that 
again is the C90 rule violation. If at all I declare here and then later 
modify it, properties[] uses oa_exponent, and I believe it's value 
should be finalised before declaration. If I place this max condition 
before that, again a C90 rule violation. The max() condition in the 
initializer avoids this which is why I didn't make that change. If you 
have any other ideas, I'm open to suggestions.

As for the dropping > 0, I still have mixed feelings about that change. 
igt_has_intel_wa has 3 return values: 0 if no WA is present, 1 if the WA 
is present and -1 on error (maybe couldn't load from debugfs or some 
other issue). When I explicitly write it as > 0, it signifies that the 
workaround was definitely found and it exists. Of course, the return 
value would always be 1 when the workaround is found, so, technically, 
the code is still right (and cleaner, I agree).

Let me know what you (Ashutosh) think about the oa_exponent declaration 
vs initialization vs usage thing (in regards to C90) and I can send 
another patch if a change is required.

-shekhar

>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
>   	size_t report_size = get_oa_format(fmt).size;

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation


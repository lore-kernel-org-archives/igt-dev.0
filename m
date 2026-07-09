Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48415C44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 08:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96DB10F46E;
	Thu,  9 Jul 2026 08:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4mcwjyF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FDD10F453
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783583977; x=1815119977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zlE+LICbroVZ9s7NwsbW9AazKmNbVEB5aARmqdsWtHA=;
 b=O4mcwjyFVY7B1xakBDIUkqxkOVjSouw5x3yI5YlN9RlgSr4CjxeCnByY
 XYtY869BlM2Air9wPsHM3qJQDMm3yEpDvYlT+XF9wkJ03B919Ydw+i+ex
 /CW+peGkEw/mAbM/aK9iM0cfTNi8/ky5Ll+tndFf0vAnRyUbS8EhnyIVE
 XzpE5bKci0dhZLaiAsCcVRuZUNzBEf1hvhEM3sXr4pLteK2UZEMvlN4Ql
 52kX1tV9eGOeE6axMiGICkxBc5wAXbE2iaNfxsmLtZOPrcCUI5qYfU7RM
 xEkQO4daGqXyHg7XPnRj0QLmUI5xFL8v4I4GlZ7mqjJ54xkSmDELMdAg7 A==;
X-CSE-ConnectionGUID: 3mMrYMwkTmqx3u0aaja86A==
X-CSE-MsgGUID: abLFxHhjS0GSSFzW0TKKDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95772825"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95772825"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:59:37 -0700
X-CSE-ConnectionGUID: NwNvxekURa+Qv7lN+TtZOA==
X-CSE-MsgGUID: /T4Dh8xJQjWMT4DQ1quq6A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:59:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 00:59:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 00:59:35 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 00:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP9wQTCYOHW53zk8XGr6wfhEs+uk+wpTERYGd8oYXOmYFy7UdjiiwVib5p32GGZrfVGvr2/IFhvWfqfnAMc7NWaC0wpmSliH15nzSDevtZehbwANIkEdhTAUxKXY71RgXu5aFWMpaQuJfeI+1B+yy+AglTqnsK/zQlnGEvtZZR7eJQoY6u20BByivgxzmjQCdwGAb4ApgrVXUrPGDFhNsh4z1gsuj0dzdf2PkS02nosLbduRfXF+cfXr5cG0JLQxAkPw9cEhtNSRVfEL8iotvFWmagDDe25AAsM85ZlaDa+xRV4hdgHCmP6rRsWa+OZT0jvH6ygt8CurCCKhy0hctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMEPrGTKJK6VEjimVyZISQL6Spe0tGsx/qxx+cbMbjg=;
 b=mMlnHN9q+hub62fBl+7W2VBDO854TdH/6QX/AuR7W8brH76V999rKW4RwajTxojkSAEPzRdRtuKZbq+tpuIo3zS2clW9Rrrh7mJ+X1H3mA6ozHOE2PuwZU3maHCe7MFSwvwjrGIG8xa5QP4PyLvEdMuV6Kth8K3jVhZiyG00Uq3j8c+vzyYDKV8SKU7jEXzoGUOdYuUqeu3AdLJcHq2JUqpAP5+Td6LY9VVIRwvHZ5ytT6GYlRs8iMsuk/ARtYsM8JrAuBIgzwJNcHWGHcrIb7n2rjYLOgiGsSSoQg3/X8bDNxTv7rw9IcAeaUcfAgTP5owkpNNf5v4mv3P5HBa8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 07:59:33 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 07:59:33 +0000
Message-ID: <4e986963-fc58-4df0-8c92-f0f3e124ff28@intel.com>
Date: Thu, 9 Jul 2026 13:29:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel-ci/: Blocklist chamelium tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260709055349.66437-1-pranay.samala@intel.com>
 <20260709055349.66437-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260709055349.66437-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0268.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::6) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e250bcc-e886-4b61-9f88-08dedd900309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: L/kUGIfE+B4FsocYOGBZpIhnE5Jnh2I8Zy3xKQk6+1IGvS5t4YZFriGjtE28EoGe9hCLCC+oalC2R7Tj2mhSS959YZir2tH/HGr0H45y6cKoRr6A+bh1MOR0rrrOL4NVjHjdEMiy8Q+B4O3CKdySV8cMq6Q/DMBfTajvNN09+dwxjO/7MCZrxdlQa+rDJ0SE1nmY2U8vYvsg0x/vOzf6bQqi1M59ohHoLdL1TeOsXQeIMMWOSKRWsxq+IgGSho7OL21jIXJS3m2RrK+HEFYgcyFjFSzaBGoYrpS/1tvHiIiHqIEIyRxf42qOkzE+RDBN+SDuU7rOlB5sVTxHKzi51t7Zg3M/8NozanK+Kspj1Hp8UddTSOwhO0kJyIyMaXId/DTAX/8Q+B7EFHiQ/XiNS9E4kzf5V83zM4pmtKl+7TL3ZbGBPFVK/+Le6Vm7I5faIFwKbSJfKhH8XDWZlncRqeAxbdZHQqTjvQ7xtX/6SaGPPsRwiJFdQhioBGbKC0C8Trni7CxLwMFZKmzPj3XN01G/04sRjK8IM5sKw9lcfzfcFnPmbuTpPf4oXN5B/4qN9eXj31VtRsZuYSBbhNnLXDsuZYUBu7Lm1RJdqmbUis9u517E6y1CSitbnOdw9BDC4E78yqoS7Y5WLnfcD/MMkH0XZoN9o9y2b+6NpelZwVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCtPOUQ2M0k4U3dZTTBEcmIzd20yTExXemp2eVZ6L0hxaDlnT25lNkViV0g2?=
 =?utf-8?B?VzhpMUtla0xSY0s1Wlpwc3RoZWxwblZZQWFNaytSUXhEQ0hTZ0YxVG9TdmVp?=
 =?utf-8?B?eGhiZXdFRTdTNXhUODlSaWI4NlZCSnlsalFOODlScTFSaGxjQjIrTFBnUUNo?=
 =?utf-8?B?Zmd4SzFUWFUxVW9OeUo3K1RzUWhocUdNTEtNTjRjMzM3ZHN6aFJjRU5pRUg4?=
 =?utf-8?B?OFBIMVFlUXkrRTU2WG5qSENySDR0aGIrOVo5SVhmalJESEM0Wk8vRVpkOVk5?=
 =?utf-8?B?YXpqWEViSCsxRTUwUWhneFBwSjhWUmFSK3I1MFNCaTVGYkdueWlzcFAzdlRD?=
 =?utf-8?B?dkZHcm02bStQek83RGFZaGlzOTJiUTYvYnNyd0U4S0lYUnN5WUZiWVdyQzQ2?=
 =?utf-8?B?QkdXTUprdzd2eWhDT3hnaWx4VlBMNG9RZ3JmUWZZODFwMk5nbzNKZlFHWW1Q?=
 =?utf-8?B?bXMzbDN3ZDJXaG11MUJsc2tvZE91NlJUSFQzdEpiRnc2RG9QNXdRVldCQk9t?=
 =?utf-8?B?amtDQ1VqQXBtWlNaQU95bDQzanhKUkQyeUxrUjlTZlZPVVRqakp2M0hvSysz?=
 =?utf-8?B?MXpZa0d2K0RGdmxsQVMrZ1N5akhjdk9vTnp6Y0Q5Y1dPOXJseTJ0cXFMQVkv?=
 =?utf-8?B?M2Rna3BrRVVnNnNrUFpFdktnV1lPR0ZRbk5Kd1F3Zll0Ukt6M2Y4SVRhZW9t?=
 =?utf-8?B?YlVPM3p2L3l6anV2Z0xEazd5T0pNcGRuOUl2QWdBbnJVZkx0L3dHNVVTeDZu?=
 =?utf-8?B?aDBPRndLYjhWTDlvSUEzbEhaOUh2Q2o3T1Z2UnQ2czlsT1ZIMFdueFFST25u?=
 =?utf-8?B?bVFZOEJIeklTbm0yRlI5eDg0alYzSm52ZXZlOVdTZGhoVDVIR2Z4K1d0RjR0?=
 =?utf-8?B?SkN5cXdWTUQwYW5YRHd1WmJUTHpDTmREMFc4cDhlNStubGVYQmU5UFJtclFW?=
 =?utf-8?B?WTRKbFJVNVNvSjZ4UjdVNHpKNnQwZ0YvNFZUMnJHSWZhcnVseFMzc3lCMlRw?=
 =?utf-8?B?WEdPV2U3MENqQTJFNk1TeG1zUnZ1MlZZNFpFN3MrSEN6ZEhNU2hiSlB2RGtT?=
 =?utf-8?B?WDk0NjFTR3VGQnM2c2pkNFBwdWdMOCtvYm50Z3h5OE1DSzVTcTYxejBNK2Vi?=
 =?utf-8?B?UWpURTdoUjFtNytoOUcvbysrelRyamFWc3JGZStERGdwS1M5WXdDbWN4disr?=
 =?utf-8?B?UUNUWGpTY21SWTJnTmI4VkFwakg0K1ZNbkJIOFlCc0RkdFQrWFpTUGt0dmNU?=
 =?utf-8?B?SFJrb042dWpaNUJaUVFUOFR1MTRLQ0lPb1NBTmJGNktTL1VSQkVuNkQ5T3V4?=
 =?utf-8?B?ZVp3WGJSMUQ5Sy9WT0hCNGNoelZvSVdSdFBvNE44aTB3ckhqWTg2MjFENTVT?=
 =?utf-8?B?UWR2MWN0WENNUGk4WExka0lPcEtERjBVckhPWmNVQ1ArRWh6cjI3OVFLREJQ?=
 =?utf-8?B?RGhUS3REUjRrekp5OVgxMWFsUERDbmZHZS9jNXBySEZCNURmZkt1QlBEZUI0?=
 =?utf-8?B?OXI0Y2RzYkcvcGN0WXJhMEsyT204bm0rNXA4RURUVy9PQmYvdjFnT2Zaak1w?=
 =?utf-8?B?a3hNZnh4L2VWQ255U1lEVFZJZlpkbFVtajlOUGFxNE1WME44SmFsSVZTb2Vh?=
 =?utf-8?B?ZU4rdnFYaCtGbDVFZ0h6SHduSGUvenlTVmxSblNJQjB1S0hjZnl2YTJJbkFi?=
 =?utf-8?B?YkRIYnVNMGVkbWVnVWdqTEc0QlFnRkhKN0IxSGZMam5UVHFNUE9nYWtyVlFl?=
 =?utf-8?B?RXFjZG56dTQrMnlLRWVsbC84MUdZTXhHZy9GUThjYmV0ek9ZS0ZqWVBBRGZF?=
 =?utf-8?B?TDJIOHZGY3pzTjRmU2FsK0lHbVI1ZUI4VGhUamppRlhYMTYydXpPVHRLQUpY?=
 =?utf-8?B?QXAzaXhGa0ozbTE5NnBSM1V1STE4Z0UwNFYwcDlzVml3TTFaZzVxTGE4RkV5?=
 =?utf-8?B?RVJ2L3cvcXBZeWoxU0F1WWlxczgvSGluZFcySzFhTHE4U0JUTUtNcE9PclNz?=
 =?utf-8?B?UEJyMXVMNHJZbW5nTXdvZ2FnMjdMbXJteklLbFhZR0RVN1o1UzZSMHh4YzdY?=
 =?utf-8?B?YTJxdUZYSTdtZmM1RU9jWTJxeDJsbnJkc0oxam5PMVlxOUhKNFBSVm5NRmk1?=
 =?utf-8?B?NitwZTQyTTVDcm9IMkdOSmlJZ2Zqb2I1SFVOMXpRbFI2OHYyWUFFaUVUTzNV?=
 =?utf-8?B?Z2ZOSldQc3hFdTIxako2V1FQOW1ZYnNoQlNuMkZKM0FTejYxbXZEVGtNSmdm?=
 =?utf-8?B?M2hsU1hCL1NFN1g2RHhySWFlQTVlUjVXeGQ3ZjZoekcxNGZIQjR0anJweko0?=
 =?utf-8?B?S0VObUI4eklqRXNpTmI3Q0IxQ1RsODFXa0RQalhEVTJWenNnUmhsQT09?=
X-Exchange-RoutingPolicyChecked: H1Q0nVmKwIvA/DI7WM5FEIzH1KT77MGWMwTB/FhjQuBsxykAbJZkFtTsoKs5BG6rHtPhbDX3iibnfjjWP21I3oLicuvfst4dtKVwTRKlkvTGLRytlR6K+betJgRJS3ZEnhascK9CNbW3cHeJNRtRAQwb0w5uU9ue0t+s96NNAjprHgKXtNX7j2NbckshZ6YnIPBiwfb2wHeFQBtuDHnCsQz7DeOQXMkJD3EimTLZ2Jr1ksuwzwKSlhXHkd1EQSyzLOR+m8tl+hc6su4d+jDqcs9ZpSSL5oKXQYlxSal6ABu0q3iM4bc3hYG3ViF+V2eaiuWLscbbxu1gQbYogyP4Bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e250bcc-e886-4b61-9f88-08dedd900309
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 07:59:33.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtZBqtM/YHxSBNbSKzqV94yTRMWbX8qrDim0jxejw/kYvAHtVCt0hvA8Rbc1ycF5mdsUwcKaw55A8M+qTnsf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

Same here.

Subject should be intel-ci: Blocklist lut3d for display_ver < 35

Update comment display_ver < 35

On 09-07-2026 11:23 am, Pranay Samala wrote:
> Add chamelium test to BMG, LNL, PTL blocklists.
> This is a valid skip for display version <= 35.
>
> v2:
> - Add NVL specific test in other blocklists (Swati)
>
> v3:
> - Split the patches (Kamil)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>   3 files changed, 12 insertions(+)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 4c2a7390a..18712fb86 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver <= 35
> +########################################
< 35
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 1dbb24ae3..491d2b512 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver <= 35
Same
> +########################################
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 1041931a1..584114ff6 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver <= 35
> +########################################
Same
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################

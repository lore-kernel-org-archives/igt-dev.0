Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E05D41D71
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 09:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F03B10E1B3;
	Tue, 12 Nov 2024 09:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDMlohrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC1910E1B3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731403347; x=1762939347;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=V+iLWKWvcKN8jLfkEU3gvT1h0V05NY7hu0+8kV2qZDA=;
 b=BDMlohrsh9BnFkjGpde4hzC9T7m9mppT85BmYXdAQO6QkEjWEh7TVHei
 Tjn6zT5PnCZhVZHY6d+rn3RO3vPO+reCmcijKzaLurtLtC9VD4C9ixn83
 8fc2RQuSon+IRyVOjQ6EdnmxWjW/p5isEnr3pBN/o/abaL8hmr2RJ077g
 R+s3JAaq/1e7lEaLJX5M6Sybdz6YeLRMlfZPUAWMLoiBaBLRPIuiYBzlN
 RV8au4PQxN2SfOafiPAM68bcksN8mUUi/hAUL88UUxtoHdOFQsQHFPacr
 UGz0ccDL4Rx2jJ8CBLS6eBfoaXCK6+18ghFepUrLrIlF7dzhUvUga3ucd w==;
X-CSE-ConnectionGUID: wh4YIkANQ4CiwX4Kkikj6Q==
X-CSE-MsgGUID: nE9LPhb8Qkmi3Wb12giEcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31320113"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="31320113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 01:22:27 -0800
X-CSE-ConnectionGUID: /kxcwnWRSdqd9JLIA4eiGA==
X-CSE-MsgGUID: tyhakD7OTLKW1hAPCdioyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="91854040"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 01:22:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 01:22:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 01:22:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 01:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc95PHKiWJwlAYjsz65poadQ2memjvLrO0MTR38xb2b/v6i6Es6bgJxRTZkdV/vwU1OjaoFP72IkVPIWEhoP2jOoQA9A3FVfSVnB2ZIpvH9VZ2f1yjpp+0RP1fqL7x8iqRUEpu2q/tfMxdGrveLEov7ozrihZvnDEhvSJYHKN6WWWUW368GVH28W0dyUcTLrNT4MrdZRPz6eSCUsgcFEC80yuvysBSalkUrpdX4z9caxj7okAqa4lKhMyjPr4YFiM1+tN3bHQqARBq2lvsY5oupjkYwNvVdWylsyhKKN1JH3tLhXobT/ziSm9OvDs66FpHutA1wCWNCFCSc/Ygm/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlrbOOhqzeP5fEHesLCwj2KYef/y4z2+OymbT1/M6+4=;
 b=M7r1O2FALWjjkNudXMSh/7iUbZ8lWAuy5CSN0ou87CPfARbACD5SKLxes52dNBEnm5c+EYVQNdEsOo/bu+Z2R6IXr0c0xl9q3Jj2rUZEzT0uDjghtj90zUxLawRrjiHPJq2UozKTkm9UmbBQks1d1S6inM7+sDkyQwbSHQYgNXHjlWxJ9pA7lm+NO1WE3sTW9VFtRjrbWhSh5jrThzVCqz2EMi+iZHPa5sgakWb6Pe8EB7wIKI1ypZECxqTq7Hjz0am46jghdFYvC7N8wUx3IjhiMVfMC5whCqBwlFdOdbu9vlSHgJfZ9wARF7gLkxQdUzKuuaKSoV7eJtjMI8vIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Tue, 12 Nov
 2024 09:22:23 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 09:22:23 +0000
Message-ID: <30125dc1-c61b-4d6c-8ab6-b21226ad6f63@intel.com>
Date: Tue, 12 Nov 2024 14:52:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Add 6k resolution support for a single
 CRTC
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241111154635.1304517-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241111154635.1304517-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 40adaea3-df67-4ba0-841f-08dd02fb8407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzVBY3hqNHR6MEVobTdlVlpPREVFdFRGM3YwcE0ycjhaU2hHSUVlbEF4MGZs?=
 =?utf-8?B?TmlBeWRhN21BaFByeDdEOGZBTXJ3TUYyTFRqVTRST0VlY3FrbzZPeWl3WVB6?=
 =?utf-8?B?QkVucDJTRCs4QUxTK05mZ2ZndW10WEFpN2c5Q0JWaGZJTVVHTlNGVUhLcmNG?=
 =?utf-8?B?OUJSSGNxcEhXc2wvZzBFU0lVYzc1SDRCMlpSc1FZRDRUMUJkZVl3cmxOcFdl?=
 =?utf-8?B?cGRsa21OTDVjOHJIMzlnUnpJb0VrMFliOERZSHlVNDN3Z0ZYanUwVnZrellX?=
 =?utf-8?B?TnhHbkJIMHJ0OGxoMFRBMmZ3cWsrYktPUDNWOWluZGREc2NOWmUxSklKQTJa?=
 =?utf-8?B?RW91ajVwRW5XVzY1WDJvOUxGY25LbDFYMVZiL0toNHNaR2s0MndMS0t2eUly?=
 =?utf-8?B?TmkvMWNid2g0U0ViNWdpYTg0QVZRRDFzR280Y2xERTJsM05URWE5UTZjbzdv?=
 =?utf-8?B?ZDVUSGVHSFJ3S0Z1ODNKWjJjN0liUGdaTXg5b0xWdGhCYTljS296MEFpNk5B?=
 =?utf-8?B?ZkxYdENmby9zT0NtNWxpRncvS2FkRFdCZXBUbzRTTnd1bGZteC9MUi9mdGNz?=
 =?utf-8?B?THk0cHlkMWE2d0FXcTdZMURQSEJCZE8zeWJRalhWWVpHNExWbGU0TEFhVjRj?=
 =?utf-8?B?bEJ2RzU5ZkUvUFVtVG9yQWsySzduek9VOW9EKzJIOTVqVjgyKyt1b2Exd1Vx?=
 =?utf-8?B?dC9WVjkyRWdlQVVIcEtvSE8zb2dQODdhZTdBZGpGMkcrS1UyRWJOKzlBKzF0?=
 =?utf-8?B?ZXRxTWdLU3c4REhraHNJYVJuMUNrZWJJeUZIRDRVcVBDeGsveTNhTGFCREUv?=
 =?utf-8?B?NGhYZFhEMmFDWkk4ZGl2cys2RWN6Qm1MdkRZOTFPODh2bDZFWENrZ2ZUTVlH?=
 =?utf-8?B?eEFTcjU0NDJFZVFHTGhDMFFOQ3drTk9zelpHdk1nQzQ2ZFRRR1diUDc0SWRO?=
 =?utf-8?B?RnliMXJleGVmaUtIRnBpWGFhZ24zdndsOXBqV01MUXZ0LzRmbVNZUy9uZmhx?=
 =?utf-8?B?emN6VjdIQ3JKaVZrMWNvMjJiendwMlFyb254UVdldUtqenRKd1ZKaktCVTFX?=
 =?utf-8?B?SGxNNVc1bnR6cVZzUEVOS2tRUE5KcWlwOS9jOHBCSVcxYmgwaU5OcW9FUFpB?=
 =?utf-8?B?OXZoOVAyYjZ3cHYzYlJnYUF0NkczcUV3bVIremR1K3lkTjAydVVaeG9tSi9i?=
 =?utf-8?B?dGR3UjdJR0ptZG4zM3FPL1lhTVpsZnNRYURYY01HY1dYbGtYYUNPRVk1T29H?=
 =?utf-8?B?c0lRdlNLVFZoQ1drdEt1UGJaM2dkcjY5UmtXK2RKTlU1YnU1TVZhZ2tWLzNH?=
 =?utf-8?B?bFd2cVN1SFIrRWFRaWpQcFJQNE5EUG1DaWh1K3J4aVc4allLQTFwM3hjZWtF?=
 =?utf-8?B?NFFyMkI1clZFY0dIYnNXLzNNSVdGMWRVOWx5cU9Ud0FMQ2VWMzJVaXV4WUwz?=
 =?utf-8?B?bzlkZW1VaGhRZkRTa2Mwbkt5Wkg1Z3ZHdHVSTkJnZUZBQzQ4Z0hLelRPckZR?=
 =?utf-8?B?bHRVSFc1YWRQSDEyUWl1MUgyaHI1U1h6d0pVVGdSUEdXT2hhNE1zTFVUV1Nt?=
 =?utf-8?B?eFpRbUp4dlNGOU55WERVbyt0dFViQlF2TTEzT3hHYW1LNnJLR1Fjc21SWlFV?=
 =?utf-8?B?R1EraTZBZTJtTy9VeStkZVJiTFRFMjZwTEVwcWkwRXZNNHFPS2xCRjU4V3Vo?=
 =?utf-8?B?S3pLTlJLUXNxQ2wzVnpjZlRiT0d1ZHlFdG81STlsQ2dhVXc5LzA4OGsvWlVV?=
 =?utf-8?Q?WptaNwJ8oMmRPgXtTHyFB++JfBdyFF2bbV35cY1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0RiYmZGNnRDUVNaZTNQU2NxRHBQT3R6c0k3VHBOQ09yWGZNQmVsYUI0Nm0r?=
 =?utf-8?B?K05jVmhFTW5DOGRaMnI5UnRzVFE3anA0cmVXNHNBTlBLOVZCajdPa2QvRUt3?=
 =?utf-8?B?SzIrUGZYcFFxNGdUaFB4SUxlK0p3L0xqREl1aml2Q1Y5WGFqb05iZXhud3Za?=
 =?utf-8?B?akFoM3lERTVEQVA2ckZRaG5FNzdhOEtacDF5OGU3V0luUW1TTGJlRU0vcXRm?=
 =?utf-8?B?aXNscDJpNjNjZ1dqK2VVa2U0VEJZZHpOem94bW5iTXdtK21jbmZpSEFaOS95?=
 =?utf-8?B?ZTVqM2YwbTlORi8ya0tkUkMvSlJJY0dJNnA4MlJQYlorckllZWt6bFd6TURi?=
 =?utf-8?B?TnMwUXNWVjhvU3JVNlZxWnQxMER1NC9jVnlUNG5nN0Ryc3loZURGU1hoWC9O?=
 =?utf-8?B?NTFneTJXYk1pK3JnS0NLa2x1bmVpVHVUbklMdVFaMmw1eEZ0bllTK2U5TXdU?=
 =?utf-8?B?dlMwb29mRU9aZVBaWitjQkhQeGF0amJpdWpQRVFLckszM1IreElobUlCajdl?=
 =?utf-8?B?ejVkS3RLN3NKbzM3U3M2VVVud0t4SFovZndaTUhsQUJGT25Qa1VOT3I2d1Bw?=
 =?utf-8?B?c1J0RW9JVTVSUE92TTFFRGVWVmQ3UndwNVp1UkhNSzBvbTJNZjgvR29HSkJU?=
 =?utf-8?B?Qi9vRHkvYnNYYWZzaGV0ajlQK3dQY1ZhdzFObUgxalZWcTNTRDIxM1piK0N4?=
 =?utf-8?B?Wm9CZDVxQlBmNUk4RCtNWXlHcmpYeXRPdXJUUWJJYm5BbDhYaERNTHBkeklo?=
 =?utf-8?B?WVVLUkZTRUVUWExpSCtZenNUM3NNMnE3cWdLNzRUdDM0ai8ydStVWUJDbU50?=
 =?utf-8?B?ZkNEWU1JRnhISndCT3JyR1pNQkVRWmhNMXd0OS9pS1ZJOEtRaDZneERoTU5Q?=
 =?utf-8?B?NGt0T3NWbmRJUGZ1a1MzTlR4UjF6TGpNcHV5K3YvU3ZMVElSTXZpL0RPNXdI?=
 =?utf-8?B?L1UwNWd6NE5YSVNEOGMxbWZDL0RpcTlVVFk0Zlloekkyb0l1QzJNZ2JPVEZF?=
 =?utf-8?B?T2pTWWUwMGtRZ1RhOHpya0N6V3k2ZUdacnJWclE1VzZhc3ZIWC82K2dYM0pm?=
 =?utf-8?B?VTBkd2NNTDN1d1lYaFFORXR3RG5jcHJrZVFEdkxRdVFucnc3SGIzNzJRV3Er?=
 =?utf-8?B?LytINzJsd3ZVTndwYU5NT0Q5VEhDN1NTUlAvcW1DSXFNdDc0UEEzc0FFNUJ5?=
 =?utf-8?B?cE13UnpBV2VvWEk3N1luVWVka0JMU3c0TVBycG9DMVNlNmJMTjZuVlZBT3Fx?=
 =?utf-8?B?NmRHOXVHK29pc3NpV294VUpiM1BxcStRUTF5VWJURlNDVGRJeE5BRjhzY1BZ?=
 =?utf-8?B?eHdoODdzTVcxSk5peHdOZ2JEbDkwOFFwZUU3M2xVQVlsb2c1c2lZWFF0ZXV5?=
 =?utf-8?B?TC9hRUtuWTBDdkxJVXdWai9NYy9qQmtNcUhxeG5XTkdYeVQzeUFXNVcyWXlL?=
 =?utf-8?B?emNOY0JuQnc5U3F5SHY5d1ZIbWVtbFVqaE5hV0xWSEhNS052ZVZlMzNXbmlV?=
 =?utf-8?B?eXZLanpPWlM4UllHWW1Jb1IrYWZqa0xkNmZCdjdKVjhVQlJhYU0wK24rSk11?=
 =?utf-8?B?VXlxSUZmNldySkJNb055NTNvbGxoczh1anpkLzNnZVBjRzlUVWYybWxNQjU1?=
 =?utf-8?B?dXVLY29SSndyNERQRGx5aU1LWURXbVRIMW54UVVUSC85djNiRlA4WFQ0ekp2?=
 =?utf-8?B?eFB4U09UM1Rub0dxZ0src1E2MGtyZVFtVzVhVHNTMXU5OHAyN0JiMDNpSUpi?=
 =?utf-8?B?Ullsc0MrVmc3TEtuMVBFMGJBZHlFV24ybFNLbjRXT3ZIMTh2TGc0UERPbGZV?=
 =?utf-8?B?YlRkNm5lNy9MSnlVSHBWaEJvNFNDcUVIWGNzejl3M1NkdEtoR1FuMlFEdDFO?=
 =?utf-8?B?cXFvQzY5SVJXVjVpZmNzaFF3K0VubzNVL0lYV3ZGR2tuNXo0MUdUZ0VFTStU?=
 =?utf-8?B?V2h3QkxkemVjY3hBTEpyZzNZNVZxQm1sTm56K2VLSjJFbHhkZnFQdWRuZzJq?=
 =?utf-8?B?VytwUjQvaHBIWWYyZHA1ajBxUklvL0djMEV4SVRLYjNoOVl2Zmx0UUNHSFlC?=
 =?utf-8?B?eGNKZTB3NzJHWkVURWFPemtYS2wwd3RYQW1TalNRemJpVW82MXVpVXkza2dK?=
 =?utf-8?B?eDVMaHpQaXNDR2V1TnZiTExWVHI1RGo4WU5xdndadXExVXg3L2VVNFplNjBr?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40adaea3-df67-4ba0-841f-08dd02fb8407
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 09:22:23.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hHQfHv3hxQcl2ZcxZFXfm4nYl/YCtmkz07/CA4bbi4KntMwJzmRK7I/SToUpyxO7bUWWh3bA1ziOa+LN/6Qow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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

Hi Jeevan,

Please split this patch into lib and tests patches.

On 11-11-2024 09:16 pm, Jeevan B wrote:
> increase big_joiner limitation to 6k from 5k for display version
> greater than 30.
> Apart from lib following tests are modified:
> tests/intel/kms_pm_lpsp.c
> tests/kms_flip.c
> tests/kms_setmode.c
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c             | 21 ++++++++++++++-------
>   lib/igt_kms.h             |  5 +++--
>   tests/intel/kms_pm_lpsp.c |  4 ++--
>   tests/kms_display_modes.c |  6 ++++++
>   tests/kms_flip.c          |  4 ++--
>   tests/kms_setmode.c       |  4 ++--
>   6 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5d8096a17..f5bb488df 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6330,6 +6330,7 @@ int igt_get_max_dotclock(int fd)
>   
>   /**
>    * igt_bigjoiner_possible:
> + * @fd: drm file descriptor
>    * @mode: libdrm mode
>    * @max_dotclock: Max pixel clock frequency
>    *
> @@ -6338,9 +6339,13 @@ int igt_get_max_dotclock(int fd)
>    *
>    * Returns: True if mode requires Bigjoiner, else False.
>    */
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> +	int max_hdisplay, dev_id;
> +	dev_id = intel_get_drm_devid(fd);
> +	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +							   HDISPLAY_5K_PER_PIPE;
> +	return (mode->hdisplay > max_hdisplay ||
>   		mode->clock > max_dotclock);
>   }
>   
> @@ -6362,10 +6367,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	bool found = false;
>   
>   	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	if (!found) {
>   		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	}
>   	if (found)
>   		*mode = connector->modes[0];
> @@ -6384,7 +6389,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>    */
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
>   		mode->clock > 2 * max_dotclock);
>   }
>   
> @@ -6549,7 +6554,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> -		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd, pipes[i].mode,
> +		    max_dotclock)) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i].idx),
>   				 igt_output_name(pipes[i].output),
> @@ -6576,7 +6582,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   			}
>   		}
>   
> -		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
> +		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(display->drm_fd,
> +		    pipes[i - 1].mode, max_dotclock))) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i - 1].idx),
>   				 igt_output_name(pipes[i - 1].output),
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bd154d1c1..a1d2b8632 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -146,7 +146,8 @@ const char *kmstest_scaling_filter_str(int filter);
>   const char *kmstest_dsc_output_format_str(int output_format);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
> -#define MAX_HDISPLAY_PER_PIPE 5120
> +#define HDISPLAY_6K_PER_PIPE 6144
> +#define HDISPLAY_5K_PER_PIPE 5120
>   
>   int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>   void kmstest_set_vt_graphics_mode(void);
> @@ -1238,7 +1239,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 889da42de..74e9d799a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
>   	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
>   		return false;
>   
> -	if (igt_bigjoiner_possible(mode, max_dotclock)) {
> +	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
>   		for_each_connector_mode(data->output) {
>   			mode = &data->output->config.connector->modes[j__];
>   
> -			if (igt_bigjoiner_possible(mode, max_dotclock))
> +			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
>   				continue;
>   
>   			igt_output_override_mode(data->output, mode);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f1d8ab03d..0950cc483 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -318,6 +318,12 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> +			drmModeConnector *connector = output->config.connector;
> +			drmModeModeInfo mode;
> +			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
> +
> +			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
> +				      "Big Joiner Connector Found Unsupported Config\n");
>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index cbabbe74f..17da10e2e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   				 o->kconnector[i - 1]->connector_type_id);
>   
>   		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
> +		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
>   		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
> +				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>   
>   			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bc7b8fabb..d61cfeb9a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
> +			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>   			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;

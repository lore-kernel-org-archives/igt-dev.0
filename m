Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CFAC3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 05:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0C10E939;
	Thu, 11 Jul 2024 05:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKXdYR1O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A918810E939
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 05:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720676879; x=1752212879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JEiWSECcSFi16JBtoEXdYmm1ra62tTFAJmV5yP/V5BQ=;
 b=QKXdYR1OhMvm530q7EyjO1FTQQX8lVFP9IzOMU714YMTm8q9zxH3uz6Y
 5iDws68/Wwp0hwRtgB8019sT1XlaScPLKTeOTiG2WlLbjh0VeF4mUWdpf
 HVH/br5Tdv7ZPgkGEPz0ejt+1Hhzt290RbcMhaXPSmnv6siVFMDJLBSYx
 iINjKZsC1vDcrfpbxzL5aERdUQTHSE64VoyfD8I2uyFqI8lZHV+7CNd1e
 DVCb6BNUvKwRrPfIZ9m1MumMAUE2x5BTjVh2pndZ9sGam/tOplRWlzczz
 lTHptMrBCCs7Qo+k5ebKy/4KZXYOKirfGMeNHxZkZt2QAArPWd1vr9Gt+ w==;
X-CSE-ConnectionGUID: d+BItM8UQKWFOzGvTxjT5A==
X-CSE-MsgGUID: pfuNPRswQJ27YhE3EepADw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12491086"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12491086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 22:47:59 -0700
X-CSE-ConnectionGUID: +NN/y8ybSO+PwezBiOyduA==
X-CSE-MsgGUID: bz6YvHPeR6e8a9cgxNNCbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48423879"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 22:47:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 22:47:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 22:47:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 22:47:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWwKyhzVzYWYLXKGyFNfeeRoLbFEcCgG99CQb0ljxz6cO0P8sfmieVg6pWC74tFPbT6qAzO2wc9ohwCP5x3n0qH29PzVCJ9GEtpdQsP4l8RZp9d70zMBL+n6Umn0t3tkOKrQfRtNkydW9dtzz4GFsbQQFrnosMsRNaLUSk++K0ybXd6ti1EC+cmUIcf/g1I4P8AQ+HWx7v4Xhi9R5szTEXVXPJdpkGIw/PMyFeq314KCnIbUX0HGtgv/ZD62Bvafy0Vvvk/VH2z/xRnavgzVcUVMJ+ell66DRYOxrfijEqV/70ABS0DI/uN+nkZQNxkg9jj/6c1m4G8N3fbAjG097w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxZ1KxrvuDSncl6jQhvujSQPGKythw2JUnp7s0GMSeg=;
 b=Unw0mAZXpmsPBV3QpENAt4hS3+OWBvKgLTL5Y7chZVoZ8GQGxjFBoK5qtptDlN14640jVtDokP8GtKHR6sKJYVYw7j5eYx+J/B+XRXhKfY10u9eCwClIJ3lQ++Uw2D3FQPjKVUVpKkZnpMQWKmqUqyIH0tgNceUOxaG5hQc8NquOs8gSVGJusthEvbLGLg5khIlYBrwccwXAw9HX8t2LTuzIILTYVeIBhXIMwx9ZDgNiWk3L07zbQtWs6ixZ8Oxkx3vUqFgcpY+HunVI2UL7Ml46kdwvNiCeC5mioPMsi/khAfMlulfhFPMb3pMn/jkMcinci4ensbM1h6vpZxT80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:164::23)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.40; Thu, 11 Jul
 2024 05:47:55 +0000
Received: from BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0]) by BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0%5]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 05:47:55 +0000
Message-ID: <08f76c9a-6003-4bdb-a4e8-78c8e5597fd0@intel.com>
Date: Thu, 11 Jul 2024 11:17:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/3] lib/igt_sysfs: Implement dynamic adjustment
 of debug log level
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240711041355.749937-1-pranay.samala@intel.com>
 <20240711041355.749937-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240711041355.749937-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To BN0PR11MB5726.namprd11.prod.outlook.com
 (2603:10b6:408:164::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5726:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4c3f08-df43-4b9d-f334-08dca16d0328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXVGdlZOZzQwSjZFYk13cHNtZ3JjcHhsNkFIc3paWWM3VUJHa3UvYjZpVGkw?=
 =?utf-8?B?d3hIb2dSUjVqOE5aWG5RSWFNeFZHbHFTOTlmck1ZWFVGK2lDVjZIODBEWG9O?=
 =?utf-8?B?aFdGbHlRdENFOGQxWTY1cXU5YlEwVTJKcmZDSlpjazNRSUFUVTV5S1lPbnFL?=
 =?utf-8?B?cWd2VDFxemhFZUJjMFZpcndMTlRleFNHLzZVeWtOM2pIRGlMdGQrM2lUTEhY?=
 =?utf-8?B?Y0dMbEYrMzRSMkw4dUVVZ1ljZmZyaG8rcW40blZUK0VMVllIMFdWM1oxOEI1?=
 =?utf-8?B?OEZUVUpENm1tcFlXSWNKUEIrMDdHcVNmWnZ6Q3JvTUpvdTF4cjlXQzFZRjVC?=
 =?utf-8?B?TzN4RUxzNW5PZUtjT1I0VUxXaVZ3ZXlHTzZud0pnV0ptMkQxNGVUbEFVbFpl?=
 =?utf-8?B?aytteVhWMWRsci8yTDI5bG5HdjdZNTJpbm9jU3ozVXJ5dDRhTFA2QkRWbmtB?=
 =?utf-8?B?VnFueWcxRmRPNzhHOUtHSXFWZ3FtbmdnNFdtOWxOUmdzL2l4SzZ3Z3ZxbkMx?=
 =?utf-8?B?bXFlSzV5Qm1VWTFLcU9Hd3NzQXFmVXBxaVFQRWZtMUhQbmpqTXNCNSsxdkl1?=
 =?utf-8?B?WXNYc1ZoMEgwN1pWdHpvWUx6SWpZK3lYUkpORGhibkpXNFJOMEdTSTRvaUtQ?=
 =?utf-8?B?RDJsVG5RbXBBRUdnTjFLQ2dJR1ZrTm85czZkelVjSlNld2dvbXd0dDhCQUEv?=
 =?utf-8?B?bHZCeWJZa0svNGFWS2ZZMVZqeUVZQjRTbE5uT2NUNkVhNmV0M3dVZTJRZkla?=
 =?utf-8?B?MWZ3M3hhd2JpbU9JNlp0dmt6Y2E4N2l5MEFlcUVMclZXWnh2LytYRTFCaEZH?=
 =?utf-8?B?bm5zMERETzN5Znp1R1ppS0hhRWE3cUJ0UmhPUmdHWjNsWk5NTnk1MFFWa010?=
 =?utf-8?B?c3dhUmRlekdhTEpEL2RoSlVHTzlNQ2dSdmJpUUthWHpqeEUyUzZQVTIvaktj?=
 =?utf-8?B?TXU2Z3FDTTNWOWN2WklCaTFsQ3ZINTdpeWdCNEdVV1dEbldUZlRrRGtwaGJH?=
 =?utf-8?B?MjBNUnBUNWI5RWxvOWV4WmFxREoxdy9TSDlFS0R0c3JsWGFGZTN6T1VqY3Bn?=
 =?utf-8?B?dGR3VUpBTTRRMko3dkllWGh1czcwOUp3SnMvNnFreDBNMGRMQVpodUZabElD?=
 =?utf-8?B?YXNzYTM3aUc3UEpRaWVlVTM4REhMbDhod2ZQb3lvWVI0Z050YmNjVng3amFo?=
 =?utf-8?B?azl2UUx4TUtCcXZZcGJRcDhDNVI5aVplT3diUElNc3VvT2dtQVMrZDZDOGpF?=
 =?utf-8?B?d0o5aDQyZXJhaWlGNWJ4Umpla0JUVXc4eSs4MzczandMa2ZTdjQ2a1hEVTlV?=
 =?utf-8?B?a05qTjY2Z1ladGEvSWtmTGRRZjZ3ZllTV1RaNEhhNzdWeGZKVlc0dmFLQlVQ?=
 =?utf-8?B?dFlmVVVEOGQ3RlMwcUNCU1prUUR2OXhUMWN6MmowZjFYanJMRFJlRG8ySTJT?=
 =?utf-8?B?cVNWaThGKzdPbFpsVDQ4ekpkd1J4eHJaYlJSOGsyRXU5bjlsSW4zdjZiZmFl?=
 =?utf-8?B?RWkraExjekQ4a3ZVVUpOUEJXN2dpbXpyVVoyZ2VTQkNSVFpmT3JsVnNWMzY2?=
 =?utf-8?B?bEJ4WkZhZ1R1N3EyWDlUYW4xbVRiMEtsbW84d3lSUjlLUzI1Y3ROMVVuNE5a?=
 =?utf-8?B?YlZsSk1SbHBRYlRuTkdCQXdUMjJkM3hIbjM0Q2M4RGlld0YrY3FCQ3R6S3hi?=
 =?utf-8?B?ZGpSMElmcVpBVGVMdHhxR1hmSDZLV1JoSW9iKzZaMEtDSEhWUVN4eTdwNS9h?=
 =?utf-8?B?VWkyZGJ6aThCZnk5OFVuVEw3UjdtaUVsdVBzK0s0Ky9kQll4WDNITzdxZzha?=
 =?utf-8?B?Tnl3RWVTVUp2YkZtcHVLUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5726.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Si9TUjUwa04xYXhJTDRONHZFd0Nnd1Vscm9JRUhVSVhPWStwTmJsaU1DendB?=
 =?utf-8?B?dUFsa1hXUGRXUTNJYnlTUG90dElNVUloVHhYL0VRZ1I3bSt2VExYWHhhZWpT?=
 =?utf-8?B?RENqQllzMjcwT1VUczVITkgwZFJWdjQ1eGpiSnRpOUZHVkZFMklNVnEycjNM?=
 =?utf-8?B?ZklmT01pL0FIc1JGckZVNy8wNkFCUCsyTFVPemdndHJZUGJ0QmVlaGtqakF6?=
 =?utf-8?B?L09VdHRTWi8yQlUrMEJGU2lzSU05QkZGRXFRNUc0aDJIWUFVdmo2VVdIb1Fv?=
 =?utf-8?B?ZkM3UTBVd1pld3AzTHBDc2FUc2xOVEtlNWJmSTVLMENNR1dEYnJCZUNwbzQ2?=
 =?utf-8?B?ckp0QTlpWVVORjl5clhvbXJhNnZiTU52NERjUzVKVXViamtyNmtRc0hpa0px?=
 =?utf-8?B?VVNtQk05YldRSlJlK25aVmxPNGJhZ3RvVEZKaEhKV3dYZ3JHaGNxY3ppWTB0?=
 =?utf-8?B?VjU4RTIyUGpISU16aGVGUktaZGRoUjErZ3VHTzdsd2ZlQ0dpcWdzVzlJY0cv?=
 =?utf-8?B?cDJYZGNmdWNuVlF0MEhnVklxNE83b082NEUzaVJOWXRub1ZFb0hNNExHME1j?=
 =?utf-8?B?dGZyWWZXc3djOUZsYng5bjl5SDR2RWhoQzR5NUZ5dENpako5aG9vblp5UW1D?=
 =?utf-8?B?M1QwTHRHVVc0cVkrWkFIYlZudFBDNGNUSXJqeEk1UENTUXNCTm91eWxoWEhZ?=
 =?utf-8?B?ZWl0ZHMzdlF6WVJGeHFLMlNmREZLMm8xT2MrT3ZCd2E2MHZLV0JKblZYYnNr?=
 =?utf-8?B?YTc2bk9YRWJaZ05EdUpuSi85TXhXRlQyZHd5bkNtVVpiUFptVVg1T1QweXVn?=
 =?utf-8?B?bU1iY3NPSlh4MmUzSDhRSFluYUIrL013WndheEd5UFJoM0o3TVdLNnR4OUk4?=
 =?utf-8?B?WWVRQisxOHcxR21hckxicTVsSUpnd0hDQm1lbWFteVdKdWpEc2h5UnZYVHVQ?=
 =?utf-8?B?WDROWVBlWFhqUFVkQkhialR5MEJjZXdUZ0pUTkhRTWd6ZGN5RFdNc1JRZnB1?=
 =?utf-8?B?VHppS1hpRkdwNmJuVXFqZUxpdkhrTDViNTNRck16WHhUN05BVng1K1VYWFNV?=
 =?utf-8?B?bkVad2wvdHlMSk44QUxLaWVIaFFBMGs5RGxteW1xQldUbVVsbGdSV3o4dTV1?=
 =?utf-8?B?dnFPL2pJTFBUL0hTVGpsRUxvNVMwUVNub0lNR1g0c2VGYzhSMWRTTWZqME5X?=
 =?utf-8?B?WjhoSFlaV2VDaGJjSGh1SldzZ28vWEwrRWRLb1RYQXNwVllkQnord096cTQv?=
 =?utf-8?B?dlZVZU95ZFJhekJiNEdhb2Z3ZS9aN0RoUzdCTWp5S3lUVXpOOTJNR1QyazFU?=
 =?utf-8?B?bVNzQ2N3T2VWMWVTeHlScEQ1OXl1cnVwUy8xVDI0ZHRoMDlqL2dYRTNyUklv?=
 =?utf-8?B?V3BQaGZpTVdVeFZ5V09Bc1ZiMmxsYjdYV2NGNkFidzBadUdLMERGRXIrWVV4?=
 =?utf-8?B?dEF6R1NZeFQxWEFkazZvUlFEZXNpV05vUDhxdzdiTUhvWHp1M3BLTmNRMXdH?=
 =?utf-8?B?ZUZCZk9vem40SEFjL0tLc1FwZFNuSW5NdjhTMnpnZHFaTmRDM0QrNWp2eTVy?=
 =?utf-8?B?dDdhazUrZjFpTEhEL295Q0pjUHVuWGszeURPbkRtQllpQTYzTytjOHNnRG9W?=
 =?utf-8?B?SHBxd0x4WHZRVTJkY25pbXNZZ04yWGpOaHZSYTlnNTVpaTBKN3VCdUk1OXVz?=
 =?utf-8?B?aFQ3V3RSSXpuRW1uSjE3NUx1QlFhVzhwb21CdzBnaW9wc0crZHNQL0VZZE4z?=
 =?utf-8?B?YVpLUXcrSkdCYVVNMTNUNXNSbzB6OE9zNGdPaFk5S0dtdkMxTW9QZlJkZXZU?=
 =?utf-8?B?dDlzZC9Jci82aUFKSEpZc0ZXWFNDUE10SVpESVF6MWdvanRiWEpYdmlzNXA2?=
 =?utf-8?B?alAzN0xiQ0w4VXRPeUdDRlRNQldIZ3cvY1hHRDRZUERJZ21RZXBGOG8wS09G?=
 =?utf-8?B?dFE1RzBtZnZxTEFYcEtiVXRkZ3RHbi9weldDRG1zS0RVM0hTdzdQMFZlYjho?=
 =?utf-8?B?STFvT01zWFdORjI4UHg0WW9zRE5ha3haVi9Ra3pCTy8yMU5sSTl1RkJBaVhs?=
 =?utf-8?B?ZDRoQUtXc2xEREIvc1JaRkI2SEZYVTZvUXl5ZEJrbitidVVBQWlFYjhFSDlD?=
 =?utf-8?B?U1lLaFZLSWRZWE44djBKbGhreHFZUzAydFRGS0RnZkFETDU1WjdDWFA1MlVJ?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4c3f08-df43-4b9d-f334-08dca16d0328
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5726.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 05:47:55.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hzp8GgQEnxiieMN0nxjFKJr36f0BEbLnn4e6gL3Us4LUDF+Xg1PHOIPqnGiEFS5L5U8R6c3UKaSF03l7Ta6BKjNoOd+9IS91VjhjVPsz3l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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


On 11-07-2024 09:43 am, Pranay Samala wrote:
> Adjust debug log levels dynamically to prevent machine
> disk overflow during excessive test debug logs.
> 
> Introduce function to modify log levels as needed,
> with an exit handler restoring default settings post-test.
> 
> v3:
> - Adding module drm_open_param function to open
>    the sysfs directory (Bhanu)
> - Reducing the current drm loglevel by step value
>    to make it more robust (Bhanu)

Please keep maintain the rev history (v2 is missing).

> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sysfs.h |   5 +++
>   2 files changed, 114 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index ffeec1ca2..d29e0299c 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -49,6 +49,8 @@
>   #include "igt_io.h"
>   #include "intel_chipset.h"
>   
> +#define PATH "/sys/module/drm/parameters/debug"

Unused declaration, please drop.

> +
>   /**
>    * SECTION:igt_sysfs
>    * @short_description: Support code for sysfs features
> @@ -412,6 +414,113 @@ int igt_sysfs_get_num_gt(int device)
>   	return num_gts;
>   }
>   
> +/**
> + * igt_sysfs_drm_module_params_open:
> + *
> + * This opens the sysfs directory corresponding to drm module
> + * parameters.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_sysfs_drm_module_params_open(void)
> +{
> +	char path[] = "/sys/module/drm/parameters";
> +
> +	if (access(path, F_OK))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
> +static int log_level = -1;
> +
> +/**
> + * igt_drm_debug_level_get:
> + *
> + * This reads the current debug log level of the machine on
> + * which the test is currently executing.
> + *
> + * Returns:
> + * The current log level, or -1 on error.
> + */
> +

Please drop this extra new line.

> +int igt_drm_debug_level_get(int dir)
> +{
> +	char buf[20];
> +
> +	if (log_level >= 0)
> +		return log_level;
> +
> +	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
> +		return -1;
> +
> +	return atoi(buf);
> +}
> +
> +/**
> + * igt_drm_debug_level_reset:
> + *
> + * This modifies the current debug log level of the machine
> + * to the default value post-test.
> + *
> + */
> +

Please drop this extra new line.

> +void igt_drm_debug_level_reset(void)
> +{
> +	char buf[20];
> +	int dir;
> +
> +	if (log_level < 0)
> +		return;
> +
> +	dir = igt_sysfs_drm_module_params_open();
> +	if (dir < 0)
> +		return;
> +
> +	igt_debug("Resetting DRM debug level to %d\n", log_level);
> +	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_assert(igt_sysfs_set(dir, "debug", buf));
> +
> +	close(dir);
> +}
> +
> +static void igt_drm_debug_level_reset_exit_handler(int sig)
> +{
> +	igt_drm_debug_level_reset();
> +}
> +
> +/**
> + * igt_drm_debug_level_update:
> + * @debug_level: new debug level to set
> + *
> + * This modifies the current drm debug log level to the new value.
> + */
> +

Please drop this extra new line.

> +void igt_drm_debug_level_update(unsigned int step)
> +{
> +	char buf[220];
----------------^
Please reduce the buf size.

> +	int dir, new_log_level;
> +
> +	dir = igt_sysfs_drm_module_params_open();
> +	if (dir < 0)
> +		return;
> +
> +	log_level = igt_drm_debug_level_get(dir);
> +	if (log_level < 0) {
> +		close(dir);
> +		return;
> +	}
> +
> +	new_log_level = log_level - step;

This logic must be handled at caller. This API is supposed to update 
with the requested value.

> +	igt_debug("Setting DRM bebug level to %d\n", new_log_level);
-------------------------------^
Typo: s/bebug/debug/

- Bhanu

> +	snprintf(buf, sizeof(buf), "%d", new_log_level);
> +	igt_assert(igt_sysfs_set(dir, "debug", buf));
> +
> +	close(dir);
> +	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
> +}
> +
>   /**
>    * igt_sysfs_write:
>    * @dir: sysfs directory
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 6c604d939..a276c6ed1 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -138,6 +138,11 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>   void bind_fbcon(bool enable);
>   void fbcon_blink_enable(bool enable);
>   
> +void igt_drm_debug_level_update(unsigned int debug_level);
> +void igt_drm_debug_level_reset(void);
> +int igt_drm_debug_level_get(int dir);
> +int igt_sysfs_drm_module_params_open(void);
> +
>   /**
>    * igt_sysfs_rw_attr:
>    * @dir: file descriptor for parent directory

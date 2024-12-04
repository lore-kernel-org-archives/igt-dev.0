Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194A4E7716B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 05:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C71F10E29C;
	Wed,  4 Dec 2024 05:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmlaJPT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B222610E29C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 05:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733289126; x=1764825126;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/dOVN2Jz/bCo7LQm5FDDs9PYsbf+BrMFjcxpbnV1G8E=;
 b=NmlaJPT+eJYnIMEf0ITgH8eexVec7y03EiHYzFmojvsSnLXNJuRC6kzx
 b2PrUZsgWNMCutwaBm4TxcbPiHaz5qWyumQyqR3OEQoq69pk4waOVlUNG
 OjVhLaL4uwSueD+7mcaiONBM1kSBnZ8VkDZERAefRbMgAupG1A5epTLHQ
 Xyd6qcyUcg5Mc0dB/epCCXUhwD/vA6ohkAsE+uzrxkvxxSdjSDXKOoOe3
 JOK6gnT68UOMziJINgoK879z/Kfr0t+zT7YNK3nJwGYV7rzGUUf2Rp1hS
 vgIQ2dLqIl4XiZ3AMc5z1P5uaGnrjrgnHtlxgmV36YgazHm7QPbMr3Q7s w==;
X-CSE-ConnectionGUID: ZguWKEHgSfO6fQKWWI+16Q==
X-CSE-MsgGUID: QwOjkKZZTKqVk7RkeFDFQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="56023634"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="56023634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 21:12:05 -0800
X-CSE-ConnectionGUID: 1usDvi7jQxSUG3NQgcMeXw==
X-CSE-MsgGUID: E3gX9f72RumsBzJYyk1D6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="124590832"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 21:12:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 21:12:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 21:12:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 21:12:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyDhbe413lVcIg5HvDYDLxT8Rvc52gcdrXjAtYbIyXv5sFuK/3qQguxynEECZjO0T2/HQUrjZ7fpKI1ptXhwFqSgPyjyBq2xmADnjUz8i1P41uWAKalgjefh4wJcEDQ/IKNGei+ubJUidrHzzXsVst+g61dvIwnkGFmnAFqWuwveoHjJ0gpnpbX3vH0h3NOD1+GHIYuWFdZpp8O9R6ZopOpwK5v/7QGglaKbtbu3FjegXXKuvu5k2wRC0HdJpSNi1VOatavG9xPqSYlDK62dSb5dktpsqFignx0bNpA0BQTLQej50civ01gUOKBEENd7NbAZXDGbkD4JIvfiAP+geA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSnj4FQN9jseBipzG/OWvXM5w1yGteSdzpVceVVhWgk=;
 b=QcKBqoO2WXX3JuK1O2iW9qyu/Nc6azD11vYDD4ATfHknAi0yVMPx2vdO/oSzHbLmpVQBPLuFTIiB0UaTFb/Bbsyqn/tR/T+oT5iZKWpSBrpDt5LDkKJob/BrZhg2/KYdWvE4oDnPaHlMmlSvr/P9zJFQIHIeNovJ6a6A5c1r5WtA2VUi1zEv5PcnaTHP4QoKZne7VQytNy93Y2mHSAwxFbUXsDZoGJ0gmvs4tD7DZgI4SBvNrj6gLCTY9pHU38Xefq6TNLY23I0LsbFILDjd3WNn4cFcVHPf1ggkWz0AH541BiEObOj21TGgQViHeuCXsWCmn8Egr4E+Fko8/glEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 05:11:55 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:11:55 +0000
Message-ID: <af1dae63-3dba-4046-ac83-fc22ac877871@intel.com>
Date: Wed, 4 Dec 2024 10:41:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/kms_content_protection: Account for
 reauthetication in LIC
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241203061519.2121105-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241203061519.2121105-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::8) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: e93c4d80-2dbe-482b-4e11-08dd14222b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXMzZ1U5V1RDQU5WQS9ZUkpnY0xRUDBweWlFOEJadDRaNGU5bmFUZlo0eGtO?=
 =?utf-8?B?RklwOWZMYlpYYWxrU3U2YUJBTU1zWWt4WmNnQW5qSzA3SWJQVnhpciszR0xp?=
 =?utf-8?B?Wnl6ZFZqNnNrV3pXTFN0QjhOYU1vbmZDVDVhczJqL1hXeUJCT2FOU1RFUzR4?=
 =?utf-8?B?M0J4U0tvVS9OS25wV2dxVjJ3YTN1LzhjNy96anZSRHZVb0g1dElCdzBtMDh5?=
 =?utf-8?B?NDUrcjRFZ0JsL0ZDRU56b2hxallDbW84YWJrOElNRmxES1hFWGFVMWJOWDhQ?=
 =?utf-8?B?K2tmNVhTbm0zVVZVZWdMdXd1ZVA0ZGZTRmFEMEdPdzFhdEVGZ0prVlBwelNM?=
 =?utf-8?B?SnV5UnMwWkV2cWtoaWMzNWhjVlVQSDRZZnhnKy9WN2ZFMEZkSWFlL2pHV0JO?=
 =?utf-8?B?U0pZSWFJamlGMFA1N1ZBMmFJQ3RNVnl3M1BQRlBJM2NUZ1JlUTVPRTQ3OTFI?=
 =?utf-8?B?elJFcW5tOC9zZGFTZnhndWNkc0kxcjE1VDdPWDdnSndKMEQ2enFlemtHRzVu?=
 =?utf-8?B?RERFbHg3QWFKWUg2STZ5RUUwNDdNdWp6YWpNOTdtNUl2ckNHZis5amlSR3Jj?=
 =?utf-8?B?eGFpckV6SEdzcVRIS0tlUzZMYlQyMXJaT3lkaUd1RGdvdndwVXVPOWhCRW5n?=
 =?utf-8?B?ZTVFdmo2b0Erb1E2RGlkdFdieGlHM0VnNHloaVdoZ05oMVZnVkNFSEJac2t6?=
 =?utf-8?B?K3N5MVdIQ0RQVzlsRlJwVWM1QzVkNmdVWnQwaGFJN09sZXBsaVZrZFA3WGty?=
 =?utf-8?B?RnhuMmtCZGcwWmg2bXFnbUtoZDFndW5CVlVRYVBwMGJSNUlEMFNQT0VtMGNp?=
 =?utf-8?B?WllJNGZnb1E0VXNDVFd6WDE4bWhEZlBuZ0RST21jQmdIV3J5RXowSCtZWjdh?=
 =?utf-8?B?REtBYXRlTVB1d1RPYWF1Z1FYRUNFR3c2UWovOTBDdUYyWHJtZ3hpZU4zVU1n?=
 =?utf-8?B?Y0hjc0hrLzNWc0hFL1RnNmI2RnVJcVFZUC9xb3NkVC9VZTVjR3A5bUJIc2R5?=
 =?utf-8?B?dGp4MmxUQ3pHSDBvNFRaMHYyaGR0dVJwck9CUkg2Y0lxbCtDOGhpdnhDZ21n?=
 =?utf-8?B?NGREZVIyN25RZldtYWZhaVduNkpEOVBXWGJzOGpsamFUaEZ0Mk9FWFpqN1NT?=
 =?utf-8?B?NWFvTXBjcGdSTWdkK0d3MCtwcGhEU0VlYTVzSm40ZzRpRUFWeHh3cHl6Q1dX?=
 =?utf-8?B?WGRuaXQ4eFc1WnVmTFp3SEd5Q0xWYklkczJUQnl2RzREUVgrVSt3c0ZGd3Q1?=
 =?utf-8?B?NmMweUcvdEZKZjRCWVhTd1VJLy9wYWNESU9seHE1M21ZWDFUankrVmo3eERI?=
 =?utf-8?B?aTdvQWo5TVNCbnlWd0FyY2NyWFdhbXpIeVc3anZOQmJjcUZtTG5tS3dYVUE5?=
 =?utf-8?B?NmppUC9UM0w1Mjk3d1BnRUUrTmE4ZDM2dEZGY0RyT1BYZnAzSlN4NEw1NXhp?=
 =?utf-8?B?WFVOaVJLVU95dnBVVHluQURydWR6UWV6SlRtUkN2OERiV09udVRmNitaK092?=
 =?utf-8?B?NnZpWFlwUkhxWFpwcnVERVVNeVlyQ05hMm9LZ2JJdm9lbzdkdWg3dXpOKzVU?=
 =?utf-8?B?ME5vNFZlQzh2c3o5WXEzRDlQcy9FdHNhVUZlMmw4NldNcWdCd25KdE03dlBi?=
 =?utf-8?B?Qk5zcDlkak9mbGYrTElrd25GbXpmNXEwSEZwZ0x4MUgxNksrNEYremNaa0Ir?=
 =?utf-8?B?WmFJRFJQQzJNSFJjZUZLNzRsZjFGTzhyanEwWEJrdnFTTHFYd1ZKZm4wRFBZ?=
 =?utf-8?Q?3l6yflzb32AGhqXXug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BFTnVDbmoxRElDTHh5bU1jOTdZcW1HeWtOZEdIV1NNZXFRQWNPQzlBK1lp?=
 =?utf-8?B?TVcwcnZ5MzJvSG1lM21BNVZKSlVxVS9GUHJPMEx6c09heGo4MWhGY2t5aGJG?=
 =?utf-8?B?WWZiZlBIV2lBOWNVTFhhZVdsWEo2MXlKNytqUVd1VkZPcUMrUjZNZlZ4eUpk?=
 =?utf-8?B?cWlZem9BSG5TWDlCdFNsS2xPcmJ6cjE1amJ2ZWgyQkY3dVU0MkpKclN5ajNL?=
 =?utf-8?B?ZVF4UmJHbU9yT2xFMHlHTjBmZVpQS0NLcEhTeHp2RjNMaFhpUW9xNnNtV3Bj?=
 =?utf-8?B?SHVrOGhmMnBPaFlNUkFzcllFcEpFWEpnWmdEMVhhdDU1Y1E5VVl4WlZQaThi?=
 =?utf-8?B?eElDc0pEWkdvQmNrQjJLUkJVZzBSZjBMYm1rZ0xSMHhYdTMyd1g1SDl5NW5i?=
 =?utf-8?B?a3NhK0tIckFyRzJIUmV6OXB3ZExNWk5HVE0wckJSbnVsaTg4YlU5Z0cvTDZK?=
 =?utf-8?B?eXQrQU1YNmZtSUhMQ2FZWGhaQkUyMXNxTWR5TzFlRGVzM0dWaWxDd0xQWm9L?=
 =?utf-8?B?cGlJY0hZMUg2UTJUWWhKcmdMdVROSGphUVR3c3A4SXJKZ05zL0k5VDFEZU5t?=
 =?utf-8?B?T1RZUnR4eHNrY1QxZlFFWUNoMk9HYnJwK0xvNS9iZnJhdzJqVkVzWlZ2U1lv?=
 =?utf-8?B?SkxyWjBvYnM2RXg2N0lneCtna2psQmtBNlh3NHlsTkVrSUl6TXQwMVhVbzU1?=
 =?utf-8?B?RUpIRW1QOE1ZZ0hoNEdtY0pNbmVFaU5iQmtBWTFSbkpSeFBvQVZkOFF4bGdu?=
 =?utf-8?B?WDRXNFp3K2p6TnUyeXdkcXdJTmlxVTZ6bURFMEoxYnRnZHVDbFBNRzZRTkVJ?=
 =?utf-8?B?WWtiM0tvSzNNbTJONnhyWjFrS0JFU09XcFpGTTNSellLbjEybXhwcVFWK0Zr?=
 =?utf-8?B?WTdvRFMzSnp2cm5vTENGdnNUd0JPZkF3YjVhUUJQREJUTGVuMmFTem9RWXEz?=
 =?utf-8?B?Ui9GTXljWXQzNXNtOGltRUZLR0VVOGp2NTBYQ29xUVpHT2Y4K2RSOWd2ODdy?=
 =?utf-8?B?aXZRaURrcmxLUmxZVXhIK2xwazZLaTRHUVoyZ0laTmZTSUVvb29paUltSVpI?=
 =?utf-8?B?dndQOWo5NzJzOEdTOVF0MXJMRmVRRUhZdzRpNU9DWTlXM2Fjb1pGbTdQeDZL?=
 =?utf-8?B?WkY3SlVzeENMcG5lQ2dhTVlFb0N6MHNITXB0UkI4YmRiSVFxVC8yTHNmakpF?=
 =?utf-8?B?QTZnRGRjdzdVdEFhT1NJR0Q4RU1SdklEaEQyM1QvM2VGaWhlUk9hcG0xRWJX?=
 =?utf-8?B?KzVrVTZKNnNnZ1gvYUNtVEUxRFFva1lseXVDc2VVTHJxV2E3OEM5VW83dnVm?=
 =?utf-8?B?NEx6M3BPQWhDTVBrb1RwbmRhQlZTYWNpSDhXTWVST015a09ad3FHVVA3YW1J?=
 =?utf-8?B?c0VPZDRxQ2xXSnNXclQ0QnNaTVg2QUNiS3preXpsaXhRNzM1eDJLSFR2RUoz?=
 =?utf-8?B?K2J0aitVdHl5cHNpVGV5L3FPTVUySENqQ2VpNmUwZ0NzS0Z0T1dPb1NvN2xV?=
 =?utf-8?B?UmFyNlNTd3FHZGNiSSszUEQ4eWp0dFc5VUdJb0M5Mkc3ekI2TjFCOFNGTk9z?=
 =?utf-8?B?Um85aW4velZhR0ZzdVFvTi94c24raHpjbGJ4VDdRSHlKQmFVc2tSRHQzOUdO?=
 =?utf-8?B?anpaK2dyY3QvakZuLytMZkdUNDZxUFR4Vk5ZZkhoVjRTS0F3YWZ5WXhjdlRG?=
 =?utf-8?B?VFNIcVVrMTQ0ZGhhcnJIMmxSdWN0aHh6SWJTQ2RxTHU4OHFVY21qODlrWnM2?=
 =?utf-8?B?UEFOc0RVNUhvaWN4VDU4LzVVS055R1FiaGJ3QllKQWJ4bVYyT1QxQVZ3WEtZ?=
 =?utf-8?B?ZW1yQUdjWDhaOUpDTTAxeTc4Z240Uks3WWU5OXd0eTBTY0p0ZEVOUTFBQzlH?=
 =?utf-8?B?bEd0ejVSVEYweTV2YVg4UzBDbjh4Z2cvV1dVT0pFcFk0MW1kRDdVaWZ1TnZv?=
 =?utf-8?B?TUFDZ0pxSHFodTUyeDRVNG1vM3lPdmpua1g3TEtaOXAzZjBzeXlEK1pFYW9u?=
 =?utf-8?B?VmFwSzZiUGhnT1ZSdGhiMlQ5SmNsL2RYVS9Bb3Zka1l5Y1B5NlY3anh5MWVS?=
 =?utf-8?B?ZC82ZHp0Q21wSFdTbFVXMGlKQzVTVEx2OUQwUWExVW1kbTQrL0s3TkZGTFdn?=
 =?utf-8?B?M2VyQXBnK0FzOTJEQW1rNFpDQkVkSHkyNEtERGdyeXVZR3lXM0loeG5hanRs?=
 =?utf-8?Q?J5782qtewtQPqBBefF4lCQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e93c4d80-2dbe-482b-4e11-08dd14222b8c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:11:55.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjQPJExQuJO9muBX07ycQYs4e/+n/oh7tbcwQVIh/1F+K548OHIxdMyifq3601EwlNWbJpqRNGLTutqsDzoRR28zQFXoArXejE8G6qRYa1XK1ekzrlEcZ4tmhVQmEJAe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
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

LGTM,

On 03-12-2024 11:45, Suraj Kandpal wrote:
> During LIC the link may fail due to a variety of reasons but this
> does not reflect a problem with HDCP. It becomes a problem only when
> we are not able to recover from the Link Integrity Failure.
> Add a check to see if CP property is CP_DESIRED and if so give it time
> to reauthenticate and fail only if this reauthentication does not
> happen.
> 
> --v2
> -Add debug statement [Santhosh]
> -Add closes tag [Santhosh]
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3508
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_content_protection.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 59dca54df..04dff7a05 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -376,9 +376,17 @@ static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
>   static void test_cp_lic(igt_output_t *output)
>   {
>   	bool ret;
> +	uint64_t val;
>   
>   	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
>   	ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> +	val = igt_output_get_prop(output,
> +				  IGT_CONNECTOR_CONTENT_PROTECTION);
> +	if (val == CP_DESIRED) {
> +		igt_debug("Link Integrity Check failed, waiting for reauthentication\n");
> +		ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> +	}
> +
>   	igt_assert_f(!ret, "Content Protection LIC Failed\n");
>   }
>   


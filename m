Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1C6C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 12:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF9F10E05E;
	Thu, 10 Sep 2026 12:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmAvm5bQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5A010E05E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789041968; x=1820577968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MhwY6DRAaSmRJz7mkr1CGRQQfrIAxoZeo2XywUZgSGs=;
 b=NmAvm5bQaTtzV5Eto8aQJQnGn4tTl3VfpXqyESzMl8OBn+UIGDr0Bb/T
 Ha+yQmEt7BYLdnp79TSU6MhMH68R5MZwmYx50ONxd36DzSkfYbyZllw5J
 RHCvhTEq10zHAj4x7Cw8VUDmsMPkN9eSc1j63ylQpUTlYCLMa+DQROlN7
 xw9Tz8lBnrSzYs+slx7Cl4F0qcTrQtTs+vRph84RK4qMv/9eiqR+3lYvT
 LKEDAh59sMDQSU1lwmc1/YWj6+oDvOnamRzRh3jQAxv7SDDGdO0GIaLYz
 r/jUmDrl3B1FIxqUaSgVnfuhTIo8c8qJJ7BQZbeyxZeorqnTudDHGERpV A==;
X-CSE-ConnectionGUID: nJm7itzSS1+eQ3HmftRpnQ==
X-CSE-MsgGUID: Anf1vTn0R9alTbQBoskWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89421734"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89421734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:06:08 -0700
X-CSE-ConnectionGUID: USTVnZmTSkGrXSTUrZpLew==
X-CSE-MsgGUID: 7pd0qiEKTMCOhePoZAJ9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="271585764"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:06:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:06:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 05:06:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+r9ydt4uzedwEEvdh2aQLfQzqy2pS1QDMlqjEI7raPQa3Y5RLK8MSaQpI4fn/Y7p0w4ZuyiQ4tDRVs3EltCLBQSZYGmFcXIIV6BqRynFav9hXTWOGWZCNm90DnPjjugRSjLLYJ5zujddzTMzW07foT0xmW6CusgNE/N8cFxq9nQ7jk3U0LdGwD5VmzvN/9ILQGW6QuCmwbYNXLqKl9tWOw3x6DxSKfo+sTEAWQAT9CcqF8Pqv87BNAYQwWQX2dzuTz/9VPtn2QqHuUW+kdkBbCbnuG2ImF8DVQkYEFJmrAgR9GG3Vv39De7gdwcZuUhBEVAUx/jByfLsXurnesstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6QNwGadBUl4mj79beHcQISVB1MrXhfa60XGmgetLuM=;
 b=AKUbaR3NYJvhs6Ni2/UrkdFa9GHFFksQ7kn9i3+a8c9UlB4DUQIg97+AFk1h1DTNngzEoc3MzKxUL97y9aYfvj+CCHcvx8JWEV4MHw9npY2wWeVtycWF5FyvkmJFYRPeuHEhepn3YwyI0EocthHUSSqBpUuG8vFew5KFzr5r/Ob9KiHu6j2HAhRnh/iB4QO5c15/y+LW79G9s7iglidHcaRxqkffj1vyhPstRoiSTTCLErCC75mU3i87xeUrY5hZfsJsDhRcV4/ZKnimwo2rVK2VGK4RIEkpdVKG+5twU/mBgxRH6LUCRQEH+ImxnWnHmATT4hE/aY/OjrNdR+VKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 12:05:57 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 12:05:57 +0000
Message-ID: <1ed559f2-2dbd-4048-aa5b-d4b6e2493e91@intel.com>
Date: Thu, 10 Sep 2026 17:35:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-5-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-5-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|MN6PR11MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ef7ea8-4a4f-472e-401f-08df0f33decd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: yupf9atG14LmPoPznTvO2d+fCrktq3cmbXPYsgphXG2/c6NmQ7ocs8ASipzkk8zrpRoWf86kvWe3D3TAokjNh62xOWkWs0AqVOcLr2TVstertpeNf6Fzon84INIkpqmpa2BAMe/FWUndGgy7LXjScs2N2g8t/bmXinc8SiJs90VSh6fewCFLG+K+RLXPRDcf5ACgOvvtcf5/f1KIdvlS2Y6/Xw45LLQ8lQNoXsF0alu1uPyy8vF3RKkonJX/YSpNK7t8qK5hFbMB+ONPLLvLTJvrBdaGbufJ9ZCZTxXYM6jLRgyAzlIfYz2xsbZGtUissoIDTuPRGjMp1S3foozV2PAgKBT9UnANrDQnajXRY2lmuRLD/DFFC3o+FduBFt5P8QTN4RhgNgs1mH4dXvN7/xQ5m4K3oNdWXZGg1o9mj58GvHNIuztAxQaFW+OkKhfIoGV4kPUiKZeFzgrdKPD9zw99BxPprW0zpGKrj0y/3eaRU/km3JNsG5LL4glO5HkKa3GxGRkHm/VyJ4jhxM/Oth8RjtyNah3DJVibg2qHzTVMp857Kxl4CDIuJPRYwLxNkixjfQr9ocXoTwqGGZ13UgSWMEMWzCLRSi+8afeQl/P+oZ1GMwv7r/MPIymA+de5/JQU+FabffpvxssUcau9t6E6h8yXk4E9MpwdFo2rHhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHdqSHh0WStyalRLSkN1YXZsV3RIMjgvenpadFFQcEIzQXBzMk1zYkhrT2ZF?=
 =?utf-8?B?SSt4d09LeXZIWEVpbmFoQ2hlSnQwNlZFaTZxUEptWUgraVAwenBsaS9GWHlN?=
 =?utf-8?B?Szk2akFCcTNEYVBsRHlsOHVla2Q2SlI4MUh1NVRTTGNOYkEwTzg0bnhWVEhK?=
 =?utf-8?B?VmphYjhvYllVY2Z6SHhOV1ZrVmNKdG9vdjNaZ0w2ZW5IYmZtdTA1NVVjMW1N?=
 =?utf-8?B?c2Y0Um1LTmpKbnZLaTdlcC9XZEtEMS8zWHpEcjZ6U0RHZ29walIyK09jQ3Y5?=
 =?utf-8?B?SzA0MzJYQlhjOU9mRks0NlR5OGVkMVRVU3o4azFhTkV6Tmk1Y1FvSmlaTjhn?=
 =?utf-8?B?WDcvdEJlZ1B6OXhtUktUSHl5ZWpVQW9rWFBoc1hIVkhoL3ZwaVhKeGpLZGxu?=
 =?utf-8?B?bHVxNC9iSTd3T0I4VW1PL0szVnY4Sk0zVlo1c3NKMHI4NTNaMCtQVUVlNXVD?=
 =?utf-8?B?U3dPRnVRSWNMRlJqN25NeU5GTDUyMkxRTklSRWJWTFdjUjBiMHNQS2FBaHhP?=
 =?utf-8?B?dWpBZTkzZitkYjBpQXZOaVI0YnVuTXppcmliNUJ0ZXFhKytpekl5VXZXVzkw?=
 =?utf-8?B?Z3JUSitpS09mK0pRdnFJdzVyOXZxTXVWUitPNjU3TjVDRjdhMGwxYTJwN3Za?=
 =?utf-8?B?RTVEY1Y3VlRSVmh4UGF4RmR5dVpnWE80cEowL05XQlJ0ZEJleUpQbHc1KytN?=
 =?utf-8?B?Mzg5WTBVZFdITGtqVFZHRWNmTll3aVJCU05sUklqU3FRci9DZjFIQ1pMaU9P?=
 =?utf-8?B?bGhHcld1QUlaSHBZV1NDeEJKTXJEZGwxdEVLbWxMSUIrR2tLWXJReHRQVWhW?=
 =?utf-8?B?bjJYYVJDT0ZGdDN5TDZ6ZjJERHJUa1VMV2FaUDB3c0YxWVRWMXZQV3hhVUVp?=
 =?utf-8?B?MGd1KzFBRGsxNWp6eGlGZ0JYZFpTVFRDMGRTRUU5WVJEVjJMQUtxZkE0WHpm?=
 =?utf-8?B?U1Y3RW8yUWUrZUNiRVV3WHFBTDJlVUpzNGh0ZW5XUXNhZ2swaVVoelUzL0FJ?=
 =?utf-8?B?dVBpdXArYUZwUXlYYnNLZjBJOHRhY2NGdDhvMEcwd2Y3Wkk3dTBkMTcraThv?=
 =?utf-8?B?U3hIQ2plTGRqdFluT2tmZUptZnFFektzREpPNGVpOVNxQno2WnZtbDRxTXRZ?=
 =?utf-8?B?dzBYMDJmQzV5ZEgvQ3dwb1g5L1lPcEdTNnlreUVvUlMwUnBpQVhodDdJZndN?=
 =?utf-8?B?UC92TTRuK041OW53TlJsUlh1VlRxdXBqQ3NQcnBXenRNeW1SWHVuQkNWNUU1?=
 =?utf-8?B?akFuL1pEUHRQQ1FmZXpOeG9rS2lMRk96OEEvNUZCc01WcUZaTUEwRkhvRE1q?=
 =?utf-8?B?VHZZcU5GbzNEZU50ekYyd3VobTF6czI3MVVTVE8yUi9VN0JIMSt6Qktid2Jx?=
 =?utf-8?B?clArVkl3OUFSdE5saFZGMjY4QklBM0FCaG9USW9jbDhSZzhreVpUc2crVll6?=
 =?utf-8?B?M0prYzg2N05QLy9mdUVoUUNEalhLTmVoSVpBNTQyaXIxWXJhL0xraEhZVUJE?=
 =?utf-8?B?WFB3Z28vUzFreUhjTmNHckJ0dVhFRXJOSjlWTGFtMzgrSTMyai9xUEY2ZUIr?=
 =?utf-8?B?T2JpandVQmVKbENIa3B0TU5wZGdFMWRvR1hqTVdUVlpxRDh3N1dpVkdxSDNk?=
 =?utf-8?B?cjhBbFI5M2IveVpkb0J1RUFGRXJndGkzNkQybGIrQ3U2dXdmQVBwa2RHVGVa?=
 =?utf-8?B?YmJ5NzdRSEU3bVU1M2UrR3grbE1FRUd6bHZEY2d4Z1hCQnNSQ3hZcnJoR3N2?=
 =?utf-8?B?b2FkNHZsUlBOTDBUYzZqK2ViQzZab1R2d1dMd1gvMnN4OTVQdmlheVZsZjk2?=
 =?utf-8?B?bnBVRkJZdkZYOVZPNW50cU5SQ3MzTVRaK3YrcWZWbnA4dmgyNDJ6NVlSTGpu?=
 =?utf-8?B?OGdNZjZYYjg2RWVyenRWRTdBM0gyaVVjSllCVGJ1bFZ4bTh6UG5pNGcrT0RE?=
 =?utf-8?B?d3d4c1NodlNDdS9Md1FEQXl4azd4YUhSNGlOb1V6aFVNNzI0K0RuWmZBVUJh?=
 =?utf-8?B?Q1VQUEZoektDT2F6K2w2UFY1ZFRJdUNrSVFjMUtheTcrRzhJVC9XMFltVVd2?=
 =?utf-8?B?U3liQ2NVUGpjVjFua1lMQ291WFVKdElSNmg4b3VhOXlUMGZaQVhJNGh5VmFt?=
 =?utf-8?B?QUtweThTeE8xbWZYVnAzVkRid1B0N09FS3ZpbS9BNmYyNzZoUk1EWGhweDJS?=
 =?utf-8?B?NGZJVlM2SkRkbHdyS09OTnlua2pVc3FmL1N4c0I3RDR4TnRBVVk2Ym5OcXNQ?=
 =?utf-8?B?ampkdjFOT1Fqc21wbmdLRDNGVTlTWHFGdkkyelg1THlBMkNNSEZCYytCa3Mw?=
 =?utf-8?B?SWduZzd2WjdoU0RlUkt5WElYNmFYL3hPaW95VWdSUTVmdmFmWEZHN1ZlbVpO?=
 =?utf-8?Q?LAerPDL5tCCO9Gt8=3D?=
X-Exchange-RoutingPolicyChecked: KjKDj9RWzQgQRFaF+dYKqZYMw1V6ihnbXZ6HCas/GM1eJxTJ7R0DzvkdunVdqad47gy5hPVGtkTjzGPoXRvsgfZTCZZYS0dQViAY6ySccwg6WX+uck8ufYeVUKerht+ToaAqpOhTVtTwvzzoLD/lNRT+iV6TgVGeBg7CQXzyduswlb4SmFhmE9TTtjaQzcfeLc8Y6M8Q/ypjm40J8Ea5vca/CEXefus32/T43RUyXqMf+K5FXilK2hB0Xu9ET7V46Rokl3VHViPX6Kq45CwCQUAE6QciKiNT9Fcems6z7XVsgycr+OfZDTTMtacHlkbK5l8sAhimn3kPK598Fdhleg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ef7ea8-4a4f-472e-401f-08df0f33decd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:05:56.9537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2o+mIGwbI77kVeI+rtMqx4kYsXxl+YOc33wphPd9mt+qmZ1lqNk0RCErT9NCBOaA8SFPLHOXcM5zFjJjOwCPLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
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

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>     Added a check whether error_value updated by valid callback or not
>     Added a check whether response required for the command or not
> v4:Added support to poll for incoming netlink messages with 10 seconds timeout
>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>     other cosmetic changes (Nikula Jani & Kamil)
> ---
>   lib/igt_drm_netlink.c | 268 +++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_netlink.h |   9 ++
>   2 files changed, 275 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index 709c01987..b18e3eeb6 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include <errno.h>
> +#include <poll.h>
>   #include <stdint.h>
>   
>   #include <netlink/genl/ctrl.h>
> @@ -11,6 +13,229 @@
>   #include "igt_core.h"
>   #include "igt_drm_netlink.h"
>   
> +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
> +
> +static int ras_command_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +	struct nlmsghdr *nlh;
> +	struct genlmsghdr *gnlh;
> +	int ret;
> +
> +	nlh = nlmsg_hdr(msg);
> +	gnlh = nlmsg_data(nlh);
> +
> +	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
> +		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
> +		break;
> +	}
> +	default:
> +		return NL_SKIP;
> +	}
> +
> +	ctx->reply_received = true;
> +	if (ctx->ack_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_OK;
> +}
> +
> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +
> +	ctx->last_nl_error = err->error;
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +
> +	ctx->ack_received = true;
> +	if (!ctx->response_required || ctx->reply_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int register_callbacks(struct nl_cb *cb, struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int send_and_recv_nl_msg(struct app_context *ctx,
> +				struct nl_cb *cb,
> +				struct nl_msg *msg)
> +{
> +	struct pollfd pfd = {
> +		.fd = nl_socket_get_fd(ctx->sock),
> +		.events = POLLIN,
> +	};
> +	int ret;
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	nlmsg_free(msg);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return ret;
> +	}
> +
> +	/* NL Reply and ACK arrive as separate responses */
> +	while (!ctx->cmd_done) {
> +		do {
> +			/* poll for incoming netlink messages with 10 seconds timeout */
> +			ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
> +		} while (ret < 0 && errno == EINTR);
> +
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +
> +		if (ret < 0) {
> +			ret = -errno;
> +			break;
> +		}
> +
> +		if (!(pfd.revents & POLLIN)) {
> +			ret = -EIO;
> +			break;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0)
> +			break;
> +	}
> +	nl_cb_put(cb);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int send_command(struct app_context *ctx, uint8_t cmd)
> +{
> +	struct nl_cb *cb;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +
> +	msg_head = genlmsg_put(msg,
> +			       NL_AUTO_PORT,
> +			       NL_AUTO_SEQ,
> +			       ctx->family_id,
> +			       0,
> +			       NLM_F_REQUEST | NLM_F_ACK,
> +			       cmd,
> +			       DRM_RAS_FAMILY_VERSION);
> +	if (!msg_head) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
> +		ctx->response_required = true;
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +				  ctx->node_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return ret;
> +		}
> +
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +				  ctx->error_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		nlmsg_free(msg);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	ret = register_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		nlmsg_free(msg);
> +		return ret;
> +	}
> +
> +	return send_and_recv_nl_msg(ctx, cb, msg);
> +}
> +
> +static void reset_drm_ras_netlink_context(struct app_context *ctx)
> +{
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = UINT32_MAX;
> +	ctx->error_value = 0;
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +	ctx->family_id = -1;
> +}
> +
>   void igt_drm_netlink_cleanup(struct app_context *ctx)
>   {
>   	if (!ctx || !ctx->sock)
> @@ -18,14 +243,19 @@ void igt_drm_netlink_cleanup(struct app_context *ctx)
>   
>   	nl_close(ctx->sock);
>   	nl_socket_free(ctx->sock);
> -	ctx->sock = NULL;
> -	ctx->family_id = -1;
> +
> +	reset_drm_ras_netlink_context(ctx);
>   
>   	igt_debug("Cleaned up netlink socket.\n");
>   }
>   
>   int igt_drm_netlink_init(struct app_context *ctx)
>   {
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	reset_drm_ras_netlink_context(ctx);
> +
>   	ctx->sock = nl_socket_alloc();
>   	if (!ctx->sock)
>   		return -1;
> @@ -52,3 +282,37 @@ int igt_drm_netlink_init(struct app_context *ctx)
>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>   	return 0;
>   }
> +
> +int igt_drm_netlink_get_error_counter(struct app_context *ctx)

Aren't the return codes here mixing -errno and libnl -NLE_* values, 
which overlap numerically and mean different things?

Thanks,
Soham
> +{
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (ctx->node_id == UINT32_MAX ||
> +	    ctx->error_id == UINT32_MAX ||
> +	    ctx->error_id == 0) {
> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
> +			 "node_id should be >= 0 and error_id should be >= 1.\n",
> +			 ctx->node_id, ctx->error_id);
> +		return -EINVAL;
> +	}
> +
> +	ctx->error_value = UINT32_MAX;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_value == UINT32_MAX) {
> +		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
> +	}
> +
> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index 0e563e55f..5db7f4ab5 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -10,11 +10,20 @@
>   
>   struct app_context {
>   	struct nl_sock *sock;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	uint32_t error_value;
> +	int last_nl_error;
> +	bool cmd_done;
> +	bool reply_received;
> +	bool ack_received;
> +	bool response_required;
>   	int family_id;
>   };
>   
>   void igt_drm_netlink_cleanup(struct app_context *ctx);
>   int igt_drm_netlink_init(struct app_context *ctx);
> +int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>   
>   #endif /* IGT_DRM_NETLINK_H */
>   

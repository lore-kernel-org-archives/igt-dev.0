Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F35606A5EB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g07IFhgR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35010E251;
	Mon,  9 Nov 2026 18:34:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8210E251
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794249218; x=1825785218;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=24T9el4+3fxWhsLUnP10pA3fQBtkmbio8+W1TryN0EQ=;
 b=g07IFhgRPLt+fSAuWk43A0KqIYRIWOKXt9xM5PPw4D7WGx3hWhLolwMi
 /Ry5ZJVKp2Q8FlJi/sgDFnc0cRK2xDVa2I2s2wXBajD4c+20R4K4jsoQi
 KY2pCp9DwKesz7zGDs46h8QL+xONaWi9dAMbB4KTCuyEJzLjdI3xmkhAc
 6YxAK9cp1jkujWvBcZzKIwBjCSO+BSrogSgqLAr2obxwNtnkZsPrh5VWK
 AipyPeuvy0gP+Aeu9rJGgqPctKQCYmQaVYXwGK03EmGuKE4b4cIoM6ZX5
 FwTf+97ZPFxfqKDRF/Ct0wiyr9EaMx3lnFUlNCqMWG7bfvNggBU2VAR9j Q==;
X-CSE-ConnectionGUID: 4UG8HXuhSvyCO7ozu0C7Mw==
X-CSE-MsgGUID: 1xjJCSSFRwKNm4gW85EaRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2992753"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2992753"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 10:33:38 -0800
X-CSE-ConnectionGUID: B2jHSpi6S02Rzo37flJrDw==
X-CSE-MsgGUID: ZdgMDZKvSKCyc/L1r0kXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7797752"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 10:33:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:33:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 10:33:37 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHNnWaLFgPqAg54Dpa3/ILynwXuz7hlE89s9efzbJwxF2raUDpc5EtD17feAH3Phhw1nxNBCRAZ+smSV9ivb27cHW5cO85dPX0Fec8a4IPlnZb+y3BvPTPvWQ80mvX5gtHrNz7TX5KtuUEo6RUBievVpi6m6ZxqAdr9VJyExqA67ubH+ffa4SpoeAMH5eHJbu2DPxqfFop8RsURynLafZFqsu+4yOfqqz1YVjyMfLA3Af9/olzAxA5Fwsu74ZqxZS3ovDb5uTtX2NhFDtlo/OjsH0tom5gvX5dDEqQP09T/6JvsZcTiKVnUbeIRBaA15C/y2nXMvPNq2A/XXxBh0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKImji+ts8/y4YVxJhiYp6tmo9nYGosnDaj0/7c0l/M=;
 b=Xc/zUjpHNAvwYoKq2t8e3QtVHiczuaaMhs+gbinkNXzH2SuFvH46WbJ3W14heTFfSmP9DJSPwOeTkLB8bj+1/uJu8vFh6MTXnPJs87n7D3an1EfSD3U9GOIv3dhxJ4qWE2IKQIPp75lRgDry6TYsWYpq/PENMx6RYrnTkFqm6ij3hgtQN54Cds5AJll/kCu5Zb8n5OTPJrdNmK9aq29ec6IlIm7tb1BwORW7YS4JBGD+5/sg1VRFQoNdqyrJxCfwPYWRYwvD/72NxpG6NzYARxHd2zffvYAWxziKkuqgnw6oqHW3oAXvlhNF78PF0Eu3KYwfa/5yQwMCan9A+hMQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 18:33:33 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 18:33:33 +0000
Message-ID: <9b99f4ef-1f2c-459f-9dca-14e0b10933b7@intel.com>
Date: Mon, 9 Nov 2026 10:33:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/3] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-4-jagmeet.randhawa@intel.com>
 <7qstl6a3reqbsaweguauxk5xlczlivzskgwldvent6armei5iq@67tngcevxhs7>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <7qstl6a3reqbsaweguauxk5xlczlivzskgwldvent6armei5iq@67tngcevxhs7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: e607216b-c2f6-4dfb-a99a-08df3e8ff553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261022105027099003|261021121427099003|261022113327099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|261009221227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jbZIC5axPaNzRZ+iluysuMQI2dsgndINp5jFC9EpHItPWyhbwnoaN35KamWo6+YhUzVyLjGgAYhwH3z6qQDJXE60/JYMSRCb7O8f2nfltRzuQKRZ+DrrqHg68FlABMrr9m29B15AEMg0pBS7MLoQq+ktUPXflEf09SV2vo0zaU5pU8/pw/ewa0BI4VAvnHkglS6gbWT8CpDVuE8dLFyp6xjgWg2usn2R5RGUaroFQrtDf9LQwYPL00cXDuuMWTSHTld2fYBuPKPT4k92be9Nku+mapWwn7CNf4Vba9McIUtg4WXAa2w66d2/iwGFEQWNo9c17c6wGn5lTXEHCmHEUA24ANxMI7skHgX4W4VE4EN8OmnvTxuBPH0jqZHpkzwfLhEkRsSLxmqKyKszqOV0W/W7kOU4MGnr5alS3uNIQ8S/she83NZsMTjwqtU+bv9a3GNGbu2c+qIf2i6JfqS9N4hZor5cSObdfz04OYnxjT/nOd5Yw7bjbfPzQ1DirX5cv7B1HXoxf3ZPGOR1O3Ug0rSBRpKVIVxH/DDEfh12X6Pv/csWyPYnJaiyQENLeOJKxSAWHZZUZ8QPe+2ExU4cJY47Fx18dPIrv5L1H6Td3U0nAqYj8jsdPryZiIOFsfIu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261022105027099003)(261021121427099003)(261022113327099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(261009221227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGt4Zll1VUZPc2lKUXUzcnBpWGFqY1pGWnRBVlJXOVVSYk9UbEJoNVY2NGZD?=
 =?utf-8?B?LzZqWTRGbFN1WU9kY3BKbTRKVjNNekNXUzdXRUQwRVYxTkoxMGJ5b0djNTV5?=
 =?utf-8?B?QlhCNE1tMVlOMmU1Q29WaTA4djR3RHlxNmlQOEcwTDBxMzBKTjJzM3c2Mnla?=
 =?utf-8?B?b3JuYjhxOVRKOFVjYVF4Z0xycXpuVDByZ0NXNXlWVVZSYzlUdWRTT1FMNHpZ?=
 =?utf-8?B?L0kzbTQ0bThZeXd6QTkrWVlCT0pvWkhzUi9zRG54VVpoTjFJelNXQWFaV0lx?=
 =?utf-8?B?V0hhYmIrNnVESVR0c2RXOU01QjJ3TENjbjcydkQwdjBZMURwQ0JXVmVHSExh?=
 =?utf-8?B?QU4ydGFVUGFFS3k4L1B2MS8vbXYvdFA4bmhZZmpBWFV1ZGhyTzRTUzJSNE40?=
 =?utf-8?B?dGZCMVVISzJweGsremhTS1FWbCt5WUFzcitLd2d2L2loU0RBUjIvZVNkSDlB?=
 =?utf-8?B?anF5b0dQSGtLTDB1WVlpTHVTVHFaNGZGSjRVWnAxVUxocHArOTg5MVdOTmh6?=
 =?utf-8?B?L2JvaVlQSHJhNXZlYUNuQzFoLzh3d3Y3YUU1V0VVWGYzekZDamVuRmZmRXp1?=
 =?utf-8?B?SkR2KzBDdjFzZVlQL21jK2V2UGc1Y0NSUkIra1BXU3FxUVBUVDlLaFZvZTBD?=
 =?utf-8?B?UVRHTTRsYllKRkFGNllELzVFaGl2bTZ2T3JMZ0gxOEtHd2EyME5SbWRBVzF4?=
 =?utf-8?B?VTdzeHBKM0NsOFlKVStrbjVDRHN0akhoemxlQUpwaGtRSEhWd3Q2UkJsaUZ4?=
 =?utf-8?B?TlU3Nkw3STNLMGY0NGRQZEY1QnJxamdSenlQYVdhWEFtZ3ZnckdZTjdCVEdY?=
 =?utf-8?B?dHErRmdrU2tieUo1bzNHK09yRVMwL0hYSW9CVkREWUZBWm9MQVQ5bkx6ZWNP?=
 =?utf-8?B?dnkrTmkvQU96blRmSUVGQ1FrVmRvRklKTzB2aktIRDN6QWY4ZXZnbTZ0Uk5B?=
 =?utf-8?B?QjBuMlYyV0ltbE1HZnlnbm5pTnpia1Z6MGVqQll4MVBGaVBXU3ZYMUtvRWJ5?=
 =?utf-8?B?SmgvVzNJdUxyeVJ6YUh5eHY0K3pWVCsxMzhzQ3pFTzJ1SGZPeXJITnd4Vnpp?=
 =?utf-8?B?VnRWZXl3b0lGamRnVWZDODU1ZkZ2a3R6SGRGM05Kcmw0VWFrMFp1U0g2M0lZ?=
 =?utf-8?B?QmQ4RG5raWozRXFtd2czTC82VEtxL1dtUk1RN3V3d3RYU2dDM1FzOUNMdVU1?=
 =?utf-8?B?ZVdMdmtod05FYXZXSmpkVXU4NGRLT3F6UnBkNmYzYlZsanpIZE1RMGlrWU44?=
 =?utf-8?B?RkJQVkd2czdHVXhKcVFVZjFmOGVmcEFTUURZb0ZzdFI2cnhCS3Y1cUZPaERp?=
 =?utf-8?B?b0VyUDlnaUxDRWxFOXNtYjRaL1lLRFkwMDBVdUUwNkcxTE1aU0tpUm10Y0xW?=
 =?utf-8?B?M2tyMW0yYVNwY0d5NXVVNGwxVzZBT2o2blRRUGRVNlZJVTJHb3MvTFdoSlFT?=
 =?utf-8?B?YmN5VVFoZEhaL04rakFwbTVLb3dnL1IreHZNUUZ3cDJqZk0zSDhHYXllbGxw?=
 =?utf-8?B?dkhWRGVibGsrLzExdEtqSnJETVBQdUZtNUlEL0ZYUmYrdk9hbE1qZkQyN2pw?=
 =?utf-8?B?TW04MS9wTE51cjNIa2lQb3ByTkZIOGg4M0IrdjBpaFk0Z3podnZFc2o2Zmw0?=
 =?utf-8?B?dVpEdnNaZ2JjYWtzV0Z3ZFAzK1h5YlNPQjZQcEZSR1BNMUg3ZFNUWHVhdDFa?=
 =?utf-8?B?dXFib1NDQ3lFMnJmRXp5UWFqRXg4MW1lSUdJSmx1Ti9SdTBUU3dTSS9CbkxU?=
 =?utf-8?B?RW1LREVjVXdIaDN1Q1Z4eFpUcmltc3R6Nnk3U3hRakJzNHRHekpoSURCNzQv?=
 =?utf-8?B?Y2VreEErODFicE9NRmFhb3l5RTNYT2RTRHI4ZmtKekUycFp2WGZBa1U1eDFJ?=
 =?utf-8?B?ZERBa3ZRSHdMVHAzTEI4ekovRGVsUkFtcERhanMyenA4MG9iLzlyekxDbS81?=
 =?utf-8?B?MU5FVm81Tmd1KzVCSTZYUjVJVFkzcTFheHgwbmFNL2pwWUlNaGd6SG5lRHlV?=
 =?utf-8?B?YktMVllpT1F1ellTWFdVeWlLMFhxak9udE12Nk1ZcHZtdGdobHAzbUVCZXl6?=
 =?utf-8?B?Y2x1c0lpL25RRWZJK2w2WHVoUlVPNE1WYWx0WHpiOTdVVWZzZTI2ZTY1ODhl?=
 =?utf-8?B?cHN5SS9kTk0vU0hlZERuSDlod1V6UUw4ZVFjWDV3VW9PNzN2anR0TS9nTnVS?=
 =?utf-8?B?aTB6OFpid1FLWkdkT0QrbUpXdUpCRmU1RmowR2x1T2hRVnlBbmQ5WjNJRGM4?=
 =?utf-8?B?bmF1aGZmSno1U3V1YkdRaW4ydXVSVi9LYm9Ob0MvSmNpekxna2ZNS0k5cG1n?=
 =?utf-8?B?UXdPWHIvdGlwUjZTbFlqVm82TVdZeE1SNDc0NjRmamZCWEdwUDVWQzhobXhv?=
 =?utf-8?Q?/rLul7Z64U+/iQjM=3D?=
X-Exchange-RoutingPolicyChecked: dkr4DCo9UZ94SGQnNcLWkTHoHWvyso7jlv64gDxH7fUoV/3shrNeweSOp6r4ZDPKyIHVdGZQDMFH0+qkbslQMLSA7gplVatdfGo6AFCsmoX/mBq23mNAWfWt9SBd8VSK+ioEOx4iusy7Tc8YDxQjxS17hR3YFYu1VNCLx+UFWADw2CCVnoBIM+qmxBTnqawunERTpA6rmyl9KC+9DdRLnwox5FkJGsx2DdYIM6KX8E0I7fg7ol4v94gdFERyVTTwXgTTm7RXvyzLlW9O4xN48WY/LFYoqAFBQURihG6ISCOUFsO6SGyUar/seiLpRQu65bf1lxCPFOt49gMd5DpwHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e607216b-c2f6-4dfb-a99a-08df3e8ff553
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:33:32.9264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmbwudlv7skQR9OQdfh1TJc/Sbak+r2ZWLQbmeewNhFdMHyTV16HpSh4bJvbuNmuLluPTGLAryMqtBYI/l5J3Xu4ZUPIQguro4bHG6ajeso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/9/2026 6:44 AM, Kamil Konieczny wrote:
> Hi Jagmeet,
> On 2026-11-06 at 18:32:46 +0000, Jagmeet Randhawa wrote:
>> Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
>> lost message during VF migration":
>> https://patchwork.freedesktop.org/series/165324/
>>
>> A CGP_SYNC message can be lost during VF migration and is replayed by the
>> KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
>> a live multi-queue group when the migration lands.
>>
>> A group serialises on one outstanding sync, so both CGP sources are needed:
>> queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
>> ones. Both are driven from the legacy and the compute mode paths, so a
>> mixed mode run spreads the groups and the updates across both.
>>
>> A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
>> queues than that spans several groups and registers them in parallel.
>>
>> Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
>> each exec, alternating the values since the KMD ignores a set to the
>> current value.
>>
>> Add three subtests built from these sources, repeated under
>> igt_until_timeout() with a bounded wall clock:
>>
>>    multi-queue-many-groups                registers several full groups in
>>                                           parallel from multiple workers
>>                                           per engine
>>    multi-queue-mixed-many-groups          the same across legacy and
>>                                           compute mode workers
>>    multi-queue-mixed-many-groups-priority drives dynamic updates on those
>>                                           groups from a single worker per
>>                                           engine
> There are skips on LNL, PTL and BMG for these new subtests,
> please add a follow-up patch 'intel-ci: Block ...'
> as a last one in this series, or as a separate one, up to you.
>
> Regards,
> Kamil
Thanks for looking.

The three core blocklists already carry a wildcard that covers these 
subtests:

   tests/intel-ci/xe.lnl.core.blocklist.txt
   tests/intel-ci/xe.ptl.core.blocklist.txt
   tests/intel-ci/xe.bmg.core.blocklist.txt

     # Multi-queue is not supported on platforms older than xe3p
     igt@.*multi.queue.*

That was added in 758f22d62 and it matches all three new subtests:

   igt@xe_exec_threads@threads-multi-queue-many-groups
   igt@xe_exec_threads@threads-multi-queue-mixed-many-groups
   igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority

They are also not in xe.fast-feedback.testlist.

If the run you are looking at uses a list that does not read those 
files, let me

know which one and I will send a separate 'intel-ci: Block ...' patch 
for it.

If appropriate, Can you merge this patch series, Thanks!

Jagmeet

>
>> Registration and dynamic traffic are kept apart. Driving dynamic updates
>> alongside many parallel registrations makes an update wait long enough to
>> exceed the KMD sync timeout, which bans the group instead of leaving the
>> update to be replayed.
>>
>> v6:
>>   - Issue the priority burst from the compute mode path as well, and make
>>     the priority subtest a mixed mode one.
>>
>> v5:
>>   - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
>>   - Move the dynamic array allocation to its own patch, it is not specific
>>     to multi-queue.
>>   - Place queues the same way in test_compute_mode() so the group limit is
>>     honoured there too, and add multi-queue-mixed-many-groups.
>>
>> v4:
>>   - Keep the multi-queue extension at its only use site.
>>   - Mask instead of dividing in multi_queue_group_value().
>>
>> v3:
>>   - Use the MULTI_QUEUE prefix.
>>   - Drop the many groups flag and derive the group layout from the queue
>>     count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
>>   - Take the worker and queue counts from the section rather than deriving
>>     them from flags.
>>   - No subtest destroys queues, so the churn flag and the queue recreate
>>     path are dropped: registration traffic comes from the repeated runs
>>     under igt_until_timeout().
>>
>> v2:
>>   - Drop the secondary churn. A secondary cannot be replaced within a live
>>     group.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>   tests/intel/xe_exec_threads.c | 83 +++++++++++++++++++++++++++++++++--
>>   1 file changed, 80 insertions(+), 3 deletions(-)
> [cut]

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0DAD6DDD7
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 06:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B95610E156;
	Fri, 15 Nov 2024 06:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6a+N2S8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3E510E156
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 06:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731651704; x=1763187704;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KoiYJr95RqArL3FpNpzd5n9j8qXV0JLGhP5HSjryCEg=;
 b=c6a+N2S8wwEKULrV0+H1xzDWXRUd19F9h0Z62lunbHZnUOkqViFNeveb
 JJdnMaiL4yV9116PjsPCj9quQg8JXp9AnaYodNN9mTCjkGGf9QanLTSeW
 TOjpfm26IjESdLq/EUPCb/iHjOn6jS/LlFOtCIQMz0zQgnYGAsZTvUMAj
 /hWkP/QJmvg/k007ijpviX+dENmtire9xsFARhUc8lxumGluY6RJWNTKO
 gHSGtUiA9Ouiv/R6Oty+G1ZUkkPmsjMNkiEjgtJM9aN2ZVkypHac7QVHy
 QulkJHMiPnoZ4GRlHemt3rNkKQzh2Q12bDQ4ZFkfUFvweAvyHclhuFPV3 A==;
X-CSE-ConnectionGUID: 1JVWjd5CTjKEqSPRP65pHQ==
X-CSE-MsgGUID: SVy5w5knTOC0HoBjOc/2pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49172856"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="49172856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 22:21:43 -0800
X-CSE-ConnectionGUID: kbme8EfZTRaj2QWoNWi/Zw==
X-CSE-MsgGUID: YWzhdJMLTfSQF75j99rQrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="88198148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 22:21:43 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 22:21:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 22:21:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 22:21:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncAd6TAIAbelelBfsDCJapVCm88sxsceR5sCclhkIqKPZT7LNfd9f4jJk+wPvY7SEZcPl5CR9FrVdNCnNbuwMeLxOrmd0FL4yOoe5AkgqOrTfJeU28CN4/CUaEHNcBcMZoCH8sqTmvR9lDzwld2iqQ97pwQwD7k8WQWwFGMcuczEIGMMPFcL1q86MgGsOdy4AxGlfkctnejVs2Zdcg5e9YFX1Oe+57SZVteQW43BFaEhtT89q7lIYrxtoEpRIzCnQhMNYN4I6eDf849v9Rkopsjh5MLSVcQss8IlvfPwTfju4B+YdISr8RZzKfhEQigwz3w7WUlOoBp+MVuh7HbMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQrZAHWvoVnzTKP0+gGcUDjYSs7SD552iilExHK6h4I=;
 b=cXW4aqC6e56DJxtMPvuJoZpYhZX7p50GSOthlefhj/HrUc6hTZdwRSXMU7+2sZ8St8MEsOeDkood0RSs4FWck66pOd6KmS3zQF6nTbXFGed/pvQIWhpzp6wlcVi/qXu0p0LBH632bY4xZLKnnZulrPK7kLRCSYZWu13jxUyB8IaquJzEMdpDIcM8heeKQOLutY0BP4rUQifo8cMc/2BejuMQXtWIOqnDIyuLl/hFEJdN9MXPJZ4Qntj17RGQNBPexeh9ShE7UAlOKIizdWwPEaH8lm/A4HrYpm8yBiQVStH8p8AULITMrazYWW7WiWgtQI8G1HruZRhY8p/Hxn96PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 06:21:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 06:21:34 +0000
Message-ID: <6ce0b226-5b05-4e6d-891a-1454974e8daa@intel.com>
Date: Fri, 15 Nov 2024 11:51:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Skip test if big joiner
 display is connected
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241114181647.1499084-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241114181647.1499084-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: c0730bfa-0c2e-49e9-44c9-08dd053dc0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjFKekhSb1pCeFVFcGcyVjVvVS9CQ2pwNS96OExPN1FlellSMFV4blFCS3ow?=
 =?utf-8?B?SEwyVUttRGhENzQ3a2I1YmRsRFlmYmZFdVpOK3E3b3VObVIyU2R4aGFCbUU2?=
 =?utf-8?B?TnRMR3ZjcmxFeHBTYlN2cTJlRXJnNlEzYkNSc0Q0VUdBeDRKOEVmRGk3bTlQ?=
 =?utf-8?B?NDBGb0Q3TXBpSmlWeFRKTVE3TVliYkdQUXdGNklmeEtuTVdhcjJOd1hxMWYv?=
 =?utf-8?B?RU1Lb0F6bnlHbEwydGhZQVhCTHRYY2VkY0JVY1JFYk51WXY0SVBBUEhaTXNp?=
 =?utf-8?B?QXU3MXNudHBsai9JQ01rQkNmLy9BSUdhSlZYdW5WeGl2ZnZBeEI5WDdkSjJM?=
 =?utf-8?B?Z0I1QlI3ZWVxZDRpRDdpeWd4cHdoSmZNOUxHV1pWVmRES2dzR0pWRjZiVXd1?=
 =?utf-8?B?eHFLdTFmcUllR0JxNFBpZU91bnBZVWpZeUR3bGRMQjkxeldhbnphRTNsOUUy?=
 =?utf-8?B?WTNFWDZteGhVR3c0bjdQa2ZJcUtrQ0xES2RReUpXNlZjcno3Z0tMYUQ4WjFN?=
 =?utf-8?B?YW9BM01Qb1NFeVZKL0VUR28wcnVpeTNPckhoTXRjQzY1emdVeTB5UExOVDVN?=
 =?utf-8?B?UFNpZXZnMnc5WE5vSkc1RXJLajc3dlFMUkV1RkRFM09GMkpUbit6NlljUzVL?=
 =?utf-8?B?bWU4V2lkMy9nNXF0RjcwMTlEclJpSExpcWJLZXVFZDlvTDYwL3RzNWJPYUxo?=
 =?utf-8?B?S0dHdGxTRDlNWE1lbXRwY29DVk9NUlFSVGlNc1dKYnV3Qk1kTjBSaFZVK0hC?=
 =?utf-8?B?YWk4dHpKdWJWaWxtQUVDNmRxR3owTjh2Vm9IaERqUmlzbU9VVzlxaldnQ2Iy?=
 =?utf-8?B?bjVScmp3SVZZYmdlem9uSGdvQkdJSWc1eXJLa3RxYndidTVXTDF0WGFzekhi?=
 =?utf-8?B?NEFMT01wckVWOU5QaDJiOGNsSW51UDVnZGJlVXpPMVlzNVExb1Q1b0tGKzVV?=
 =?utf-8?B?YUlIOXN5bC9mZm9PbFdpbk84Z0hCY2ZLRmdIbkdHSnNaeGtNZkZLMjZyOE4v?=
 =?utf-8?B?WGFuRElSZHQ5UDZVQ0h0YnR5eXpBdEpkZ2tlNzU0WjR3SG8xNVlZQm5jM1p5?=
 =?utf-8?B?VEF3UHh1am5lWGxoVVF3bDZPN3pZUHRLQkhRbEFSNnFuL0p1azhHaHgzWUUr?=
 =?utf-8?B?WEZzOGJuU0lBVDAzaFdUZi9jR0N6SEhTc0MrSjJuVEpOUXg1YmFtcmlKOHBM?=
 =?utf-8?B?aXd5OUlvalVYUVVyU3J5YXU4emlnYmtHS09aWTJZaC9UaXN6cmF5WmFWNEha?=
 =?utf-8?B?aENteGt6aGZZWEh0QUxDQzEyN1NJbnl3azNIREYwMmgxY2N1anYyQ3VYYjVY?=
 =?utf-8?B?T2JMTzlENXRHZ2xleHdPQVV1WWE1ZGFLUWpvNTVraXFWQnpzZWhJam9mb0da?=
 =?utf-8?B?Sk5XRXVZSnJjOG13QTRpc2JjL2lweGpDVUZDRHVMUS9wWlFUUW9OQmZtU2Fv?=
 =?utf-8?B?Z3hRUFMwWTdWS1VIMjV0aHpOeWJ3ZXQrc1p6QlZYdzVQRHpndUp6MW1EZHpk?=
 =?utf-8?B?aVFBQjhJL3BxVHhSd2NUU1A3TjJEc3F3VWV5TGhkbUd6ZStPZ0NPVVNvVVFH?=
 =?utf-8?B?dy9HeDlWdFdMUkIwSStobVFKVSt2U0hZUG5mUzRTbWlpZmVMQlVKOFJ4eS9E?=
 =?utf-8?B?Y25TcnJuZzVhazNVaHE0UTBmRzIzb1MyeVFZNEVtTmZTaTgrMHArMXF5N3VP?=
 =?utf-8?Q?TfsJyOWnFz1woLCKIkeW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JPUlpKQW1pL2NtK3VPQnpUWmRSem5QUWhTS2hHdzZwQ0l3RXNUbktlWjB3?=
 =?utf-8?B?aGZRNGprclJ0Q3JlOE1qbjBCVzk5SHRZbWpNOWErUHRwazljWHR0Mm8rNTdp?=
 =?utf-8?B?NnNyeGdEdEVVU29YYjkvcCtGbjJJNXdNdWllTHh0cWxLNkF2bHg2M25obnBX?=
 =?utf-8?B?amZRNWNOUmRwL0VJQXgvenZ1WTg2WVRRWncyS3pvRDFuMVlwUW5DOTVwcHJJ?=
 =?utf-8?B?d1NYTThJWFY4bXR6MG9lcnVkRWNwSy9mVUU1QmFUWnh2Z2g3WCtUUC92cFdP?=
 =?utf-8?B?VDNmck5XZ1QySndYMTBLOVVmMG1sQjdPVlg2R05vbVJuY1ZEYjhpUVNWY2ds?=
 =?utf-8?B?WGt0Nm0wUE1SbWFlNHk2S0tnV2ZmUnlKWnN2ekRKNkVDdEc4K1N0dkw5dEhw?=
 =?utf-8?B?MVhrN2s0ZkM5VU9XempCK0VyRXZGR0lzRW1BK1ZPcm1UZHVBUDRwRGFqOUVK?=
 =?utf-8?B?K3ZTdjZLeGJNcm9NQzAyeWRxMmJCcEt6ank5S1F4clo0L3FvUkVyRE51NVU3?=
 =?utf-8?B?YXZJTXRvWFAvc3hpYk42cW0rejRXVGdmYkF6T3ZPcGc2TnNaR2JtR1YwWnBu?=
 =?utf-8?B?N3p3VC9RVXpJT2tvMXVmOCs3bll2UVcyNmhPRlc5V1YwejZQN1hUa0pjSFU5?=
 =?utf-8?B?elQwV09hclFid3pLbWFlaFljdE1icXI1YVdaNEdTc0tOcFNkclNuOTlGZFc0?=
 =?utf-8?B?NWRORng1NmoxelpDTkNPZjRCUEl1RDNBWFNMZjcxS3pvRnFSTlI5YU5OR3BZ?=
 =?utf-8?B?UXZFaTRGbnZNenRhbURobVhaakVSZ2RnSm13VzNZVUI5eGRkS2ZaR1RTOFNk?=
 =?utf-8?B?eG1IZ05IZ0t2QmpkL1pJcklSem93TFl2MklLeVdIb2Nwd1dML2tJemptWjVy?=
 =?utf-8?B?RkhZTFl1M0tmVVNQMUNKaFdNQkVtbEk3ZFlqanNIUmE0WDlvWDh4MmpLWHdH?=
 =?utf-8?B?U2NqSUtZVjNoQ1dqVEQ3VDIrdHlKNGpXTC90UGZGZlYyVGJoZkJFM1VZaUE1?=
 =?utf-8?B?bGVwd1g4Q0dvTW0vdSsxSUVKSDlnOVlFMkJYbEtud0NnODNYVVlFTWZINmtr?=
 =?utf-8?B?OUVycnFWVW1uMTdXWHJRZ0lwcjlYTGJmZTlkeStheXN2WFo3c2gvQVA3UUda?=
 =?utf-8?B?QWphYjFTanRxc3ZGQXp5L2pERkw0c0Y0RWY3ejM1Nyt6L2NiWGpSd0FtSU5a?=
 =?utf-8?B?V2M5Q0NDeWgyY3REaEUzWlFqQ25waGxVc0N4RTVYeWZXOGltYlNjcDB2TytQ?=
 =?utf-8?B?bzY4a21YSUQ3OXl0MkJOZDJFeWRuUVVaUmwwSE5GT3VjU2JKdHcvSVNSOEFa?=
 =?utf-8?B?TEt5MUVlbHRhelFEYUtxYzJtRTROWkVwK0ZBd1FLL2dER2ZLTUhtVGFSUkZV?=
 =?utf-8?B?MmlQZEFPanFEMER0SUQ4eVpXbWdCb3dqTXpFZjE2dzZEaEpnVXR5SDhSeXhi?=
 =?utf-8?B?NE5sLytUOVV5Q0JIamhhZ3hyOWQ1VUVYaVFxeTNjTnJ5ZUY0QTJ3ZVp1MVJJ?=
 =?utf-8?B?ZEk1L0NCNDAyOHkrQkJMK0ZBcUdaTEVTaE5aaUJXY3ZEOGorUnYrZWl1cjgr?=
 =?utf-8?B?azVaeGZmcDduTFRtZXUrdW5kNWpTcFJ3cTE5R0s2bVR1NVlLNVlKckw3NGNV?=
 =?utf-8?B?VDBUY09PcXlOaU1kZVowazhsa20rL0I2TUJiVG5pcHhRNDE4RmdUM1FQMG1k?=
 =?utf-8?B?ckI4alhHc1k1QnBQYllabVliRFVnbERGZlpWVzZsNjl0dWQyNHZCbFl4NGx0?=
 =?utf-8?B?UDkwL3o0dXdEQXNwVFZBVWVZNUZBYVFoZVBlUHBYbThSSFh6NVFuczhVMlF1?=
 =?utf-8?B?WDZjM2pNWGdQQUM0S2ZpU1NwcGxZRjRtVFJpcmtFRmUyekh3a3loVGR3VW5s?=
 =?utf-8?B?Q2FxUUxMME5FQnpsblBudkwyYjlEQ1p4ZmhmbG5CbHNDNWMrWjZMdk01M08r?=
 =?utf-8?B?V3lnNlhRaEdrRkV1OUdYNm5EYTB4eFFZQnliQjBuN2c0RG5UZS9OczRBaGMw?=
 =?utf-8?B?NzIxeFZlWE5FTjdqUXJLeTgzeXU0Q0QyOXpsQXc0YTNraGE4T1lHWXBOODND?=
 =?utf-8?B?R0ZTWnVkeFp1Yms1M2ZZdVc1L3RCWmJqb1Q0M294dzJ4aEhvRGN5NWhHeHhF?=
 =?utf-8?B?WGNGUEhaaEN1dndwQ0NQWFZVeWVBK0xYTnBMMTJ1Nk1NZmRvR3FwaVEzbzN2?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0730bfa-0c2e-49e9-44c9-08dd053dc0c5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 06:21:34.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLPft5Bkln+f174Uhm/pRAoBTZOq2aKb5iem8iNCo8GtxwIaArgIxuT1mxpcUc3IV1e7xRON6FBD+iEnfaPvKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
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

We are doing similar thing in following patch

https://patchwork.freedesktop.org/patch/624329/?series=140349&rev=3

Lets have a lib func() for joiner mode.

Cc: santhosh.reddy.guddati@intel.com

On 14-11-2024 11:46 pm, Jeevan B wrote:
> High-resolution displays that support big joiner can cause extended mode
> tests to fail. This commit introduces a check to skip these tests if a
> big joiner display is connected, ensuring the test suite runs smoothly
> without unnecessary failures.
>
> v2: Add ultra joiner check.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f1d8ab03d..eefe4e85e 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -318,6 +318,14 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> +			drmModeConnector *connector = output->config.connector;
> +			drmModeModeInfo mode;
> +			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
> +
> +			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
> +				      "Big Joiner Connector Found Unsupported Config\n");
> +			igt_require_f(!ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
> +				      "Ultra Joiner Connector Found Unsupported Config\n");
>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;

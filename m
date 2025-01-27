Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B50C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 11:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC1010E3AA;
	Mon, 27 Jan 2025 11:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVbUtVhV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280ED10E3AA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737978722; x=1769514722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rtK1rMAX/T9CSKFozzAMedtdS5JyiDJ9bLb0kVWGBiM=;
 b=UVbUtVhVWw7n+N3G0Aqu/Eo5cMMSdXZF8P9eTTbENHIoVicAWKjjPsLd
 FxtkazXmvkW4xSaNt8eFydEpNlXRCZeL4yPWfb7F6lQLm2hxLliEkQsZF
 lWRN3EQ4K58qdVhmYX3l5uROg+6xmZKFZoSGVJjd9LbhGbVIG1hAIoPQM
 2c5f1HMaE11DbJbdtDX1VJMK27HYxy7T5UIW/E5QC5ZB9ARAhNFq/qbYc
 JYSbB2vuhKq8EtdoMkoYNBZ4M8Pu+G1ME2nZX9u430wBOsLns0i54RgUQ
 dusgPxAC2/bVOKYz1GReHMvt0C5lq/II/dOzVVA0VNey7qQJtZ+AOD9pO w==;
X-CSE-ConnectionGUID: BGlS5nAWShenSKFYVBugZg==
X-CSE-MsgGUID: sJ5gPFVMRoOpyCh6BpG/UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38574376"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38574376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:51:54 -0800
X-CSE-ConnectionGUID: xV4BFPO0S7GGFrSzxO+CRQ==
X-CSE-MsgGUID: SaypBBVnQnappr3t4Ae6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113029462"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 03:51:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 03:51:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 03:51:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 03:51:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9ozCMmpCNMkLZGi7WKYZ/B53YIg+1vDjce1NRreJqFrfJb0EuSUKnVqeXTWREtwq8QQzbRlLDu7iLeIsYQS6bFKEvbD78+OfCU5ZSdiU9BMjoQGFqIWFV0C7jvaprqns3l5aADIvfWScgpMeIikQWnnApwlXHQecXy+bG/wfn2Bi6p2Hb8uE8plK03SVpSGSWitSWJ4Mt24LsqROq/zbJB6d4uOC+dqwd4O2RXXQ3/HW9HjOplecWdM2coIctH+V9o3kTdc4iFuoOU9zTJlu3j21JgpCaNZPOi3ll8UonJhNKvoF+zZtfmArH4XKJD64U9zjGvhrMylUO8Sa0ZEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fyu8jDwPvit8h1RUXTfGynoTmL0VrC6mEBmOL1Y4vMY=;
 b=RUOksZWYlHiFbIYYXz+CIh9ZzCsmUQWtKftOZAsjljJ1Q/XV0lunDeq5ltNfNxcSxveanD801DdryGUHVaPB5gRpsiIC38tMnM1HszR8cTyC+lWM5oXDHt1NR+goCf5sHfFr2qBEEVxchGnkuF0JcwQRzDzSm7JZO7eamn3JwhLj64IY0Yvh+Ll0msPd/wVox8GAh0pcBVWl0q339mLrTkd+WK3y46INIIOHlCKBfRDnvARn36LoHuPg/B7UbOUamBi2U2zvrUebHksuw7D3x+PoKMd4sIjOAYGCE2Q8mq21ayT9qWobw2cCLnjBpSM7kRrGDfpAasfHmLUuDe11JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB8343.namprd11.prod.outlook.com (2603:10b6:610:180::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 11:51:37 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8377.009; Mon, 27 Jan 2025
 11:51:37 +0000
Message-ID: <815ee19b-a944-4731-b5d8-6364595df04a@intel.com>
Date: Mon, 27 Jan 2025 17:21:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/1] tests/intel/kms_dirty_fbc: Add kms_dirty_fbc
 test for DIRTYFB ioctl with fbc
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <vinod.govindapillai@intel.com>, <jeevan.b@intel.com>,
 <kunal1.joshi@intel.com>, <ramanaidu.naladala@intel.com>
References: <20250124120335.379855-1-santhosh.reddy.guddati@intel.com>
 <20250124120335.379855-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250124120335.379855-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e9313d-7033-4aef-dd64-08dd3ec8f44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjZ2cDJnK3N1Y2N1Y3FOYk5wdTE3djNRODlXaHlvdFVHQ2tLOW9KS2FGZ29l?=
 =?utf-8?B?UVVzaEFYWjhGRGprWGJTYkdWQllHRkhtdUo1TlZIYjhIUTU5ZFlNZytoOGow?=
 =?utf-8?B?Z1pYbUVjYit0U0VQWHNyVmIvWE5NNUlQaS9MM2x6TFhEdklLVW8xTzBtN1Mw?=
 =?utf-8?B?U3lwR2lkaEx1eTkyNUM1TS9HQm9rWS9JNXhVM2x5clMwY1MvWGtNb0p5RjZp?=
 =?utf-8?B?SWxkRlNpc1pqaVMrbjdyaHRWbDBwSmhwczFPOHl2bEhhMFBqZ3ZnaEZwWWVa?=
 =?utf-8?B?Z2xIOW5YQjRQNUhXS3BhUVNQMDRVR2MzNUJQa29mYXZnNmpadVp1SXZLMWdE?=
 =?utf-8?B?YjRsVEp0TGxxVEt5eTZESnlGeGhyZ0RoYTNOeEcrTVV2VXcvQzRmSUJ3NU5Q?=
 =?utf-8?B?TTZVaEdoZGhkckoySmRGTkxPUEwrT2l0ZUc4ZjMxSE9YQ21VRGluMVJQQS9O?=
 =?utf-8?B?Tk05cmJYRFdYZXBGVTd0eGJNaWZwaFA3b1F4MnZZV0MxOEQ3L3k4aFh0WGk2?=
 =?utf-8?B?STJ1R3htQytjTTFoVk1FNktWRUtKS1AyaDBaNjN2N2VPLzNZN2JKTyt6ckJH?=
 =?utf-8?B?STA5c01oTEE1WisvczFxMi9reHkwOFJFZW5jdVZCanM4cTR6M1dIdkh4YmtD?=
 =?utf-8?B?K3hQV3BvRzAwMDNTQUVla1ZwcWdHeHV5Y2o4M3JEVVAyRXE3MDZGZzlWbnZT?=
 =?utf-8?B?dllhR09Mb2s4SkxOU3pHYlpXa2NFQitTNzVIS3RWRktJRkU5bmlEeUF2bVNN?=
 =?utf-8?B?bmRId3VpRS9BY2s5S0U0b0RQcHFNNy9veXRyRzY0UElkYzdKRnFOeHVsak51?=
 =?utf-8?B?TGVXdGFzT3BmeTVrSzZ6RkVEZkxSSndyaktpRU9iK003dThEcllERTdyVWVp?=
 =?utf-8?B?NzB0U2pxNjh0bjNUZ2JZekNjdlhOMlg4MTFPemN4OU83Nmh6akZCcjlzNVVM?=
 =?utf-8?B?MUlONkFxWlVlQ0ZYUHBCUXRHcVp5d0tNRC9ITk42SHpnL3ZMaXlFSGVoZmJ2?=
 =?utf-8?B?cUJJNC9UYlRMS25DWmNJcmVrWG5rdWJCbDA0RnlYYVVTSTF6VUFlNVpoMXF5?=
 =?utf-8?B?aVJsYitTQ1l2bXVqVGp1T08yRzV1YlJBcGp3Q1BrQTJLZnkzUmlSUkpFRFlz?=
 =?utf-8?B?dWVzNXRkTjc4aWdXa2U1dTZTcG5Ld3dVRmVHNXB2VTh0UFVnWkFzVURPamo3?=
 =?utf-8?B?b0gzM2RSQU1YaW8rT2UyQXZxZjljNTVpeTJNTXBEY3lRSnVRem1tRnpOVVAw?=
 =?utf-8?B?WVlxU054S3pWTU01L3BhL0pJR3hPMXdST1BuR01WajJLVUtNODY3ZndwRVdW?=
 =?utf-8?B?dkJPY3VzMkl0aW44QUhkZzh6NzRHL0R4WkpkSzRrb25ObzY3NmgwOGtESCtW?=
 =?utf-8?B?NkprbjBsUXpNOEhWbGdjSFZsNkV6NzhJalRWRlJwazVidlllZDB1V2hxQjFU?=
 =?utf-8?B?bG5oRWpnMWtIZDV6OG9mRW5MK2xXMWF2c1J3NEtDUExDMXZXNjgra1pRbUFw?=
 =?utf-8?B?Z1JLdTB1ODJhdTJncVp2eG1RY3N1L0hkK05ZOXQ4R000eVVtME9hUjlxUG44?=
 =?utf-8?B?QzlrT081NFYxMmZNK1FsUUJXS3dFWlp4ajRURDdKQUljMU9PL2p5TW44R1J5?=
 =?utf-8?B?dldybzdLYUVnVVNVRnZySC90OVNqVlNBU1pPaDhwMXN2MWszUkFicmRPWklU?=
 =?utf-8?B?ZG9xTmNQN2hETmxaRU8reTkxNFVmNzBPak1KSDlZSHpLbEJRS0JoNUFvLzFl?=
 =?utf-8?B?dWx1QlpEdThUVk11dmpuRnpBSXVkK0RnM0FyUm5TcVhkU2FTUmpGZnQvSXVm?=
 =?utf-8?B?bWdiSGFEODZ5Sml5ZW53Wm5XZGlDSkEwWm85R0RFanRmczh6djN1Um1lMkp3?=
 =?utf-8?Q?Bl2lwpcrJoTEX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3Q0RDQ1K3N6elBacHpPME1mMGNtaUkxZkhJWE56Q0x6em0xeU8zMkRCTmlX?=
 =?utf-8?B?eWIrcVYwYnkwN2Z6dVp3TkdZNncxWFpMNXJQaERQeXpCMnppaTcxL3l5YzFv?=
 =?utf-8?B?M0xkSlFQWUNLRmZBT1lzL3FVaTRkd21NK0t2dDdkeVhCUk9ML1Y2aU1KL05k?=
 =?utf-8?B?VjQvemRlektWTFR0K211QUUzUE9mZEppRWpMejVKTXNjR1I1Q2J0SC9TZGlk?=
 =?utf-8?B?b3lrWnJ5NzVHd0FaTlB4NUFOWjU5TVNGdXpTVWhoQ3RZM3MweDROL1F1TmpH?=
 =?utf-8?B?bWNBVGtBQmhJNTRqV0VZdGxGeVdlY3BjQjRXS3VPSXloUWNvSndKWWpDcE83?=
 =?utf-8?B?TUY2blhaTHI5TDZtR1duY3BPUW1BS21PdTIzOENCUmRsN3BmLy9xTlFVc2hY?=
 =?utf-8?B?b2lCZ0ZwczNKcmxvZy9VcjNBOStVVFZwZUJLcC92bnZXd09tenBvcmk4UFda?=
 =?utf-8?B?Vnd4eERYVlVLTVdTWjU1dVVwcFA4WTQ5QUljaS9KSmxVK0VKZ1dVekh1Q2Q5?=
 =?utf-8?B?bnpYbkw4Vk9GNWcrS0VkZnlnL3RyYkYxcGVoTlJFcmt5N2lCbTZvL0lsZEVz?=
 =?utf-8?B?N3JyQzY0OVZuaFMwUkRiQnNvLzZTRVIvZXIrRkNFUkdLa2RjOTgwV3VwTWNK?=
 =?utf-8?B?Tjh3bUpiUWtJTnNhZlNjWGxqWDg2YnJadWpnT0huNFF3ZTJHdnpBNE1uZnNu?=
 =?utf-8?B?V1Njd1VQOW54TjlsVmZnKytERmRlYmtMTDczeGZFMUtSVHJ4d0h4Z1F0OWow?=
 =?utf-8?B?Vmo1dkFwRGZNKzhVeURWMXUrQTd6a0tpaC9GMlgyVi9lZ05STTY0VUN5WEpJ?=
 =?utf-8?B?ZHJZSTh2Sm90c0VtTUJmQWY2TkZLWWp1em9BZ3pqM0ppTW9EWFo4V04yekZo?=
 =?utf-8?B?b2NXMVovK1lnMG52V0hxK2U4b0MwQkZobklDVlBpSGtUYzdUSERYbHh6YUVt?=
 =?utf-8?B?dGFlOVc2SU1weDNnT2JXMERtVzZ1Z0l6bGFqNiszQ1pLck92aEJMWkljdDhy?=
 =?utf-8?B?ZWZFN01SVUtBLzdyK1ZhRnp6cTh0ZGw3N1JPamc5WXRkZHNYeU45eW95dE9Q?=
 =?utf-8?B?c0VJSTBBWWcyeGNJdnBmd1R1dk8va0VpVHNqNTZ5dkE1ZFZrbmp1UVd5blVa?=
 =?utf-8?B?VXhtSzBZWHRrR1BCVTRwN2l5TVBuU1dRZVVNTzB0eVpRbUpWaVI1Y1RxYVRo?=
 =?utf-8?B?OVBMKzJrQ1BaVXBTMUg0d0ZQU0tsL2p6SU1neVo0THdIaFNFZ1EvNDNhdHBE?=
 =?utf-8?B?S2E5YXM5TjlhYm1pY1V4Q1NlcVR6eVlNdlF2OFdORkloeHFHRFVjRk9JNGs1?=
 =?utf-8?B?RTU2aHI0WFFPZ1U0Uk0vRzZQVDlaZzZGSGt5c203WXA2eU9lYm5LS3NHMDVL?=
 =?utf-8?B?VnVhS3lyOGZ2QjRNZjJqYU0zOFBsTFNCOW5ic1BoaVZCL2RnV0tydmlPMHNy?=
 =?utf-8?B?R2c5WktJaFNCNWt1QWFsb1dIazJBaVk3UFk3WXcxQkQ1WWJyNnFEQzVHa0NW?=
 =?utf-8?B?ZlZjVGJ6VzVheEFXbmI5ZlprbWM4ZzZicmI0UTFueHl0cXBQUW1tdTFqSGw1?=
 =?utf-8?B?cHcwemp4S05udkVQUVlWYlJiZm4zVDcrc0hRRTh6alFzWG1PaHc3aUpmVWov?=
 =?utf-8?B?cFpwdnBkQVo4VHNZQUVhcXFwSGl4VFdHUW5iUU1qS05HampmUUZSL1huQkpj?=
 =?utf-8?B?WDJBSnFMSE5Eczh4Q1NyTnZKU3k0eTU0QVR0eXJZeWF4SUtWWVBpdS9ST3NZ?=
 =?utf-8?B?WmFPK0VxTzN4ZzVheDZUdHkyaFlZZnl4UHlSVm54WUtHb3dlVHRRVzYzczU3?=
 =?utf-8?B?czRwbnpKUEVQSzdpNVRXWkwwRDVWNWt0aWtEZ2RUdnJOT2VVKzVGTjVtY3hx?=
 =?utf-8?B?eU94TlNSQmlBZS9TY3ZkS1ErWUQ5Snk1NmRnRGppb3JXcjA1Z0hmTW9GVzEv?=
 =?utf-8?B?Vnp0UVQwNktzbGhRZXJYcDhjU2EvV1pBaWNTL2pOYitSTzFPajhNK2NXMG5w?=
 =?utf-8?B?dlVNMFdVbUlRVGJ2TEFwSEdKeGdBU3VBZDBKNWVVejMrQVhNR252dkdKTTR1?=
 =?utf-8?B?TDh6ZVhxbVNyait4b21aNmJSeURKdENFdm9FdW5RK3FjOEE4L2MyT01wVUdr?=
 =?utf-8?B?RzNNZGlkZk5WTUo5T0c1SnJ0VEU2c3AxRlp2K3JNZ09DQTJxUGl0MEVML1k3?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e9313d-7033-4aef-dd64-08dd3ec8f44e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 11:51:37.2627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuzO29/fQPunrJDoikFY8Nl0mmwxdXmYP19pcM8KYfPD93XurLg7t4kTt9ZNFTbaNqL2KD9kWs1idCIIqVuSTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8343
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

Hi Santosh,

Please add commit message. PFB review comments.

On 24-01-2025 05:33 pm, Santhosh Reddy Guddati wrote:
> v2: Fix typo , add version check for feature support,
>      extend support for all pipes (Rama Naidu).
>
> v3: Add new subtest to scatter dirty rectangles at differnt places in a
>      frame and commit all rectangles at once (Rama Naidu).
>      Add a negative case with invalid coordinates (Vinod)
>
> v4: Add subtest `fbc-dirty-rectangle-basic` to perform sanity checks
>      by sending multiple damaged areas with non-PSR modes.(Vinod)
>      Update `meson.build` to include the new test.
>
> v5: Include checks to ensure FBC is enabled during tests.(Vinod)
>      Add dynamic subtests for fbc-dirty-rectangle-different-formats
>      and fbc-dirty-rectangle-dirtyfb-ioctl. (Vinod)
>
> v6: Update meson.build to include kms_fbc_dirty_rect.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_fbc_dirty_rect.c | 348 +++++++++++++++++++++++++++++++
>   tests/meson.build                |   1 +
>   2 files changed, 349 insertions(+)
>   create mode 100644 tests/intel/kms_fbc_dirty_rect.c
>
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
> new file mode 100644
> index 000000000..b05367011
> --- /dev/null
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -0,0 +1,348 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms dirty fbc
> + * Category: Display
> + * Description: Test DIRTYFB ioctl functionality with FBC enabled.
> + * Driver requirement: i915, xe
Since this test is applicable for display ver >= 30; remove i915
> + * Functionality: dirtyfb, fbc
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "i915/intel_fbc.h"
> +
> +enum operations {
> +	FRONTBUFFER,
> +};
> +
> +/**
> + * SUBTEST: fbc-dirty-rectangle-basic
> + * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
> + * Functionality: fbc
Since fbc is already added above, remove from here. Same implies to 
other subtests.
> + *
> + * SUBTEST: fbc-dirty-rectangle-different-formats
> + * Description: Sanity test to verify FBC DR by sending multiple
> + *              damaged areas with different formats.
> + * Functionality: fbc
> + *
> + * SUBTEST: fbc-dirty-rectangle-dirtyfb-ioctl
> + * Description: Sanity test to verify FBC DR by sending
> + *              multiple damaged areas with dirtyfb ioctl with fbc enabled.
> + * Functionality: fbc
> + */
> +
> +#define SQUARE_SIZE 100
> +#define SQUARE_OFFSET 100
> +#define SQUARE_OFFSET_2 600
> +
> +typedef struct {
> +	int drm_fd;
> +	int debugfs_fd;
> +	igt_display_t display;
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +	igt_pipe_crc_t *pipe_crc;
> +	enum pipe pipe;
> +	enum operations op;
> +	u32 format;
> +
> +	igt_crc_t ref_crc;
> +
> +	enum {
> +		FEATURE_NONE  = 0,
> +		FEATURE_PSR   = 1,
> +		FEATURE_FBC   = 2,
> +		FEATURE_DRRS  = 4,
> +		FEATURE_COUNT = 8,
> +		FEATURE_DEFAULT = 8,
> +	} feature;
> +} data_t;
> +
> +
> +static void set_damage_clip(struct drm_mode_rect *damage, int x1, int y1, int x2, int y2)
> +{
> +	damage->x1 = x1;
> +	damage->y1 = y1;
> +	damage->x2 = x2;
> +	damage->y2 = y2;
> +}
> +
> +static void dirty_rect_create_fb(data_t *data, struct igt_fb *fb, int nrects,
> +				 struct drm_mode_rect *rect)
> +{
> +	cairo_t *cr;
> +
> +	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, fb);
> +
> +	if (!nrects || !rect)
> +		return;
> +
> +	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> +
> +	for (int i = 0; i < nrects; i++) {
> +		igt_paint_color_alpha(cr, rect[i].x1, rect[i].y1,
> +				      rect[i].x2 - rect[i].x1,
> +				      rect[i].y2 - rect[i].y1,
> +				      1.0, 1.0, 1.0, 1.0);
> +	}
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void fbc_dirty_rectangle_complete_set(data_t *data)
> +{
> +	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	struct igt_fb main_fb;
> +	struct igt_fb rect_1_fb;
> +	struct igt_fb rect_2_fb;
> +	struct igt_fb rect_combined_fb;
> +	struct drm_mode_rect rect1;
> +	struct drm_mode_rect rect2;
> +	struct drm_mode_rect rect_combined[2];
> +	struct drm_mode_rect full_rect;
> +	igt_crc_t main_fb_crc, rect_1_fb_crc, rect_2_fb_crc, rect_combined_fb_crc, crc;
> +	int ret;
> +
> +	mode = igt_output_get_mode(output);
> +	igt_output_set_pipe(output, data->pipe);
> +	if (!pipe_crc) {
> +		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_assert(pipe_crc);
> +	}
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	set_damage_clip(&full_rect, 0, 0, mode->hdisplay-1, mode->vdisplay-1);
> +	set_damage_clip(&rect1, SQUARE_OFFSET, SQUARE_OFFSET,
> +			SQUARE_OFFSET + SQUARE_SIZE, SQUARE_OFFSET + SQUARE_SIZE);
> +	set_damage_clip(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2,
> +			SQUARE_OFFSET_2 + SQUARE_SIZE, SQUARE_OFFSET_2 + SQUARE_SIZE);
> +	set_damage_clip(&rect_combined[0], rect1.x1, rect1.y1, rect1.x2, rect1.y2);
> +	set_damage_clip(&rect_combined[1], rect2.x1, rect2.y1, rect2.x2, rect2.y2);
> +
> +	dirty_rect_create_fb(data, &main_fb, 0, NULL);
> +	dirty_rect_create_fb(data, &rect_1_fb, 1, &rect1);
> +	dirty_rect_create_fb(data, &rect_2_fb, 1, &rect2);
> +	dirty_rect_create_fb(data, &rect_combined_fb, 2, rect_combined);
> +
> +	/* main_fb blank blue screen - get and store crc*/
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &full_rect, sizeof(full_rect));
> +	dirty_rect_create_fb(data, &main_fb, 0, NULL);
> +	dirty_rect_create_fb(data, &rect_1_fb, 1, &rect1);
> +	dirty_rect_create_fb(data, &rect_2_fb, 1, &rect2);
> +	dirty_rect_create_fb(data, &rect_combined_fb, 2, rect_combined);
> +
> +	/* main_fb blank blue screen - get and store crc*/
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &full_rect, sizeof(full_rect));
> +	igt_plane_set_fb(primary, &main_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &main_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Whole blue screen with one white rect and collect crc */
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &full_rect, sizeof(full_rect));
> +	igt_plane_set_fb(primary, &rect_1_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &rect_1_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Second white rect and collect crc */
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &full_rect, sizeof(full_rect));
> +	igt_plane_set_fb(primary, &rect_2_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &rect_2_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Both rects and collect crc */
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &full_rect, sizeof(full_rect));
> +	igt_plane_set_fb(primary, &rect_combined_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &rect_combined_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Put full blank screen back */
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &full_rect, sizeof(full_rect));
> +	igt_plane_set_fb(primary, &main_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +	igt_assert_crc_equal(&crc, &main_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Set combined rect - draw two white rects using damage area*/
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &rect_combined, sizeof(rect_combined));
> +	igt_plane_set_fb(primary, &rect_combined_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Clear first rect using damage area. Only the second rect should be visible here! */
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &rect1, sizeof(rect1));
> +	igt_plane_set_fb(primary, &main_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	/* Clear the second rect as well. Now back to original blank screen */
> +	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +				    &rect2, sizeof(rect2));
> +	igt_plane_set_fb(primary, &main_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +	igt_assert_crc_equal(&crc, &main_fb_crc);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &main_fb);
> +	igt_remove_fb(data->drm_fd, &rect_1_fb);
> +	igt_remove_fb(data->drm_fd, &rect_2_fb);
> +	igt_remove_fb(data->drm_fd, &rect_combined_fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +					  IGT_LOG_WARN), "FBC is not enabled\n");
> +
> +	if (data->op == FRONTBUFFER) {
> +		drmModeClip clip;
> +		struct igt_fb fb;
> +
> +		clip.x1 = clip.y1 = SQUARE_OFFSET;
> +		clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
> +
> +		dirty_rect_create_fb(data, &fb, 1, (struct drm_mode_rect *)&clip);
> +		ret = drmModeDirtyFB(data->drm_fd, fb.fb_id, &clip, 1);
> +		igt_assert(ret == 0);
> +	}
> +}
> +
> +static void prepare_test(data_t *data, igt_output_t *output)
> +{
> +	bool is_fbc_supported = false;
> +
> +	is_fbc_supported = intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
> +
> +	igt_require_f(is_fbc_supported, "FBC not supported on this platform\n");
> +
> +	if (data->feature & FEATURE_FBC)
> +		intel_fbc_enable(data->drm_fd);
> +
> +}
> +
> +static void fbc_dirty_rectangle_basic(data_t *data)
> +{
> +	prepare_test(data, NULL);
> +	return fbc_dirty_rectangle_complete_set(data);
> +}
> +
> +igt_main
> +{
> +	data_t data = {0};
> +	int display_ver;
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
And since this is for display_ver >= 30; test should be supported only 
by XE driver.
> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
> +		kmstest_set_vt_graphics_mode();
> +		igt_require_pipe_crc(data.drm_fd);
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> +	}
> +
> +	igt_subtest_with_dynamic("fbc-dirty-rectangle-basic") {
> +		data.feature = FEATURE_FBC;
> +		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
> +		for_each_pipe(&data.display, data.pipe) {
> +			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> +				data.mode = igt_output_get_mode(data.output);
> +				igt_display_reset(&data.display);
> +				igt_output_set_pipe(data.output, data.pipe);
> +				igt_dynamic_f("%s-%s",
> +					       kmstest_pipe_name(data.pipe),
> +					       igt_output_name(data.output)) {
> +					fbc_dirty_rectangle_basic(&data);
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("fbc-dirty-rectangle-different-formats") {
> +		uint32_t formats[] = {DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_ARGB8888,
> +				      DRM_FORMAT_RGB565};
> +		int num_formats = ARRAY_SIZE(formats);
> +
> +		data.feature = FEATURE_FBC;
> +		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
> +
> +		for_each_pipe(&data.display, data.pipe) {
> +			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> +				data.mode = igt_output_get_mode(data.output);
> +				igt_display_reset(&data.display);
> +				igt_output_set_pipe(data.output, data.pipe);
> +
> +				for (int i = 0; i < num_formats; i++) {
> +					igt_dynamic_f("%s-%s-format-%s",
> +						       kmstest_pipe_name(data.pipe),
> +						       igt_output_name(data.output),
> +						       igt_format_str(formats[i])) {
> +						data.format = formats[i];
> +						fbc_dirty_rectangle_basic(&data);
> +					}
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("fbc-dirty-rectangle-dirtyfb-ioctl") {
> +		data.feature = FEATURE_FBC;
> +		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
Can we add this check in igt_fixture()? since its common across all 
subtests.
> +
> +		for_each_pipe(&data.display, data.pipe) {
> +			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> +				data.mode = igt_output_get_mode(data.output);
> +				igt_display_reset(&data.display);
> +				igt_output_set_pipe(data.output, data.pipe);
> +
> +				igt_dynamic_f("%s-%s-dirtyfb-ioctl",
> +					       kmstest_pipe_name(data.pipe),
> +					       igt_output_name(data.output)) {
> +					data.op = FRONTBUFFER;
> +					data.format = DRM_FORMAT_XRGB8888;
> +					fbc_dirty_rectangle_basic(&data);
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..2ac5ce309 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -268,6 +268,7 @@ intel_kms_progs = [
>   	'kms_psr2_su',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
> +        'kms_fbc_dirty_rect',
Fix indentation.
>   ]
>   
>   intel_xe_progs = [

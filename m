Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA15CA0FF2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 06:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162F10E11C;
	Thu, 28 Aug 2025 06:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emrdNwCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0DB10E11C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 06:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756361567; x=1787897567;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uPq4n9rzibCxZcsuyEyCU249kEVpnJT7/DYFEygli90=;
 b=emrdNwCDCdAmFyDZbJ/8y3mrkJATr2hH8oM9Bx6SYA8xdQKLQkcGVoRb
 0BN4ECGQhJ4oD+EQvBj5I55IgJCsmu6KhkKwPAmk3F5vBFUCeUYkU/46p
 VJIgdTSDV2WUiAChbv2CtZ++tO6s0Luea2p9wZ0LKsGeaYi6dbNtMCeFD
 jV7kORePmCKrWezABvRMovyfwnPDbS9uIH4Avq6NgOrgicpAG1y/qAcYg
 aLa6nJj2Tyn4Zq4VqgLTRQl8t8BDFaAvOpXJ7szJyC4aGByJvHVdX4agM
 YzlObwb4YKznupUNzjRB3OCx+ypDUE5K87zmKRkITdno6gh3ykB0O4vVs g==;
X-CSE-ConnectionGUID: 9RG4zru/Rbu49NSIXwcBsg==
X-CSE-MsgGUID: ZyxGiN7CS/2kLubWsURY/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58551678"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58551678"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:12:47 -0700
X-CSE-ConnectionGUID: gVV6T8zKRpi1nnYBzW/fTw==
X-CSE-MsgGUID: oLoAIDOgTyWOOXL1854ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175323543"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:12:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 23:12:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 23:12:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.84)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 23:12:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf4AvGvsLyMqKFIFlkM3mfgFpyU7WVFG+TcsE9zZ8xDtJck9rLFPlzbyq+86sT3fI7OBP5RDGLT7u2Y0uC2KHEKFb6IZ44nxj8FZrHol8oDyddYY8GcWdq0baW4gj1B30g3edOamcpxW81JaETFnLAA4HbVnAxph33Nv6Dpa7bCREe+4z3ktLut+6H7PQXDDj6JkOdLMQ73fiA1FTAPcWwSFMUcq2uqoPKEpQZsWUWW8ZY9pgZXLpfc6C6p86xGd3z7o2JGV3+tWzg9LGCTtj7BNoQaLPv1mLIdcNc63KgsQyZ5uxfVAKza1ic+wZuYrjQjbSnvha+hBwe9X3nDygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=940SBCJdfPsnL8TPr8l0qpiAhFMZ9JSSb+wZIpZ/XXw=;
 b=RmWL71DkXYol5VCy+hWbaNkaGcfUvKkSBJALqM0Rt2oWH86f1dKktKvrmSAyOUhminbVja+D/DW6Wdf2qoMVfjq9Ms7uXlHd+cTXrH+SRs8BGmUuiVQUazsBJI0o4DCQ3tsFXOZJIY8s9d3rgGl3uDNpuxDlLys0o1M3aBI9z2OlqRAyKQWoF+rPdMKff5wfG8rXj6DuMd6dTNnJmnUOWVTktAnWK2tiQsuNCaQIG5NAg6B3lGEwQ1oT+rLAzXd9gCZ7vw3f9NniMyZUxkeL4yW1bZjWJNuJIQ0lRKUxW/e/+DU1M8Eung6jQEsFP3+LzjZGY6j7oz+rKee+Xj0gNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9202.namprd11.prod.outlook.com (2603:10b6:208:56e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 06:12:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 06:12:37 +0000
Message-ID: <15878408-56d9-4f0d-aa82-6c4cf218fa16@intel.com>
Date: Thu, 28 Aug 2025 11:42:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_configfs: Add i2c adapter check in
 survivability mode
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>
References: <20250813100117.910824-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250813100117.910824-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: eb393023-28c4-44a2-1c9b-08dde5f9e2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3lGYktqamt0Nmdad0VUSDMvMG95SCtCSnhhM2QzNE8zTWEwSkpJVFRFWmdQ?=
 =?utf-8?B?ZXA4cC9iWGkzQnU4cXBOaU1TNVZmdldOMHlvd1F5c2VIVVQrdTRKcHNjb1g5?=
 =?utf-8?B?YU02SkRzK3J4NFBvK2NBakd5K1JBcVhsdGF3TTk3c3hkaHZHR010MDZ1WmpO?=
 =?utf-8?B?MlY2QkNEQWtCdWVLZlgzUnNZRlY0MEZEd3QrekJpcmF6OUpwaWM3b0g1UHNR?=
 =?utf-8?B?NUxuZUkybnJIeUNLemhxVEFHSG1iWUZzQlNuYjMzUW9jVlM1TCtnMEFVMUZk?=
 =?utf-8?B?WjF5TG5XWlJYM2NyNFlGOXdlYkpKbUpOd01HZEJnMGxXQ1RoakMvTVF1STdv?=
 =?utf-8?B?Mk5VWWhSekRBdmZRK0FGUEtCWm5GVi9UeGpnUzRpQmtHeVdEWDZndFBNQ1ZM?=
 =?utf-8?B?eXp5K2VpR1JBSW1uOE5DTXlyVUU3UVBpSkU3T1V0bUdlZmZoZFUzc1dldGI2?=
 =?utf-8?B?SUMwSGkyNU0yRWkzdWFGbUROTWJ2djVTVEhTKzdrRlcyUFRSdGtiTmlBb2dP?=
 =?utf-8?B?aklMZmlOMVdyWDJjS0U4ZEpFTk9nc0RRR1p0OUV0clFodlQxTWk0aWdBVElx?=
 =?utf-8?B?am5QdlV1TkFRL1Zja1FvcXp5QW9CeDNiS09KbTkxSlFXOXQwaC94Q1YyenRv?=
 =?utf-8?B?blYrMHB4cXRkbnFZTTYzRTkyelIvbFR6ME50Y1NhbDhrQ3J4aHpnbWVoelFN?=
 =?utf-8?B?TW5OY1lVWWxIYmd5MTVRaVAzM3ZRTUQrNXlMMDVocWozY2pQaFI0MmVTcXlJ?=
 =?utf-8?B?alVQYzM3N014V21Td3RJbWNSVWZ0RkFZd2NCeHE2Uml3Q3FLbzBaVUtuaHp1?=
 =?utf-8?B?clE4WmY2QldSM2xNTjRZenJWdW56cXN1UHVZeHFjRWx3UllLSmF0Q01nWG1B?=
 =?utf-8?B?NVVrdnVkMnlIMCtiRHR5TnVDcGpoMDd4RndtYTF5Y0VHUk9veWZ1M3RLSHZo?=
 =?utf-8?B?UHd0U3NpMitVNVlJN0k1elRKaDA4MWJFRDIwU0wvdkZ2MkxIdWZVbTRaTWZu?=
 =?utf-8?B?aXl3b3Bpd21mdUZpSmJ5eURvSG42bnUwWk9RWDBLQ2JnMWQ2VFIrMlNtRkRP?=
 =?utf-8?B?US82SHdtazhTbVJ1VEZjalcwL0ZrSm1GUVRtL3BJWmFUSnNRcFhMWm9sWk92?=
 =?utf-8?B?cWNXSjhOZkgxMzhGcEZkYmliYml4OXVMZGJoMjZQb2h0MkhHSk0rYUk4Z2RO?=
 =?utf-8?B?L0pHd1Y1V0dVQWxXWUZOWVI4RDBOZkZ3MlVwU29WR25RcmUwVUp4YlJCT3Zr?=
 =?utf-8?B?Z253K1UwU2EwLy9hRzcyY1R3VnR4MTh5WU8zaC9IQkNLandtQXY3MFArcFU5?=
 =?utf-8?B?eWtrLzI2Sy8vS0UvU3JVaXJjNVJQZ2hIWEYwWitNYjEyR0Z4ZExLY3ZZQm9B?=
 =?utf-8?B?OVVFWlBaeW9aSGplNXFJOTFEdkwydWlqczV5RWovY0lBVTFMODdBMis1SFAx?=
 =?utf-8?B?NEU1REQybTl6WSt6NDhaaGtDL0E1a3dTMmRqR1NJMmdJRk9pWVpLaS9UTWFo?=
 =?utf-8?B?ZFRTRkR4anFzM25Ed2QxbFhBVTF4MkRIa2dzTGxKKzltMHhIY2VSTDdJdlZU?=
 =?utf-8?B?bnowdDZMd2lXbWJkRHFaQW5HR3R3T29pSUZTVHl1cE01RXFGeCtFRUdnZDVV?=
 =?utf-8?B?VzIrOFp3ZnRFZjdqYzdzeGVNNVZqMThJd0ZOUytaWnF4anV1TFJuWlQwVERv?=
 =?utf-8?B?ZG5CYmo5eWRFZFA4NjNNeG5sNjFyUHJ2Q1R6Zzk3U1FzVWtlVmg0NzhYWGhP?=
 =?utf-8?B?aEZyNkVLdy9hYXl4c2hqVGVFUmJLNGx0Z245N29TUzk4bmhra1ZuK2ZLMjI0?=
 =?utf-8?B?RGhmOFdsWDlROSswNklEamF2bHRNLzJWVU9kTEhqdzBCdmJibSt4L2dEQkpi?=
 =?utf-8?B?WUpQVWhadlB2VE1qU2IwZ0Y3U3U3WEtUelJ4b1drY2cwMGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNxSmxsQnFPNmEvUThKbmVCcTlTWVJRaDBUcy95cjJVS25Gc1lmTDYwOERp?=
 =?utf-8?B?OUZhWHJVeUI5R3AweWZiemIzZkFmM0VseVVLbXVmUGpFMXhSTk1BOXB1S1Z1?=
 =?utf-8?B?bGlXL0RCYVZGUGw2dWEwbWhRbWhtcGxneEVyM0dBbDl1Tk1NZDkxbzdpUGV0?=
 =?utf-8?B?WXpoWjhidnVjek1FSUwwc0U2NmJoaGRRTldMZnNJRFR6OFlvdG85L056L2lP?=
 =?utf-8?B?dTFlZmgwd0FOWUYvVmQvVStFU3Y3K1FCWnhZSDNZZTNIaUI0dGpuYUo2K0s2?=
 =?utf-8?B?dlRGNEFFYU5SU25kdHBjR09Xam0vYVZ4TGR1U21mRDJSQlJGbDlHNW9QZWRi?=
 =?utf-8?B?YlA3aWlBZGJSdmxLSGJvaWhnZW54Y0tOMEgvQkNzSUZ6ajYvSGZIN1JNc3Rt?=
 =?utf-8?B?TkVHWENNZlNyRFRtMk83c1k4Vkk0b01TeHN1N0ZMSTRvb3o1eUFwcC9jL2cz?=
 =?utf-8?B?MWNQajJQRnhOdkNmTXVsTHRHenNEc0M2U2pLWkkzMUNpZjhvSHJaMHQvMElV?=
 =?utf-8?B?MlU5TUtNMmRxWEdBajBZTWtFYitNeHIyVWgwbFdWN0V1KzdQd2pQNjFIbGtY?=
 =?utf-8?B?T3NPWUpad0wvWVVXbHhsYjhrcXZkUHlkQnJZWmxON1NGcEw3NFVIbW5XL3NC?=
 =?utf-8?B?bDRQYThPc1hGZ1NlRTNCMUNpQXhmQkFGbkRuc3VycmJKVjZlRnpuZDFCbWV0?=
 =?utf-8?B?T0pIR1gyZ0RqNm1OZGhUdkpDRXNjMUVpWEtiMmFVeHM4UHdXYUFSUGorMk9s?=
 =?utf-8?B?aFJhZE1ncFU2RVVYUUY1ZFNHc3ZSaEN5ME1HMEpoenQzcnNPVGJ4WUxjcGRL?=
 =?utf-8?B?MCtUc1VCTTVXL20xZWplTlIvVm9hUXA4dXM5aG9rNCticXVrcno1UmJzZmNG?=
 =?utf-8?B?bkRvcTBVVEM5TStvMENxZklzU1Fsbmgwanp4RngxMjdYYXR4UGdlWDNtVWMw?=
 =?utf-8?B?UjFoVExHQllqeTd0aDNzKzN4UHlWMnMxeWtuU2lCRW1wM1hnZ0ZVUjR3SkIy?=
 =?utf-8?B?YnVhUmdXd1FPRzBsYkpUMGt6aEQzQnlWQk9PdHVYT2FhV2pkTC8vekYxT2xk?=
 =?utf-8?B?dEU5UFgyVFpWWTR1YU1sMFdHNDN4d3FLakFlOEJIenV1VGo4d0NWd294dVFz?=
 =?utf-8?B?OElYNFpjVTFON2xpYU5EUnVDNy8rdUdpd2t1cjc5RnEwN2IveTBjenhscER1?=
 =?utf-8?B?VjVRelFaWnpzYzdtTmYxYlRxYkJkTkJRM3ZmUUtoQ0ErMkxxc3lrTktIQm12?=
 =?utf-8?B?WjJlMUwrQk85OURveDJ6a2NyY21hUTl6NVg0OUVEdlFKL1U0bGdIT3ZkMG9h?=
 =?utf-8?B?YUFaK0JOSERCanpHWmlSY20wT2F6clFQRVkxNmVWT2tZaGlXOUo2VFRVQURh?=
 =?utf-8?B?RlNETUI0bGhSSlE3c1p1aEE3K0ZhMk9ORWpCRHJuTWxUSS9wNVg2YSttZFBX?=
 =?utf-8?B?TWp1cEFQK1RGYmNtanZ3cDhGV2xnOU1wOFI1V1psYXI5UWpsT2NJZUlramw5?=
 =?utf-8?B?cCthNnNxb0hKb041TUlSZ3NuOWl4Z0NhdTAwYXYyTThnTHZ6NUFySXVOcm9l?=
 =?utf-8?B?Qkw2Y3FJU25KRWliRkJjNVZYeTdVUjJPdk9UaUJPS3pPOGJpdkNvRmYxUkh1?=
 =?utf-8?B?a1FCY0puZE53V0RqZTlOL1hZVjkvbklUR3RIVHRHbUp0eExBclNKeTRSbTlB?=
 =?utf-8?B?WnRaVE8rQ0VKRTB4Z3lhMHVySW1Ld1NVY2RRVTRUNmlhRHgzSFI3THROenc1?=
 =?utf-8?B?U2lVbUZwNFByT2dhdG9DZVdQMzUxZEczVUVFS0hRam44S282ZWI1azJva1o2?=
 =?utf-8?B?MVg2MWJVVk1LWC9IakFzUzBKeC8rdklMamVHcWVPTEdoMHpZRFhtQkplbUZF?=
 =?utf-8?B?Q2FNMjFYSVk1S0NRQkZScGxmVVBsWDc0dG92clptckVuQlJoOElnTFFBNlpN?=
 =?utf-8?B?K1Jjck5ESHZvV0ltamwyNkp5bHRHbCtwNURYTjY0Q3F5N2dwR2JRNEdjSWJL?=
 =?utf-8?B?NjlUbFZoTW5yN3lNNkNRQk5XTWhJYkd1bExWdUVmc2M5VjBveWUxUEk2R3dU?=
 =?utf-8?B?ZElGUm9SbW5zTXNWRDNncFVRaVVKTmZaYnlRb1lGK3JvUWR6dWdici9mQjJP?=
 =?utf-8?Q?uAhKu8Gjd28iHyQHndxsXvShN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb393023-28c4-44a2-1c9b-08dde5f9e2d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 06:12:37.3367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtH9tGLEe3qTt9b2GGN6yr+vo1GYuH8cAGiGUVXSSBepNaLGAsNLRYeyQaiiZpC9xyOz6suoNvIdJYY67lyLGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9202
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

Hi Anirban

On 8/13/2025 3:31 PM, Sk Anirban wrote:
> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.

Add the csc-wedged here not the survivability_mode existing test case.
You could modify that to only set the configfs and move the 
functionality check here. But don't remove the entire test from configfs.

Thanks
Riana
> 
> v2: Create new file for test (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_configfs.c      |  36 +------
>   tests/intel/xe_survivability.c | 174 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   3 files changed, 177 insertions(+), 34 deletions(-)
>   create mode 100644 tests/intel/xe_survivability.c
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 5c65cd01d..e573421aa 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -2,7 +2,9 @@
>   /*
>    * Copyright © 2025 Intel Corporation
>    */
> +#include <dirent.h>
>   #include <limits.h>
> +#include <fcntl.h>
>   
>   #include "igt.h"
>   #include "igt_configfs.h"
> @@ -31,33 +33,6 @@ static void restore(int sig)
>   	igt_kmod_bind("xe", bus_addr);
>   }
>   
> -static void set_survivability_mode(int configfs_device_fd, bool value)
> -{
> -	igt_kmod_unbind("xe", bus_addr);
> -	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> -	igt_kmod_bind("xe", bus_addr);
> -}
> -
> -/**
> - * SUBTEST: survivability-mode
> - * Description: Validate survivability mode by setting configfs
> - */
> -static void test_survivability_mode(int configfs_device_fd)
> -{
> -	char path[PATH_MAX];
> -	int fd;
> -
> -	/* Enable survivability mode */
> -	set_survivability_mode(configfs_device_fd, true);
> -
> -	/* check presence of survivability mode sysfs */
> -	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> -
> -	fd = open(path, O_RDONLY);
> -	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> -	close(fd);
> -}
> -
>   /**
>    * SUBTEST: engines-allowed-invalid
>    * Description: Validate engines_allowed attribute for invalid values
> @@ -128,13 +103,6 @@ igt_main
>   		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
>   	}
>   
> -	igt_describe("Validate survivability mode");
> -	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> -		igt_install_exit_handler(restore);
> -		test_survivability_mode(configfs_device_fd);
> -	}
> -
>   	igt_describe("Validate engines_allowed with invalid options");
>   	igt_subtest("engines-allowed-invalid") {
>   		igt_install_exit_handler(restore);
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> new file mode 100644
> index 000000000..1bfcb2756
> --- /dev/null
> +++ b/tests/intel/xe_survivability.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <dirent.h>
> +#include <limits.h>
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Comprehensive survivability mode testing
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: survivability
> + * Functionality: survivability mode
> + * Description: validate survivability mode functionality including i2c and runtime behavior
> + * Test category: functionality test
> + */
> +
> +static char bus_addr[NAME_MAX];
> +
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +	int ret;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
> +static void restore(int sig)
> +{
> +	/* Restore after survivability mode */
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int configfs_device_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +/**
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + */
> +static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
> +{
> +	int i2c_adapter_before, i2c_adapter_after;
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Check i2c adapter before survivability mode */
> +	i2c_adapter_before = find_i2c_adapter(pci_xe);
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(configfs_device_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +
> +	/* Check i2c adapter after survivability mode */
> +	i2c_adapter_after = find_i2c_adapter(pci_xe);
> +	if (i2c_adapter_before >= 0) {
> +		igt_assert_f(i2c_adapter_after >= 0,
> +			     "i2c adapter disappeared in survivability mode (was %d)",
> +			     i2c_adapter_before);
> +	}
> +}
> +
> +/**
> + * SUBTEST: survivability-mode
> + * Description: Validate survivability mode by setting configfs
> + */
> +static void test_survivability_mode(int configfs_device_fd)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(configfs_device_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +}
> +
> +static int create_device_configfs_group(int configfs_fd, int fd)
> +{
> +	int configfs_device_fd;
> +	struct pci_device *pci_dev;
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(configfs_device_fd);
> +
> +	return configfs_device_fd;
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		pci_xe = igt_device_get_pci_device(fd);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +	}
> +
> +	igt_describe("Validate survivability mode");
> +	igt_subtest("survivability-mode") {
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_install_exit_handler(restore);
> +		test_survivability_mode(configfs_device_fd);
> +	}
> +
> +	igt_describe("Validate i2c adapter functionality in survivability mode");
> +	igt_subtest("i2c-functionality") {
> +		igt_install_exit_handler(restore);
> +		test_i2c_functionality(configfs_device_fd, pci_xe);
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(configfs_device_fd);
> +		close(configfs_fd);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..8f264d8e8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +	'xe_survivability',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFF3C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 09:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E362410E68F;
	Wed, 26 Mar 2025 09:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfjhE0d2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2710E692
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742981454; x=1774517454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7RSlFvWXBQ95Chxcr1umZ+/mHoE0acn301HqWyGlSfg=;
 b=nfjhE0d2GLL5Omq0wt2q2eSYdu9/sJIXmulkZznyNXbzj1kpWN3aUX3j
 OvPiNsmxJXJvjFTFCp6hCF0YwF4oaF/1OJRY+gEYJKyKKD0q72lF70Swh
 ItLv7F8O65mi4Lnk1qignuigwgtgIS2gUmKmZquJNhjhjt6R5lAoUp+eT
 hsmtsxpdkAGf7KZGg9vOQkMsjZNDo2pgEbRujUY9HzJMkTH1LfPtt91eo
 11dGqjLxXiVK1VOQdSKVjhb2hUSKRdSEUtlqyyAFidxmv5r7LTG1VijPe
 p2inYCW6OIOW9OTOJILAeQ5u8NsRAFtAyWBbO1VrkjZg0u0zUr3O9FJyZ w==;
X-CSE-ConnectionGUID: 4+ACGy8ESXqaDTUrCgBOyA==
X-CSE-MsgGUID: m7EfXXP2S/KwbYVdiWo2/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44380621"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44380621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:30:54 -0700
X-CSE-ConnectionGUID: E6GFRyGlQNe4hM7InBsQgw==
X-CSE-MsgGUID: B6hCy5YZS0yijSms9GXUhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="147886656"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:30:54 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 02:30:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 02:30:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 02:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXjoGPJQ+yIsES3G9erwFbYAlvaZQ39lUjYdDMFw5EHeL6SW+1EPzE+NkYEk4jotPWbP2xG6+IVRcg4vFEaGb0aBxnaaPj9TWFC2akVanH3F3hd+0AsnyQyCDRKQj64/i5rRRYeY2QFvtNfWY/ef3+In+XvWa1dZL0Z0ZaziTryjvE6Yng7r8YCqW2nvMVf2SzASOlxPpINaWMzGW1/xOnN2b2b5RHMOQK+gtTu7PEnvhtaN8y7BwZrG+67So7qIKU9GwGvgq04FwOh/CLqdfUUDARP9uPZSK9+lBjy2KEI2o4sFS1BzuO1d2PZy8cWiv1r3o1XzHmnv6NTnEwL8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9eAZKfpD4LmMAEJlREcgrqm5T3YusVA0+qIvdHqpIQ=;
 b=AOlW9hKVjONK5l7x563CzzTgQfOPI7g1HJqOkHbsEAvOikFc++KpTGlkIdmDxR5sfmTSdG65+7NceaXGXckZBeMP21WscjGeIRRALMXSwGt8Q0kBDUi662xgFFEulXkANQKxlKj7A2uLEaOYolk6KxF/kPplyB+OuDeRQCHwERzNwfQ6arxEwyNF/n+6KayRDE7avkieMrlXh4pc5ANW8gtw7kSDC8YwXkzpDI/EFwLB35eNV+ukT1R3FZ74rQg4eAYEk9h1eYrLErWlLHc5jr55B/7TwOvLNI7efLG8PZazNnIfFLCmb3wG3m/boqhMmzQL5Yl/Ocy5za3H2gZqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 09:30:50 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:30:50 +0000
Message-ID: <11948989-bead-4a14-8659-a86ccf0dd139@intel.com>
Date: Wed, 26 Mar 2025 15:00:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/dsc: use intel_display_caps instead of
 i915_display_capabilities
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Vinod Govindapillai <vinod.govindapillai@intel.com>
References: <20250325130842.1821042-1-jani.nikula@intel.com>
 <48a20710-a884-45f1-8485-ed1f17450741@intel.com> <878qos87nx.fsf@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <878qos87nx.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d58841f-8b93-4574-547d-08dd6c48e5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG9PU2hlSnhGK3FBbTFERG5rTlpSWGZtbG1FVmJCSElqUGJFTCtodlNxalRD?=
 =?utf-8?B?YTZtNk8rc1NLb0dYOEprM2M2VE16cVMvKzhEYXVJWnNodkRZOUJyemZUVlhi?=
 =?utf-8?B?WjB5emcybVBERDhHV1daTkR2NGxFK01nL2Ixa21keThNZnJTa1FXVk5JOGd4?=
 =?utf-8?B?MDFpeUx1WlZhaUFhbEZRNzVrY2ZVVzhKWXFwZG0wT1hLTUxHWWhKamtmT2lG?=
 =?utf-8?B?dzRLc2w1QzJNOXNIbmFnZ2xNdzY3MkdmeklVUlZQdll4SnZwZktsT0VITDc1?=
 =?utf-8?B?K0xmbTNuYXF2ak1iZGo2aHFFdmhXQTc0a3p0UnBORW9CQmdwaEhMbW5EZ0px?=
 =?utf-8?B?Wm1FZVJqWHl6Si94T0J6VmRBQktsQ1lTbWlhMmZWNEt4NDh1WlZoVEs5RHE5?=
 =?utf-8?B?cHRIUTk2YWE2b3A0d0VvUnd5bGZhaHVwZXYzVEV4ODNLaG5qYWpNakRyVlFL?=
 =?utf-8?B?MVpLbWdLaVIrdXFqcGo1bVF2K3BCaUR2K3JpdlBST2tBdkk3Sk5sRkk3MG0x?=
 =?utf-8?B?STRjYUk0eGVXOXZaY1I3N2o4QVFUU1BTOWJBQ0ViWnl2SGFqamZaVTcvWW1Q?=
 =?utf-8?B?czNGaXRCaFJBb1pxTTFkSERaR3dqSFByMHVWS2dPdTYzZitSdllGVmpjSmQy?=
 =?utf-8?B?ZVExQ0tuaVdHSTl2RjVZNmNWdStoZEtmV2tBMUIrdURTdDQxcGFwMEtUMzc3?=
 =?utf-8?B?MXJja09ScjFMVDVoTEVENXpYM1FER0E2QTlrZFFsVkQxd0l2ZVE0WEhlMFpV?=
 =?utf-8?B?QnNmVHRkYmZ3RGlLaEd1VnpYS2Y2Z3dZSGZmUGRJY242cDZKMitiMmFqYWlv?=
 =?utf-8?B?UGtJQ1pSMCt5TEJEb2ZUOHlQUHhycmNENWxuemJEWllOYjBFMzZTWmZuREZW?=
 =?utf-8?B?dHVtZWMwRHRTMlMvV0dVNnhRZ09hZk4vWjJlMVc1ZHVDOS9ndFFZQmMvRXpz?=
 =?utf-8?B?bGhCT244NXpBVHRydXIvTGJZdEFLTmpMcGJ6cmFEa2N6S3VaaUcya29sQi80?=
 =?utf-8?B?T3JTNDUzZzRkcTBlWk5leUhERFZIdFp2OEJMZzdYRlQyM2JPVWhWZWQrcHBT?=
 =?utf-8?B?ZmFXR2FLQjk1VkNVczZkUXlDTDJUQU1zSUNSd2RuM1h1OHpJdVN6UFdTNit0?=
 =?utf-8?B?d3lrMTBCUGNhcm9zRndmVWhDTlYxQnZOampHbzh6UWU3OGx6VmF6UHV1aFdm?=
 =?utf-8?B?Y2d4ZW9ZZ2I5bU5nLzJQWUNzc2RLTFJaU1JHZjJubGFrcWdSTWdNL0FZa3RJ?=
 =?utf-8?B?UXpreHFZeVZkS2lOdzFmMjI4YSs0NlNOOHZGdUNBQzh6cjR2Nm03b1ZkS0xj?=
 =?utf-8?B?SjU2UGtFSzlodnFnQTRQWGMwZVZUZ1V4eTlOdlAwTTczbkRHWXd6UERkNVN0?=
 =?utf-8?B?K0ZrRzdVZGU3VERUUVBoN3RUM2ZVSEpCaktmNlhmYlRUSUIxeDh1b2V0K3NC?=
 =?utf-8?B?WlAwTXhkaTFXekdRejVWWXBjUnJuT2ZYVmZrNEM4MXNSMmtjbStFRGIyd0lP?=
 =?utf-8?B?MUJHMjlRd1BGMDVkakdmNlpwWkRITk84K2ppWjZhbTdzUmFRcmxncnVDNFY2?=
 =?utf-8?B?bFdtanZ1alVtSmY3Ym9rQUFIMHRkekJIRURCczlzdzgyS3czQjY1UGxwYXhI?=
 =?utf-8?B?Z3k3eUQzU05GVitHUk4vdDUrTGJBY2g3QWxzdWNqNmU2ZHZOQVZmN1lxNkU3?=
 =?utf-8?B?RStCWnY4c2NtZFlaM3ZlNVRrQmNXRDAzZWxBV0ZSZHV0THRJSGM3RUx3eVFC?=
 =?utf-8?B?MlZQdGQxVnN4cUJ4ZGsxUDE0UEhqRkw3dVViZituS2ZReWRlTmJTN2E1N3JT?=
 =?utf-8?B?Zzl4VWRSVXBMQ092Yy9zT2d6amRxT1Y5eXRDVjk2WEVZSlQxTGZVMG1Xc0Ur?=
 =?utf-8?Q?BlnRrpM7zGOaF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVlFeHFPR284Lzg4eTBZQXJnbWpHQjR1SGNDd3JKY0M5Q0tPamxDVmpPZmJK?=
 =?utf-8?B?S3N1d1pubS9vV3hrNTRpWThwOGRqamNhUitrc0JuaURaQVJMTXdPMmRkQVlI?=
 =?utf-8?B?M0Rneldua3dMcTFVQTRxc00veENBQnltYUVaWXdmc3RZSy9ZOVVKVTU4d0lC?=
 =?utf-8?B?cXFXTDUrdlViakcrZi8rNVBNUmhOekVpVDhDYnhpK05XbDJFZmRMTkhiS2oy?=
 =?utf-8?B?bmZPY2FRUVVOd3J4OVpBT2pwT3NmS3VmWThYc3U3cmdwSTdPeWk1NVpOcHA2?=
 =?utf-8?B?eWpJMVFWeG5BYXVUMDVEYXQzeTJQSXdsb2Nac094ai92M2hhSVdXTmszTDZl?=
 =?utf-8?B?MnVReENlNUhlSDY5dFlSV2UydGcybWM5MjFPYUZrYVgwMU1pRkQva2MxczUv?=
 =?utf-8?B?NEZsZWtVb1BzQ1JOZThkNnI3VlBrQkxLWnpXSEd1VDhXanlPblBzc25TVmVX?=
 =?utf-8?B?UDZEZHE5QWxhc1VXZ1VtbkU4STFuZ1BmdFV0bER0b2UwVmJKT0VEK3kwZXow?=
 =?utf-8?B?T2YxSFQ0b2Mxalg4eU9XaWMyYVFybG1OQVhqZ1NvNmZhK2JNSEYwSGpIZEtR?=
 =?utf-8?B?NDBTbzJDdk5ENGlKRFBuRGtsTGkvalhGb1FVcCtTcEdLeFVsVGJ0MWo0VFR0?=
 =?utf-8?B?OW84Z3o2cXBSWTZCNldnSXFhUnk4S0tmcmk1cTJGTFBKQXB3RHZPQy9Ndnhr?=
 =?utf-8?B?dGd1cXdJUENLTzR1OFEvdUxWenBnREdnUHR3L25KME5CeXNMVmh3ZCtjMU4z?=
 =?utf-8?B?b2RVUXROd0xhdTVLYmI5VFh6c2FMMnRjRWYvbW55OVRYbHRob3dEUUlkanJm?=
 =?utf-8?B?LzFaNXh3RTUrdDViT2svMFVheFd6NmxicnhvSE01RXcxSnM1QkdROTBMMWh1?=
 =?utf-8?B?alFwZkhNbFpnNHh4eDNyb3V6MTBHeU80c3dtdGF5aklOeGN4dHZoaFJscG5P?=
 =?utf-8?B?L3habWtlaC95WW9aY0FDYUx4KzVQOTJ1amJBNGNVSTluV2lqS2FhSHpDV3JG?=
 =?utf-8?B?eXlQTkU1clp6WE80RkJSMVBadjJwdzZ2a0hkMnRIOE9tMmVRZ2RiVmFnWjFU?=
 =?utf-8?B?cVVLRzNNT1dHWmdYTEVPSU4vdGdaUUdoenpWUFNQd0xLY2hibjRKcDhNM3dV?=
 =?utf-8?B?NUJMRUV2NVZHN2dTNU5EOERSRjdYbkFTc0NSZkx6Q2N6ZjNGZHF1V0pxam1k?=
 =?utf-8?B?VGNpQ2V6WVFNL3VTbVdEckFTN0JXeUZWaUZyYXgxTm5Ddk03dmxXTEtDNVZO?=
 =?utf-8?B?SDE0QTVuVmZqRTBNcGNST2EyaHZtckhndWRGdjdBS0Iya2JuTWJlcFFqYk9D?=
 =?utf-8?B?d0FoeHlCN1MrMkJKeHZlMXQvZ1JlTkkvNUN2SWJaSVFGd0Y5dEFUTk1TckVs?=
 =?utf-8?B?OFpqM2VIcTZibm9rTEJZWm4xelhJdW4yRDBTdHBRbEptbmJyME1YZ3ZTWWhT?=
 =?utf-8?B?QmdMaGNjL09ZN2NkTm8zUXNBa1FJWVJXUGJocTJlR1BmTk53a1V5eDVUZU0z?=
 =?utf-8?B?Qk5RanlQVHQ3TVBDRk5tRVd6VU4rS2x6UytaL0Y3NjllN04rNjYyWFRqb3Aw?=
 =?utf-8?B?eitkVm9KMVMyK1NNb2loQ2tZc2x6NzRnSW9zVVNVZ0pVTjYrK242UzVEREFy?=
 =?utf-8?B?YWhMc0s3QWV4YUd6T3M1bkRoSGsxZ0REbFoxMXZTUVVSUHNGQkE1WmxQa3Fs?=
 =?utf-8?B?UU85L2R2cUJ4ZGdyME5IYmlBTFVTeG9kanpBaG9uYnJIZDhvdzQxc2Q0aWZ6?=
 =?utf-8?B?YUcvaUY0NnA1YS91KzYwaHdvVkxweW5pcWwxT3I0dHRNZXRBUGJ5RGpNRkNz?=
 =?utf-8?B?RUdTWGdEUUFLTzVyOTZNZk4zOWZTeFdHbzBXWmUwaDFKSk1XbDhWa05yRG9l?=
 =?utf-8?B?ZjlnclNjM1BNaElqV2ladFZHZW9POTJZajhtMWtwREw3ZTBMKzJvWXJnWVl0?=
 =?utf-8?B?Q0JBdEw1RXdmWWJDKytVTWZzK056WkU1UmkwSDB3SjU1QlVvcEpnYlFzLzJU?=
 =?utf-8?B?WXByOWo1bEYzaTlqbmpLTWlHdmIvOVVrSm8zYncxbmdaa1lhTUdCWlNuZUNJ?=
 =?utf-8?B?YkZUbEp2QSttR1NLQjVMc1hKVjJmS0lhbjhtenhoRFVIMm1BNzd1Kzk1STJ2?=
 =?utf-8?B?TTJZRUxoaUdFSmhueDdZRjVFUDZkU1Y3RWtXU3EwZkdoQng2cTVONVA1YVNP?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d58841f-8b93-4574-547d-08dd6c48e5cb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:30:50.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkS5psRiXqh84f9mIJ4FX2Nst5O+Mh4+3TyTn1lt9iq8R56be9443biUvu4/BhSY//lLkvm8wQ/pup+5tl1vIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

Hi Jani,

Thanks for the reply.

Patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 26-03-2025 02:56 pm, Jani Nikula wrote:
> On Wed, 26 Mar 2025, "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
>> Hi Jani,
>>
>> Have few queries:
>> 1. Are we going to remove i915_display_capabilities ?
> Yes, hence the patch at hand. Can't remove it before merging this.
>
> intel_display_caps already has more information than
> i915_display_capabilities, and I intend to add more.
>
>> 2. Since this new debugfs intel_display_caps, has prefix "intel" whereas
>> all other debugfs still has "i915"
>> Are we going to make this change to other display related debugfs too?
> Eventually, yes. The xe driver having debugfs files with i915 prefix is
> quite confusing.
>
> I think new debugfs files should be prefixed intel_ while any rename
> will need more careful consideration. It's quite the flag day change.
>
> This one's easier as i915_display_capabilities and intel_display_caps
> already coexist.
>
> BR,
> Jani.
>
>
>> On 25-03-2025 06:38 pm, Jani Nikula wrote:
>>> Turns out we've added two similar files in kernel. Consolidate on
>>> intel_display_caps as the more driver independent name.
>>>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>    lib/igt_dsc.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
>>> index 8d259b7344a6..4caad39db7a9 100644
>>> --- a/lib/igt_dsc.c
>>> +++ b/lib/igt_dsc.c
>>> @@ -56,7 +56,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
>>>    	dir = igt_debugfs_dir(drmfd);
>>>    	igt_assert(dir >= 0);
>>>    
>>> -	res = igt_debugfs_simple_read(dir, "i915_display_capabilities",
>>> +	res = igt_debugfs_simple_read(dir, "intel_display_caps",
>>>    				      buf, sizeof(buf));
>>>    	close(dir);
>>>    


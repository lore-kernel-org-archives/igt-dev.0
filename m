Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2979DD4920F
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 11:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D555F10E49D;
	Mon, 18 Nov 2024 11:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKWp2qhx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF88310E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 11:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731929749; x=1763465749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fZPWqcO63lMkTtqqUZ8FA+qiPe+Akx2GmsnveuhfCt8=;
 b=YKWp2qhxF7dQvwPgWB7coz8E9r3DluGNCzr+eLuxjHTzTTBBPSR0SeSt
 0aGHJoeP4pm0CtoCFIfoV7BwdeXuaUlx+QPoKVcDU0SpkufbqbFXYA9wV
 LEkwnacLgK9kvZvZA1CJYWdnCCt+hyOE4A76NqpVKImb8VzcEw1mJzw3t
 SrJfpeImKBhVEG1FownrNeIKiAPoHgD+Vk3G9GaOh6aaOViIarcOgLKEs
 W7C+kzjqLTbV2C5cJaNYBye+eGRlwvwObJfDTOEPN528KqtB6ss5JGKLW
 o793K5dIU71z3tvguTCdFIQ4BPvkf9h3MyOWpUHQB8U3mgF4oysWoL5Wb Q==;
X-CSE-ConnectionGUID: Xxn43KtjTdePCqBsSX55OA==
X-CSE-MsgGUID: oYC7W633SbOPHMhq+l8eVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31255669"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31255669"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:35:49 -0800
X-CSE-ConnectionGUID: ntuX5mSaQSGNXF68OrZICw==
X-CSE-MsgGUID: G/3t746EQkO96lqr+NHnHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89213966"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 03:35:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 03:35:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 03:35:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 03:35:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJ77LwfyVomq6mq3n+dy14A/dsCtpHqnGItmiHKbVmAn/+Ldeo016IFZMl51pQsd3DZY8n0RcL1InDOzPE75+coRcA0ZghUYaPIAREjGUSAMD+94lecT7tT2PMO7nyMYa0QjmRi+pTjuyddymyBRfALRDo1pXl+Ub+zGy8DbrOOlaVCHGIBInpo/Cg9stEtmZpFtRWYOzUN81JPgFuROjoqYk7bw1kph110kLdMkT4VmQUxZzBW/TJKtpPiuXNkQll/1HbbilgXfAsIVUL778kYquoxRpGNM9BT35SW1rCA0QlXx2ghNI5xCun7Tm9wyVe8qohOg71y/0lDmdBJCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/5l0B3eg966aMr0T8mYrnCfrMj7jUZWqjlvdDO8su0=;
 b=v/lt/st2Lm41bPMcUiIHZ69Y5OBbWRp3gkUk4xc1do61HkoHTC9dftsEQfwsYipkZs6vwoBCB5B46ARxMaURBbJUsKui1WMckLgSseBXKKuXgDqOYpKI9ExilDc22CgquUmvLiH1mCZDMsjjfckzAsqR1cSX1kkzdk7rjV7nZ2jSEiYoFRs8TJKpe42Poa9tIxrauq9RLS6/KMkGRMI63jhchYCKCP7SZIvZzRszz6l9kzJ5rY9C8odSOfEy7ESBdO4zGEiVEhmM2bmyj29QcxCrQHcVgDcX65mNn22crE773PKbaUYmVX3Uks0ACvI8u0LLXBlvjiTPzxOflW6Pug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Mon, 18 Nov
 2024 11:35:40 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 11:35:40 +0000
Date: Mon, 18 Nov 2024 12:35:31 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel-ci: Block all gem_exec_fair tests
Message-ID: <wsfwq2n5d4chuxvcrc3gypdrlgknmezkyaale3cjkfzxg5yh5e@cnrdvjv52cvl>
References: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
 <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fcabe9-2303-4983-d8ca-08dd07c52119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vlc2QVMyRXFYaC9URy82U01Sd1pBVHFBUXZISVVQanZBanJ2d2oyaFFxWFh4?=
 =?utf-8?B?dEJsWndnNlI2a0dFb0Q3SUxVM3hodnIvUkcrVzJhbk8wc1UvYXo5L01JQ2s4?=
 =?utf-8?B?eDNIZkh5UXlJdldkK0gxZldrQ1ZiQXdCNWVKSnJnWVdKR3JoVEJqckFhenA3?=
 =?utf-8?B?S0xqbE5oTjBQT3FkTnlaS3M4OUFlb2lBRE15UUFPMEV1R0t5S2pnYXJYMjhn?=
 =?utf-8?B?V2lqU0hzbjh4SXl3bFNQeVFGNWlBZWREQlA2M2psZU9IalVmUkVwV2ZxeGJy?=
 =?utf-8?B?eFN2N3ZUdEtUelVtN2RWRGlONEhlcTFrTHF0d3g0Y3phOC9weWM0anZ3Um9K?=
 =?utf-8?B?YnYzb1JpblB0eWE4WUNUcld4NTBOb3J2dmRndkVvaFNxcytKcXFnVmp2Z0Ex?=
 =?utf-8?B?TEFLWjBrTU1jZEVEWkVjUTJ6NDlXL0NQK3BOZ1M5TCtIeEVtOHc3UUlTdkxN?=
 =?utf-8?B?UXJQdVNhSkhISVQ2aE9aUGUxREh0N3Y4ZTE2eXUzTWx5RmNWSElNQVNUVjY4?=
 =?utf-8?B?b2FERU9HREdmMkVEekxwY0JwNTI0MlozMVlvU3pqUzB3WEt0RUxSL3JlU3NS?=
 =?utf-8?B?cDJncVRqc21HYmR0Q0NkYnp2ekZ2ZGJ2dURhSnJTZ0paZnhYd3BkWEZuMG52?=
 =?utf-8?B?dC8yNWF4ZU5tYWNkWkJKUStyZGw5dllkMWw2ejdIT0NNK2duc2FSUitNdk4x?=
 =?utf-8?B?TW8wRW1ZQVVVRVI1OTFFQ25iSFdMdHIxZEE3SXVlNEJSLy9VZ3VibUNJVWlq?=
 =?utf-8?B?QUdJSEtxaVhZTXlPWWRWUU9odDdVRzMzeDFRcW80dks3bThrQlE4VW1HRnhL?=
 =?utf-8?B?bEFWQmI2dUhxakVXQkp6Y25jNWhhd3RNMkxkSnhnQTV3TFpaWWFmdVVJN3cz?=
 =?utf-8?B?T0FyNENqb25RRW5CcjNRdXdRemdPRU1MR1FXK0FkT3JvYUNQN0kzVngreTFw?=
 =?utf-8?B?YTQzVXE4aExBVFZUTFVFWTczT2VkcTlWMURBR2hEODY1dzBTeURNYU9wOW1Q?=
 =?utf-8?B?Wm1XdHFiZnlVc0NyeGxrcGxwK2pCdFVxdU9XOUw2M0xud1B4aFBPSEJUT1pY?=
 =?utf-8?B?VWFDZ2ZTc0V2Yjh1OVN3SERLeHpIQkJ6Mlg4ODdYY3ZuSlJMVS9NQ1Yzak02?=
 =?utf-8?B?Q2RsVlFDcEhQMGVhL290c0FDdmYvQkxNL0NQdlh3UzNlbDJhQWhlWEhuUUFm?=
 =?utf-8?B?WFJmTkV3KzVYajZCZ2VGWVM5OFE2TWFqaUFqdkYwWW1Gb3M3Q3lwWDZOUWVa?=
 =?utf-8?B?RVpOa3dQQUM0NHRJQ2pET2tCYVhvbzEwOEhUQm5xNTVHZWNxT09Od3NOU2Yw?=
 =?utf-8?B?bUVBczF0bzM2dHNYbFFXeGxadHFlZHRQR1dPQ3Y4RTRid3l0TnBnWUVSbmRw?=
 =?utf-8?B?Q2p6MXJEUWdSVUJDenljb00zMkl6WStTQ2xMdkZqRUhIdElKWkV5USs5T25q?=
 =?utf-8?B?SjBucHlHYnFXVlNmUzNZWGNJVmlhaUN3T1RoTGxvbG45Q2V2TDUxbnVaOXFJ?=
 =?utf-8?B?Zm9GZDY5eXRLYzZoclBFN3BoWXB1K29Mdk52MlJGMEpqUDlKcUcrRmlMZ29i?=
 =?utf-8?B?QzR4bklnS0xMeVFKZ0s5OEF4UHNKMTJTbHZjY1FUVXBWWVo0VmFMOU9lR24w?=
 =?utf-8?B?TE1aQUFNQjRxUzJnU0ZiSFY2T1k5VTlzNVZwNlRuMnhVRmQySzBTOHFPVWtX?=
 =?utf-8?B?S0RqckF5bWtrT2RnejRPZytERlRMTUQ2THFSN1ZJa0QyUWErYnhHODZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFgvYlVKTHl4aWNyRnd0anlic2pCSDF5dXFQQ20vOGhsTGU5VWVCMk9JSklG?=
 =?utf-8?B?ZHNMYjVkVEs1ckJaWVlqQ0hXbmpYQzI2UFZWbU8xNldZVkZ2T0pCQWNheldZ?=
 =?utf-8?B?Y3BaQTFkMmZ2Vzk4blMvQzZtaTlpWUczOFUxUE1ublRIQ2FSeXQ5UldvUGVT?=
 =?utf-8?B?bjBoMlRzdFdqK0FnaW9VUmEydTBuMlphTUgxK0VSa0tlTVJwOXcxb2JWdXA4?=
 =?utf-8?B?ck1JbExxNGpiZ3lxL2VoSi9zTWEreEZWbG1JUGptNDdJMlRuRVhkMUJyRnhv?=
 =?utf-8?B?ZDQyemk1MWkwVlgyWklFUGxHeUNtYnExNW9WNFhOY2tweU1vL203YnJndHl3?=
 =?utf-8?B?bG1zaDQxQnh3eE1OdkxEQXJsQW9BVFhZek5VcHI5a2xrUzBjWU5UejJBWk5L?=
 =?utf-8?B?TGFRRXQyWDR0MFJnYnpyNEVKWmIrZzFlQzlDV3V4cmZsVUs1VEsrRkIxaDZG?=
 =?utf-8?B?TkRSUDZpMUd5UlZheHBhL21kM1FpZ01kR2tYUjBNK3hsQmc0a3FZWTlRNENL?=
 =?utf-8?B?NnVMWW91RlhJUnN2c0FjcStpRjAzbGVxMlAwUS9VbWIySXdrNW5LOFovQ3Mw?=
 =?utf-8?B?TUlobkJNc0psWjh3eUQ4N2NWS0NuQUJBRUVGZDdVdm1qTmlHVithYVMxa2Q2?=
 =?utf-8?B?bktGTExXc29HbDVQeURldVAwaDZnZjVuL2FuYTJ1QUhiVEZMRFlLUWV4ZGJP?=
 =?utf-8?B?bSt4ZFIxbUsrMXc3QkU3cUl3UEswOGtEVGhXcHZNT1gvd3NiZmZwVXlKN0Jz?=
 =?utf-8?B?SEdjbzExaENzdnFqTWdET3Nrcm1CeXNFV1FWOVRlb3dadVl4NVo4Uk1qVEVS?=
 =?utf-8?B?WnlwL3hONHladXpZNlBKdlcwMzYxWW5TWjFZNWNaZElFMzF6TmtyMWE5Wlhp?=
 =?utf-8?B?VDNiT21md3UvQlVCeE1lSTdRNlBBLzlWMDZHSGxFcW90RVliemsrcmN1OUMw?=
 =?utf-8?B?U2xWbitiOTkxREFXd0NvRTNzK0JnSHBlNEYzcThDM0NZZElDcWt1VHZLR3g5?=
 =?utf-8?B?WUgrNFpVVkMrL29LMG50b2JxMkdMSllIblRZVEhKRDNzVlMzK2hHamFUMS92?=
 =?utf-8?B?Lyt3N3pUVDhCVXRWckhBK0dVZC92WlZEV1Qyd2wvM3Z3L1pjVWFubW5aaDdR?=
 =?utf-8?B?YmpWUzFJb2pyVmFqUFJlam9ON2VEN1V1RFRoYWFYU0hnTlhIQitqRzZlZnhH?=
 =?utf-8?B?TGczMWp2Z1JncWFUWWFic0pILzF1THpjMjRxSVlQTDBTbSt4QnVYSnVHMHJQ?=
 =?utf-8?B?eVBCWk9IR0Y4UjFSUE1wMVpEa2s4c05QMDNoWVNVblBkK0VYNWpWRlhOdjBp?=
 =?utf-8?B?aE5Ma2txdVEycmNyc1ZtWklrVUhFc1ZieitVRStGVUlyMnF2N3ZVYmdPazFS?=
 =?utf-8?B?ZGZWNG1GWS9GejZCaEp0bjZpT3lrQjdhaGlaQTVTbjNtcjMxMURpKy84Sjh4?=
 =?utf-8?B?ajFSaFNKT2tHSG1CMmtSUUt1Z1VKdi9aVDdvRHNhWGhpbFJuTWZ6WjFXb3lY?=
 =?utf-8?B?M0p2SnloQUU1TzBGSUtmOHpaOXdqckdaU2ZGMkxBY3JuRGZWeUJjSUdVSlRh?=
 =?utf-8?B?L0huK0JuUHNQYzZZVUd0SmR4a25Eb0M2Tmo0TVc0Z0s2UnZHMnJOMm1jb0JN?=
 =?utf-8?B?b0VMbG12UlU3OXhpWi9UOFhGTnAzQnBTOTN3ZHUybGZrdDJpa2l5N2xLeDcy?=
 =?utf-8?B?WEZvaklRNitneVN4OWZsbVRKdi9nUkVja0JSUUw5NWJjOFRST21lcllZeTk0?=
 =?utf-8?B?bUZBT2pyRklFNE9HL1l6aGxRRWVic1pCdGVteTJCNzc3L0VjUmY5ODBmZ0Vq?=
 =?utf-8?B?WEZKTm5HdEFxM1RQS0lla3gzcnJyeE90Q2tPSXk1RGJIS2VhdTYvbHV0aFNt?=
 =?utf-8?B?eUZZWXd0Q0NXUUluUVVlb1gzelNiazc0Qjd6TWtZcTdIb1pzRmdNblRxZGhZ?=
 =?utf-8?B?TWVsbVlnWU1GTmVvRWtOMVY3Rjl3clRWbTdNbS9Ba3VJTmR6VktVeHV0NzAr?=
 =?utf-8?B?UmViNDF4WWczZ1o1aTkrYjEyZHRRQklndGhYRHAzYm1DUC9HOTVKS285WGFU?=
 =?utf-8?B?WjYzYUlCRXNsc251M1hwTDU0VlQ5Y2VHQ3Rvd0RIVHdGTC9OQlZmMytDZ3BF?=
 =?utf-8?B?TE1mc2svdnNGdVM5NzJlVUFreEtKQ3VnVkxLbmFibXptTkYxaUVycUgzVlRB?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fcabe9-2303-4983-d8ca-08dd07c52119
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 11:35:40.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4a+SS22txChasao3SLf7M14Unw8jHuP2OyvSvh35RRxatrGLJRDZD0XJ/NF0oD9x6pjGwryknsOs0hWuKoS7G5bK98Y+xl9tiRFu7FVA50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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

Hi Katarzyna,

On 2024-11-18 at 11:15:28 GMT, Katarzyna Piecielska wrote:
> As i915 schedules is not going to be improved there is no need to
> execute gem_exec_fair tests. For now let's keep them for future
> reference.
> 
> Ref:
> https://gitlab.freedesktop.org/drm/intel/issues/2842
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12786
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Regex checks out.

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> ---
>  tests/intel-ci/blacklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index cfc5491d5..d0b39111c 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -29,7 +29,7 @@ igt@gem_evict_alignment(@.*)?
>  igt@gem_evict_everything(@.*)?
>  igt@gem_exec_big@(?!.*single).*
>  igt@gem_exec_capture@many-.*
> -igt@gem_exec_fair@(?!.*basic).*
> +igt@gem_exec_fair(@.*)?
>  igt@gem_exec_fence@.*hang.*
>  igt@gem_exec_flush@(?!.*basic).*
>  igt@gem_exec_latency(@.*)?
> -- 
> 2.34.1
> 

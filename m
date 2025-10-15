Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DDDCCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 12:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192FB10E2A3;
	Wed, 15 Oct 2025 12:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz+c2OwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EB310E7B0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760532194; x=1792068194;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=seEHgTY1uiu5gumt7yhh0cLIwpu3VciGQ1eYim8xjlY=;
 b=Yz+c2OwRwzgEX0mmgdptu56sHKl+UkIYlsw8eWBnP3JdNK2ohbb78Ody
 Ctl8YNTrBS26wIRnSyPKiVrIw9bjj6aP83Br2r7n+KLF9+wjsuERUhp90
 rLnRwj9+nmxXUPIEwn1bFCm4x88g+PyNtr7mzJvYMWmX6vfJTm///1VU4
 LA85FJWHLFbeUucOGt+xSm5P80W8d96Ag9yNpo07876R4EdyjUvRRp3nx
 aKxcOpRrxvJ9P57xJ32CE3iwKnD+UTQfa+NkLSHX9oG4sOkzfsFELhRdr
 bga7tcXeXsmnS5WCzr4d0Wanjp1BYbLB+MPiaegE7Uh5OR5JGJH2iK7+v A==;
X-CSE-ConnectionGUID: vCyy7T6ESj2q7JBuJEebSg==
X-CSE-MsgGUID: mROIHiFOSeK3+hkGmVrw+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88172894"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="88172894"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:43:14 -0700
X-CSE-ConnectionGUID: Qi2gqA9+QRKPnQWPorb8+A==
X-CSE-MsgGUID: ElkfZc4pQOurG663Jzi3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182623935"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:43:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 05:43:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 05:43:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 05:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElktqXgsnhNqEAyDQifWRYqjXxhasKmqgOJCO8kWYto3z0dgvvoTsr5rEpd1H6AakEdV382/Bc2HA2Yq9emvKbbfxp+gJHNUL79CryUHCXNQYEy3DZZ3995mxsg1w6Fd2QYQLwrurqY9/E7sVyEGLqRriZaMnv/ehGgaxWZ/HSSc5hf/mzUAxp9o0mmAvzRSzwmX+NF1ifzdQf6q95sSZ3YuvSQ9B5hLHIKB0eFFi7GbO3UP9Q2jtpRBiRDjZr85bsx6xO4KZjOI33cYYApDa8NrR1F+S8WjDs4Tg3ts1o/zGG139u6FVkg3BXZPipQ7p/RklAFgNiXhXeECZD2iRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TD5/YTuzJ6vWIVbDAnTNxJVdsegtYPkLdDbc69J+L8=;
 b=ZRlecfMJERUtyVdk4y9MMNRBAgzAbxvlkoij0GjUTi/7kQUzUqeWzAdOhKbUReaAIHeAiUG+RRo9vWAw//v1h5FAsAwdLkmAFtEUGw6E8R8l8BQsHIrCbh7TducgjXPAUNwX5eEMC+YOl25jYKWh2OgTTgnvcMSq2YgfpkoQ0xjWXH5wJP0xEFPk5g+tE0lf4zoXgo3e8e3y7rZ1z77eJlszSkLKON6pGhC3V1giiqxV9zZSdpCG3zwC7Jcg8fz6zju+u9UCDXZJXQWqp0rIJgq9ZgeS6PvAmdrmcYiBu5vkdgKMHE9vQ/kir8DRbfsrwANNX5x/iXWq2Q1zwvhvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 12:43:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9228.005; Wed, 15 Oct 2025
 12:43:11 +0000
Message-ID: <535b4d39-9af1-4fee-87c0-6f37282c8b8b@intel.com>
Date: Wed, 15 Oct 2025 18:13:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2] tests/gem_ctx_freq: Fix frequency restoration in exit
 handler
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251014192458.1277774-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251014192458.1277774-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 1022ebed-8a12-4788-4f6d-08de0be865fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHFQQXY0cFh1aVpHN1N5QVY4dVMyK2dWcW9xSDNmbGxJZ3BmcmZMZWpKQmZk?=
 =?utf-8?B?cFJnbVNCdDgxdjBlYnRGT0hSUDZIY2NGa0dDQXNuKzdwSHlCVVk4UFJndVM5?=
 =?utf-8?B?SlRFekY3ejFOd3ArMy9aL3ROdkhFQ0k5TUtaakNQZDhJS3U1Y3VTY2Z0Z205?=
 =?utf-8?B?c0paN2J4eXBsYWx4ZDdxcTRsWHYvODRjM2RtZDVBdUlWYzQyMDVuRDlJaFVZ?=
 =?utf-8?B?WDRTZjJxWC9iNWN3SUdVci9lM1BWZElwblpNUEQ4amwvQk1YUms3UFgxc04y?=
 =?utf-8?B?WHVLSENFN0VRS3JiMXhQYUNkWnVKNElVb1RoV29SV2dBd01IWHMwUTRKaStz?=
 =?utf-8?B?YlpnN045am53ajhhRm1sZXgvbUR2YzlobG1SN2cvTURUcWVTeTdrMDZzTnNn?=
 =?utf-8?B?Tm1sOE1yRmErRlFmb0VEM3BKK3pIeUMyQ2hHQlUrMDBtbHBkb3NkWndwSUY5?=
 =?utf-8?B?bDBvNDltVEFFd0ZJSEV2eHJJL1N2SnlqWWI5OFlMTXJzUjdPQmtXVFYwLzJ4?=
 =?utf-8?B?Sm0rOUhjd3RxYnlTZTlwWUlnamNDN2NCYllLQlFianhsSXYrbUcrQnlyM0Mz?=
 =?utf-8?B?NjdBSEd3eDhYQjhXckc2TTZmRDFvTlprblRFdzVaK2YrYm9aaTV4NnR5RXZ3?=
 =?utf-8?B?dWhtcTVlY2gzZWdkT0VoNEFJU3crRE8yR0xQVnNqSlk5R2M2blVTeUQzbTVU?=
 =?utf-8?B?UGNvMWI0YUNVQXBjaHdyOVdsaWtTNEw4aHRlSDlWMzgzN0h1T3dHelFxczlS?=
 =?utf-8?B?bGd0S2FYZ0RPQ2hNdnk0b1dVbHVLVk9SaXQxTHZoWGNIRkI3d2Y2T1g0ZHBa?=
 =?utf-8?B?YlJtUjIyQ3k5QmFlcG9UNURZbFIrVVhvWTJCaUY0VFM4cU9JZmZCNUp5bmlx?=
 =?utf-8?B?MGptUFQrcThlT1I0SVd4SVdkSkZ1MTA5aGdNTjMxL29NMWVETWJTVkVqVVZk?=
 =?utf-8?B?MFFkT1NBRHhRUEVqWVhrV0ZrMzE4VHRCekNHTkJzb0pMdlBuQ0FQTXhXaXVQ?=
 =?utf-8?B?emhBbDd1eW5tZlc5a0ovTEdvbjhzVzV0ZHZ1UHpMUjZmNmhpVHV4cSt1aGFx?=
 =?utf-8?B?L2xTUHNNQWRxUGR6dWhpSkZkNnF3Snc3MzZUSTJXKzhiUUlxRXJ1OFZaQlpY?=
 =?utf-8?B?RG5SamJ6SldKTk9jbXp0aUYvaTgvUXJHYUpCb25vdEpiVUhVbkpHVXZCdDd4?=
 =?utf-8?B?T2pqR3VMWnk5OEtzc0VLN2F1M2N5MnJyLzA4WmxTVmcwYWcrb0krbW92NXNu?=
 =?utf-8?B?YTlxZklKUmdFcitVaHRjWHhkbzJJbUhiVzhnYzNDUllFcmQrUE1qVlF0bTlS?=
 =?utf-8?B?bTYvdHg1aktrL3hoeEEvSm9nRS95MHpQUUxabXVBVkdnRlhiY2VOSmR2NFZD?=
 =?utf-8?B?dGFkRTgxc3huOC9pQzJzcUdTdnZ4SkhpN1c3cGxhWFdoU3ZFWU0yaWR1cDRC?=
 =?utf-8?B?QWRPZDVEVjMrZjR1dzVQa2MxOTNPNUlaSmxnaTFDSG0wYWlMbnVhR1dJM3A1?=
 =?utf-8?B?MkZyUml2TTR1c3JIckRKS2hWblA5VmtKUXlUa2F2OTd4aUNCRnRjTHVMaG9v?=
 =?utf-8?B?UTU3OUZIS2s4dnlpVjBBYmtWclhYaSttamxWejJhd0ZZSnlQbFFuNjNvTXhr?=
 =?utf-8?B?K3FhODIyVUl1RGRMNUtYbHNxRWJ2TXIwNDR6SFhmY25kLzNXRWdUUXk5TE5G?=
 =?utf-8?B?K3ZsZGxiTXRHWS9pTkhFQU1NclNIQzJGMkVNRWpCMm5yVWNtRDBRZW83dnhk?=
 =?utf-8?B?VnV0eTVKVk1qNThXVEZYQjFOQmNrbzRzK2FueGp4dWtDdGRqeVpiN05ha1N6?=
 =?utf-8?B?Ylk4bE1yN2ZnTjZoWTlsdEFlUk5hZW1aazhQYnVaajFScHpGVkdmZEhVSnJE?=
 =?utf-8?B?SXFiOFRieXYycTNGaVFpS3V2eGZHbUtXZ0h0Ym83M1kxWHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmpESFJmZ2tpUHFDWmxxWkJ2N1hya2JMUnBEY2pXclRvU0xUczJZNTB3TnJJ?=
 =?utf-8?B?ZUJlK3BDZWhSSGpaNG41blNpc2NqNGRKZ25VSXNmaU1LOXdrVmdyZjF3cDEx?=
 =?utf-8?B?b1VaQ29UYkFkNjdzVGFuQlYrVmh1bERab2FwcC9PK2FQWk8yZHVOOUh6dEVq?=
 =?utf-8?B?ZXVYVnh4bmNKNU9tNG1tQ1l0K1I5aVRMMHBiU2hZSTVjVFpDYndaVk1VTkpB?=
 =?utf-8?B?ekJmVTFod3k5WDVGYSt6WlovWnYyV3hudVhRMnRCdllRSUFITXFvOENzWEFr?=
 =?utf-8?B?VkhVRko3SHc4TFFkOTJPeUk1eEtuVndDSzc2M2xGaEhsMU5aZXJkbGFpYnRP?=
 =?utf-8?B?dVlpUVFhSHpjWER3QUIvdGkwVmRCaGVkLy81WnZHSHJOczBpZzRLWW8wWWM2?=
 =?utf-8?B?N21Sb2o0VWFxVlh1QU45UndsbjJiMGdxZ203TGt5WG9zTCt6UXFGNG5qY1Bu?=
 =?utf-8?B?M1RGMmZHSENOUmRpM3JWR3VwN3ZxVlk5bzhBaEhFcTBSMnlxQWIvT2gwRUsx?=
 =?utf-8?B?ZitsMk1FMTlaUE5kVDkyR2xiNGRPOStrT25LUDZoYUdxSHgxWUprVno3eU52?=
 =?utf-8?B?dUpXQnVJeiswMCtTclpRRnRZSzVxVVUxMitTemFxSnJtby9FUXZYQ24yY2FJ?=
 =?utf-8?B?TmVaY2VJSXhJcmVHRHpQcHdUOVpmTTM2WkJKajNhdkoxT1pwbXVXUms5VE56?=
 =?utf-8?B?TS9jbHF3VlAzYnZwaW0zbWtJcGFDbVNTOVMyQjN4VGVpR1pZTXZJOFlvTGdG?=
 =?utf-8?B?QmkzZ0w0ejF0UkV6Y2FYZlJWdWxFOWpPMElwOWJNbW9Td245MThOSHlVQ0lR?=
 =?utf-8?B?dDkvSm5uNVlxSlB4TEV5RXRqcVBqMUF4bjljaEJWS3dCRmZDQmtxWFprOGJM?=
 =?utf-8?B?UC9UWFNVYWVpWHJyNkNYRHhNL3d1MXhLc21aMlRBWHhhV0VtUlErbi9JMHh0?=
 =?utf-8?B?NStWeXhkVTFVZm5Ob0NCVXk3djFjb1hRT2JvU2NsVDFvQTdDMFZwZmZCdTNa?=
 =?utf-8?B?d2pwNUlHeGsvaENOL29rcTJVa3dlSm8yUFJpQWNiYmFjTFJ3SHpYcUF6V09a?=
 =?utf-8?B?RHRDVjh5K3JFc3lUZDdIQWRWMENsSTBkSFJydmtDSkVqbmEzVkJTSHVpNmNK?=
 =?utf-8?B?QllDRUtnTSsraG1lY2c0Q2MrUXR6RkUrdjgwUVRoYzZZc2VaODJBTFdSSGlI?=
 =?utf-8?B?aStRS3F4bSsrUlk2UXVNL29Qb3NPbitBUE42NkRwL0xRbjI3YXRpdCt4bjRr?=
 =?utf-8?B?RGVvd3p0RmZJVTFjSXBaTXkrckdtam9laWswZzlQVm5HM2F3Syt0NlIxdVJu?=
 =?utf-8?B?b0o0NUNJa0pkUUFEb2JZN2U2ZllVdk1uMjN5OStvRjhOdFBkVzcwWFpuVGhW?=
 =?utf-8?B?TzNrdkIzcjRlaTFCZlIrcW9JQVBiUnlTZk5yQ0kxalA3RHRBOWVqMTFlYmN4?=
 =?utf-8?B?akhJSUpEd0xzRWVWZXY0ZDN5RC81dDJTMkY1QnFFcUt6ME1JYk5XOGUxdGlr?=
 =?utf-8?B?Vm40d1lJdGZuSkVUamxuRTlqZ0YrR3JweW4wUk5QOE56MXdhcFh6MUdRczNo?=
 =?utf-8?B?OGFPRW81U3ZmdFJUVzIwY29nMlBKZDV5emFNamU1TFJzeUNnQUV5cFdCd284?=
 =?utf-8?B?VWlEVlRNTXdQZUV6WEdtMy9JakJ6My8yQTd1aHVVTG80Z2ZubDN2dUVTTDBu?=
 =?utf-8?B?T1cwejRURm5LalZUdURCOVlHZk44dWNOTjd5K3NXL0N3azY0eHNPQ20zKzNT?=
 =?utf-8?B?bUd1Rng1aXVCaEkyNXB2emVUYlN2cGVRbUg3SFhZZldsbG1uRTBSNXJSMUJ2?=
 =?utf-8?B?Y3JvLzhLZzVPRmVVbXJGeXd3VU9LYW1kWTJPbzgvS285SG5CajhiYmx3QXps?=
 =?utf-8?B?enFvUVJCcHlVY0xqZjdmTGI2c0pXUGJXenR6UmQ1QVlFVm1QNUUwdlFqdkJI?=
 =?utf-8?B?emFXb1VpWlg5WWlpQkptSDlZZER4ZzhYUVFTWlB2RXBoa1RjWkljeDljQ3JD?=
 =?utf-8?B?QjhaeVJSVUFZZGU3WFNOaUxRSnIxM1ZNcHZJQVJpVDRBNll6elBrT0owWXg5?=
 =?utf-8?B?MHhLczhxZ2FMSFk4UGNad0VxNks1Uk9HSEREUkxCbzJQZkQ2QkNET3kwYU5V?=
 =?utf-8?Q?3u7XsHzWEgxijR+EKtazCM1FU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1022ebed-8a12-4788-4f6d-08de0be865fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:43:10.9498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SfwU25oXvGY/JQxrRp0lFMpdlD4afuKb6/lW0nTZ7zgQfPq6l8maQWPM9BR++3OjT96kQFqGDyB3jTOJ+dzug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
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

On 10/15/2025 12:54 AM, Sk Anirban wrote:
> The exit handler was failing to restore frequencies as it was being called
> after the driver was closed. Reopen the driver in the exit handler to
> ensure proper frequency restoration.
> 
> v2: Use global sysfs variable (Riana)
>      Fix buffer length issue
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/gem_ctx_freq.c | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index 29fdf89cb..6cc349b15 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -197,16 +197,22 @@ static void sysfs_range(int dirfd, int gt)
>   #undef N_STEPS
>   }
>   
> -static void __restore_sysfs_freq(int dirfd)
> +static void __restore_sysfs_freq(int dirfd, int fd)
>   {
>   	char buf[256];
> +	int len;
>   
> -	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
> +	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
>   
> -	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
> +	len = igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf) - 1);

This needs to be fixed throughout the file.
Can you split patches?

Thanks
Riana
> +	if (len > 0) {
> +		buf[len] = '\0';
>   		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
> +	}
>   
> -	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
> +	len = igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf) - 1);
> +	if (len > 0) {
> +		buf[len] = '\0';
>   		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
>   		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
>   	}
> @@ -214,10 +220,18 @@ static void __restore_sysfs_freq(int dirfd)
>   
>   static void restore_sysfs_freq(int sig)
>   {
> -	int dirfd, gt;
> +	int dirfd, gt, fd;
>   
> -	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
> -		__restore_sysfs_freq(dirfd);
> +	fd = drm_open_driver(DRIVER_INTEL);
> +	igt_require_gem(fd);
> +	sysfs = igt_sysfs_open(fd);
> +	igt_assert(sysfs != -1);
> +
> +	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
> +		__restore_sysfs_freq(dirfd, fd);
> +
> +	close(sysfs);
> +	drm_close_driver(fd);
>   }
>   
>   static void __disable_boost(int dirfd)
> @@ -262,6 +276,8 @@ igt_main
>   				sysfs_range(dirfd, gt);
>   	}
>   
> -	igt_fixture
> +	igt_fixture {
> +		close(sysfs);
>   		drm_close_driver(i915);
> +	}
>   }


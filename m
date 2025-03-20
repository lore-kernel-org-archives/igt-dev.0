Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072EAC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 13:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F110E0B6;
	Thu, 20 Mar 2025 13:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEJCNStj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD510E0B6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742478507; x=1774014507;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xV+CbZPZr3c5VG6OR5mEENhAk6ak3XBtvfnJsqECkuo=;
 b=OEJCNStjtDGINZ3FpuxwuEL/NF1ePlmxhlhmhIlTAgOHShFCA4E/GRtU
 PjwH1C4H+VvQh+s5Q+tX0qJj+kGi52rWx0HPLc2BZ5NQ64ETIdXCDpCyo
 btVeYZ913FhOqFHef1H9TXSwFdt266/z/NOMsfn5o2g8+crH9jRRH7OfD
 fg1pgnxYHATE3yN2IxPdVhWLUDrO+lpx2WCEynO2ISH7P6Dmm56oLYQxP
 bDxkI5kWNHdJdWXwM10+6Qlllnr9KIGnZ5TpkZFK42QjiEfpLIiWagpXO
 gdpPsjsQDC1TMHprlKXrB4kMjCUp7BIEN0uzEkAasoRcGX/9mZdQ6hqk1 w==;
X-CSE-ConnectionGUID: NX6XhEPCSJitG9etH4M79A==
X-CSE-MsgGUID: OxX5T8PZT76b1daTWIVCUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43596102"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43596102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:48:26 -0700
X-CSE-ConnectionGUID: 0ocHEU/LSemNhVHvJICzVg==
X-CSE-MsgGUID: 9azoBzpwT+KBJwIqXM7mEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123267373"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:48:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 06:48:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 06:48:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 06:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5mZB69/tIhWxhS2xkeRus08IJYknseEPZhU1aVb/KQzDx0kcgdOc13To0P6LME3lc+aejDwnqrdS8dU3Wear59edWm6IvmypLZaH4HjRrdhlFyE+vvod3clT7WaMFPDbP67anQ70KwwY/dks26T/T7907R9MoGPK9jh4nqtD3WiFxMBs9pBab6OFV2zPSfEfMaVDvy9kaCEvJK2dzB6DJVOGDtvxIKXbtx7NFA5l6BOJjRmIdxrbmfLr+IC0ZbhFB9G+P4554baEdQSt8o8rh0yetF3lZUTFTfNk1zYWp4jEFvMAKTotPv6UFQz5QapSpV/FRAiNNc2HOIGqtpeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EFcM745Kx92h/Aqqs7kNy/vDz7/0E20m8xm3aExaAY=;
 b=zFaMC5ajjAffGQgt2i6IpMshma7/E+MaFegUfknbG086hTq0O3k/91wV5PlLGEXAwKbOvQd+g6dbOk1k35P610nwmavgwxOae9acGI+ppfBQvRMUHxWlcYiLe4Bfzz8/nVrNnMWNCHqdA3LFFNhbh9pHzlQfE0wNCP6TdDotGZbV99l/gQeKOrBiz0N7qSn2CM8/8DqPiVcxymGLVK4+6WQPgk1wAL+nGuOzmNj9NwAPiOYN95Ob7WV2Dovuhjf0TwZ9x2LGbBP7U5aXU2OT8De/ZFy9sYES6v3ZUMicgU3sOZthQm9jAmwTyOz3SZFfPc73gOQCR9n2SoVLRyGnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 13:47:42 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 13:47:41 +0000
Message-ID: <385f0c01-8961-4c8d-9213-43e0c82dcb49@intel.com>
Date: Thu, 20 Mar 2025 19:17:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel-ci/xe: Block
 kms_display_modes@mst-extended-mode-negative test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Thasleem
 <mohammed.thasleem@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250306121311.431289-1-mohammed.thasleem@intel.com>
 <20250313114832.15472-1-mohammed.thasleem@intel.com>
 <20250320133541.3lkne36aa7zox4cd@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250320133541.3lkne36aa7zox4cd@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9a7796-d521-4e07-a548-08dd67b5c8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTBxUzBIZ05YSFdwL0tZaTJqR0VOYW1PU252dUs5L3VxU09lZU5BNTV3am5N?=
 =?utf-8?B?VFljM3ZkdFlpc045N0wxam1Ed1QwejlCaENVdHhRcmcyRi9PQTZYV0gydzNL?=
 =?utf-8?B?OXZkb2FaMGFEUVd3aEVGZEI3Y3dPc3NYaU5GVjBmSXlFNmt4cnRLdjNyQXlQ?=
 =?utf-8?B?RkVmRkU3UXhQYzU1RGJ1ZlljQy9XSkUvR0xlc2w0NzA4dXRCa2FwYVB4aWNW?=
 =?utf-8?B?QTI1dlhVNmo2NDNqZWg0elBPWXlSMitXS2RYeVN4QjU4bGdSa2xvb1dHVnFS?=
 =?utf-8?B?K241a3lkTEhSRm9aYnRCb2NlTWJoQVNQb2FoWlZsV2dHZUVaQ0JULzB3Zmwr?=
 =?utf-8?B?Y0JiSWIxakY0OUlvT01hMTdnbFUzVFZkcVdjM0ZxbkJRcXFPTVF2MXVnVmVT?=
 =?utf-8?B?cWc2bit4K2lhckpXMkxJc2lHN3ozQWd0QVBXdVg3MHk0a3FPZW5SSmlOZ3M1?=
 =?utf-8?B?WmduVll2cndEbWRaL2FFRENHVmNITCtjelkvRHF3MHI3ODhDSndDd24zbTBQ?=
 =?utf-8?B?elUxWXlMY0crZms1dG56RXE5Z1k3WEREOGxDQzlpTXovdDY2STVMT2xweHg2?=
 =?utf-8?B?WWtvVEl6WUZEOGd4YXN3VEFmdFNhQmF0RlBzeWFycUNvVFBZMm9oRnZXWEFD?=
 =?utf-8?B?aGE1Tzd6V0ZadTBKS2g4THJZNnM5R0YycjZTVEJNQjRHc20zZVVXUC9uaUpG?=
 =?utf-8?B?YzNyRXEvSzRJdDhpZ3VhakphUi9FbCtxKzN3ZlYzTU1UOUlKUVB6SVNyVUVX?=
 =?utf-8?B?MCs5VHRBZVhDRW43TW5JdVpJcWF6ZHV5TXhuK1h3R2Y2bG04OWhkRzlYWjFM?=
 =?utf-8?B?eXVmblFuNVREaGY3MVl2VWUvelNUYkFaNzZFTWdJYzczQVFJMzZ2SHZUdy9J?=
 =?utf-8?B?d1FQQmlON1ZIcGFnUzI0MEF0SVZOVkNMMk5JSWVzZEtYa0lKN0ZhRjlPdmpM?=
 =?utf-8?B?UjJGYWVkaG9JeWhKMXdzZmVZQ0VOc0xkejlpWjJJRXk3QmhzRThvNHNwUitk?=
 =?utf-8?B?NkdtOGpZSGlkUGJ1Z0d2NGYyUklJd2lHdkhVWWRjYTBiNEJFb0tkekszQzFp?=
 =?utf-8?B?cXVhNWU4andwT0VUc3d1U3EzT2dDZkxlRndBZDJORERKbGdrU1NMamw3RVN5?=
 =?utf-8?B?UlA1eXVmUFQ2RFZ5bnZJZkNLdUcya0pDNE13TnhDU0VzcEx0ekJwOVhnL0Z5?=
 =?utf-8?B?VFpzeWRTanVRL2dDeGxwdWxpOTQ0b1VHaWIzY3dFT3dwSHZZcGpNOGtqSGk2?=
 =?utf-8?B?M0plQ2E2ZDJFcm9CNkRXRGgvUzNJNWpZaG90RkJ2MmZkQTdKSlhPWFFRU1dZ?=
 =?utf-8?B?eTdjaGdQekFkNzhpdXBDdTNyMmtiYnhaeitBUTZ2VTJVaWJLMXFmN1U0S0Ix?=
 =?utf-8?B?N3RFcUkySEJSVmUzV1BtWWZrK1JwdVZ6amRUWmx4WGRpS0UyZWZWaUZzNXBk?=
 =?utf-8?B?MWtlUXlITEpnVzBpS3ovVFpmeW0zRHN1K2NDQmgvOWIycjFFWXVzRGtObW5m?=
 =?utf-8?B?VkhoWDZ0VHZac3hWcXVxQVdCWnN2dmFuN3pVbVdrMGU0NUVzSVZ5cXdQcmtS?=
 =?utf-8?B?ZTNNeXhoZWRFY2QrL0lHam1TcFVIMW13K1oyWWI5Q01uZ2tSMmFTVE5XdEdn?=
 =?utf-8?B?VXdQaXpjNUVwUk9VaG9RN3pZUWx5MS90czY3dk45Mkd1SjJGQklqQlJQait5?=
 =?utf-8?B?UGc1bU5tTjNDWEx5M0JhVE1QZ1ZNMDhjazN4WW01Tm9oRUEwZ2VzWmdJTHli?=
 =?utf-8?B?UFZMYlFVZjJSdklMbkpvbmx1VTVNNjFjZjQ4SFBkRGNEVDN3NzQvczY4TW1F?=
 =?utf-8?B?d2Jxbi9pUGVWek1ubEV5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNBUUVNMFFSOXRPVDJMUVgrSnVhS0p0Zk81dDl6TVNucTBqUkg5V09TdTNa?=
 =?utf-8?B?a0Z6WnFPYzYwd1owTW9VUkN2bER0Tm55SVdkTVFLanJ1NWQ3Tld0bno3V3Na?=
 =?utf-8?B?T3JISUZEWEJpMU1KMSsyNmFPa0hlRlV2WHBGT0tDcU1YZnI3ZnVCOXMyWFNs?=
 =?utf-8?B?eUFZSE4waE9VZmNmbmVOZnViUWFxalJOcTdVMWhvUEtST2VReUVtMUFYTzIv?=
 =?utf-8?B?STJQNWFBaEdUWFpSUTNaT0FhcmVldHc4NTVJT3hRdmlWVU9BOGtham83RDk4?=
 =?utf-8?B?c2JtWlRuMEUwYWNWazAwaXloNXloVTgxVEhlNUsrYnhHUXJ3dTA1RmQ5NTZU?=
 =?utf-8?B?YVpqdFFYT2d1eGhRZXV2MS94T0UyWVRScWRibVhWRVVBUjdDNlBtUDBrYThx?=
 =?utf-8?B?enpFTkdvdWFpekNxbzA2S1YxditzWEllWVBtcDZqWEVoN1hxZ2x2K0JmTUJm?=
 =?utf-8?B?MGNlcUpQZkE1WGYrekxkUjUxN3puMStOSC9VeDNYZVlmY01vekZ3WnEzVXRZ?=
 =?utf-8?B?RFBub0RHbmZVMCtyWndZRG8wbjFhMXhJdjhGZWJURWVMZEJvaTUvdkVFOG50?=
 =?utf-8?B?YVc5cjVPbTA0L2owK1Fvek1zaEhzbnFmY05ZSldiVGpHWG9SRUUrSHZQUExK?=
 =?utf-8?B?VHlURGxlUk4xMHB4a296RWxQYU9BUWxNQkt2bXlZSThXQ1owM1VtWUxLVzBy?=
 =?utf-8?B?VTR0YUNjWWNrQkJDOEFLM1ZPVXAvblcxdTE5TUljUThjc3JYTk1rbURVUUsr?=
 =?utf-8?B?ellOejJzUjNrWTA4UUpQejRhQ0p5bnlvRzNWOUJOSkR5MzdNREU5d3lrZkZH?=
 =?utf-8?B?eSs5ZDNDWmFJRThEVDVjYkFnYndQQnZOeGViRng1Q3dYNWd0aXdob3pNVGEy?=
 =?utf-8?B?ck1Jb01vdzlzQjJYTWxlR055aUMwdU8xdk9ralVhd3U1WDAzY0M4VGJkUjdK?=
 =?utf-8?B?MEQrTDhuS0hUS01IVXp6RG43Wm90eXBvblRMbVN4bU4xWHpScnlQSmFGTFVs?=
 =?utf-8?B?clcvYVRqZ3dvYXh1R1YyWjdaRTM2VzduZFNHRzZ4OUwvOW5PWDdYM0NlM25C?=
 =?utf-8?B?aWZhYmNxVFY2VkdGY2I5Q0RBTjByM21RdXRBNUJBQ0pmeUpBb1g4ME9TbnR6?=
 =?utf-8?B?RFNOazM4ZDBKMUVaNXQ0VHdNdjk1NlU0NERVbG9WTnJwN2p6L0lpKzFHSXRh?=
 =?utf-8?B?UHN0NjFOS1JHcjZHM2pQUmwrRXoxTUtmWFFpMXVXaVpZenNuUzUvanZjQ3Bq?=
 =?utf-8?B?Wm5JMldMTE9IU3Iza3ljdTZXMU11UlZCck1JbWd1R01xK2N3SzBsL05RWmt3?=
 =?utf-8?B?c2ZCcjk0NlRxYnIvYUVQWWdWS0V5SHlXMlp5VFJoRkNsaU9CZDZjOGNMRUtv?=
 =?utf-8?B?SkY1dXVmdUg0QkhKNnNhM25iMU9LcnhybjVGUFpsSjh6eStwUWdCejB6M0lV?=
 =?utf-8?B?WmpVK0kwTmllMFcrRG1uUzVReEtaSVR6VDM0bWRLeW4zc3JmM2NDdWl6WWty?=
 =?utf-8?B?aFg2d2NYaEExaHBtZVo4M3lEOTBEbmpoYkllODhWRHdSY2tXbGwxRlVpVnQ3?=
 =?utf-8?B?NWtRdVpEUUpOOVIycDVCSTZHUlN6eGg1c28xR2FLMkZzcER1eXJLRHBLRGxG?=
 =?utf-8?B?bTRaSTRaMWVkbWhOamJ3RG9SRmUxYkViSXBaN29JRWlsb2Zpajh0MjU0SGRn?=
 =?utf-8?B?VHUzcngyUFJQcW1UUWxhbkxZT2szelJDY3JnSVM3cTYvSjFUTUJYU2NMM3Fi?=
 =?utf-8?B?RWtTeHpabm05VUVHUys4dkxIUnJ3RERhMkxSRnZVVm1TbmpSVDc5aXhMeGpa?=
 =?utf-8?B?WUJGR25iV3pBcU1hdEtZZCtPN1NiOENpT0tPL0tTd0hkS2Jhb2IvdW9OdjBa?=
 =?utf-8?B?QXdKOFVQbDNqaFZ1ZXJpQm5ncVlLa3JwVlRqRmJaSmlnL2hpZitreUxVR3Fq?=
 =?utf-8?B?Ym5zVlFRSDhYZ2F5VUcyclFlb0xWYTkzVzZ6R3RlbnBwZWpXS1VuakcyaTVB?=
 =?utf-8?B?NjVzSFJBZWRBNTdIMnZnc2hCai9jSlZmWXY1VURpaXIwSE4xVXFMUDR5aThK?=
 =?utf-8?B?UU9TMmNSSmVUelVWSHRzSmF2Y2xXMmlZVm9BM2g3aHpnNzJmSmZEU0NUQnVK?=
 =?utf-8?Q?TRLxGcN7DnJyAab68fjjjw4LB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9a7796-d521-4e07-a548-08dd67b5c8e5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:47:41.7394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL7BQJNP1FmdI+wE7+XCL5Btc/Fafb/dt/cActcJubMzYGrg2ZzCvQTpt+mpUj576IiUGIdruYEytfFU8jx5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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

Hi Thasleem,

On 3/20/2025 7:05 PM, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2025-03-13 at 17:18:32 +0530, Mohammed Thasleem wrote:
>> This negative test was designed to validate ENOSPC errors with 2k-4k or
>> 4k-4k monitors connected via MST, addressing bandwidth issues in MST
>> configurations.
>>
>> However, it is not applicable to current bandwidths, as DP 1.4 supports
>> 4 × 8.1 Gbps, and DP 2.1 has increased this to 4 × 20 Gbps, offering
>> significantly greater display capabilities.
>>
>> v2: Add blacklist for i915.
>>
> +cc Swati and Karthik
>
>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> ---
>>   tests/intel-ci/blacklist.txt    | 4 ++++
>>   tests/intel-ci/xe.blocklist.txt | 1 +
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
>> index 9917bf46a..507c14d58 100644
>> --- a/tests/intel-ci/blacklist.txt
>> +++ b/tests/intel-ci/blacklist.txt
>> @@ -83,6 +83,10 @@ igt@gem_exec_alignment@pi-shared
>>   ###############################################
>>   igt@kms_frontbuffer_tracking@.*drrs.*
>>   ###############################################
>> +#Test is removed, so block it on CI

Since we've completely removed this subtest, we don't need to block this 
separately. Please discard this patch.

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/1845b2478892457fab2333930c44288970bbb96a 


Thanks,
Karthik.B.S
> Add space before 'Test':
>
> # Test is removed, so block it on CI
>
>> +###############################################
>> +igt@kms_display_modes@mst-extended-mode-negative
>> +###############################################
>>   # Tends to generate invalid configurations
>>   # using CCS planes or configurations that
>>   # exceed HW capabilities resulting in sporadic
>> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
>> index 80ceba9a5..06506f590 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -92,6 +92,7 @@ igt@kms_sysfs_edid_timing
>>   # KMS: Non-Intel tests
>>   ##################################################################
>>   igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
> Add new section here, as this one is for Non-Intel tests
>
> Regards,
> Kamil
>
>> +igt@kms_display_modes@mst-extended-mode-negative
>>   ##################################################################
>>   # SR-IOV tests too stressful or time-consuming
>>   # to execute all dynamic subtests at once.
>> -- 
>> 2.43.0
>>

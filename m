Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45385CCD187
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 03:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF23810E129;
	Tue, 14 Oct 2025 03:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWUZXddX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ABA10E129
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 03:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760413519; x=1791949519;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X9kFza2OBwtarqu1Lv0mZQfig4gmHiLNpExT72wkwg4=;
 b=bWUZXddXwin5UwSD2rlT0kcGUJ1jGVi4Jr/zpGA7V6eMVBZt9+7KZxvY
 i08yEi29w8/xx54/tBoWmShDfUFG+kI+2gNMxyL+1JWLGVa/Gynv25DOY
 yboT1mQPmZRJwj0TXaeMMHBxsiWV6lPzFHUKZu+9nZLzP5n6vsWN00O+z
 Nr/oBfMoZZ4WNCKAEk8UALIiqvHbnoMhaYxp/nHcRiSDhNDNx7iQJX8JW
 Ska8+uLi6eIl+nENR3NYXb06CeicQmQoJoa+GCLVg3acUyiHiH0KbkcdE
 pgDF6g/dSMregK29hMM0w+pw7uXicPbF2tFKsn16iiA00Uukvu6B4kEAM w==;
X-CSE-ConnectionGUID: fXHJJEUDRzCIfj4oURoVYw==
X-CSE-MsgGUID: J8AIEqYjQsC3WTDC9UBKjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72835339"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="72835339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:45:18 -0700
X-CSE-ConnectionGUID: h7ZG87uhSSKfa8vdqtVv9g==
X-CSE-MsgGUID: e6j3sZ0/RhmO4lxRQJzQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181729484"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:45:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 20:45:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 20:45:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 20:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL6YV3FKFmWzZ6eVTYT9V7koO7/9GVKoOljg04TcYa/0tWB9gksRw2pWdwk1rOrlq70WxD83kvznyqRitxJBqo4LsQTz9wmEV+TJoSk2BHhWT/5UksuQjqZ7CQeM1vuZd1aUG9uR6ssHKwJYduKVhTSyd9hmuYcN+pNvIiiNcoNI5myj/BY2RI+9rAoVZPYaZ42u1X+Gh8zw9FhSZRJfnM3Vt+/hueFjMqHXsJVKVJOZfEPHcuB1wppHGOnFSDUSLUKYYJgK2VpNJlKMprNJpOEFup40GscQDcGkV+EpBNw8r4cvJgqGVSALwYK14g+D93PUQeJi0CHv60iDFB2gMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42KKUqX14E1S0PfEku0dAn9AnJyIHWXA3rZpeW6ZK38=;
 b=cQ5eaJ+jEx/weoNwxkhg+Me/nk9auN31aTxFHegnDrC0MzJBdGRR3LUqPV5ACLrigu/Tx8b4VY8cfwgN7L0iYMtzhSF9UHk0bg5cS/QwAHEA+PWN6ewMft3qLxtbSDNOi9/LGKJsmqPs8psCAb/RZ4hnTVlft1qCYbWmstbmC9Zwg5UDg0pBrepTlqef2FZ3BOTauQBe2djWd8s7FPItFGv0bDjAfn+Nka3I9iGO84bgVitWgtoWn2IUCgjbyQwcGSGecIyF2gxv9SavcTw/N/vWC+6cetPo547VbdbmSpBA/DsgwXj4evrRyWmAFy6bS0YvQxjNid8yf/oWO+YCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 03:45:14 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 03:45:14 +0000
Message-ID: <181469c7-4ccd-44eb-a0ae-9b600326c794@intel.com>
Date: Tue, 14 Oct 2025 09:15:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/kms_usb4_switch: add test to validate
 dock/undock and switch
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <imre.deak@intel.com>
References: <20250521055619.1961965-1-kunal1.joshi@intel.com>
 <20250521055619.1961965-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250521055619.1961965-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b241070-9921-4891-7e9b-08de0ad41517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWlGc0RvdmNrZjArd3V1WVdCMjJjWmY3QTU3UmlSU1pzZEpSZzdmd0ZvZzNK?=
 =?utf-8?B?cWpqNjZ3V0dyYkI1eFRhQnFWSXBGbm96Tjk2Q1N3ZFZEc1N5WXJ3VUZvWE9p?=
 =?utf-8?B?SXBDcjV2UE9Id0JOK01uYnZINVUvREk1d1RlenNST0pNS0VzQWRLeHZBTnBV?=
 =?utf-8?B?WEFlS0NvOUgxb3lCcHh4Tys1cUtVMXNQNkUyVFZFdE9oQ0g5cFpjckk4aUlh?=
 =?utf-8?B?YlJjZ3R3M3kxQUNlUGh4K3dDQm1MNmFnN2dlSEQ2M1dEeDQ1SEsrMjdkc3pD?=
 =?utf-8?B?V0NyTGk5VnkwY3p0MHRxeHFmT0tHa2lwWmoyYnEyM2lJcXVrYTNDeWZvN3Y5?=
 =?utf-8?B?UHdpVWFWak1TOFZzK3kwQjl3TVhGOCtKaXRlaUtRNWZIbm1YVGF1VjlCUksx?=
 =?utf-8?B?R3A5cEY0dXZJT2FWQ0xGNXFnMUdsbUVGNjB6WWFyWk16dUFNMHA2bHRZY1Iy?=
 =?utf-8?B?RXoxTlYxdDJzVFZNR0FuM01XbnVnbXdpS3NVb3BvMXRTNW9tRWtIVWE5TXVk?=
 =?utf-8?B?My9aYnd2RFVHcXB0S1RLdHdQejkvWEpDYTgxSDVNN3ltQzFVSWo3SEczVDhu?=
 =?utf-8?B?RjA5Mm1sU29PblY0b1VKeXlHRnNFY0l3bU5xOFdMdEt5QXVKL002Sk0wcmcv?=
 =?utf-8?B?UFJDcCtSMEZ5QmRXalRic3NOZk94Q2FjS3hoZ3Y5NUN0S3FnL1FUbUVQaVdk?=
 =?utf-8?B?RGVZNE02UDFBVXhORkV0NTJhS2lGbGJreVpoVlhtazVINFl6TXd1M2pTdVpT?=
 =?utf-8?B?WThhYTM1S3Rxa3hnbGphU3pneUFKenQ4ak9nRTEyd1NOTmZDWDVVRTArVDRj?=
 =?utf-8?B?QWVvU3dlY3BLbDBNUlBiMk5JTGkwY2xTRm8rTXp6R1lvNENWNUJPM25hajBN?=
 =?utf-8?B?bU12WEVnMjh0WjZBNmpsNTRhbW5LTHhSTDNic2g5RGIzUm12aXdYenR0Wlhj?=
 =?utf-8?B?UjBmWm9UdlEyYi9KMnBYbnZ2TzlTQy8vRVBBLzRPSEc1NkZ5QTdVa01ZK3BP?=
 =?utf-8?B?bS9USEsvRGpxcWd0UlY5alIwYnlFWXFSa1BJdjJmQStXbVRiUjBvVVd1bkd6?=
 =?utf-8?B?Z2VDRjh1UlNjVVhLYlNLbVRaNmlVQzhKbmZUblRzNk5yQlBMQzlYdkdmR3VJ?=
 =?utf-8?B?bFRuOWNkWSt4VDVCUkQ1allSdG9HYnVIeTdDcDJkNEJNOXN0UzI1eGtGVmtX?=
 =?utf-8?B?VWpHbCtJWmVVaVE3cnp2MHl5NllMVWdGYmtHNkVXWHkxd0VLbkNXbGxDMEh3?=
 =?utf-8?B?RlFXUjRwZzBjMDFQYTQrT0ZHNkJjMkJkKzE5QUtIZk5tWldPcjZqcVg0SHNn?=
 =?utf-8?B?b0srMWFJU0wvRFlOM25URHpCK01WSGpxY3U2MTZ2ZFJNRmlZbTNiVXBBZVQv?=
 =?utf-8?B?MytaVlQ1S2xxbUdTY0dSLzZweXFrVWZ5dU1CMnloSWZUZ1VGc21xd3ZZdHps?=
 =?utf-8?B?eGR0S3BDWWQzOWhoNSsvM2VhTVF0L3RqUi9peitTa0ZpMlRlc3NBR3lFSmxu?=
 =?utf-8?B?TEppajZRYmZSWmI2VnVJQVVJbDIvbmhPZXNwZC9YblVTdDIwUGdaRXUvZ0sw?=
 =?utf-8?B?Y1VOMjJJVlpqeHhrV082WUtYc0VheE5Rb2x4eVR2bmRlUXFTVXdzLzNwZG40?=
 =?utf-8?B?UXkrTko4SGVRNm9nRU1SOTc5b1pDTVR5d2pPS2FhRVU5Mk9QS2J3RTZSbk9j?=
 =?utf-8?B?UkplYnVPcnZZTHJSMERHd2RsTVRRb2JRNExOQXJWUXNSbUdFTG1kQ0k2UzBm?=
 =?utf-8?B?WVdqYnhXbkZieWdJSDFnQXdCSEFrRlQyT2NFWENuZGlJRTJJM0dEdTBLcVkr?=
 =?utf-8?B?RWRnNXhNSW1WclZnVWdqT0ZLWFYvZTZidWFpc2xRcmN6MGxVOFdrbzU0Rzk1?=
 =?utf-8?B?cExOZmVORjZKRUsxRlB0eExHbDM2czZhaFNhUm0veXBMdlJOTnFKNHIzeTZa?=
 =?utf-8?Q?pyJk60j6Y9vB41WMdZKtj4IBSBZunIQa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0dOOG5FS2xidFhML3ZhaktDdkRSNXNZVU9qOHdqRTZTUmpqeWFSblIxdmtQ?=
 =?utf-8?B?ZnNwVW41VWxpa242Qmx2VVFjckphaUovMDN3SjJFMUxvbklHM1VJOVpjdWdw?=
 =?utf-8?B?WU53RmhsSVNVL0NEZ3pBcjFIWEx6dXBEVks4NWZGZFNKdzRoQWFCUGFMemQ1?=
 =?utf-8?B?RlczWmVUQjlmYXUvYmdneHQwVFBCc0FwQWM3Z2JTT1BHYzRPbk5TVDdYOWJH?=
 =?utf-8?B?b3AvU0dFbzNiUDc0V0w5VGgzY0NudmVOamQ2TFdNb1h0OEJWek5nOTBteEwv?=
 =?utf-8?B?T1dibUpaZW1OdXY2em84dVlTZlJHVlJJbk9WWnp3d1Vlb3czdUdjRjVqbVpL?=
 =?utf-8?B?c0cyTlVtOFNFWkcrTzYrN0UyZE5SYlRqYUdEamRJT0s5VXpqeGhYb1JNOWdu?=
 =?utf-8?B?L095eXZwZGhsVERjUEliVmRGaW9wSmJRbXB3emJLUmtuMkpqWUQyaFdNQ0RN?=
 =?utf-8?B?THJOeDk0VHhmZ3ZSdVZUdnlQd3NQNTZETVlQZnNJdC9Id21TYk1WOVRKQVgw?=
 =?utf-8?B?Sk5ORVpGaXVkM29INXNTMllHaGVpTGIvbnBGbTdHY1R0TDdvVFlUVDExdUlJ?=
 =?utf-8?B?bDZ2S1FlZmJxUTNmeEUyKzZOUU1qQjBiUVY1OHBNOTdrNVFYR3FHRzYwdWpF?=
 =?utf-8?B?SVlvM1FubFJXYmM2dFcxYmRXV3JaSFBOQkZORzBnZHhJYXBBYjR2V2ZZdjFQ?=
 =?utf-8?B?SWptb250RzRyRUs3RGsrandsQ2ZJSTVuT2lvbjllTklwQ1NnM2VoNkNNVlNV?=
 =?utf-8?B?dk1QM29PS2tWUUpMNDkxQkdGMUU5TUNTeHZRRUpiWThkK2s5MWpqSU0wZDhQ?=
 =?utf-8?B?Q1VaSEdJRHdLd0F6Rk9zQ1d1U3BLRnZnSzl2bEw0ZVpMNnhaejRuZ0srVE1G?=
 =?utf-8?B?OE5Nb2VXcUNFVHhJMGxNajVsWVk1alZreW5DRE9Id3dsejJQaSsvYk1ubm5t?=
 =?utf-8?B?VkRhekd2VkNLVXJzaXBpMWVVVmFoeFA0dzhRNFhZb3BxRWZRTVI3R1F5VEFV?=
 =?utf-8?B?K1duUFZYRU1YcVhkM3RCZHU1TWtaRWwvMWVmdjI3TGN0MWpqTE1sYVJpOGVF?=
 =?utf-8?B?ZUYvWU5oMFZETGxxdDMvbnI3QVI1MTc2ZjR6YlRaNzh4MU1zTUpteEg0SUZv?=
 =?utf-8?B?ZVRWM2FIU1BhOGpxTHJzV3ZsTmVncG1MQ1NpdERQRTRieHFGOC9HR2VXdjZH?=
 =?utf-8?B?cFk2V1FiZzhUQ0kwcnJYN3kvTUVBMVhJZWRtMmh6ZnE1R1RhQjUxUFFpUXky?=
 =?utf-8?B?R042VlcxRU1DNG41SjhMTGxoUnZBanFuNmE1cEwvRTNqY0ZHNUdyMVdvSm53?=
 =?utf-8?B?Ti9WeVkvVHF5M3Zmck40K1V6MUdmenpQMW1KaUJXVUF2SzlKdXA4NEFVaVVq?=
 =?utf-8?B?MFpNS1Z3WFRZaTVBcG9PS0xvYkQyWlNkZkpYS09ZM3lUcmtLRXl6eTVrQXJh?=
 =?utf-8?B?c09ONlAzVnBxdDZubDgreXRyajVhRlJsRUpHUWpiQjFTWHJpVml1THU5OGcv?=
 =?utf-8?B?RUNFcm5NNWRhMytMZVU2L2kzYWVldkxBWVREYWppaTBtOXZuT1ZvemVSOG43?=
 =?utf-8?B?SUZuaGZwTGQwZDRSYmtSb21ETGdkcDVGUklESzRka2RIZXliRTd0ME9lUGRN?=
 =?utf-8?B?dzFnQWlxZng2Z0diVDBHVjd6MkRQSHJHRWZwWDkxbUFLSUhWZno0aURRUGZq?=
 =?utf-8?B?d0x4N1c5U2JKTTBvTHNYVXlGZzhvd3JpRldjREJuZ2MzZWwzZ0cxZkFBall1?=
 =?utf-8?B?c3RQUDlxUFJZeDBPSFROcjg2Z3M3NVRNaVVXWkxaSWQzdFduYjJWaUVzaGpB?=
 =?utf-8?B?MFFZMWx1MkJkd0lDM1FFd2tFUGpTVGtnQUpaVXBDNUUxNG5vQ3VRRk1SYkwv?=
 =?utf-8?B?Tmc5TjhBWXVXTVJtVFVCTFFKOElrUWJUaWpHdElvdWQ2elJ0RUN2Vkl1M291?=
 =?utf-8?B?SWo0MUx4VUVjOCtlUUh3ck13akQ3aHRGd1UvUTJDcWZidFhvbEt6a0htaGtB?=
 =?utf-8?B?VmFpeElEbjlFbDZhclI5b1VtVGFKMDJlWHJOTjlNWCtoaXVXOUgwQlkvS3JK?=
 =?utf-8?B?RkQwMVdGdm1DcWhkYlRGYWs4N0NQUklzaW4rWTY4ZjVDeExLOVQxMTh4YStP?=
 =?utf-8?Q?8/TwaxrGT23cbHndBPXLS5Q1x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b241070-9921-4891-7e9b-08de0ad41517
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 03:45:14.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3+vXpIpWt7jA09M7x07l3GwMmwhPQmnc9/OnbZZwZS8/XyMyZX+4ADIsKxub51HA6OA4IWgT8szUxeQPnY35w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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

Hi Kunal,

On 5/21/2025 11:26 AM, Kunal Joshi wrote:
> Add test suite that validates docking/undocking
> of TBT hubs and switch from DP-ALT to TBT or vice-versa.
>
> tbt-dock-undock : dock/undock each *Thunderbolt* port × 3,
> 		  checking HPD, EDIDs and a green fullscreen fb
> tbt-switch-alt  : start on TBT → switch to DP-ALT → verify HPD/EDIDs/modeset                             |
> alt-switch-tbt  : start on DP-ALT → switch to TBT → verify HPD/EDIDs/modeset
Please add new line here.
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_usb4_switch.c | 299 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   1 +
>   2 files changed, 300 insertions(+)
>   create mode 100644 tests/intel/kms_usb4_switch.c
>
> diff --git a/tests/intel/kms_usb4_switch.c b/tests/intel/kms_usb4_switch.c
> new file mode 100644
> index 000000000..05a6d3651
> --- /dev/null
> +++ b/tests/intel/kms_usb4_switch.c
> @@ -0,0 +11,304 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms usb4 switch
> + * Category: Display
> + * Description: Validate docking/undocking of TBT Hub and switch
> + *		from TBT mode to DP-ALT mode and vice-versa
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + */
> +
> +/**
> + * SUBTEST: tbt-dock-undock
> + * Description: Repeatedly dock and undock each Thunderbolt (TBT) port
> + *              `DOCK_UNDOCK_COUNT` times, verifying hot-plug events,
> + *              EDID (re)appearance and successful full modesets.
> +
> + * SUBTEST: tbt-switch-alt
> + * Description: Start on a TBT port, switch the USB4 switch to a
> + *              DisplayPort-Alt-Mode (DP-ALT) port, and validate hot-plug,
> + *              EDIDs and modeset on the new path.
> +
> + * SUBTEST: alt-switch-tbt
> + * Description: Start on a DP-ALT port, switch the USB4 switch back to a
> + *              TBT port, and validate hot-plug, EDIDs and modeset on the
> + *              restored path.
> + */
> +
> +#include <string.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <libudev.h>
> +#include <drm_fourcc.h>
> +#include <xf86drmMode.h>
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include "igt_fb.h"
> +#include "igt_usb4_switch.h"
> +
> +#define DOCK_UNDOCK_COUNT 3
> +#define HOTPLUG_TIMEOUT 20
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct udev_monitor *hotplug_mon;
> +	usb4_switch_t sw;
> +	struct usb4_switch_port_info *ports;
> +	size_t n_ports;
> +	int n_pipes;
> +	int current_port;
> +} data_t;
> +
> +static bool fit_modes_in_bw(data_t *d)
Could we use igt_fit_modes_in_bw() here?
> +{
> +	int ret = igt_display_try_commit_atomic(&d->display,
> +						DRM_MODE_ATOMIC_TEST_ONLY |
> +						DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						NULL);
> +	if (ret != 0) {
> +		bool ok = igt_override_all_active_output_modes_to_fit_bw(&d->display);
> +
> +		igt_require_f(ok, "Cannot fit modes in available BW\n");
> +	}
> +	return true;
> +}
> +
> +static void setup_pipe_on_outputs(data_t *d,
> +				  igt_output_t *outputs[],
> +				  int output_count)
Since this function is already present in kms_dp_link_training can this 
be moved to lib to avoid code duplication.
> +{
> +	int i = 0;
> +	enum pipe pipe;
> +
> +	igt_require_f(d->n_pipes >= output_count,
> +		      "Need %d pipes for %d outputs\n",
> +		      d->n_pipes, output_count);
> +
> +	for_each_pipe(&d->display, pipe) {
> +		if (i >= output_count)
> +			break;
> +		igt_info("Assigning pipe %s → %s\n",
> +			 kmstest_pipe_name(pipe),
> +			 igt_output_name(outputs[i]));
> +		igt_output_set_pipe(outputs[i++], pipe);
> +	}
> +}
> +
> +static bool modeset_on_edid_connectors(data_t *d,
> +				       char **edids,
> +				       int n_edids)
> +{
> +	igt_output_t *output;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int out_cnt = 0;
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *primaries[IGT_MAX_PIPES];
> +	int i;
> +
> +	/* Find all connected outputs whose EDID matches this port */
> +	for_each_connected_output(&d->display, output) {
> +		for (i = 0; i < n_edids; i++) {
> +			if (usb4_switch_port_has_edid(d->drm_fd,
> +						      d->current_port,
> +						      edids[i])) {
> +				outputs[out_cnt++] = output;
> +				igt_info("Port %d → connector %s (EDID %s)\n",
> +					 d->current_port, igt_output_name(output),
> +					 edids[i]);
> +				break;
> +			}
> +		}
> +	}
> +	igt_require_f(out_cnt > 0, "No connectors found for EDIDs on port %d\n",
> +		      d->current_port);
> +
> +	/* Reset display and assign pipes */
> +	igt_display_reset(&d->display);
> +	setup_pipe_on_outputs(d, outputs, out_cnt);
> +
> +	/* Create simple color framebuffers on each plane */
> +	for (i = 0; i < out_cnt; i++) {
> +		modes[i] = igt_output_get_mode(outputs[i]);
> +		primaries[i] = igt_output_get_plane_type(outputs[i],
> +							 DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(d->drm_fd,
> +				    modes[i]->hdisplay,
> +				    modes[i]->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 1.0, 0.0,
> +				    &fbs[i]);
> +		igt_plane_set_fb(primaries[i], &fbs[i]);
> +	}
> +
> +	/* Fit modes in available bandwidth */
> +	igt_require_f(fit_modes_in_bw(d),
> +		      "Failed BW fit on port %d\n",
> +		      d->current_port);
> +
> +	/* Commit the atomic modeset */
> +	igt_display_commit2(&d->display, COMMIT_ATOMIC);
> +	return true;
> +}
> +
> +/**
> + * Returns the index of the first port whose .type matches 'type', or -1.
> + */
> +static int find_port_by_type(data_t *d, const char *type)
> +{
> +	for (size_t i = 0; i < d->n_ports; i++)
> +		igt_info("Configured port: %s (looking for %s)\n",
> +			 d->ports[i].type, type);
> +
> +	for (size_t i = 0; i < d->n_ports; i++) {
> +		if (strcmp(d->ports[i].type, type) == 0)
> +			return i;
> +	}
Please add new line here.
> +	return -1;
> +}
> +
> +/**
> + * Perform a dock/undock or switch action on @port_id:
> + *  - set the switch
> + *  - wait for hotplug
> + *  - verify EDID presence/absence
> + *  - full modeset on connectors for that port (only on dock)
> + */
> +static void port_action(data_t *d, int port_id,
> +			char **edids, int n_edids,
> +			bool connect, bool reset)
> +{
> +	const char *verb = connect ? "Docking" : "Undocking";
> +
> +	d->hotplug_mon = igt_watch_uevents();
> +	igt_assert(d->hotplug_mon);
> +	igt_info(" → %s (port %d)\n", verb, port_id);
> +
> +	/* Trigger the switch */
> +	igt_assert_eq(usb4_switch_set_port(&d->sw, port_id), 0);
Please add new line here.
> +	if (!reset)
> +		igt_assert(igt_hotplug_detected(d->hotplug_mon, HOTPLUG_TIMEOUT));
> +	igt_flush_uevents(d->hotplug_mon);
Please add new line here.
> +	for (int e = 0; e < n_edids; e++) {
> +		bool present = usb4_switch_port_has_edid(d->drm_fd, port_id, edids[e]);
> +
> +		if (!reset) {
> +			if (connect)
> +				igt_assert_f(present, "EDID %s not found after dock on port %d\n",
> +					     edids[e], port_id);
> +			else
> +				igt_assert_f(!present, "EDID %s still present after undock on port %d\n",
> +					     edids[e], port_id);
> +		}
> +	}
> +
> +	if (connect) {
> +		d->current_port = port_id;
> +		igt_assert_f(modeset_on_edid_connectors(d, edids, n_edids),
> +			     "Modeset failed for port %d after EDID check\n",
> +			     port_id);
> +	}
> +}
> +
> +/**
> + * For a single port @p, repeat dock/undock DOCK_UNDOCK_COUNT times.
> + */
> +static void test_dock_undock(data_t *d,
> +			     struct usb4_switch_port_info *p)
> +{
> +	/* initial undock */
> +	port_action(d, 0, p->edids, p->n_edids, false, true);
> +
> +	for (int rep = 0; rep < DOCK_UNDOCK_COUNT; rep++) {
> +		igt_info("Iteration %d/%d on %s\n", rep+1, DOCK_UNDOCK_COUNT, p->name);
> +		port_action(d, p->port_id, p->edids, p->n_edids, true, false);
> +		port_action(d, 0, p->edids, p->n_edids, false, false);
> +	}
> +}
> +
> +/**
> + * Switch from src to dst port, verifying connectors at each step.
> + */
> +static void test_switch(data_t *d,
> +			struct usb4_switch_port_info *src,
> +			struct usb4_switch_port_info *dst)
> +{
> +	/* dock src, then switch to dst */
> +	port_action(d, src->port_id, src->edids, src->n_edids, true, false);
> +	port_action(d, dst->port_id, dst->edids, dst->n_edids, true, false);
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		enum pipe p;
> +
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		igt_assert(data.drm_fd >= 0);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		data.n_pipes = 0;
> +		for_each_pipe(&data.display, p)
> +			data.n_pipes++;
> +
> +		if (!usb4_switch_load_config())
> +			igt_skip("No USB4Switch section in ~/.igtrc\n");
Please use igt_require here.
> +
> +		data.ports = usb4_switch_list_ports(&data.n_ports);
> +		igt_require(data.n_ports > 0);
> +
> +		igt_assert_eq(usb4_switch_open(&data.sw), 0);
> +	}
> +
> +	igt_subtest_with_dynamic("tbt-dock-undock") {
> +		bool saw = false;
Nit: Can this variable be named 'found'?
> +
> +		for (size_t i = 0; i < data.n_ports; i++) {
> +			if (strcmp(data.ports[i].type, "TBT") != 0)
> +				continue;
> +			saw = true;
Please add new line here.
> +			igt_dynamic_f("%s", data.ports[i].name)
> +				test_dock_undock(&data, &data.ports[i]);
> +		}
> +		if (!saw)
> +			igt_skip("No TBT ports configured\n");

Please use igt_skip_on() here.

Regards,
Karthik.B.S
> +	}
> +
> +	igt_subtest("tbt-switch-alt") {
> +		int tbt = find_port_by_type(&data, "TBT");
> +		int alt = find_port_by_type(&data, "DP-ALT");
> +
> +		igt_require_f(tbt != -1 && alt != -1,
> +			      "Need one TBT and one DP-ALT port configured\n");
> +		test_switch(&data, &data.ports[tbt], &data.ports[alt]);
> +	}
> +
> +	igt_subtest("alt-switch-tbt") {
> +		int tbt = find_port_by_type(&data, "TBT");
> +		int alt = find_port_by_type(&data, "DP-ALT");
> +
> +		igt_require_f(tbt != -1 && alt != -1,
> +			      "Need one TBT and one DP-ALT port configured\n");
> +		test_switch(&data, &data.ports[alt], &data.ports[tbt]);
> +	}
> +
> +	igt_fixture {
> +		usb4_switch_close(&data.sw);
> +		usb4_switch_free_port_info(data.ports, data.n_ports);
> +		usb4_switch_unload_config();
> +
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +		udev_monitor_unref(data.hotplug_mon);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 55bcf57ec..19a7a5ad6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -270,6 +270,7 @@ intel_kms_progs = [
>   	'kms_psr2_su',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
> +        'kms_usb4_switch',
>   ]
>   
>   intel_xe_progs = [
